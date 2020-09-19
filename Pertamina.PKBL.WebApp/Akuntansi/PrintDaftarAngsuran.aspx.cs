using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pertamina.PKBL.BLL.Akuntansi;


namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class PrintDaftarAngsuran : System.Web.UI.Page
    {
        protected string mintraId;
        protected string nama;
        protected string alamat;
        protected string jatuhtempo_bulan;
        protected object NilaiSetuju;
        protected string TglRealisasi;
        protected string jatuhtempo_tgl;
        protected string JangkaWaktu;
        protected string grace_period;
        protected string SukuBunga;
        protected string TglJatuhTempo;
        protected string branch;

        KartuPiutangDetailBll bll = new KartuPiutangDetailBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }
        private void GetData()
        {
            //data debitur

            var id = Request.QueryString["prop"].ToString();//Session["daftarangsuran"].ToString().Trim();
            ViewState["noproposal"] = id;
            
            DataTable dt = bll.getDataDebitur(id.ToString());

            if (dt.Rows.Count > 0)
            {
                mintraId = (string)dt.Rows[0]["id"].ToString();
                nama = (string)dt.Rows[0]["nama"].ToString();
                alamat = (string)dt.Rows[0]["alamat"].ToString();
                jatuhtempo_bulan = (string)dt.Rows[0]["jatuhtempo_bulan"].ToString();
                NilaiSetuju = dt.Rows[0]["NilaiSetuju"];
                TglRealisasi = (string)dt.Rows[0]["TglRealisasi"].ToString();
                jatuhtempo_tgl = (string)dt.Rows[0]["jatuhtempo_tgl"].ToString();
                JangkaWaktu = (string)dt.Rows[0]["JangkaWaktu"].ToString();
                grace_period = (string)dt.Rows[0]["grace_period"].ToString();
                SukuBunga = (string)dt.Rows[0]["SukuBunga"].ToString();
                TglJatuhTempo = (string)dt.Rows[0]["maturityDate"].ToString();
                branch = "PKBL / CSR & SME Partnership Program PT. PERTAMINA (PERSERO) " + dt.Rows[0]["branch_name"].ToString();

                lblKodeMitra2.Text = mintraId;
                lblAlamat2.Text = alamat;
                lblNama2.Text = nama;
                lblJtuhTempo2.Text = jatuhtempo_bulan + " bulan";
                lblPinjaman2.Text = String.Format("Rp {0:#,##}.00", NilaiSetuju);
                lblTanggalRealisasi2.Text = String.Format("{0:dd/MM/yyyy}", TglRealisasi);
                lblJangkaWaktu2.Text = JangkaWaktu;
                lblGracePeriod2.Text = grace_period;
                lblPersentaseJasa2.Text = SukuBunga;
                lblTglJatuhTempo2.Text = String.Format("{0:dd/MM/yyyy}", TglJatuhTempo);
                lblRegion.Text = branch;
            }

            var detailbll = new PembayaranPKBll();

            gvDetailKartuPiutang.DataSource = detailbll.GetDaftarAngsuran(id);
            gvDetailKartuPiutang.DataBind();
        }
    }
}