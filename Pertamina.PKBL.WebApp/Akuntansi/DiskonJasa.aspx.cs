using DevExpress.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class DiskonJasa : System.Web.UI.Page
    {
        DiskonJasaBll bll = new DiskonJasaBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            GetData();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.DiskonJasa.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            //((GridViewCommandColumn)gvBankCOA.Columns["Opr."]).ShowEditButton = edit;
            //((GridViewDataColumn)gvPenyaluran.Columns["Opr."]).ShowEditButton = edit;
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
            var data = bll.GetData(Convert.ToInt32(branchCode));

            gvDiskonJasa.DataSource = data;
            gvDiskonJasa.DataBind();
        }

        private void btnTambahAction(int visibleIndex)
        {

            var id = gvDiskonJasa.GetRowValues(visibleIndex, "proposal_number");
            Session["proposal_number"] = id;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailDiskonJasa.aspx");
        }

        public void getKartuPiutang(int visibleIndex)
        {
            Session["proposal_number"] = gvDiskonJasa.GetRowValues(visibleIndex, "proposal_number");
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Akuntansi/Detail_Kartu_Piutang.aspx");
        }

        protected void gvDiskonJasa_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnTambah")
            {
                btnTambahAction(e.VisibleIndex);
            }

            else if (e.ButtonID == "debitur")
            {
                getKartuPiutang(e.VisibleIndex);
            }
        }


        protected void gvDiskonJasa_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex > 0)
            {

                try
                {
                    if (e.ButtonID == "debitur")
                    {
                        e.Text = (gvDiskonJasa.GetRowValues(e.VisibleIndex, "mitra_id")).ToString();
                    }
                    else if (e.ButtonID=="btnTambah")
                    {
                        int sisa = Convert.ToInt32(gvDiskonJasa.GetRowValues(e.VisibleIndex, "sisabunga"));
                        if(sisa>0)
                        {
                            e.Visible = DefaultBoolean.True;
                        }
                        else
                        {
                            e.Visible=DefaultBoolean.False;
                        }
                    }
                }

                catch (Exception ex)
                {

                }

            }
        }

        protected void gvDiskonJasa_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = ((e.VisibleIndex) + 1).ToString();
            }
        }

    }
}