using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.BinaLingk;
using Pertamina.PKBL.BLL.Administer;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using DevExpress.Web.ASPxEditors;
using System.IO;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class PermohonanBL : System.Web.UI.Page
    {
        PermohonanBll bll = new PermohonanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvPermohonan.CommandButtonInitialize += gvPermohonan_CommandButtonInitialize;
            gvPermohonan.CustomErrorText += gvPermohonan_CustomErrorText;
            GetData();
            roleAuth();
        }

        void gvPermohonan_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            e.ErrorText = e.Exception.GetBaseException().Message;
        }

        private void roleAuth()
        {
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "BL.Permohonan.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "BL.Permohonan.Edit");
            bool delete = RoleCheck.CheckRoleView(userRoles, "BL.Permohonan.Delete");
            bool view = RoleCheck.CheckRoleView(userRoles, "BL.Permohonan.View"); 

            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }


            btnAdd.Visible = insert;
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            ((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowEditButton = edit;
        }

        void gvPermohonan_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            try
            {
                if (e.ButtonType == ColumnCommandButtonType.Edit)
                {
                    var userBranchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                    var data = gvPermohonan.GetRowValues(e.VisibleIndex, "branch_code").ToString();
                    var appstatus = gvPermohonan.GetRowValues(e.VisibleIndex, "status").ToString();
                    if (userBranchCode == data && appstatus != "5")
                    {
                        e.Visible = true;
                    }
                    else
                    {
                        e.Visible = false;
                    }


                }
            }
            catch(Exception ex)
            {

            }
            
        }

        private void GetData()
        {
            initCombo();
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPermohonan.DataSource = ((new PermohonanBll()).GetData(branchCode));
            gvPermohonan.DataBind();

        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            
            MasterBLBll jenisBlBll = new MasterBLBll();
            CityIndexBll cityBll = new CityIndexBll();
            DdlBll ddlBll = new DdlBll();
            MasterKantorCabangBll cabangBll = new MasterKantorCabangBll();

            var binalingComboData = jenisBlBll.GetDataActive();
            var cityComboData = cityBll.GetDataByBranch(branchCode);
            cityComboData.DefaultView.Sort = "city_name ASC";

            var statusComboData = ddlBll.GetComboItem("ddl_status_binaling");
            var cabangCombo = cabangBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["requestor_city_id"]).PropertiesComboBox.TextField = "city_name";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["requestor_city_id"]).PropertiesComboBox.ValueField = "city_appcode";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["requestor_city_id"]).PropertiesComboBox.DataSource = cityComboData.DefaultView;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["binaling_kind_id"]).PropertiesComboBox.TextField = "name";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["binaling_kind_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["binaling_kind_id"]).PropertiesComboBox.DataSource = binalingComboData;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["status"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["status"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["status"]).PropertiesComboBox.DataSource = statusComboData;


            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["branch_code"]).PropertiesComboBox.TextField = "branch_name";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["branch_code"]).PropertiesComboBox.ValueField = "branch_code";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["branch_code"]).PropertiesComboBox.DataSource = cabangCombo;


        }


        protected void gvPermohonan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Update Permohonan";
            log.UserName = userName;

            try
            {
            var accDate = DateTime.Parse(e.NewValues["proposal_accept_date"].ToString());
            var regisDate = DateTime.Parse(e.NewValues["registration_date"].ToString());
            Hashtable ht = new Hashtable();
            string modified_by = Session["user"].ToString();
            string form_number = e.NewValues["form_number"].ToString();
            ht.Add("@id-int",e.Keys["id"].ToString());
            ht.Add("@form_number-varchar-99", form_number);
            ht.Add("@proposal_number-varchar-99", e.NewValues["proposal_number"].ToString());
            ht.Add("@proposal_accept_date-varchar-10", accDate.ToString("dd/MM/yyyy"));
            ht.Add("@registration_date-varchar-10", regisDate.ToString("dd/MM/yyyy"));

            ht.Add("@requestor_company-varchar-200", e.NewValues["requestor_company"] ?? "");
            ht.Add("@requestor_name-varchar-200", e.NewValues["requestor_name"] ?? "");
            ht.Add("@requestor_address-varchar-512", e.NewValues["requestor_address"] ?? "");
            ht.Add("@requestor_district-varchar-200", e.NewValues["requestor_district"] ?? "");
            ht.Add("@requestor_city_id-varchar-5", e.NewValues["requestor_city_id"] ?? "");
            ht.Add("@requestor_postal-varchar-9", e.NewValues["requestor_postal"] ?? "");
            ht.Add("@requestor_phone1-varchar-100", e.NewValues["requestor_phone1"] ?? "");
            ht.Add("@requestor_phone2-varchar-100", e.NewValues["requestor_phone2"] ?? "");
            ht.Add("@requestor_email-varchar-100", e.NewValues["requestor_email"] ?? "");

            ht.Add("@proposal_title-varchar-200", e.NewValues["proposal_title"] ?? "");
            ht.Add("@activity_descr-varchar-512", e.NewValues["activity_descr"] ?? "");
            ht.Add("@binaling_kind_id-int", e.NewValues["binaling_kind_id"] ?? "");
            ht.Add("@requested_amount-decimal", e.NewValues["requested_amount"] ?? "");
            ht.Add("@modified_by-varchar-99", modified_by.ToString());

            bll.UpdateData(ht);
            log.Type = "S";
            log.Description = log.Action + ' ' + form_number + ' ' + "Sukses oleh id" + ' ' + userName; 
            e.Cancel = true;
            gvPermohonan.CancelEdit();
            GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Update Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        protected void gvPermohonan_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Insert Permohonan";
            log.UserName = userName;

            try
            {

            var accDate = DateTime.Parse(e.NewValues["proposal_accept_date"].ToString());
            var regisDate = DateTime.Parse(e.NewValues["registration_date"].ToString());

            var userBranchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName.Contains("REGION")).Value1;

            Hashtable ht = new Hashtable();
            string created_by = Session["user"].ToString();
            ht.Add("@proposal_number-varchar-99", e.NewValues["proposal_number"] ?? "");
            ht.Add("@proposal_accept_date-varchar-30", accDate.ToString("dd/MM/yyyy"));
            ht.Add("@registration_date-varchar-30", regisDate.ToString("dd/MM/yyyy"));

            ht.Add("@requestor_company-varchar-200", e.NewValues["requestor_company"] ?? "");
            ht.Add("@requestor_name-varchar-200", e.NewValues["requestor_name"] ?? "");
            ht.Add("@requestor_address-varchar-512", e.NewValues["requestor_address"] ?? "");
            ht.Add("@requestor_district-varchar-200", e.NewValues["requestor_district"] ?? "");
            ht.Add("@requestor_city_id-varchar-5", e.NewValues["requestor_city_id"] ?? "");
            ht.Add("@requestor_postal-varchar-9", e.NewValues["requestor_postal"] ?? "");
            ht.Add("@requestor_phone1-varchar-100", e.NewValues["requestor_phone1"] ?? "");
            ht.Add("@requestor_phone2-varchar-100", e.NewValues["requestor_phone2"] ?? "");
            ht.Add("@requestor_email-varchar-100", e.NewValues["requestor_email"] ?? "");

            ht.Add("@proposal_title-varchar-200", e.NewValues["proposal_title"] ?? "");
            ht.Add("@activity_descr-varchar-512", e.NewValues["activity_descr"] ?? "");
            ht.Add("@binaling_kind_id-int", e.NewValues["binaling_kind_id"] ?? "");
            ht.Add("@requested_amount-decimal", e.NewValues["requested_amount"] ?? "");
            ht.Add("@created_by-varchar-99", created_by.ToString());

            ht.Add("@branch_code-int", userBranchCode );

            Session["idPermohonan"] = bll.InsertData(ht);
            log.Type = "S";
            log.Description = log.Action  + "Sukses oleh id" + ' ' + userName; 
            e.Cancel = true;
            gvPermohonan.CancelEdit();
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("CheckList.aspx");
            //GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Insert Error : " + ex.Message;
            }
            finally
            {
                
                logBll.InsertActivity(log);
            }
        }

        private void btnCheckListAction(int visibleIndex)
        {

            var id = gvPermohonan.GetRowValues(visibleIndex, gvPermohonan.KeyFieldName);
            Session["idPermohonan"] = id;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("CheckList.aspx");
            //("CheckList.aspx");
        }

        protected void gvPermohonan_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "Checklist")
            {
                btnCheckListAction(e.VisibleIndex);
            }

            else if (e.ButtonID == "Print")
            {
                //
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Download file";
            log.UserName = userName;

            try
            {

                ImageButton btn = (ImageButton)sender;

                var focusIndex = gvPermohonan.FocusedRowIndex;

                var rowID = gvPermohonan.GetRowValues(focusIndex, "id").ToString();

                var data = bll.GetFilePath(rowID);

                string original = data.Rows[0]["FileName"].ToString();

                byte[] filedata = (byte[])data.Rows[0]["FileData"];

                string mime = System.Web.MimeMapping.GetMimeMapping( data.Rows[0]["FileExt"].ToString());

                Response.ContentType = mime;
                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + original);
                Response.BinaryWrite(filedata);
                Response.Flush();
                Response.End();

                log.Type = "S";
                log.Description = log.Action + ' ' + original + ' ' + "Sukses oleh id" + ' ' + userName; 

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Download Gagal : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }
        protected void gvPermohonan_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "Nomor")
            {
                e.Value = string.Format("Item #{0}", e.ListSourceRowIndex + 1);
            }
            GetData();
        }

        protected void gvPermohonan_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            
            e.NewValues["registration_date"] = DateTime.Today;
            
            e.NewValues["proposal_accept_date"] = DateTime.Today;
            e.NewValues["form_number"] = "--Generate by System--";
        }

    }
}