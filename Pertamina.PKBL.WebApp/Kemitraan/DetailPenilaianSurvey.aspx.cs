using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL;
using Pertamina.PKBL.BLL.Kemitraan;
using System.Data;
using System.Collections;
using System.Net;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class DetailPenilaianSurvey : System.Web.UI.Page
    {
        DetailPenilaianProposalBll bll = new DetailPenilaianProposalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                initCombo();
                getData();   

                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;

                btnSimpan.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penilaian.Edit");
            }
        }

        public void getData() {
            string proposal_number = Session["proposal_number"].ToString();
            DataTable dt = bll.getData(proposal_number);
            if (dt.Rows.Count > 0)
            {


                (ASPxNavBar1.Groups[0].Items[0].FindControl("aNoForm") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["NoForm"].ToString();
                (ASPxNavBar1.Groups[0].Items[0].FindControl("aNama") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["nama"].ToString();
                (ASPxNavBar1.Groups[0].Items[0].FindControl("aTanggal") as DevExpress.Web.ASPxEditors.ASPxDateEdit).Text = DateTime.Now.ToShortDateString();
                (ASPxNavBar1.Groups[0].Items[0].FindControl("aAlamatUsaha") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["requestor_address"].ToString();
                (ASPxNavBar1.Groups[0].Items[0].FindControl("aBidangUSaha") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["BidangUsaha"].ToString();
                (ASPxNavBar1.Groups[0].Items[0].FindControl("aNoTelp") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["NoTelp"].ToString();
                (ASPxNavBar1.Groups[1].Items[0].FindControl("bSuratPermohonan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["SuratPermohonan"].ToString();
                (ASPxNavBar1.Groups[1].Items[0].FindControl("bPermohonanKredit") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["PermohonanKredit"].ToString();
                (ASPxNavBar1.Groups[1].Items[0].FindControl("bNilaiSetuju") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["NilaiSetuju"].ToString();
                (ASPxNavBar1.Groups[1].Items[0].FindControl("bJangkaWaktu") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["JangkaWaktu"].ToString();
                (ASPxNavBar1.Groups[1].Items[0].FindControl("bMemoMotivasi") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["MemoMotivasi"].ToString();

                (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganPertamina") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = Convert.ToInt16(dt.Rows[0]["HubunganPertamina"]) - 1;
                (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganBUMN") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = Convert.ToInt16(dt.Rows[0]["HubunganBUMN"]) - 1;
                (ASPxNavBar1.Groups[2].Items[0].FindControl("bFasilitas") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = Convert.ToInt16(dt.Rows[0]["Fasilitas"]) - 1;

                (ASPxNavBar1.Groups[3].Items[0].FindControl("dAkte") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Akte"].ToString();
                (ASPxNavBar1.Groups[3].Items[0].FindControl("dKTP") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["KTP"].ToString();
                (ASPxNavBar1.Groups[3].Items[0].FindControl("dKK") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["KK"].ToString();
                (ASPxNavBar1.Groups[3].Items[0].FindControl("dPerijinan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Perijinan"].ToString();

                (ASPxNavBar1.Groups[4].Items[0].FindControl("ePerformance") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["Performance"].ToString();

                (ASPxNavBar1.Groups[5].Items[0].FindControl("fTeknis") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["Teknis"].ToString();

                (ASPxNavBar1.Groups[6].Items[0].FindControl("gPemasaran") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["Pemasaran"].ToString();

                (ASPxNavBar1.Groups[7].Items[0].FindControl("hUang") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Uang"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hPersediaan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Persediaan"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hPiutang") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Piutang"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hPeralatan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Peralatan"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hKendaraan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Kendaraan"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hTotalAktiva") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["TotalAktiva"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hHutangDagang") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["HutangDagang"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hModal") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Modal"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hTotalPasiva") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["TotalPasiva"].ToString();
                (ASPxNavBar1.Groups[7].Items[0].FindControl("hPembukuan") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["Pembukuan"].ToString();

                (ASPxNavBar1.Groups[8].Items[0].FindControl("iManfaat") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["Manfaat"].ToString();

                (ASPxNavBar1.Groups[9].Items[0].FindControl("jAgunanPokok") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["AgunanPokok"].ToString();
                (ASPxNavBar1.Groups[9].Items[0].FindControl("jAgunanTambahan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["AgunanTambahan"].ToString();
                (ASPxNavBar1.Groups[9].Items[0].FindControl("jHargaTanah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["HargaTanah"].ToString();
                (ASPxNavBar1.Groups[9].Items[0].FindControl("jLuasTanah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["LuasTanah"].ToString();
                (ASPxNavBar1.Groups[9].Items[0].FindControl("jNilaiTanah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["NilaiTanah"].ToString();
                (ASPxNavBar1.Groups[9].Items[0].FindControl("jNilaiBangunan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["NilaiBangunan"].ToString();
                (ASPxNavBar1.Groups[9].Items[0].FindControl("jTotalAgunan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["TotalAgunan"].ToString();

                (ASPxNavBar1.Groups[10].Items[0].FindControl("kTotalPenjualan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["TotalPenjualan"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kPembelian") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Pembelian"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kLabaKotor") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["LabaKotor"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kKaryawan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Karyawan"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kListrik") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Listrik"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kTransportasi") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Transportasi"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kPerkiraanDaerah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["PerkiraanDaerah"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kTotalPenjualan2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["TotalPenjualan2"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kTotalPembelian2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["TotalPembelian2"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kLabaKotor2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["LabaKotor2"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kKaryawan2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Karyawan2"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kListrik2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Listrik2"].ToString();
                (ASPxNavBar1.Groups[10].Items[0].FindControl("kTransportasi2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Transportasi2"].ToString();
                //
                (ASPxNavBar1.Groups[11].Items[0].FindControl("lKreditAjukan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["KreditAjukan"].ToString();
                (ASPxNavBar1.Groups[11].Items[0].FindControl("lPenjualanKotor") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["PenjualanKotor"].ToString();
                (ASPxNavBar1.Groups[11].Items[0].FindControl("lPengeluaran") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Pengeluaran"].ToString();
                (ASPxNavBar1.Groups[11].Items[0].FindControl("lKebutuhan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Kebutuhan"].ToString();
                (ASPxNavBar1.Groups[11].Items[0].FindControl("lTotalKebutuhan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["TotalKebutuhan"].ToString();
                (ASPxNavBar1.Groups[11].Items[0].FindControl("lPerkiraan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Perkiraan"].ToString();
                (ASPxNavBar1.Groups[11].Items[0].FindControl("lPembulatan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Pembulatan"].ToString();

                (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekLegal") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["AspekLegal"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekManajemen") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["AspekManajemen"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekTeknik") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["AspekTeknik"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekPemasaran") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["AspekPemasaran"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekKeuangan") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["AspekKeuangan"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekManfaat") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["AspekManfaat"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekAgunan") as DevExpress.Web.ASPxEditors.ASPxMemo).Text = dt.Rows[0]["AspekAgunan"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mKegunaan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Kegunaan"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisKredit") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = Convert.ToInt16(dt.Rows[0]["JenisKredit"]) - 1;
                if ((Convert.ToInt32(dt.Rows[0]["SukuBUnga"])) == 0)
                {
                    (ASPxNavBar1.Groups[12].Items[0].FindControl("mSukuJasa") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = "6";
                }
                else
                {
                    (ASPxNavBar1.Groups[12].Items[0].FindControl("mSukuJasa") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = (Convert.ToInt32(dt.Rows[0]["SukuBUnga"])).ToString();
                }

                (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = Convert.ToInt16(dt.Rows[0]["JenisJasa"]) - 1;
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mDenda") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Denda"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mProvinsi") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["Provisi"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mBiayaAdm") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["BiayaAdm"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mPembayaranBunga") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["PembayaranBunga"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mJaminanPokok") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["JaminanPokok"].ToString();
                (ASPxNavBar1.Groups[12].Items[0].FindControl("mJaminanTambahan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text = dt.Rows[0]["JaminanTambahan"].ToString();

                if (dt.Rows[0]["Keputusan"].Equals(DBNull.Value))
                {
                    (ASPxNavBar1.Groups[13].Items[0].FindControl("Keputusan") as DropDownList).Visible = true;
                    (ASPxNavBar1.Groups[13].Items[0].FindControl("alasan") as DevExpress.Web.ASPxEditors.ASPxMemo).Visible = true;
                }
                else if (dt.Rows[0]["sts"].ToString() == "I" || dt.Rows[0]["sts"].ToString() == "P")
                {
                    (ASPxNavBar1.Groups[13].Items[0].FindControl("Keputusan") as DropDownList).Visible = true;
                    (ASPxNavBar1.Groups[13].Items[0].FindControl("alasan") as DevExpress.Web.ASPxEditors.ASPxMemo).Visible = true;

                }
                else
                {

                    (ASPxNavBar1.Groups[13].Items[0].FindControl("Keputusan") as DropDownList).Visible = false;
                    (ASPxNavBar1.Groups[13].Items[0].FindControl("alasan") as DevExpress.Web.ASPxEditors.ASPxMemo).Visible = false;
                    btnSimpan.Visible = false;
                }
            }
            else
            {
                Response.Redirect("PenilaianSurvey.aspx");
            }
        }

        private void initCombo() {
            DdlBll dll = new DdlBll();
            var jenisKredit = dll.getJenisKredit();
            var jenisBunga = dll.getJenisBunga();


            (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganPertamina") as DevExpress.Web.ASPxEditors.ASPxComboBox).Items.Add("Ada", "1");
            (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganPertamina") as DevExpress.Web.ASPxEditors.ASPxComboBox).Items.Add("Tidak Ada", "0");
            (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganPertamina") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = 0;

            (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganBUMN") as DevExpress.Web.ASPxEditors.ASPxComboBox).Items.Add("Ada", "1");
            (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganBUMN") as DevExpress.Web.ASPxEditors.ASPxComboBox).Items.Add("Tidak Ada", "0");
            (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganBUMN") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = 0;

            (ASPxNavBar1.Groups[2].Items[0].FindControl("bFasilitas") as DevExpress.Web.ASPxEditors.ASPxComboBox).Items.Add("Ada", "1");
            (ASPxNavBar1.Groups[2].Items[0].FindControl("bFasilitas") as DevExpress.Web.ASPxEditors.ASPxComboBox).Items.Add("Tidak Ada", "0");
            (ASPxNavBar1.Groups[2].Items[0].FindControl("bFasilitas") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = 0;

            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisKredit") as DevExpress.Web.ASPxEditors.ASPxComboBox).DataSource = jenisKredit;
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisKredit") as DevExpress.Web.ASPxEditors.ASPxComboBox).TextField = "descr";
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisKredit") as DevExpress.Web.ASPxEditors.ASPxComboBox).ValueField = "id";
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisKredit") as DevExpress.Web.ASPxEditors.ASPxComboBox).DataBind();
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisKredit") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = 0;

            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).DataSource = jenisBunga;            
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).TextField = "descr";
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).ValueField = "id";
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).ValueType = typeof(Int32);
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).DataBind();
            (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).SelectedIndex = 0;
        }

        protected void btnSimpan_Click(object sender, EventArgs e)
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
            log.Action = "insert penilaian";
            log.UserName = userName;

            try
            {


                Hashtable ht = new Hashtable();
                var Tanggal = DateTime.Parse((ASPxNavBar1.Groups[0].Items[0].FindControl("aTanggal") as DevExpress.Web.ASPxEditors.ASPxDateEdit).Text);
                //int nilai = Convert.ToInt32((ASPxNavBar1.Groups[1].Items[0].FindControl("bNilaiSetuju") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                decimal nilai = Convert.ToDecimal((ASPxNavBar1.Groups[1].Items[0].FindControl("bNilaiSetuju") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                if (true)//Kredit <= 75000000---Permen sekarang tidak boleh  lebih dari 75 juta
                {

                    
                    ht.Add("@Proposal_number-varchar-255", (ASPxNavBar1.Groups[1].Items[0].FindControl("bSuratPermohonan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Tanggal-varchar-12", Tanggal.ToString("dd/MM/yyyy"));
                    ht.Add("@BidangUsaha-varchar-255", (ASPxNavBar1.Groups[0].Items[0].FindControl("aBidangUSaha") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@NoTelp-varchar-255", (ASPxNavBar1.Groups[0].Items[0].FindControl("aNoTelp") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@PengalamanUsaha-text", (ASPxNavBar1.Groups[0].Items[0].FindControl("aPengalaman") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@SuratPermohonan-varchar-255", (ASPxNavBar1.Groups[1].Items[0].FindControl("bSuratPermohonan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);

                    ht.Add("@PermohonanKredit-decimal", (ASPxNavBar1.Groups[1].Items[0].FindControl("bPermohonanKredit") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@NilaiSetuju-decimal",decimal.Parse(nilai.ToString()));
                    ht.Add("@JangkaWaktu-int", (ASPxNavBar1.Groups[1].Items[0].FindControl("bJangkaWaktu") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@MemoMotivasi-text", (ASPxNavBar1.Groups[1].Items[0].FindControl("bMemoMotivasi") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);

                    ht.Add("@HubunganPertamina-int", (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganPertamina") as DevExpress.Web.ASPxEditors.ASPxComboBox).Value??0);
                    ht.Add("@HubunganBUMN-int", (ASPxNavBar1.Groups[2].Items[0].FindControl("cHubunganBUMN") as DevExpress.Web.ASPxEditors.ASPxComboBox).Value??0);
                    ht.Add("@Fasilitas-int", (ASPxNavBar1.Groups[2].Items[0].FindControl("bFasilitas") as DevExpress.Web.ASPxEditors.ASPxComboBox).Value??0);

                    ht.Add("@Akte-varchar-255", (ASPxNavBar1.Groups[3].Items[0].FindControl("dAkte") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@KTP-varchar-255", (ASPxNavBar1.Groups[3].Items[0].FindControl("dKTP") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@KK-varchar-255", (ASPxNavBar1.Groups[3].Items[0].FindControl("dKK") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Perijinan-varchar-255", (ASPxNavBar1.Groups[3].Items[0].FindControl("dPerijinan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);

                    ht.Add("@Performance-text", (ASPxNavBar1.Groups[4].Items[0].FindControl("ePerformance") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);

                    ht.Add("@Teknis-text", (ASPxNavBar1.Groups[5].Items[0].FindControl("fTeknis") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);

                    ht.Add("@Pemasaran-text", (ASPxNavBar1.Groups[6].Items[0].FindControl("gPemasaran") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);

                    ht.Add("@Uang-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hUang") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Persediaan-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hPersediaan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Piutang-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hPiutang") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Peralatan-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hPeralatan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Kendaraan-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hKendaraan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@TotalAktiva-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hTotalAktiva") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@HutangDagang-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hHutangDagang") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Modal-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hModal") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@TotalPasiva-decimal", (ASPxNavBar1.Groups[7].Items[0].FindControl("hTotalPasiva") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Pembukuan-text", (ASPxNavBar1.Groups[7].Items[0].FindControl("hPembukuan") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);

                    ht.Add("@Manfaat-text", (ASPxNavBar1.Groups[8].Items[0].FindControl("iManfaat") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);

                    ht.Add("@AgunanPokok-varchar-255", (ASPxNavBar1.Groups[9].Items[0].FindControl("jAgunanPokok") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@AgunanTambahan-varchar-255", (ASPxNavBar1.Groups[9].Items[0].FindControl("jAgunanTambahan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@HargaTanah-decimal", (ASPxNavBar1.Groups[9].Items[0].FindControl("jHargaTanah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@LuasTanah-varchar-255", (ASPxNavBar1.Groups[9].Items[0].FindControl("jLuasTanah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@NilaiTanah-decimal", (ASPxNavBar1.Groups[9].Items[0].FindControl("jNilaiTanah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@NilaiBangunan-decimal", (ASPxNavBar1.Groups[9].Items[0].FindControl("jNilaiBangunan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@TotalAgunan-decimal", (ASPxNavBar1.Groups[9].Items[0].FindControl("jTotalAgunan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);

                    ht.Add("@TotalPenjualan-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kTotalPenjualan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Pembelian-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kPembelian") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@LabaKotor-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kLabaKotor") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Karyawan-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kKaryawan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Listrik-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kListrik") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Transportasi-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kTransportasi") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@PerkiraanDaerah-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kPerkiraanDaerah") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@TotalPenjualan2-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kTotalPenjualan2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@TotalPembelian2-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kTotalPembelian2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@LabaKotor2-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kLabaKotor2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Karyawan2-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kKaryawan2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Listrik2-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kListrik2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Transportasi2-decimal", (ASPxNavBar1.Groups[10].Items[0].FindControl("kTransportasi2") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    //
                    ht.Add("@KreditAjukan-decimal", (ASPxNavBar1.Groups[11].Items[0].FindControl("lKreditAjukan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@PenjualanKotor-decimal", (ASPxNavBar1.Groups[11].Items[0].FindControl("lPenjualanKotor") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Pengeluaran-decimal", (ASPxNavBar1.Groups[11].Items[0].FindControl("lPengeluaran") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Kebutuhan-decimal", (ASPxNavBar1.Groups[11].Items[0].FindControl("lKebutuhan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@TotalKebutuhan-decimal", (ASPxNavBar1.Groups[11].Items[0].FindControl("lTotalKebutuhan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Perkiraan-decimal", (ASPxNavBar1.Groups[11].Items[0].FindControl("lPerkiraan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Pembulatan-decimal", (ASPxNavBar1.Groups[11].Items[0].FindControl("lPembulatan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);

                    ht.Add("@AspekLegal-text", (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekLegal") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@AspekManajemen-text", (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekManajemen") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@AspekTeknik-text", (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekTeknik") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@AspekPemasaran-text", (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekPemasaran") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@AspekKeuangan-text", (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekKeuangan") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@AspekManfaat-text", (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekManfaat") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@AspekAgunan-text", (ASPxNavBar1.Groups[12].Items[0].FindControl("mAspekAgunan") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@Kegunaan-varchar-255", (ASPxNavBar1.Groups[12].Items[0].FindControl("mKegunaan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@JenisKredit-int", Convert.ToInt32((ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisKredit") as DevExpress.Web.ASPxEditors.ASPxComboBox).Value));
                    ht.Add("@SukuBUnga-decimal", (ASPxNavBar1.Groups[12].Items[0].FindControl("mSukuJasa") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@JenisJasa-int", (ASPxNavBar1.Groups[12].Items[0].FindControl("mJenisJasa") as DevExpress.Web.ASPxEditors.ASPxComboBox).Value);
                    ht.Add("@Denda-decimal", (ASPxNavBar1.Groups[12].Items[0].FindControl("mDenda") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@Provisi-decimal", (ASPxNavBar1.Groups[12].Items[0].FindControl("mProvinsi") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@BiayaAdm-decimal", (ASPxNavBar1.Groups[12].Items[0].FindControl("mBiayaAdm") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@PembayaranBunga-varchar-255", (ASPxNavBar1.Groups[12].Items[0].FindControl("mPembayaranBunga") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@JaminanPokok-varchar-255", (ASPxNavBar1.Groups[12].Items[0].FindControl("mJaminanPokok") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);
                    ht.Add("@JaminanTambahan-varchar-255", (ASPxNavBar1.Groups[12].Items[0].FindControl("mJaminanTambahan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text);

                    ht.Add("@Keputusan-varchar-255", (ASPxNavBar1.Groups[13].Items[0].FindControl("Keputusan") as DropDownList).SelectedValue.ToString());
                    ht.Add("@Alasan-text", (ASPxNavBar1.Groups[13].Items[0].FindControl("alasan") as DevExpress.Web.ASPxEditors.ASPxMemo).Text);
                    ht.Add("@modified_by-varchar-64", Session["user"].ToString());

                   
                    bll.insertData(ht);
                    log.Type = "S";
                    log.Description = log.Action + "no proposal " + (ASPxNavBar1.Groups[1].Items[0].FindControl("bSuratPermohonan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text + " ";
                        
                    try
                    {
                            log.Description = log.Action + "no proposal " + (ASPxNavBar1.Groups[1].Items[0].FindControl("bSuratPermohonan") as DevExpress.Web.ASPxEditors.ASPxTextBox).Text + " " + (ASPxNavBar1.Groups[13].Items[0].FindControl("Keputusan") as DropDownList).SelectedValue.ToString() + " sukses oleh id " + userName;
                        
                    }
                    catch
                    {

                        
                    }
                    

                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
                    Response.Redirect("PenilaianSurvey.aspx");
                }
                else
                {
                    log.Type = "F";
                    log.Description = "insert penilaian proposal gagal : ";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Nilai Persetujuan tidak boleh lebih dari Rp 75.000.000,00');", true);
                }
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "insert penilaian proposal error : " + ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally {
                logBll.InsertActivity(log);
            }
        }


    }
}