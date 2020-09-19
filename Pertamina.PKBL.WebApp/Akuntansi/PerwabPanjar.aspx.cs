using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;
using DevExpress.Utils;

namespace Pertamina.PKBL.WebApp
{
    public partial class PerwabPanjar : System.Web.UI.Page
    {
        PanjarBll bll = new PanjarBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["Nopanjar"] = null;
                Session["program"] = null;

                if (Session["Perwab"] != null)
                {
                    if (Session["Perwab"].ToString() == "S")
                    {
                        ClientScript.RegisterStartupScript(GetType(), "koreksi", "alert('Perwab Sukses');", true);
                        Session["Perwab"] = null;
                    }
                }

            }
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = bll.GetDataPerwab(Convert.ToInt32(branchCode));
            gvPerwabPanjar.DataSource = data;
            gvPerwabPanjar.DataBind();
        }

        protected void gvPerwabPanjar_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        private void btnPersetujuanPerwab(int visibleIndex)
        {

            var Nopanjar = gvPerwabPanjar.GetRowValues(visibleIndex,gvPerwabPanjar.KeyFieldName).ToString();
            var program = gvPerwabPanjar.GetRowValues(visibleIndex, "program_id").ToString();
            Session["Nopanjar"] = Nopanjar;
            Session["program"] = program;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Akuntansi/DetailPerwabPanjar.aspx");
        }
        protected void gvPerwabPanjar_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            btnPersetujuanPerwab(e.VisibleIndex);
        }

        protected void gvPerwabPanjar_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            var noref = gvPerwabPanjar.GetRowValues(e.VisibleIndex,"NoRefPerwab");
            if (e.VisibleIndex > 0)
            {
                if (string.IsNullOrEmpty(noref.ToString()))
                {
                    e.Visible = DefaultBoolean.True;
                }
                else
                {
                    e.Visible = DefaultBoolean.False;
                }
            }
        }
    }
}