using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using DevExpress.Web.ASPxGridView;
using System.Web.Security;


namespace Pertamina.PKBL.WebApp
{
    public partial class PersetujuanSurvey : System.Web.UI.Page
    {
        PersetujuanProposalBll bllPersetujuan = new PersetujuanProposalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (Session != null)
            {
                if (!IsPostBack)
                {
                    InitCombo();
                }
                roleAuth();
                GetData();
            }
            else 
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "PK.Persetujuan.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "PK.Persetujuan.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "PK.Persetujuan.View");
            ((GridViewCommandColumn)gvPersetujuanSurvey.Columns["opr"]).ShowNewButton = insert;
            //((GridViewCommandColumn)gvPersetujuanSurvey.Columns["Opr."]).sho = edit;
               

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            

        }

        private void InitCombo()
        {
            var statusCombo = (new DdlBll()).GetComboItem("ddl_statusKemitraan");

            ((GridViewDataComboBoxColumn)gvPersetujuanSurvey.Columns["status"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvPersetujuanSurvey.Columns["status"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvPersetujuanSurvey.Columns["status"]).PropertiesComboBox.DataSource = statusCombo;
        }

        public void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

            gvPersetujuanSurvey.DataSource = bllPersetujuan.GetPersetujuan(branchCode);
            gvPersetujuanSurvey.DataBind();


        }

        protected void gvPersetujuanSurvey_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

        }

        protected void gvPersetujuanSurvey_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "detail")
            {
                btnDetail(e.VisibleIndex);
            }
        }

        private void btnDetail(int visibleIndex)
        {
            var id = gvPersetujuanSurvey.GetRowValues(visibleIndex,gvPersetujuanSurvey.KeyFieldName).ToString();

            Session["proposalID"] = id;

            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailPersetujuanSurvey.aspx");
        }

        protected void gvPersetujuanSurvey_CustomButtonInitialize1(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            try
            {


                var row = gvPersetujuanSurvey.GetRowValues(e.VisibleIndex, "status").ToString();
                if (string.IsNullOrEmpty(row.ToString()))
                {

                }

                else
                {
                    if (e.ButtonID == "detail")
                    {
                        if (row == "A")
                        {
                            e.Image.Url = "~/content/images/checklist.png";
                            //e.Visible = DevExpress.Utils.DefaultBoolean.False;
                        }
                        else
                        {
                            e.Image.Url = "~/content/images/new.png";
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }


    }
}