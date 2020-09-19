using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Kemitraan;

namespace Pertamina.PKBL.WebApp
{
    public partial class MonitoringMitra : System.Web.UI.Page
    {
        MonitoringMitraBll bll = new MonitoringMitraBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
        }
        private void btnTambahAction(int visibleIndex)
        {

            var mitraId = gvMonitoring.GetRowValues(visibleIndex, gvMonitoring.KeyFieldName);
            Session["mitraId"] = mitraId;
            Session["tglMon"] = "";
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("TambahMonitoringMitra.aspx");
            //("CheckList.aspx");
        }
        private void btnEditAction(int visibleIndex)
        {

            //var id = gvMonitoring.GetRowValues(visibleIndex, gvMonitoring.KeyFieldName);
            //Session["idPermohonan"] = id;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("EditMonitoringMitra.aspx");
            //("CheckList.aspx");
        }

        private void getData() {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            DataTable dt = bll.getData(branchCode.ToString());
            gvMonitoring.DataSource = dt;
            gvMonitoring.DataBind();
        
        }
        protected void gvMonitoring_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnTambah")
            {
                btnTambahAction(e.VisibleIndex);
            }

            else if (e.ButtonID == "btnEdit")
            {
                btnEditAction(e.VisibleIndex);
            }
            else if (e.ButtonID == "button1")
            {
                var text = gvMonitoring.GetRowValues(e.VisibleIndex, "I").ToString();
                var mitraId = gvMonitoring.GetRowValues(e.VisibleIndex, gvMonitoring.KeyFieldName);
                Session["mitraId"] = mitraId; 
                Session["tglMon"] = text;
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("TambahMonitoringMitra.aspx");
            }
            else if (e.ButtonID == "button2")
            {
                var text = gvMonitoring.GetRowValues(e.VisibleIndex, "II").ToString();
                var mitraId = gvMonitoring.GetRowValues(e.VisibleIndex, gvMonitoring.KeyFieldName);
                Session["mitraId"] = mitraId; 
                Session["tglMon"] = text;
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("TambahMonitoringMitra.aspx");
            }
            else if (e.ButtonID == "button3")
            {
                var text = gvMonitoring.GetRowValues(e.VisibleIndex, "III").ToString();
                var mitraId = gvMonitoring.GetRowValues(e.VisibleIndex, gvMonitoring.KeyFieldName);
                Session["mitraId"] = mitraId; 
                Session["tglMon"] = text;
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("TambahMonitoringMitra.aspx");
            }
        }

        protected void gvMonitoring_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.ButtonID == "button1") {
                string text = gvMonitoring.GetRowValues(e.VisibleIndex, "I").ToString();

                e.Text = text;
            }
            if (e.ButtonID == "button2")
            {
                string text = gvMonitoring.GetRowValues(e.VisibleIndex, "II").ToString();

                e.Text = text;
            }
            if (e.ButtonID == "button3")
            {
                string text = gvMonitoring.GetRowValues(e.VisibleIndex, "III").ToString();

                e.Text = text;
            }
        }

        protected void gvMonitoring_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = ((e.VisibleIndex) + 1).ToString();
            }
        }
    }
}