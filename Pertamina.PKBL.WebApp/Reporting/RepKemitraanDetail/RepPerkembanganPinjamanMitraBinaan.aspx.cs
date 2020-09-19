using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Reporting;
using Pertamina.PKBL.BLL;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraPrinting;

namespace Pertamina.PKBL.WebApp.Reporting.RepKemitraan
{
    public partial class RepPerkembanganPinjamanMitraBinaan : System.Web.UI.Page
    {
        RepKemitraanBll bll = new RepKemitraanBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (!IsPostBack)
            {
                gvPerPinjBinLingk.Columns["requestor_address"].ExportWidth = 200;
                
                var date = Convert.ToInt32(DateTime.Today.Year.ToString());
                DataTable dt = new DataTable();
                dt.Columns.Add("text", typeof(string));
                dt.Columns.Add("value", typeof(string));
                DataRow dr;
                DataView dv;

                for (int i = date; i >= 1990; i--)
                {
                    dr = dt.NewRow();
                    dr["text"] = i.ToString();
                    dr["value"] = i;
                    dt.Rows.Add(dr);
                }

                dr = dt.NewRow();
                dr["text"] = "--pilih--";
                dr["value"] = 0;
                dt.Rows.InsertAt(dr, 0);

                dv = new DataView(dt);
                cbbTahun.DataSource = dv;
                cbbTahun.TextField = "text";
                cbbTahun.ValueField = "value";
                cbbTahun.DataBind();
                cbbTahun.SelectedIndex = 0;

                txtPeriode.Date = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
                txtSampaii.Date = DateTime.Today;
                cbbBulan.SelectedItem = cbbBulan.Items.FindByValue("0");
                cbbTahun.SelectedItem = cbbTahun.Items.FindByValue("0");


                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                var pengirim = new Pertamina.PKBL.BLL.Akuntansi.TransferDanaBankBll().GetKantorCabang(Convert.ToInt32(branchCode));
                if (branchCode == "9900" || branchCode == "9999")
                {
                    chregion1.Text = "AREA SUMBAGUT";
                    chregion2.Text = "AREA SUMBAGSEL";
                    chregion3.Text = "AREA JBB";
                    chregion4.Text = "AREA JATENG-YOGYAKARTA";
                    chregion5.Text = "AREA JATIM-BALINUS";
                    chregion6.Text = "AREA KALIMANTAN";
                    chregion7.Text = "AREA SULAWESI";
                    chregion8.Text = "AREA MALUKU-PAPUA";
                    chregion9.Text = "AREA KANTOR PUSAT";

                }

                else
                {
                    chregion1.Text = pengirim.Rows[0]["branch_name"].ToString();
                    chregion1.Attributes["data-branch"] = branchCode;
                    chregion2.Visible = false;
                    chregion3.Visible = false;
                    chregion4.Visible = false;
                    chregion5.Visible = false;
                    chregion6.Visible = false;
                    chregion7.Visible = false;
                    chregion8.Visible = false;
                    chregion9.Visible = false;

                }

                DataTable data = new DataTable();
                data.Columns.Add("province_name", typeof(string));
                data.Columns.Add("province_code", typeof(string));
                data.Columns.Add("branch_code", typeof(string));
                data.PrimaryKey = new DataColumn[] { data.Columns["province_code"] };
                DataRow row;
                row = data.NewRow();
                row["province_name"] = "--pilih--";
                row["province_code"] = "all";
                row["branch_code"] = "0";
                data.Rows.InsertAt(row, 0);

                cbbPropnsi.DataSource = data;
                cbbPropnsi.TextField = "province_name";
                cbbPropnsi.ValueField = "province_code";
                cbbPropnsi.DataBind();
                cbbPropnsi.SelectedItem = cbbPropnsi.Items.FindByValue("all");
                Session["provinsi"] = data;

                var MasterSektor = new Pertamina.PKBL.BLL.Kemitraan.MasterSektorKemitraanBll().GetData(new Hashtable());
                DataTable sektor = MasterSektor.Clone();
                sektor.Columns["id"].DataType = typeof(string);
                foreach (DataRow drow in MasterSektor.Rows)
                {
                    sektor.ImportRow(drow);
                }
                row = sektor.NewRow();
                row["sector_name"] = "--pilih--";
                row["id"] = "all";
                sektor.Rows.InsertAt(row, 0);

                cbbSektor.DataSource = sektor;
                cbbSektor.TextField = "sector_name";
                cbbSektor.ValueField = "id";
                cbbSektor.DataBind();
                cbbSektor.SelectedItem = cbbSektor.Items.FindByValue("all");

                Session["data"] = null;

            }
            else
            {
                if (Session["data"] != null)
                {
                    var data = (DataTable)Session["data"];
                    gvPerPinjBinLingk.DataSource = data;
                    gvPerPinjBinLingk.DataBind();
                }
            }

            
        }

