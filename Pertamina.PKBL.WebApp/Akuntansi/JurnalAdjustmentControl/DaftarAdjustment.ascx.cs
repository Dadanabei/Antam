using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using DevExpress.Web.ASPxGridView;

namespace Pertamina.PKBL.WebApp.Akuntansi.JurnalAdjustmentControl
{
    public partial class DaftarAdjustment : System.Web.UI.UserControl
    {
        JurnalBll bll = new JurnalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if(!IsPostBack)
            {
                txtTanggalDari.Date = DateTime.Today;
                txtTanggalHingga.Date = DateTime.Today;
            }

            GetData();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.View");
            ((GridViewCommandColumn)gvDaftarJrnal.Columns["Opr."]).CustomButtons["btnKoreksi"].Visibility = (insert) ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;
            ((GridViewCommandColumn)gvDaftarJrnal.Columns["Opr."]).CustomButtons["btnKoreksi"].Visibility = (edit) ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;
              if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
           

        }

        private void GetData()
        {
           

            var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            string tglMulai = DateTime.Parse(txtTanggalDari.Text).ToString("dd/MM/yyyy");
            string tglSampai = DateTime.Parse(txtTanggalHingga.Text).ToString("dd/MM/yyyy");
            int program_id = Convert.ToInt32(cbbJenisProgram.Value);
            string NoBukti = txtNoBkti.Text.Trim() ?? "";
            var data = bll.GetDataJurnalAdjusment(Convert.ToInt32(branchCode), tglMulai, tglSampai, program_id,NoBukti);
            gvDaftarJrnal.DataSource = data;
            gvDaftarJrnal.DataBind();
            gvDaftarJrnal.GroupBy(gvDaftarJrnal.Columns["NoBukti"]);
            gvDaftarJrnal.ExpandAll();
        }

        private void btnKoreksiAction(int visibleIndex)
        {

            var noBukti = gvDaftarJrnal.GetRowValues(visibleIndex, "NoBukti").ToString();
            Session["noBukti"] = noBukti;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Reporting/Koreksi.aspx");
            //("CheckList.aspx");
        }

        protected void gvDaftarJrnal_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnKoreksi")
            {
                btnKoreksiAction(e.VisibleIndex);
            }
            if (e.ButtonID == "edit")
            {
                EditAction(e.VisibleIndex);
            }
        }

        private void EditAction(int index)
        {
            Session["lihatjurnal"] = gvDaftarJrnal.GetRowValues(index, "NoBukti");
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Reporting/RepLainLain/RepLihatDetailJurnal.aspx");
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            gvDaftarJrnal.Visible = true;
        }

        protected void gvDaftarJrnal_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Group && e.VisibleIndex == 0)
            {
                var count = 1;
                Session["count"] = count;
                e.Row.Cells[0].Text = count.ToString();
            }
            else if (e.VisibleIndex > 0 && e.RowType == DevExpress.Web.ASPxGridView.GridViewRowType.Group)
            {
                var count = Convert.ToInt32(Session["count"]) + 1;
                Session["count"] = count;

                e.Row.Cells[0].Text = count.ToString();

            }
        }
    }
}