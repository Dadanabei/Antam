using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;

namespace Pertamina.PKBL.WebApp.Kemitraan.RealisasiKemitraanControl
{
    public partial class ListAkad : System.Web.UI.UserControl
    {
        RealisasiBll bll = new RealisasiBll();
        protected void Page_Load(object sender, EventArgs e)
        {

            GetData();

            
        }


        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = bll.GetDataAkad(branchCode);

            gvListAkad.DataSource = data;
            gvListAkad.DataBind();

        }

        private void btnAction(int visibleIndex)
        {

            //string proposal = gvListAkad.GetRowValues(visibleIndex, "proposal_number").ToString();
           var mitra = gvListAkad.GetRowValues(visibleIndex,gvListAkad.KeyFieldName).ToString();

                Session["mitraid"]=mitra;
            

        }
        protected void gvListAkad_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            btnAction(e.VisibleIndex);
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~\Kemitraan\RealisasiListAkadDetail.aspx");
        }

        protected void gvListAkad_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }
    }
}