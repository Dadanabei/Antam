using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Data;
using DevExpress.Utils;
using DevExpress.Web.ASPxGridView;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class Detail_Kartu_Piutang : System.Web.UI.Page
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

        KartuPiutangDetailBll bll = new KartuPiutangDetailBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            //roleAuth();
            
            if (!IsPostBack) 
            {
                if (Request.QueryString["prop"] != null)
                {
                    lblKolektibilitas.Text = bll.getKolektibilitas(Request.QueryString["prop"].ToString().Trim());
                }
            }
            getData();

        }
        //private void roleAuth()
        //{

        //    var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
        //    bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.KartuPiutang.Add");
        //    bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.KartuPiutang.Edit");
        //    bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.KartuPiutang.View");
          
        //    if (view == false)
        //    {
        //        Response.Redirect("~/Default.aspx");
        //    }


        //}

        private void getData() {

            //data debitur
            var id = Request.QueryString["prop"].ToString().Trim();
            ViewState["noproposal"] = id;
            btnDownload.Attributes.Add("data-prop", id.ToString());
            lblProposal.Text = id.ToString();
            DataTable dt = bll.getDataDebitur(id.ToString());

            if (dt.Rows.Count>0)
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

                lblKodeMitra2.Text = mintraId;
                lblAlamat2.Text = alamat;
                lblNama2.Text = nama;
                lblJtuhTempo2.Text = jatuhtempo_bulan + " bulan";
                lblPinjaman2.Text =String.Format("Rp {0:#,##}.00", NilaiSetuju);
                lblTanggalRealisasi2.Text =String.Format("{0:dd/MM/yyyy}", TglRealisasi);
                lblJangkaWaktu2.Text = JangkaWaktu;
                lblGracePeriod2.Text = grace_period;
                lblPersentaseJasa2.Text = SukuBunga;
                lblTglJatuhTempo2.Text = String.Format("{0:dd/MM/yyyy}", TglJatuhTempo);

            }


            //kartupiutang
            DataTable dtPiutang = bll.getKartuPiutang(id.ToString());

            int currAngsuran = 0;

            if (dtPiutang != null)
            {

                foreach (DataRow item in dtPiutang.Rows)
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
                gvDetailKartuPiutang.DataSource = dtPiutang;
                gvDetailKartuPiutang.DataBind();
            }
            

            //gvDetailKartuPiutang.GroupBy(gvDetailKartuPiutang.Columns["AngsuranKe"]);
        }
        
      
        protected void gvDetailKartuPiutang_Load(object sender, EventArgs e)
        {

        }

        protected void gvDetailKartuPiutang_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            
        }

        protected void gvDetailKartuPiutang_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
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

        protected void gvDetailKartuPiutang_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                if (e.DataColumn == gvDetailKartuPiutang.Columns["NilaiPokok"] || e.DataColumn == gvDetailKartuPiutang.Columns["NilaiBunga"] || e.DataColumn == gvDetailKartuPiutang.Columns["NilaiAdv"] || e.DataColumn == gvDetailKartuPiutang.Columns["Totalbayar"])
                {

                    var value = 0m;
                    try
                    {
                        value = Convert.ToDecimal(e.CellValue.ToString());
                    }
                    catch (Exception ex)
                    {

                    }
                    if (value < 0)
                    {
                        e.Cell.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        
    }
}