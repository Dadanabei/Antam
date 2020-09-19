using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;
using DevExpress.Web.ASPxGridView;

namespace Pertamina.PKBL.WebApp.Kemitraan.RealisasiKemitraanControl
{
    public partial class Persetujuan : System.Web.UI.UserControl
    {
        RealisasiBll bll = new RealisasiBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
            
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = bll.GetData(branchCode);
           
            gvPersetujuan.DataSource = data;
            gvPersetujuan.DataBind();
            
        }


        private void btnAction(int visibleIndex)
        {

            string proposal = gvPersetujuan.GetRowValues(visibleIndex,"proposal_number").ToString();
            var data = gvPersetujuan.GetRowValues(visibleIndex, "isRealisasi").ToString();
            Session["IsReal"] = data;
            Session["Realisasi"] = proposal;

        }

        protected void gvPersetujuan_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            btnAction(e.VisibleIndex);
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~\Kemitraan\RealisasiPersetujuanTambah.aspx");
        }

        protected void gvPersetujuan_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            try
            {


                var data = gvPersetujuan.GetRowValues(e.VisibleIndex, "isRealisasi").ToString();

                if (data == "True")
                {
                    e.Image.Url = "~/content/images/checklist.png";
                    e.Text = "Detail";
                }
            }
            catch(Exception ex)
            {

            }
            
        }

        protected void gvPersetujuan_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }
    }
}