using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;

namespace Pertamina.PKBL.WebApp
{
    public partial class ReschedulePiutangKemitraan : System.Web.UI.Page
    {
        ReschedulePiutangKemitraanBll bll = new ReschedulePiutangKemitraanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
        }
        private void getData() {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvRescheduleKemitraan.DataSource = bll.getData(branchCode);
            gvRescheduleKemitraan.DataBind(); 
        }

        protected void gvRescheduleKemitraan_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnReschedule") {
                var id = gvRescheduleKemitraan.GetRowValues(e.VisibleIndex,"proposal_number");
                Session["proposal_number"] = id;
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailReschedulePiutangKemitraan.aspx");
            }
            if (e.ButtonID == "btnPrint")
            {
                var id = gvRescheduleKemitraan.GetRowValues(e.VisibleIndex, "proposal_number");
                
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("~/Reporting/PrintKartuPiutang.aspx?proposal="+id);
            }
        }
    }
}