using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Reporting;
using DevExpress.XtraPrinting;
using DevExpress.Web.ASPxEditors;

namespace Pertamina.PKBL.WebApp.Reporting.RepKemitraan
{
    public partial class RepRealisasiProgramKemitraan : System.Web.UI.Page
    {
        RepKemitraanBll bll = new RepKemitraanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                txtPeriode.Date = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
                txtPeriode2.Date = DateTime.Today;

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

                Session["data"] = null;
            }

            else
            {
                if (Session["data"] != null)
                {
                    var data = (DataTable)Session["data"];
                    gv.DataSource = data;
                    gv.DataBind();
                }
            }
        }

        private void GetData()
        {
            try 
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                var mulai = DateTime.Parse(txtPeriode.Text).ToString("dd/MM/yyyy");
                var selesai = DateTime.Parse(txtPeriode2.Text).ToString("dd/MM/yyyy");
                List<string> regional = new List<string>();

                

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
                    if (chregion1.Checked == true)
                    {
                        regional.Add(branchCode);
                    }
                }

                var provinsi = cbbPropnsi.Value;
                FilterRealisasi filter = new FilterRealisasi();

                filter.TglSalurMulai = mulai;
                filter.TglSaalurAkhir = selesai;

                filter.Provinsi = provinsi.ToString();
                filter.Regions = regional;



                var retval = bll.GetLaporanRealisasi(filter);
                Session["data"] = retval.Copy();
                var data = retval;
                gv.DataSource = data;
                gv.DataBind();
            }
            catch(Exception ex)
            {

            }
            
        }

        protected void chkregionChange(object sender, EventArgs e)
        {
            var cb = (ASPxCheckBox)sender;

            var branchCode = Convert.ToInt32(cb.Attributes["data-branch"]);

            if (cb.Checked)
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

        protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = (Convert.ToInt32(e.VisibleIndex) + 1).ToString();
            }
        }

        protected void btnSbmit_Click(object sender, EventArgs e)
        {
            GetData();
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            string branchName = "";
            string provinsi = "";
            if (cbbPropnsi.Value != "all")
            {
                provinsi = ", Provinsi" + cbbPropnsi.SelectedItem.ToString();
            }
            string filename = txtPeriode.Date.ToString("dd/MM/yyyy") + " to " + txtPeriode2.Date.ToString("dd/MM/yyyy");
            gvExporter.ReportHeader = "Laporan Realisasi Program Kemitraan \n " + filename + "\n" + branchName + "\n" + provinsi;

            //if (fileType == "pdf") {
            //    gridExporter.WritePdfToResponse(filename);
            //}
            //else if (fileType == "xls") {
            gvExporter.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
        }
    }
}