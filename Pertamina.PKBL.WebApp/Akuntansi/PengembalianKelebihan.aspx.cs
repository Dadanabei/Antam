using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class PengembalianKelebihan : System.Web.UI.Page
    {
        PengembalianKelebihanBll bll = new PengembalianKelebihanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int",Convert.ToInt32(branchCode));
            ht.Add("@no_bukti-varchar-50",txtNoBukti.Text??"");

            var data = bll.GetData(ht);

            gvPengembalianKelebihan.DataSource = data;
            gvPengembalianKelebihan.DataBind();

        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.LebihBayar.View");
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

        private void btnTambahAction(int visibleIndex)
        {

            var mitraid = gvPengembalianKelebihan.GetRowValues(visibleIndex, "proposal_number");
            Session["proposal_number"] = mitraid;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailPengembalianKelebihan.aspx");
        }

        public void getKartuPiutang(int visibleIndex)
        {
            Session["proposal_number"] = gvPengembalianKelebihan.GetRowValues(visibleIndex, "proposal_number");
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Akuntansi/Detail_Kartu_Piutang.aspx");
        }

        protected void gvPengembalianKelebihan_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnTambah")
            {
                btnTambahAction(e.VisibleIndex);
            }

            else if (e.ButtonID=="Kartu")
            {
                getKartuPiutang(e.VisibleIndex);
            }

           
        }

        protected void gvPengembalianKelebihan_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                try
                {
                    if (e.ButtonID == "Kartu")
                    {
                        e.Text = (gvPengembalianKelebihan.GetRowValues(e.VisibleIndex, "mitra_id")).ToString();
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void gvPengembalianKelebihan_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.VisibleIndex >= 0)
                {
                    if (e.DataColumn.FieldName == "nilaiAdv")
                    {
                        int adv = Convert.ToInt32(e.GetValue("nilaiAdv"));

                        if (adv != 0)
                        {
                            e.Cell.ForeColor = System.Drawing.Color.Red;
                            e.Cell.Text = String.Format("({0:#,##})", adv);
                        }
                        else
                        {
                            e.Cell.ForeColor = System.Drawing.Color.Black;
                        }
                    }
                }
            }
            catch
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GetData();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtNoBukti.Text = String.Empty;
            GetData();
        }

        protected void gvPengembalianKelebihan_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = ((e.VisibleIndex) + 1).ToString();
            }
        }
    }
}