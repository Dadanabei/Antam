using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class DetailJadwalPembayaran : System.Web.UI.Page
    {
        DetailJadwalPembayaraBll bll = new DetailJadwalPembayaraBll();        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                getPreviewData();
            }
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;

            SAVE.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penilaian.Edit");
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.View");
         
            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        private void getPreviewData() {


            string id = Session["proposal_number"].ToString();

            try
            {

                DataTable detail = bll.getDataDebitur(id);

                if (detail.Rows.Count > 0)
                {



                    var detailDeb = detail.Rows[0];

                    txtNama.Text = detailDeb["nama"].ToString();
                    txtAlamat.Text = detailDeb["alamat"].ToString();
                    txtTanggalRealisasi.Text = detailDeb["TglRealisasi"].ToString();
                    txtPlafond.Text = detailDeb["NilaiSetuju"].ToString();
                    txtJangkaWaktu.Text = detailDeb["JangkaWaktu"].ToString();
                    txtBunga.Text = Convert.ToInt32(detailDeb["SukuBUnga"]).ToString();
                    txtGrace.Text = detailDeb["grace_period"].ToString();
                    txtTagihan.Text = detailDeb["jatuhtempo_bulan"].ToString();
                    txtTanggal.Text = detailDeb["jatuhtempo_tgl"].ToString();
                    txtTanggalMulai.Date = DateTime.Parse(detailDeb["tglMulaiBayar"].ToString());
                    txtTanggalTempo.Date = DateTime.Parse(detailDeb["maturityDate"].ToString());

                    if (txtJangkaWaktu.Text.Equals(txtTagihan.Text))
                    {
                        lblPinjam.Text = "Pinjaman Yarnen";
                    }
                    else
                    {
                        lblPinjam.Text = "Pinjaman Biasa";
                    }



                }
                else
                {
                    Response.Redirect("JadwalPembayaran.aspx");
                }

            }
            catch (Exception ex)
            { }
        }

        protected void SAVE_Click(object sender, EventArgs e)
        {
            string id = Session["proposal_number"].ToString();
            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "save jadwal pembayaran";
            log.UserName = userName;

            try
            {
                bll.prosesData(id);
                log.Type = "S";
                log.Description = log.Action + " " + id + " sukses oleh :" + userName;
                Response.Redirect("JadwalPembayaran.aspx");
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = log.Action + " error :" + ex.Message;
            }
            finally {
                logBll.InsertActivity(log);
            }
            
        }


        protected void BATAL_Click(object sender, EventArgs e)
        {
            Response.Redirect("JadwalPembayaran.aspx");
        }

        protected void prosesButton_Click(object sender, EventArgs e)
        {
            string id = Session["proposal_number"].ToString();

            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "get preview jadwal pembayaran";
            log.UserName = userName;

            try
            {

                DataTable dt = bll.getPreviewData(id);
                gvDetailAngsur.DataSource = dt;
                gvDetailAngsur.DataBind();

                int row = 0;
                int tagih = int.Parse(txtTagihan.Text);
                int grace = int.Parse(txtGrace.Text);

                row = tagih > grace ? tagih : grace;

                txtAngsur.Text = dt.Rows[row-1]["jumlah"].ToString();
                txtHutang.Text = dt.Rows[row-1]["HutangPokok"].ToString();
                txtBungaPokok.Text = dt.Rows[row-1]["Bunga"].ToString();
                txtTanggalTempo.Date = DateTime.Parse(dt.Rows[int.Parse(txtJangkaWaktu.Text) - 1]["TglJatuhTempo"].ToString());

                SAVE.Visible = true;
                BATAL.Visible = true;

                SAVE.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "PK.Penilaian.Edit");
                BATAL.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "PK.Penilaian.Edit");

                log.Type = "S";
                log.Description = log.Action + " sukses oleh " + userName;

            }
            catch (Exception Ex)
            {

                log.Type = "E";
                log.Description = log.Action + " error :" + Ex.Message;
            }
            finally {
                logBll.InsertActivity(log);
            
            }
        }
    }
}