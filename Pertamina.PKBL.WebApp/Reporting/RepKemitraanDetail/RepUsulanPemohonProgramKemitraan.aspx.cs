using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Reporting;
using Pertamina.PKBL.BLL;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraPrinting;

namespace Pertamina.PKBL.WebApp.Reporting.RepKemitraan
{
    public partial class RepUsulanPemohonProgramKemitraan : System.Web.UI.Page
    {

        RepKemitraanBll bll = new RepKemitraanBll();
        DdlBll ddl = new DdlBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (!IsPostBack) {
                txtTanggalM.Date = new DateTime(1993,01,01);
                txtTanggalS.Date = DateTime.Today;
                initCombo();

                Session["data"] = null;
            }
            else
            {

            }
                
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "RPT.Kemitraan.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
           
            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int",cbbRegion.SelectedItem.Value);
            ht.Add("@tglMulai-varchar-12",txtTanggalM.Date.ToString("dd/MM/yyyy"));
            ht.Add("@tglAkhir-varchar-12",txtTanggalS.Date.ToString("dd/MM/yyyy"));
            ht.Add("@status-varchar-1",cbbStatus.SelectedItem.Value);
            ht.Add("@keyword-varchar-100", txtSearch.Text);


            DataTable dt = bll.getRepUsulanKemitraan(ht);
            Session["data"] = dt.Copy();
            gvUsulan.DataSource = dt;
            gvUsulan.DataBind();
        }



        public void initCombo() {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            cbbStatus.Items.Insert(0, new ListEditItem("--ALL--", "0"));
            cbbStatus.Items.Insert(1, new ListEditItem("DALAM PROSES", "I"));
            cbbStatus.Items.Insert(2, new ListEditItem("DITERIMA", "P"));
            cbbStatus.Items.Insert(3, new ListEditItem("DITOLAK", "R"));
            cbbStatus.Items.Insert(4, new ListEditItem("DISETUJUI", "A"));
            cbbStatus.SelectedIndex = 0;

            
            BLL.Administer.MasterKantorCabangBll bll = new BLL.Administer.MasterKantorCabangBll();

            var data = bll.GetData(new System.Collections.Hashtable());

            var dr = data.NewRow();
            dr["branch_name"] = "- All -";
            dr["branch_code"] = 0;

            data.Rows.InsertAt(dr, 0);

            DataView dv = new DataView(data);

            if (branchCode != "9900")
            {
                dv.RowFilter = "branch_code=" + branchCode.ToString();
            }


            cbbRegion.DataSource = dv;
            cbbRegion.ValueField = "branch_code";
            cbbRegion.TextField = "branch_name";
            cbbRegion.DataBind();
            cbbRegion.SelectedIndex = 0;

        }

        protected void gvUsulan_Load(object sender, EventArgs e)
        {
            if (Session["data"] != null) {
                gvUsulan.DataSource = Session["data"];
                gvUsulan.DataBind();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            string branchName = cbbRegion.SelectedItem.ToString();
            string filename = branchName + " " + txtTanggalM.Date.ToString("dd/MM/yyyy") + " to " +txtTanggalS.Date.ToString("dd/MM/yyyy");
            gridExporter.ReportHeader = "Laporan Usulan Permohonan Proposal \n "+filename;

            //if (fileType == "pdf") {
            //    gridExporter.WritePdfToResponse(filename);
            //}
            //else if (fileType == "xls") {
                gridExporter.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
            //}
        }
    }
}