        protected void chkregionChange(object sender, EventArgs e)
        {
            var cb = (ASPxCheckBox)sender;

            var branchCode = Convert.ToInt32(cb.Attributes["data-branch"]);

            if(cb.Checked)
            {
                DataTable dt = new Pertamina.PKBL.BLL.Reporting.RepKemitraanBll().GetProvinsi(branchCode);
                dt.PrimaryKey = new DataColumn[] { dt.Columns["province_code"] };
                DataTable drop = ((DataTable)Session["provinsi"]);

                foreach (DataRow item in dt.Rows)
                {
                    if (!drop.Rows.Contains(item["province_code"]))
                    {
                        var nwrw = drop.NewRow();
                        nwrw["province_name"] = item["province_name"];
                        nwrw["province_code"] = item["province_code"];
                        nwrw["branch_code"] = item["branch_code"];
                        drop.Rows.Add(nwrw);
                    }
                }
                cbbPropnsi.DataSource = drop;
                cbbPropnsi.TextField = "province_name";
                cbbPropnsi.ValueField = "province_code";
                cbbPropnsi.DataBind();
                Session["provinsi"] = drop;
            }
            else
            {
                DataTable drop = ((DataTable)Session["provinsi"]);
                DataTable temp = drop.Copy();
                temp.PrimaryKey = new DataColumn[] { temp.Columns["province_code"] };
                var rows = temp.Select("branch_code <> " + branchCode.ToString());

                drop.Rows.Clear();
                drop.PrimaryKey = null;

                foreach (DataRow item in rows)
                {
                    drop.ImportRow(item);
                    drop.PrimaryKey = new DataColumn[] { drop.Columns["province_code"] };
                }
                cbbPropnsi.DataSource = drop;
                cbbPropnsi.TextField = "province_name";
                cbbPropnsi.ValueField = "province_code";
                cbbPropnsi.DataBind();
                Session["provinsi"] = drop;
            }
            


        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "RPT.Kemitraan.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        private void GetData()
        {
            try
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                var mulai = DateTime.Parse(txtPeriode.Text).ToString("dd/MM/yyyy");
                var selesai = DateTime.Parse(txtSampaii.Text).ToString("dd/MM/yyyy");
                var bulan = cbbBulan.Value;
                var tahun = cbbTahun.Value;
                List<string> regional = new List<string>();

                bool isLancar = false, isKurang = false, isRagu = false, isMacet = false;
                if(chLancar.Checked==true)
                {
                    isLancar = true;
                }
                if(chKurang.Checked==true)
                {
                    isKurang = true;
                }
                if(chRagu.Checked==true)
                {
                    isRagu = true;
                }
                if(chMacet.Checked==true)
                {
                    isMacet = true;
                }

                if (branchCode == "9900")
                {
                    if (chregion1.Checked == true)
                    {
                        //sumbagut
                        regional.Add("1100");
                    }
                    if (chregion2.Checked == true)
                    {
                        //sumbagsel
                        regional.Add("1200");
                    }
                    if (chregion3.Checked == true)
                    {
                        //jbb
                        regional.Add("1300");
                    }
                    if (chregion4.Checked == true)
                    {
                        //jateng-yogya
                        regional.Add("1400");
                    }
                    if (chregion5.Checked == true)
                    {
                        //jatim-balinus
                        regional.Add("2500");
                    }
                    if (chregion6.Checked == true)
                    {
                        //kalimantan
                        regional.Add("2600");
                    }
                    if (chregion7.Checked == true)
                    {
                        //sulawesi
                        regional.Add("2700");
                    }
                    if (chregion8.Checked == true)
                    {
                        //maluku-papua
                        regional.Add("2800");
                    }
                    if (chregion9.Checked == true)
                    {
                        //kantor pusat
                        regional.Add("9900");
                    }
                }

                else
                {
                    if(chregion1.Checked==true)
                    {
                        regional.Add(branchCode);
                    }
                }


                var bermasalah = cbbBermasalah.Value;
                var sektor = cbbSektor.Value;
                var lunas = cbbLunas.Value;
                var provinsi = cbbPropnsi.Value;

                



                FilterPerkembangan filter = new FilterPerkembangan();

                filter.TglSalurMulai = mulai;
                filter.TglSaalurAkhir = selesai;
                filter.KualitasPerBulan = Convert.ToInt32(bulan);
                filter.KualitasPerTahun = Convert.ToInt32(tahun);

                filter.IsLancar = isLancar;
                filter.IsKurangLancar = isKurang;
                filter.IsDiragukan = isRagu;
                filter.IsMacet = isMacet;

                filter.Bermasalah = bermasalah.ToString();
                filter.Sektor = sektor.ToString();
                filter.Lunas = lunas.ToString();

                filter.Provinsi = provinsi.ToString();
                filter.Regions = regional;



                var retval = bll.GetRepPerkembanganKemitraan(filter);
                Session["data"] = retval.TabelPerkembangan;
                var data = retval.TabelPerkembangan;
                gvPerPinjBinLingk.DataSource = data;
                gvPerPinjBinLingk.DataBind();


                lblTotalPenyaluran.Text = String.Format("{0:#,#.00}",retval.TotalPenyaluran);
                lblJasaAdm.Text = String.Format("{0:#,#.00}", retval.JasaAdm);
                lblTotalPinjaman.Text = String.Format("{0:#,#.00}", retval.TotalPinjaman);
                lblPengembalianPokok.Text = String.Format("{0:#,#.00}", retval.PengembalianPinjaman);
                lblPEndapatanJasaAdm.Text = String.Format("{0:#,#.00}", retval.PendapatanJasaAdm);
                lblTotalPengembalian.Text = String.Format("{0:#,#.00}", retval.TotalPengembalian);
                lblSisaPinjamanPokok.Text = String.Format("{0:#,#.00}", retval.SisaPokok);
                lblSisaJasaAdm.Text = String.Format("{0:#,#.00}", retval.SisaJasaAdm);
                lblTotalSisaPinjaman.Text = String.Format("{0:#,#.00}", retval.TotalSisa);
                lblTunggakanPokok.Text = String.Format("{0:#,#.00}", retval.TunggakanPokok);
                lblTunggakanBunga.Text = String.Format("{0:#,#.00}", retval.TunggakanBunga);
                lblTotalTunggakan.Text = String.Format("{0:#,#.00}", retval.TotalTunggakan);

                lblLunas.Text = String.Format("{0} MB ", retval.JumlahLunas,retval.SaldoLunas);
                lblLancar.Text = String.Format("{0} MB ", retval.JumlahLancar);
                lblKurangLancar.Text = String.Format("{0} MB ", retval.JumlahKurangLancar);
                lblDiragukan.Text = String.Format("{0} MB ", retval.JumlahDiragukan);
                lblMacet.Text = String.Format("{0} MB ", retval.JumlahMacet);

                lblSaldoLunas.Text = String.Format("{0:#,#.00}", retval.SaldoLunas);
                lblSaldoLancar.Text = String.Format("{0:#,#.00}", retval.SaldoLancar);
                lblSaldoKurangLancar.Text = String.Format("{0:#,#.00}", retval.SaldoKurangLancar);
                lblSaldoDiragukan.Text = String.Format("{0:#,#.00}", retval.SaldoDiragukan);
                lblSaldoMacet.Text = String.Format("{0:#,#.00}", retval.SaldoMacet);


                lblReport.Text = "";
                lblReport.ForeColor = System.Drawing.Color.Green;
            }
            catch(Exception ex)
            {
                throw ex;
                lblReport.Text = "Pilih Bulan dan Tahun";
                lblReport.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            //Session["Pageload"] = 1;
            GetData();
            gvPerPinjBinLingk.Visible = true;
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {

            txtPeriode.Date = DateTime.Today;
            txtSampaii.Date = DateTime.Today;
            cbbBulan.SelectedItem = cbbBulan.Items.FindByValue("0");
            cbbTahun.SelectedItem = cbbTahun.Items.FindByValue("0");
            gvPerPinjBinLingk.Visible = false;
        }

        protected void gvPerPinjBinLingk_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            

            string kualitas = "periode kualitas per " + cbbBulan.SelectedItem.ToString() + " " + cbbTahun.SelectedItem.ToString();
            string filename = "periode "+txtPeriode.Date.ToString("dd/MM/yyyy") + " sampai " + txtSampaii.Date.ToString("dd/MM/yyyy")+" \n "+kualitas;
            gvExporter.ReportHeader = "Laporan Perkembangan \n " + filename;

            string TotalPenyaluran = "Total Penyaluran : " + lblTotalPenyaluran.Text;
            string JasaAdm = "Jasa Adm. : " + lblJasaAdm.Text;
            string TotalPinjaman = "Total Pinjaman : " + lblTotalPinjaman.Text;
            string PengembalianPokok = "Pengembalian Pokok : " + lblPengembalianPokok.Text ;
            string PendapatanJasaAdm = "Pendapatan Jasa Adm. : " + lblPEndapatanJasaAdm.Text;
            string TotalPengembalian = "Total Pengembalian : " + lblTotalPengembalian.Text;
            string SisaPinjamanPokok = "Sisa Pinjaman Pokok : " + lblSisaPinjamanPokok.Text;
            string SisaJasaAdm = "Sisa Jasa Adm. " + lblSisaJasaAdm.Text ;
            string TotalSisaPinjaman = "Total Sisa Pinjaman : " + lblTotalSisaPinjaman.Text;
            string TunggakanPokok = "Tunggakan Pokok : " + lblTunggakanPokok.Text;
            string TunggakanBunga = "Tunggakan Bunga : " + lblTunggakanBunga.Text;
            string TotalTunggakan = "Total Tunggakan : " + lblTotalTunggakan.Text;

            string Lunas = "Lunas : " + lblLunas.Text;
            string Lancar = " Lancar : " + lblLancar.Text;
            string KurangLancar = "Kurang Lancar : " + lblKurangLancar.Text;
            string Diragukan = "Diragukan : " + lblDiragukan.Text;
            string Macet = "Macet : " + lblMacet.Text;
            gvExporter.ReportFooter = TotalPenyaluran + "\n" + JasaAdm + "\n" + TotalPinjaman + "\n" + PengembalianPokok + "\n" + PendapatanJasaAdm + "\n" +
                PendapatanJasaAdm + "\n" + TotalPengembalian + "\n" + SisaPinjamanPokok + "\n" + SisaJasaAdm + "\n" + TotalSisaPinjaman + "\n" +
                TunggakanPokok + "\n" + TunggakanBunga + "\n" + TotalTunggakan + "\n" + "\n" + "\n" + "Klasifikasi Saldo Pinjaman" + "\n" +
                Lunas + "\n" + Lancar + "\n" + KurangLancar + "\n" + Diragukan + "\n" + Macet;

            gvExporter.MaxColumnWidth = 1000;
            gvExporter.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
            
        }

        protected void gvPerPinjBinLingk_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                try
                {
                    e.Text = (gvPerPinjBinLingk.GetRowValues(e.VisibleIndex, "requestor_name")).ToString();
                }
                catch(Exception ex)
                {

                }
            }
        }

        public void getKartuPiutang (int visibleIndex)
        {
            var prop = gvPerPinjBinLingk.GetRowValues(visibleIndex, "proposal_number");
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Akuntansi/Detail_Kartu_Piutang.aspx?prop=" + prop);
        }
        protected void gvPerPinjBinLingk_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            getKartuPiutang(e.VisibleIndex);
        }


    }
}