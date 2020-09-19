using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Administer;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Reporting;
using DevExpress.XtraPrinting;

namespace Pertamina.PKBL.WebApp.Reporting.RepBinaLingUserControl
{
    public partial class RepUsulanBinaLingUserControl : System.Web.UI.UserControl
    {
        MasterKantorCabangBll bll = new MasterKantorCabangBll();
        RepBinalingBll repBll = new RepBinalingBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (!IsPostBack)
            {
                dateSampaiTanggal.Date = DateTime.Today;
                dateTanggalMulai.Date = new DateTime(1993,01,01);
                initCombo();
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

        private void initReport()
        {
            Session["dt1"] = null;
            DateTime start = (DateTime)dateTanggalMulai.Value;
            DateTime end = (DateTime)dateSampaiTanggal.Value;
            int code = int.Parse(cbbCabang.SelectedItem.Value.ToString());
            string branchName = cbbCabang.SelectedItem.ToString();

            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int",code);
            ht.Add("@tglMulai-varchar-12", start.ToString("dd/MM/yyyy"));
            ht.Add("@tglAkhir-varchar-12", end.ToString("dd/MM/yyyy"));
            DataTable dt = repBll.getRepUsulanBinaling(ht);

            Session["dt1"] = dt;
            gvReportUsulanBinaling.DataSource = dt;
            gvReportUsulanBinaling.DataBind();

        }

        private void initCombo()
        {

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var comboCabang = bll.GetData(new Hashtable());

            var row = comboCabang.NewRow();
            row["branch_name"] = "- All -";
            row["branch_code"] = 0;

            comboCabang.Rows.InsertAt(row, 0);
            DataView dv = new DataView(comboCabang);

            if (branchCode != "9900")
            {
                dv.RowFilter = "branch_code=" + branchCode.ToString();
            }
            cbbCabang.DataSource = dv;// comboCabang;
            cbbCabang.TextField = "branch_name";
            cbbCabang.ValueField = "branch_code";
            cbbCabang.DataBind();

            cbbCabang.SelectedIndex = 0;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            initReport();
        }

        public void exportReport()
        {
            string start = dateTanggalMulai.Date.ToShortDateString();
            string end = dateSampaiTanggal.Date.ToShortDateString();
            int branchCode = int.Parse(cbbCabang.SelectedItem.Value.ToString());
            string branchName = cbbCabang.SelectedItem.ToString();
            string filename = branchName + " " + start + " To " + end;
            gridExporter.ReportHeader = "Laporan Usulan Bina Lingkungan \n" + filename + "\n\n";

            gridExporter.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
           // gridExporter.WritePdfToResponse(filename);
        }

        protected void gvReportUsulanBinaling_Load(object sender, EventArgs e)
        {
            if (Session["dt1"] != null)
            {
                gvReportUsulanBinaling.DataSource = Session["dt1"];
                gvReportUsulanBinaling.DataBind();
            }            
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            exportReport();
        }
    }
}