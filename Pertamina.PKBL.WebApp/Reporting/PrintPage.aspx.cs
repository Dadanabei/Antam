using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;

namespace Pertamina.PKBL.WebApp.Reporting
{
    public partial class PrintPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["noref"] != null)
            {
                var noref = Request.QueryString["noref"].ToString();

                if (noref.ToLower().Contains("gl"))
                {
                    lblHeader.Text = "JURNAL UMUM";
                }
                else
                {
                    lblHeader.Text = "BUKTI KAS BANK";
                }

                var ht = (new JurnalBll()).GetJurnalByNoRef(noref);
                DataRow master = (DataRow)ht["master"];
                DataTable detail = (DataTable)ht["detail"];

                lblNoBukti.Text = noref;
                lblKepada.Text = master["kepada"].ToString();
                lblKeterangan.Text = master["ketbayar"].ToString();
                lblTgl.Text = master["tglBukti"].ToString();

                lblVerifikator.Text = master["verifikasi"].ToString();
                lblPermintaanBayar.Text = master["permintaan_bayar"].ToString();
                lblPenyetuju.Text = master["penyetujuan"].ToString();

                gvJurnal.DataSource = detail;
                gvJurnal.DataBind();
            }
            else
            {
                if (Session["printPreviewJurnal"] != null)
                {
                    var data = (Hashtable)Session["printPreviewJurnal"];

                    var noref = data["@Noref-varchar-40"].ToString();

                    if (noref.ToLower().Contains("gl"))
                    {
                        lblHeader.Text = "JURNAL UMUM";
                    }
                    else
                    {
                        lblHeader.Text = "BUKTI KAS BANK";
                    }

                    //var ht = (new JurnalBll()).GetJurnalByNoRef(noref);
                    //DataRow master = (DataRow)ht["master"];
                    //DataTable detail = (DataTable)ht["detail"];

                    lblNoBukti.Text = noref;
                    lblKepada.Text = data["@kepada-varchar-99"].ToString();
                    lblKeterangan.Text = data["@KetBayar-nvarchar-1000"].ToString();
                    lblTgl.Text = data["@TglBukti-varchar-20"].ToString();

                    lblVerifikator.Text = data["@verifikasi-varchar-99"].ToString();
                    lblPermintaanBayar.Text = data["@permintaan_bayar-varchar-99"].ToString();
                    lblPenyetuju.Text = data["@penyetujuan-varchar-99"].ToString();

                    var detail = (DataTable)data["@details-structured"];

                    gvJurnal.DataSource = (new JurnalBll()).GetPreviewJurnal(detail);
                    gvJurnal.DataBind();

                }
            }
        }

        protected void gvJurnal_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }
    }
}