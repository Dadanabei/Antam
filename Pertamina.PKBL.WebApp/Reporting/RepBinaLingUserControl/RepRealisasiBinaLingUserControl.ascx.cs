using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Reporting;
using DevExpress.XtraPrinting;

namespace Pertamina.PKBL.WebApp.Reporting.RepBinaLingUserControl
{
    public partial class RepRealisasiBinaLingUserControl : System.Web.UI.UserControl
    {
        RepBinaLingRealisasi report = new RepBinaLingRealisasi();
        RepBinalingBll bll = new RepBinalingBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (IsPostBack)
            {
                
            }
            else
            {
                InitCombo();
                dateSampaiTanggal.Date = DateTime.Today;
                dateTanggalMulai.Date = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
            }
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "RPT.BinaLing.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        private void InitReport()
        {
            Session["dt"] = null;
            DateTime start = (DateTime) dateTanggalMulai.Value;
            DateTime end = (DateTime)dateSampaiTanggal.Value;
            int branchCode = int.Parse(cbbCabang.SelectedItem.Value.ToString());
            string branchName = cbbCabang.SelectedItem.ToString();
            report.Parameters["startDate"].Value = start;
            report.Parameters["endDate"].Value = end;
            report.Parameters["branchCode"].Value = branchCode;
            report.Parameters["branchName"].Value = branchName;

            Hashtable ht = new Hashtable();

            ht.Add("@branch_code-int", branchCode);
            ht.Add("@tglMulai-varchar-20", start.ToString("dd/MM/yyyy"));
            ht.Add("@tglSelesai-varchar-20", end.ToString("dd/MM/yyyy"));

            DataTable dt = bll.getRepRealisasiBinaLing(ht);
            Session["dt"] = dt;
            gvBinalingUser.DataSource = dt;
            gvBinalingUser.DataBind();

        }

        private void InitCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            BLL.Administer.MasterKantorCabangBll bll = new BLL.Administer.MasterKantorCabangBll();

            var data = bll.GetData(new System.Collections.Hashtable());

            var dr = data.NewRow();
            dr["branch_name"] = "- All -";
            dr["branch_code"] = 0;

            data.Rows.InsertAt(dr, 0);

            DataView dv = new DataView(data);

            if (branchCode != "9900" && branchCode != "9999")
            {
                dv.RowFilter = "branch_code=" + branchCode.ToString();
            }

            cbbCabang.DataSource = dv;
            cbbCabang.ValueField = "branch_code";
            cbbCabang.TextField = "branch_name";
            cbbCabang.DataBind();

            cbbCabang.SelectedIndex = 0;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InitReport();
        }


        public void exportReport() {
            string start = dateTanggalMulai.Date.ToShortDateString();
            string end = dateSampaiTanggal.Date.ToShortDateString();
            int branchCode = int.Parse(cbbCabang.SelectedItem.Value.ToString());
            string branchName = cbbCabang.SelectedItem.ToString();
            string filename = branchName + " " +  start + " To " + end;
            gridExporter.ReportHeader = "Laporan Realisasi Bina Lingkungan \n" + filename +"\n\n";

            gridExporter.WriteXlsToResponse(filename, new XlsExportOptions {TextExportMode = TextExportMode.Value});
            //gridExporter.WritePdfToResponse(filename);
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            exportReport();
        }

        protected void gvBinalingUser_Load(object sender, EventArgs e)
        {
            if (Session["dt"] != null)
            {
                gvBinalingUser.DataSource = Session["dt"];
                gvBinalingUser.DataBind();
            }            
        }

        protected void gvBinalingUser_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = ((e.VisibleIndex) + 1).ToString();
            }
        }


    }
}