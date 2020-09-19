using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class DetailReschedulePiutangKemitraan : System.Web.UI.Page
    {
        DetailReschedulePiutangKemitraanBll bll = new DetailReschedulePiutangKemitraanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                getData();
            }
        }

        private void getData() {
            var id = Session["proposal_number"];            
            DataTable dt = bll.getData(id.ToString());
            if (dt.Rows.Count > 0)
            {


                var dataDebitur = dt.Rows[0];

                txtNoMitra.Text = dataDebitur["id"].ToString();
                AtxtDebitur.Text = dataDebitur["nama"].ToString();
                txtPlafond.Text = dataDebitur["NilaiSetuju"].ToString();
                txtJangkaWaktu.Text = dataDebitur["JangkaWaktu"].ToString();
                txtBunga.Text = dataDebitur["SukuBUnga"].ToString();
                txtJatuhTempoTg.Text = dataDebitur["jatuhtempo_tgl"].ToString();
                txtJatuhTempoBl.Text = dataDebitur["jatuhtempo_bulan"].ToString();
                txtBungaa.Text = dataDebitur["jenisJasa"].ToString();
                txtSisaPokok.Text = dataDebitur["SisaPokok"].ToString();
                txtSisaBunga.Text = dataDebitur["SisaBunga"].ToString();
                cbbRescheduleAng.Items.Add(dataDebitur["maxPeriod"].ToString(), dataDebitur["maxPeriod"].ToString());
                cbbRescheduleAng.SelectedItem = cbbRescheduleAng.Items.FindByValue(dataDebitur["maxPeriod"].ToString());
                txtTanggal.Date = DateTime.Today;
                labelKolek.Text = "Status Kolektabilitas untuk mitra " + dataDebitur["nama"].ToString() + " adalah " + dataDebitur["init"].ToString();


                DataTable rs = bll.previewKartuPiutang(id.ToString());
                gvAngsuran.DataSource = rs;
                gvAngsuran.DataBind();
            }
            else
            {
                Response.Redirect("ReschedulePiutangKemitraan.aspx");
            }
        }

        protected void btnSimpan_Click(object sender, EventArgs e)
        {
            string id = Session["proposal_number"].ToString();
            DataTable rs = bll.prosesReschedule(id, txtTanggal.Text);
            gvAngsuran.DataSource = rs;
            gvAngsuran.DataBind();
        }

        protected void btnReschedule_Click(object sender, EventArgs e)
        {
            if (rdbReschedule.Checked == true)
            {

                string id = Session["proposal_number"].ToString();
                DataTable rs = bll.previewReschedule(id, txtTanggal.Text);
                gvAngsuran.DataSource = rs;
                gvAngsuran.DataBind();
            }
            if(rdbReschedule2.Checked == true){
                //not yet supported
                string id = Session["proposal_number"].ToString();
                DataTable rs = bll.previewRecondition(id, txtTanggal.Text);
                gvAngsuran.DataSource = rs;
                gvAngsuran.DataBind();
            }
            btnSimpan.Visible = true;
        }

        protected void gvAngsuran_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            //cek < 0 || (string)
            int cek = DateTime.Compare(DateTime.Today, DateTime.Parse(gvAngsuran.GetRowValues(e.VisibleIndex, "TglJatuhTempo").ToString()));
            if (gvAngsuran.GetRowValues(e.VisibleIndex, "IsLunas").ToString() == "Ya" || cek<0)
            {
                e.Cell.ForeColor = System.Drawing.Color.Black;
            }
            else {
                e.Cell.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            getData();
            btnSimpan.Visible = false;
        }


    }
}