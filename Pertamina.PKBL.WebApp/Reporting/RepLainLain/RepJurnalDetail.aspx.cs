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
using DevExpress.Web.ASPxGridView;
using System.Drawing;

namespace Pertamina.PKBL.WebApp.Reporting.RepLainLain
{
    public partial class RepJurnalDetail : System.Web.UI.Page
    {
        ReportLainBll bll = new ReportLainBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if(!IsPostBack){
                txtDari.Date = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
                txtHingga.Date = DateTime.Today;

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

        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "RPT.Lain.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            Session["repJurnal"] = null;
            Hashtable ht = new Hashtable();
            ht.Add("@noBukti-varchar-30", txtNo.Text);
            ht.Add("@TglBayarMulai-varchar-12", txtDari.Date.ToString("dd/MM/yyyy"));
            ht.Add("@TglBayarSampai-varchar-12", txtHingga.Date.ToString("dd/MM/yyyy"));
            ht.Add("@branchCode-int", Convert.ToInt32(cbbCabang.Value));

            DataTable repJurnal = bll.reportDetailJurnal(ht);

            Session["repJurnal"] = repJurnal;

            gvDetail.DataSource = repJurnal;
            gvDetail.DataBind();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //string branchName = cbbRegion.SelectedItem.ToString();
            string filename = "Jurnal Detail "+ txtDari.Date.ToString("dd/MM/yyyy") + " to " + txtHingga.Date.ToString("dd/MM/yyyy");
            gridExporter.ReportHeader = "Laporan Jurnal Detail \n " + filename;

            //if (fileType == "pdf")
            //{
            //    gridExporter.WritePdfToResponse(filename);
            //}
            //else if (fileType == "xls")
            //{
                gridExporter.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
            //}
        }

        protected void gvDetail_Load(object sender, EventArgs e)
        {
            if (Session["repJurnal"] != null) {
                gvDetail.DataSource = Session["repJurnal"];
                gvDetail.DataBind();            
            }
        }

        protected void gvDetail_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }


    }
}