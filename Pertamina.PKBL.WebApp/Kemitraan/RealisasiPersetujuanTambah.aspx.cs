using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using System.Data;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class RealisasiPersetujuanTambah : System.Web.UI.Page
    {
        RealisasiBll bll = new RealisasiBll();
        protected void Page_Load(object sender, EventArgs e)
        {
             
            if(!IsPostBack)
            {
                initCombo();
                GetData();
            }


            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;

            btnSubmit.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penilaian.Edit");

        }

        private void GetData()
        {



            var data = bll.GetDetail(Session["Realisasi"].ToString());

            if (data != null)
            {


                //form 1
                txtPinjamanKe.Text = "1";
                txtNoMitra.Text = data["mitra_id"].ToString();
                if (data["TglRealisasi"].ToString() != "")
                {
                    DateTime tes = DateTime.Parse(data["TglRealisasi"].ToString());
                    deTglPerjanjian.Date = tes;
                }
                else
                {
                    deTglPerjanjian.Date = DateTime.Today;
                }

                if (data["TglMulaiBayar"].ToString() != "")
                {
                    DateTime tes = DateTime.Parse(data["TglMulaiBayar"].ToString());
                    deTglMulaiBayar.Date = tes;
                }
                else
                {
                    deTglMulaiBayar.Date = DateTime.Today;
                }


                txtPinjamanKe.Text = data["pinjamanke"].ToString();
                txtNoSppu.Text = data["no_sppu"].ToString();

                //form 2
                txtNama.Text = data["requestor_name"].ToString();
                txtKTP.Text = data["identification_number"].ToString();
                txtAlamatRumah.Text = data["requestor_address"].ToString();
                txtKodePos.Text = data["postal_code"].ToString();
                cbbKota.SelectedItem = cbbKota.Items.FindByValue(data["requestor_city_id"].ToString());

                cbbPenyalur.SelectedItem = cbbPenyalur.Items.FindByValue(data["supplier_id"].ToString());
                txtNamaUSaha.Text = data["company_name"].ToString();
                txtJenisUsaha.Text = data["company_sector_detail"].ToString();
                txtAlamatUSaha.Text = data["company_address"].ToString();
                txtKodePosUsaha.Text = data["company_postal"].ToString();

                //Form 3
                txtJmlPokokPinjaman.Text = data["NilaiSetuju"].ToString();
                txtJangkaWaktu.Text = data["JangkaWaktu"].ToString();
                lblTempJangkaWaktu.Text = data["JangkaWaktu"].ToString();
                txtSukuBunga.Text = data["SukuBUnga"].ToString();
                cbbSistemBunga.SelectedItem = cbbSistemBunga.Items.FindByValue(data["JenisJasa"].ToString());
                cbbSektorUSaha.SelectedItem = cbbSektorUSaha.Items.FindByValue(data["sector_id"].ToString()); 
                //txtAngsuran.Text = data[""].ToString();

                //deTglMulaiBayar.Date = DateTime.Today;
                txtJatuhTempoPerTgl.Text = data["jatuhtempo_tgl"].ToString();
                txtJatuhTempoPerBulan.Text = data["jatuhtempo_bulan"].ToString();
                cbbJenisPinjaman.SelectedItem = cbbJenisPinjaman.Items.FindByValue(data["JenisKredit"].ToString());

                txtJmlDebitur.Text = data["jml_debitur"].ToString();
                txtGracePeriod.Text = data["grace_period"].ToString();
                txtDendaTunggakan.Text = data["denda_tunggakan"].ToString();
                //txtJenisAgunan.Text = data[""].ToString();
                //txtLetakAgunan.Text = data[""].ToString();

                //txtKodePosKetentuan.Text = data[""].ToString();
                //txtBuktiKepemilikanAgunan.Text = data[""].ToString();

                //Form 4
                cbbProdukUnggulan.SelectedIndex = cbbProdukUnggulan.Items.IndexOfValue(data["isProdukUnggulan"].ToString());
                cbbMitraTerpilih.SelectedIndex = cbbMitraTerpilih.Items.IndexOfValue(data["isMitraTerpilih"].ToString());
                memoJaminan.Text = data["jaminan"].ToString();
                txtNoRekening.Text = data["no_rekening"].ToString();
                txtNamaBank.Text = data["nama_bank"].ToString();



                string header = Session["IsReal"].ToString();

                if (header == "True")
                {
                    lblHeader.Text = "Detail";
                    btnSubmit.Visible = false;
                    Session["Realisasi"] = null;
                    linkCancel.Text = "Kembali";
                }

                else
                {
                    lblHeader.Text = "Tambah";
                    btnSubmit.Visible = true;
                }
            }
            else
            {
                lblInfo.Text = "Detail data tidak tersedia";
                lblInfo.ForeColor = System.Drawing.Color.Red;
                btnSubmit.Visible = false;
            }
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var ddl = new Pertamina.PKBL.BLL.DdlBll();
            var kota = new Pertamina.PKBL.BLL.Administer.CityIndexBll().GetDataByBranch(branchCode);
            var penyalur = ddl.getComboSupplier(branchCode.ToString());
            var sektor = new Pertamina.PKBL.BLL.Kemitraan.MasterSektorKemitraanBll().GetData(new Hashtable());
            var bunga = ddl.getJenisBunga();
            var pinjaman = ddl.getJenisKredit();
            var yesno = ddl.GetComboItem("ddl_administrasi");

            cbbKota.DataSource = kota;
            cbbKota.TextField = "city_name";
            cbbKota.ValueField = "city_appcode";
            cbbKota.DataBind();

            cbbPenyalur.DataSource = penyalur;
            cbbPenyalur.TextField = "supplier_name";
            cbbPenyalur.ValueField = "id";
            cbbPenyalur.DataBind();

            cbbSektorUSaha.DataSource = sektor;
            cbbSektorUSaha.TextField = "sector_name";
            cbbSektorUSaha.ValueField = "id";
            cbbSektorUSaha.DataBind();

            cbbSistemBunga.DataSource = bunga;
            cbbSistemBunga.TextField = "descr";
            cbbSistemBunga.ValueField = "id";
            cbbSistemBunga.DataBind();

            cbbJenisPinjaman.DataSource = pinjaman;
            cbbJenisPinjaman.TextField = "descr";
            cbbJenisPinjaman.ValueField = "id";
            cbbJenisPinjaman.DataBind();

            cbbProdukUnggulan.DataSource = yesno;
            cbbProdukUnggulan.TextField = "ddl_item";
            cbbProdukUnggulan.ValueField = "ddl_value";
            cbbProdukUnggulan.DataBind();

            cbbMitraTerpilih.DataSource = yesno;
            cbbMitraTerpilih.TextField = "ddl_item";
            cbbMitraTerpilih.ValueField = "ddl_value";
            cbbMitraTerpilih.DataBind();


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
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
            log.Action = "Realisasi Proposal Nomor ";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();
                string tglPerjanjian = DateTime.Parse(deTglPerjanjian.Text).ToString("dd/MM/yyyy");
                string tglMulaiBayar = DateTime.Parse(deTglMulaiBayar.Text).ToString("dd/MM/yyyy");

                string proposal =Session["Realisasi"].ToString();
                ht.Add("@proposal_number-varchar-99", proposal);
                ht.Add("@tgl_perjanjian-varchar-20", tglPerjanjian);
                ht.Add("@pinjaman_ke-int", Convert.ToInt32(txtPinjamanKe.Text));
                ht.Add("@no_sppu-varchar-50", txtNoSppu.Text.ToString());
                ht.Add("@sistem_bunga-char-1", cbbSistemBunga.Value);

                ht.Add("@jatuhtempo_tgl-int", Convert.ToInt32(txtJatuhTempoPerTgl.Text));
                ht.Add("@jatuhtempo_bulan-int", Convert.ToInt32(txtJatuhTempoPerBulan.Text));
                ht.Add("@model_pembayaran-varchar-50", cbbModelPembayaran.SelectedItem.ToString());
                ht.Add("@jml_debitur-int", Convert.ToInt32(txtJmlDebitur.Text));
                ht.Add("@grace_period-int", Convert.ToInt32(txtGracePeriod.Text));

                ht.Add("@denda-float",float.Parse(txtDendaTunggakan.Text));
                ht.Add("@isProdukUnggulan-bit", cbbProdukUnggulan.Value.ToString());
                ht.Add("@isMitraTerpilih-bit", cbbMitraTerpilih.Value.ToString());
                ht.Add("@jaminan-text", memoJaminan.Text.ToString()??"");
                ht.Add("@no_rekening-varchar-50", txtNoRekening.Text.ToString());

                ht.Add("@nama_bank-varchar-100", txtNamaBank.Text.ToString());
                ht.Add("@tgl_mulaiBayar-varchar-20", tglMulaiBayar);
                ht.Add("@jangkaWaktu-int", Convert.ToInt32(txtJangkaWaktu.Text));

                bll.InsertAkad(ht);

                log.Type = "S";
                log.Description = log.Action + ' ' + proposal + ' ' + "Sukses oleh id" + ' ' + userName;

                lblInfo.Text = "Sukses";
                lblInfo.ForeColor = System.Drawing.Color.Green;

                GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Realisasi Gagal : " + ex.Message;
                lblInfo.Text = "Gagal, mohon periksa kembali field yang tersedia";
                lblInfo.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                logBll.InsertActivity(log);

                if (log.Type == "S")
                {
                    Session["Realisasi"] = null;
                    int flag = 1;
                    Session["Flag"] = flag;
                    Response.Redirect("RealisasiKemitraan.aspx");
                }
            }

            
        }

        protected void chYarnen_CheckedChanged(object sender, EventArgs e)
        {
            if(chYarnen.Checked==true)
            {
                txtJangkaWaktu.ReadOnly = false;
                txtJatuhTempoPerBulan.ReadOnly = false;
                lblYarnen.Visible = true;
                lblJangkaWaktu.ForeColor = System.Drawing.Color.Red;
                lblJatuhTempoBulan.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                txtJangkaWaktu.ReadOnly = true;
                txtJatuhTempoPerBulan.ReadOnly = true;
                lblYarnen.Visible = false;
                lblJangkaWaktu.ForeColor = System.Drawing.Color.Black;
                lblJatuhTempoBulan.ForeColor = System.Drawing.Color.Black;
                txtJatuhTempoPerBulan.Text = "1";
                txtJangkaWaktu.Text = lblTempJangkaWaktu.Text;
            }
        }
    }
}