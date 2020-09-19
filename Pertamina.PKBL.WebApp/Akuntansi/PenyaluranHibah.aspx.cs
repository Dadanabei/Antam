using Pertamina.PKBL.BLL.Akuntansi;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Hibah;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class PenyaluranHibah : System.Web.UI.Page
    {
        PenyaluranHibahBll bll = new PenyaluranHibahBll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["DataAvailable"] != null)
            {

                if (Session["DataAvailable"].ToString() == "S")
                {

                    Session["DataAvailable"] = null;
                    ClientScript.RegisterStartupScript(GetType(), "DataAvailable", "alert('Data Tidak Tersedia');", true);
                }
            }

            roleAuth();
            GetData();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.Pencairan.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            //((GridViewCommandColumn)gvBankCOA.Columns["Opr."]).ShowEditButton = edit;
            // ((GridViewDataColumn)gvPenyaluran.Columns["Opr."]).ShowEditButton = edit;



            //btnSubmit.Visible = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            //btnSubmit.Visible = insert;

        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPenyaluran.DataSource = bll.GetData(branchCode);
            gvPenyaluran.DataBind();
        }

        private void btnAction(int visibleIndex)
        {
            var proposal = gvPenyaluran.GetRowValues(visibleIndex, gvPenyaluran.KeyFieldName);
            var sector = gvPenyaluran.GetRowValues(visibleIndex, "sector_id");
            Session["PenyaluranHibah"] = proposal;
            Session["sector_id"] = sector;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailPenyaluranHibah.aspx");

        }

        protected void gvPenyaluran_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            btnAction(e.VisibleIndex);
        }

        protected void gvPenyaluran_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            var data = gvPenyaluran.GetRowValues(e.VisibleIndex, "iscair") ?? "";

            if (data.ToString() == "1")
            {
                e.Image.Url = "~/content/images/checklist.png";
            }
        }

        protected void gvPenyaluran_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        protected void gvPenyaluran_PageIndexChanged(object sender, EventArgs e)
        {
            GetData();
        }
    }
}