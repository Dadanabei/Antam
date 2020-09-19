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
    public partial class PersetujuanBL : System.Web.UI.Page
    {

        PersetujuanBll bll1 = new PersetujuanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvPersetujuan.CommandButtonInitialize += gvPersetujuan_CommandButtonInitialize;
            GetData();
            RoleAuth();
        }

        void gvPersetujuan_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            try
            {
                if (e.ButtonType == ColumnCommandButtonType.Edit)
                {
                    var userBranchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                    var branch = gvPersetujuan.GetRowValues(e.VisibleIndex, "branch_code").ToString();

                    if (userBranchCode == branch)
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

        private void RoleAuth()
        {
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;

            bool edit = (userRoles.FirstOrDefault(t => t.Contains("BL.Persetujuan.Edit")) != null) ? true : false;
            bool view = (userRoles.FirstOrDefault(t => t.Contains("BL.Persetujuan.View")) != null) ? true : false; 
            
            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }


            ((GridViewCommandColumn)gvPersetujuan.Columns["opr"]).ShowEditButton = edit;

        }

        private void GetData()
        {
            initCombo();
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPersetujuan.DataSource = ((new PersetujuanBll()).GetData(branchCode)).DefaultView;
            gvPersetujuan.DataBind();

        }

        private void initCombo()
        {
            MasterBLBll jenisBlBll = new MasterBLBll();
            CityIndexBll cityBll = new CityIndexBll();
            DdlBll ddlBll = new DdlBll();

            var binalingComboData = jenisBlBll.GetDataActive();
            var cityComboData = cityBll.GetData(new Hashtable());
            var workOrderComboData = ddlBll.GetComboItem("ddl_input_persetujuan");

            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["requestor_city_id"]).PropertiesComboBox.TextField = "city_name";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["requestor_city_id"]).PropertiesComboBox.ValueField = "city_appcode";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["requestor_city_id"]).PropertiesComboBox.DataSource = cityComboData;

            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["binaling_kind_id"]).PropertiesComboBox.TextField = "bl_kind";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["binaling_kind_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["binaling_kind_id"]).PropertiesComboBox.DataSource = binalingComboData;

            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["approval_result"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["approval_result"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["approval_result"]).PropertiesComboBox.DataSource = workOrderComboData;

        }

        protected void gvPersetujuan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Persetujuan ";
            log.UserName = userName;

            try
            {

                string approval_result = e.NewValues["approval_result"].ToString();
                //string approval_result_date = e.NewValues["approval_result_date"].ToString();
                string granted_amount;
            try
            {
                granted_amount = e.NewValues["granted_amount"].ToString();
            }
            catch
            {
                granted_amount = "0";
            }

            if (approval_result == "0")
            {
                granted_amount = "0";
            }

            Hashtable ht = new Hashtable();
            var id = e.Keys["id"].ToString();
            ht.Add("@approval_result-smallint", approval_result);
            ht.Add("@granted_amount-decimal", granted_amount);
            ht.Add("@id-int", id);
            ht.Add("@approved_by-varchar-99", Session["user"]);
            bll1.SetApproval(ht);
            log.Type = "S";
            log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName; 
            e.Cancel = true;
            gvPersetujuan.CancelEdit();
            GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Persetujuan Gagal : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        protected void gvPersetujuan_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["proposal_accept_date"] = DateTime.Today;
            //e.NewValues["approval_result_date"] = DateTime.Today;

           
            
        }
    }
}