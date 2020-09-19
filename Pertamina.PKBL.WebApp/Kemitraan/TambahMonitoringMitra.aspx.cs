using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class TambahMonitoringMitra : System.Web.UI.Page
    {
        MonitoringMitraBll bll = new MonitoringMitraBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                initCombo();
              getData();
            }
        }



        public void initCombo()
        {
            DdlBll combo = new DdlBll();
            var lahanUsaha = combo.GetComboItem("ddl_workplace");

            cbbKepemilikan.TextField = "ddl_item";
            cbbKepemilikan.ValueField = "ddl_value";
            cbbKepemilikan.DataSource = lahanUsaha;
            cbbKepemilikan.DataBind();

        }
        private void getData() {
            int mitraId = (int) Session["mitraId"];
            string tglMon = (string)Session["tglMon"];
            DataTable dt = bll.getDataDetail(mitraId, tglMon);

            var detail = dt.Rows[0]; 
            txtKode.Text=detail["mitraId"].ToString();
            txtTangal.Date = DateTime.Parse(detail["tglMonitor"].ToString());
            txtNamaUs.Text=detail["company_name"].ToString();
            txtNamaPim.Text=detail["company_ceo"].ToString();
            txtJenis.Text=detail["company_sector_detail"].ToString();
            txtAlamat.Text=detail["company_address"].ToString();
            txtTelepon.Text=detail["company_phone1"].ToString();
            txtKapan.Text=detail["company_active_since"].ToString();
            cbbKepemilikan.SelectedItem =  cbbKepemilikan.Items.FindByValue(detail["company_owns_workplace"].ToString());

            txtJumlahPeng.Text = detail["jumlahPelanggan"].ToString();
            txtJumlahTenaga.Text = detail["jumlahTenaga"].ToString();
            txtOmzet.Text = detail["omzet"].ToString();
            txtPenjualan.Text = detail["keuntungan"].ToString();
            txtDalam.Text = detail["wilPasarProvinsi"].ToString();
            txtLuar.Text = detail["wilPasarLuarProvinsi"].ToString();
            txtBangunan.Text = detail["Bangunan"].ToString();
            txtPeralatan.Text = detail["peralatan"].ToString();
            txtAset.Text = detail["nilaiAsset"].ToString();
            txtKendala.Text = detail["kendala"].ToString();
            txtSaran.Text = detail["saran"].ToString();
            txtKesim.Text = detail["kesimpulan"].ToString();
        }

        protected void btnSimpan_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            var tgl = DateTime.Parse(txtTangal.Date.ToString());
            ht.Add("@mitraId-int",txtKode.Text);
            ht.Add("@tglMonitor-varchar-12",  tgl.ToString("dd/MM/yyyy"));
            ht.Add("@jumlahPelanggan-int",txtJumlahPeng.Text);
            ht.Add("@jumlahTenaga-int",txtJumlahTenaga.Text);
            ht.Add("@omzet-decimal",txtOmzet.Text);
            ht.Add("@keuntungan-decimal",txtPenjualan.Text);
            ht.Add("@wilPasarProvinsi-varchar-100", txtDalam.Text);
            ht.Add("@wilPasarLuarProvinsi-varchar-100", txtLuar.Text);
            ht.Add("@Bangunan-varchar-100", txtBangunan.Text);
            ht.Add("@peralatan-text",txtPeralatan.Text);
            ht.Add("@nilaiAsset-decimal",txtAset.Text);
            ht.Add("@kendala-text",txtKendala.Text);
            ht.Add("@saran-text",txtSaran.Text);
            ht.Add("@kesimpulan-text", txtKesim.Text);
            try
            {
                int dt = bll.insertMonitoring(ht);
                Response.Redirect("MonitoringMitra.aspx");
            }
            catch (Exception)
            {
                
                throw;
            }

        }
    }
}