using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class PrintJadwalAngsuran : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["proposal"] != null)
            {


                var proposal = Request.QueryString["proposal"].ToString();
                var detail = (new Pertamina.PKBL.BLL.Akuntansi.KartuPiutangDetailBll()).getPrintKartuPiutang(proposal);
                DataRow data = (DataRow)detail["data"];

                if (data != null)
                {
                    lblKodeMitra2.Text = data["mitraid"].ToString();
                    lblNama2.Text = data["requestor_name"].ToString();
                    lblAlamat2.Text = data["requestor_address"].ToString();
                    lblJtuhTempo2.Text = String.Format("per {0} bulan ", data["jatuhtempo_bulan"]);

                    lblPinjaman2.Text = String.Format("{0:#,##}.00", Convert.ToInt32(data["NilaiSetuju"]));
                    lblTanggalRealisasi2.Text = DateTime.Parse(data["TglRealisasi"].ToString()).ToString("dd/MM/yyyy");
                    lblTglJatuhTempo2.Text = data["maturityDate"].ToString();

                    lblJangkaWaktu2.Text = String.Format("{0} Bulan", data["JangkaWaktu"]);
                    lblGracePeriod2.Text = String.Format("{0} Bulan", data["grace_period"]);
                    lblPersentaseJasa2.Text = String.Format("{0}%", data["SukuBUnga"]);

                }
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;


                var res = (new Pertamina.PKBL.BLL.Kemitraan.JadwalPembayaranBll()).PrintJadwalAngsuranItems(proposal, branchCode);

                var tabel = (DataTable)res["tabel"];
                try
                {


                    var footer = ((DataTable)res["footer"]).Rows[0];

                    gvDetailKartuPiutang.DataSource = tabel;
                    gvDetailKartuPiutang.DataBind();

                    var awal = Convert.ToDateTime(tabel.Rows[0]["TglJatuhTempo"]).ToString("dd MMMM yyyy");
                    var akhir = Convert.ToDateTime(tabel.Rows[tabel.Rows.Count - 1]["TglJatuhTempo"]).ToString("dd MMMM yyyy");

                    ViewState["awal"] = awal;
                    ViewState["akhir"] = akhir;

                    ViewState["branch_name"] = footer["branch_name"].ToString();
                    ViewState["alamat"] = footer["address1"].ToString();
                    ViewState["kota"] = footer["kota_lengkap"].ToString();
                    ViewState["now"] = DateTime.Today.ToString("dd MMMM yyyy");
                    ViewState["manager"] = footer["pic"].ToString();
                }
                catch
                {

                }
            }
        }



        protected void gvDetailKartuPiutang_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            //if (e.Column.FieldName == "HutangPokok")
            //{
            //    if (e.Value.ToString() != " ")
            //    {
            //        decimal price = Convert.ToDecimal(e.Value);

            //        e.DisplayText = string.Format("{0:#,##}", price);
            //    }

            //}
            //else if (e.Column.FieldName == "Bunga")
            //{
            //    if (e.Value.ToString() != " ")
            //    {
            //        decimal price = Convert.ToDecimal(e.Value);

            //        e.DisplayText = string.Format("{0:#,##}", price);
            //    }

            //}
            //else if (e.Column.FieldName == "Total")
            //{
            //    if (e.Value.ToString() != " ")
            //    {
            //        decimal price = Convert.ToDecimal(e.Value);

            //        e.DisplayText = string.Format("{0:#,##}", price);
            //    }

            //}
        }
    }
}