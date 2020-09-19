using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.BinaLingk;
using System.Data;
using System.Collections;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using Pertamina.PKBL.BLL.Administer;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class PenilaianBL : System.Web.UI.Page
    {
        PenilaianBll bll = new PenilaianBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            gvBlPenilaian.CommandButtonInitialize += gvBlPenilaian_CommandButtonInitialize;
            GetData();
            RoleAuth();
        }

        private void RoleAuth()
        {
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;

            bool edit = (userRoles.FirstOrDefault(t => t.Contains("BL.Penilaian.Edit")) != null) ? true : false;
            bool delete= (userRoles.FirstOrDefault(t => t.Contains("BL.Penilaian.Delete")) != null) ? true : false;
            bool insert= (userRoles.FirstOrDefault(t => t.Contains("BL.Penilaian.Insert")) != null) ? true : false;
            bool view= (userRoles.FirstOrDefault(t => t.Contains("BL.Penilaian.View")) != null) ? true : false;
            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }

            ((GridViewCommandColumn)gvBlPenilaian.Columns["opr"]).ShowEditButton = edit;
            ((GridViewCommandColumn)gvBlPenilaian.Columns["opr"]).ShowNewButton = insert;
            ((GridViewCommandColumn)gvBlPenilaian.Columns["opr"]).ShowDeleteButton = delete;
        }

        void gvBlPenilaian_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            try
            {
                if (e.ButtonType == ColumnCommandButtonType.Edit)
                {
                    var userBranchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                    var branch = gvBlPenilaian.GetRowValues(e.VisibleIndex, "branch_code").ToString();
                    var isApproved = gvBlPenilaian.GetRowValues(e.VisibleIndex, "approval_result").ToString();

                    if (userBranchCode == branch)
                    {
                        e.Visible = true;
                    }
                    else
                    {
                        e.Visible = false;
                    }

                    if (isApproved == "1")
                    {
                        e.Visible = false;
                    }
                    else
                    {
                        e.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            Hashtable ht = new Hashtable();
            DataView dv = ((DataTable)bll.GetData(branchCode)).DefaultView;

            initCombo();

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }
            gvBlPenilaian.DataSource = dv;
            gvBlPenilaian.DataBind();


        }

        private void initCombo()
        {
            MasterBLBll jenisBlBll = new MasterBLBll();
            CityIndexBll cityBll = new CityIndexBll();
            DdlBll ddlBll = new DdlBll();

            var binalingComboData = jenisBlBll.GetDataActive();
            var cityComboData = cityBll.GetData(new Hashtable());
            var statusComboData = ddlBll.GetComboItem("ddl_input_penilaian");

            ((GridViewDataComboBoxColumn)gvBlPenilaian.Columns["evaluation_result"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvBlPenilaian.Columns["evaluation_result"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvBlPenilaian.Columns["evaluation_result"]).PropertiesComboBox.DataSource = statusComboData;
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {

        }

        protected void gvBlPenilaian_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Penilaian ";
            log.UserName = userName;

            try
            {

            Hashtable ht = new Hashtable();
            var id = e.Keys["id"].ToString();
            ht.Add("@evaluation_result-smallint", e.NewValues["evaluation_result"].ToString());
            ht.Add("@recomended_amount-decimal-18", e.NewValues["recomended_amount"]);
            ht.Add("@survey_result_descr-varchar-512", e.NewValues["survey_result_descr"].ToString());
            ht.Add("@id-int", id);
            bll.SetApproval(ht);
            log.Type = "S";
            log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName; 
            e.Cancel = true;
            gvBlPenilaian.CancelEdit();
            GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Penilaian Gagal : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected void gvBlPenilaian_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }
    }
}