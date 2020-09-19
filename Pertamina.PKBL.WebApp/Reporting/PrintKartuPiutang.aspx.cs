using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Akuntansi;

namespace Pertamina.PKBL.WebApp.Reporting
{
    public partial class PrintKartuPiutang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var proposal = Request.QueryString["proposal"].ToString();
            var detail = (new Pertamina.PKBL.BLL.Akuntansi.KartuPiutangDetailBll()).getPrintKartuPiutang(proposal);
            DataRow data = (DataRow)detail["data"];
            
            if(!IsPostBack)
            {
                if (Request.QueryString["proposal"] != null)
                {
                    lblKolektibilitas.Text = (new KartuPiutangDetailBll()).getKolektibilitas(Request.QueryString["proposal"].ToString().Trim());
                }
            }

            if(data!=null)
            {
                lblKodeMitra2.Text = data["mitraid"].ToString();
                lblNama2.Text = data["requestor_name"].ToString();
                lblAlamat2.Text = data["requestor_address"].ToString();
                lblJtuhTempo2.Text = String.Format("per {0} bulan ", data["jatuhtempo_bulan"]);

                lblPinjaman2.Text = String.Format("{0:#,##}.00", data["NilaiSetuju"]);
                lblTanggalRealisasi2.Text = DateTime.Parse(data["TglRealisasi"].ToString()).ToString("dd/MM/yyyy");
                lblTglJatuhTempo2.Text = data["maturityDate"].ToString();

                lblJangkaWaktu2.Text = String.Format("{0} Bulan", data["JangkaWaktu"]);
                lblGracePeriod2.Text = String.Format("{0} Bulan", data["grace_period"]);
                lblPersentaseJasa2.Text = String.Format("{0}%", data["SukuBUnga"]); 

            }


            DataTable kartu = new Pertamina.PKBL.BLL.Akuntansi.KartuPiutangDetailBll().getKartuPiutang(proposal.ToString());

            int currAngsuran = 0;
            foreach (DataRow item in kartu.Rows)
            {
                if (Convert.ToInt32(item["AngsuranKe"]) == currAngsuran)
                {
                    item["AngsuranKe"] = " ";
                    item["HutangPokok"] = " ";
                    item["Bunga"] = " ";
                    item["Total"] = " ";
                    item["TglJatuhTempo"] = " ";
                }
                else
                {
                    currAngsuran = Convert.ToInt32(item["AngsuranKe"]);
                }
            }
            gvDetailKartuPiutang.DataSource = kartu;
            gvDetailKartuPiutang.DataBind();
        }

        protected void gvDetailKartuPiutang_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "HutangPokok")
            {
                if (e.Value.ToString() != " ")
                {
                    decimal price = Convert.ToDecimal(e.Value);

                    e.DisplayText = string.Format("{0:#,##}", price);
                }

            }
            else if (e.Column.FieldName == "Bunga")
            {
                if (e.Value.ToString() != " ")
                {
                    decimal price = Convert.ToDecimal(e.Value);

                    e.DisplayText = string.Format("{0:#,##}", price);
                }

            }
            else if (e.Column.FieldName == "Total")
            {
                if (e.Value.ToString() != " ")
                {
                    decimal price = Convert.ToDecimal(e.Value);

                    e.DisplayText = string.Format("{0:#,##}", price);
                }

            }
        }
    }
}