using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class Kartu_Piutang : System.Web.UI.Page
    {
        KartuPiutangBll kpBll = new KartuPiutangBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                roleAuth();
            }
            getData();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.KartuPiutang.View");
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

        public void getData(){

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gridKartuPiutang.DataSource = kpBll.getData(branchCode);
            gridKartuPiutang.DataBind();
        }

        protected void gridKartuPiutang_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

        }

        protected void gridKartuPiutang_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnDetail") {
                Session["proposal_number"] = gridKartuPiutang.GetRowValues(e.VisibleIndex, "proposal_number");
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("Detail_Kartu_Piutang.aspx");  
                //Response.Write("<script>window.open('Detail_Kartu_Piutang.aspx')</script>");
            }
            else if(e.ButtonID=="btnPrint")
            {
                Session["proposal_number"] = gridKartuPiutang.GetRowValues(e.VisibleIndex, "proposal_number");
                //DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("SuratKartuPiutang.aspx");     
                //Response.Write("<script>window.open('SuratKartuPiutang.aspx')</script>");
            }

        }

        protected void gridKartuPiutang_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }
    }
}