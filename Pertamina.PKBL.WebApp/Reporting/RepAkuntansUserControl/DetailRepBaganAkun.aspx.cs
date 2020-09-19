using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Reporting;
using System.Data;

namespace Pertamina.PKBL.WebApp.Reporting.RepAkuntansUserControl
{
    public partial class DetailRepBaganAkun : System.Web.UI.Page
    {
        RepAkuntansiBll bll = new RepAkuntansiBll();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();
            }
            else
            {
                gvBagan.DataSource = (DataTable)Session["detBaganAkun"];
                gvBagan.DataBind();
            }
            
        }

        protected void GetData()
        {
            BaganAkunDetail akun = new BaganAkunDetail();
            akun = (BaganAkunDetail)Session["detailbagan"];

            txtCoa.Text = akun.Coa;
            txtDesc.Text = akun.Deskripsi;
            TxtPeriode.Text = akun.Periode;

            txtSaldoAwal.Text = String.Format("{0:#,##}", akun.SaldoAwal);
            txtDebit.Text = String.Format("{0:#,##}",akun.Debet);
            txtKredit.Text = String.Format("{0:#,##}",akun.Kredit);
            txtSaldoAkhir.Text = String.Format("{0:#,##}",akun.SaldoAkhir);

            var data = bll.GetDetailBaganAkun(akun);
            Session["detBaganAkun"] = data;
            gvBagan.DataSource = data;
            gvBagan.DataBind();


        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            string coa = txtCoa.Text;
            string filename = coa + " dengan deskripsi " + txtDesc.Text + " periode " + TxtPeriode.Text;
            gridExporter.ReportHeader = "Laporan Bagan Akun COA \n " + filename;


            gridExporter.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
        }

        protected void gvBagan_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            var nobukti = gvBagan.GetRowValues(e.VisibleIndex, "NoBukti");

            Session["lihatjurnal"] = nobukti;

            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("~/Reporting/RepLainLain/RepLihatDetailJurnal.aspx");

        }

       
    }
}