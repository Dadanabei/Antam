using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;
using Pertamina.PKBL.BLL;
using System.Collections;
using Helper;
using System.Globalization;
namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class UploadRealisasiKemitraan : System.Web.UI.Page
    {
        Pertamina.PKBL.BLL.Kemitraan.UploadRealisasiKemitraanBll bll = new BLL.Kemitraan.UploadRealisasiKemitraanBll();
        string savePath = System.Configuration.ConfigurationManager.AppSettings["RealisasiKemitraanXls"].ToString();
        string excelConn = System.Configuration.ConfigurationManager.AppSettings["excelConn"].ToString();
        int minCount = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["minimalUploadRealisasiPK"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {


            roleAuth();
            if (!IsPostBack)
            {
                InitCombo();
                deTglRealisasi.MinDate = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
                deTglRealisasi.Date = DateTime.Today;
                deTglPersetujuan.Date = DateTime.Today;
                deTglPermohonan.Date = DateTime.Today;

                txtGracePeriod.Text = "0";
                cbbJenisJasa.SelectedIndex = cbbJenisJasa.Items.IndexOfValue("4");
                cbbCOABank.SelectedIndex = 0;
                txtBunga.Text = "6";
                cbbJkr.SelectedIndex = 0;
                cbbCompanyKind.SelectedIndex = cbbCompanyKind.Items.IndexOfValue("5");
                cbbSector.SelectedIndex = 0;


                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                gvDetailPencairanPK.DataSource = (new Pertamina.PKBL.BLL.Akuntansi.DetailPencairanPKBll()).GetAkun(branchCode);
                gvDetailPencairanPK.DataBind();
            }
        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.Pencairan.Upload");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        protected void btnPreview_Click(object sender, EventArgs e)
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
            log.Action = "Upload Realisasi Kemitraan";
            log.UserName = userName;
            
            //string userName = Session["user"].ToString();
            string filename = userName + DateTime.Now.ToString("yyyyMMddhhmmss")+".xls";

            string fullpath = Server.MapPath(savePath) + "\\" + filename;

            if (!Path.GetExtension(fuUploadData.FileName).Trim().Equals(".xls"))
            {
                lblKeterangan.ForeColor = System.Drawing.Color.Red;
                lblKeterangan.Text = "File Harus Dalam Format .xls";
            }
            else
            {
                if (!File.Exists(fullpath))
                {
                    DataTable dt = null;
                    File.WriteAllBytes(fullpath, fuUploadData.FileBytes);
                    try
                    {
                        dt = readXls(fullpath);
                    }
                    catch (Exception ex)
                    {
                        lblKeterangan.ForeColor = System.Drawing.Color.Red;
                        lblKeterangan.Text = "File tidak dapat terbaca";

                        log.Type = "E";
                        log.Description = "Preview Realisasi Kemitraan Error : " + ex.Message;

                        logBll.InsertActivity(log);

                        return;
                    }

                    if (dt.Rows.Count > minCount)
                    {

                        DataTable prevData;
                        try
                        {
                            if (DataCheck(dt, out prevData))
                            {
                                lblKeterangan.ForeColor = System.Drawing.Color.Green;
                                lblKeterangan.Text = "Data Siap Diupload";
                                btnSave.Visible = true;
                                Session["oktoupload"] = prevData;
                                gPreview.SettingsPager.Visible = true;
                                gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowPager;
                            }
                            else
                            {
                                lblKeterangan.ForeColor = System.Drawing.Color.Red;
                                lblKeterangan.Text = "Terdapat Kesalahan Format";
                                btnSave.Visible = false;
                                gPreview.Columns["Message"].Visible = true;
                                Session["oktoupload"] = null;
                                gPreview.SettingsPager.Visible = false;
                                gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowAllRecords;

                            }

                            gPreview.DataSource = prevData;
                            gPreview.DataBind();
                        }
                        catch (Exception ex)
                        {
                            lblKeterangan.ForeColor = System.Drawing.Color.Red;
                            lblKeterangan.Text = "Terdapat Kesalahan Format Excel, Pastikan file yang diupload sesuai template";
                            btnSave.Visible = false;
                            Session["oktoupload"] = null;
                            gPreview.SettingsPager.Visible = false;
                            gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowAllRecords;

                            log.Type = "E";
                            log.Description = "Preview Realisasi Kemitraan Error : " + ex.Message;

                            logBll.InsertActivity(log);

                        }
                        finally
                        {
                            if (File.Exists(fullpath))
                            {
                                File.Delete(fullpath);
                            }
                        }
                    }
                    else
                    {
                        lblKeterangan.ForeColor = System.Drawing.Color.Red;
                        lblKeterangan.Text = "Minimal upload data Realisasi PK adalah " + minCount;
                        btnSave.Visible = false;
                        Session["oktoupload"] = null;
                        gPreview.SettingsPager.Visible = false;
                        gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowAllRecords;
                    }

                }
                
                

            }

        }


        protected bool DataCheck(DataTable data,out DataTable prevData)
        {
            bool isErrorExists = false;

            var errorTable = data.Clone();
            errorTable.Rows.Clear();
            
            foreach (DataRow item in data.Rows)
            {
                
                DataRow dr;
                if(!RowCheck(item,data.Columns,out dr))
                {
                    isErrorExists = true;
                    errorTable.ImportRow(dr);
                }
                
            }

            if(isErrorExists)
            {
                prevData = errorTable;
            }
            else
            {
                var validateKTPResult = bll.ValidateKTP(data);
                if (validateKTPResult.Rows.Count > 0)
                {
                    isErrorExists = true;
                    prevData = validateKTPResult;
                }
                else
                {
                    prevData = data;
                }
            }

            return !isErrorExists;
        }


        protected bool RowCheck(DataRow item,DataColumnCollection cols,out DataRow dr)
        {
            bool isErrorExists = false;
            var decimalRegex = @"^\d*\.?\d*$";
            var dateRegex = @"^([0]?[0-9]|[12][0-9]|[3][01])[./-]([0]?[1-9]|[1][0-2])[./-]([0-9]{4}|[0-9]{2})$";
            var numberRegex = @"^[0-9]*$";
            var textRegex = @"[0-9a-zA-Z;: ,.\/\\=-_+|~!@#$%\^&*()\[\]]";
            var oneNumberRegex = @"^[0-9]$";
            var fourNumberRegex = @"^[0-9]{4}$";

            var allstring = "";

            foreach (DataColumn col in cols)
            {
                allstring += item[col].ToString();
            }

            if(!Regex.IsMatch(allstring,textRegex))
            {
                item["Message"] = "Terdapat karakter ilegal;";
                isErrorExists = true;
            }

            if (!Regex.IsMatch(item["TglLahir"].ToString(), dateRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format TglKelahiran tidak sesuai;";
                isErrorExists = true;
            }
            else
            {
                try
                {

                    DateTime tgllhr = DateTime.ParseExact(item["TglLahir"].ToString().Trim(), "d/M/yyyy", CultureInfo.InvariantCulture);

                    if ((DateTime.Now - tgllhr).TotalDays / 365 <= 17)
                    {
                        item["Message"] = item["Message"].ToString() + " Umur mitra minimal 17 tahun;";
                        isErrorExists = true;
                    }
                }
                catch (Exception e)
                {
                    item["Message"] = item["Message"].ToString() + " Format TglKelahiran tidak sesuai;";
                    isErrorExists = true;
                }

            }

            if (!Regex.IsMatch(item["Kotakab"].ToString(), fourNumberRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format Kotakab tidak sesuai;";
                isErrorExists = true;
            }
            else
            {
                var cityExists = cbbKota.Items.FindByValue(item["Kotakab"].ToString().Trim());
                if (cityExists == null)
                {
                    item["Message"] = item["Message"].ToString() + " Kotakab tidak terdaftar;";
                    isErrorExists = true;
                }
            }

            if (!Regex.IsMatch(item["PendidikanTerakhir"].ToString(), oneNumberRegex) && !string.IsNullOrEmpty(item["PendidikanTerakhir"].ToString()))
            {
                item["Message"] = item["Message"].ToString() + " Format PendidikanTerakhir tidak sesuai;";
                isErrorExists = true;
            }

            if (!Regex.IsMatch(item["StatusPernikahan"].ToString(), oneNumberRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format StatusPernikahan tidak sesuai;";
                isErrorExists = true;
            }

            if (!Regex.IsMatch(item["TgllahirPenjamin"].ToString(), dateRegex) && !string.IsNullOrEmpty(item["TgllahirPenjamin"].ToString().Trim()))
            {
                item["Message"] = item["Message"].ToString() + " Format TgllahirPenjamin tidak sesuai;";
                isErrorExists = true;
            }
            if (!Regex.IsMatch(item["LuasTanah"].ToString(), decimalRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format LuasTanah tidak sesuai;";
                isErrorExists = true;
            }
            
            if (!Regex.IsMatch(item["Telfon"].ToString(), numberRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format Telfon tidak sesuai;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["NamaKTP"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " NamaKTP tidak boleh kosong;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["NoKTP"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " NoKTP tidak boleh kosong;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["TglLahir"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " TglLahir tidak boleh kosong;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["Kotakab"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " Kotakab tidak boleh kosong;";
                isErrorExists = true;
            }
            
            if (string.IsNullOrWhiteSpace((item["Pinjaman"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " Pinjaman tidak boleh kosong;";
                isErrorExists = true;
            }
            else
            {
                if (!Regex.IsMatch(item["Pinjaman"].ToString(), decimalRegex))
                {
                    item["Message"] = item["Message"].ToString() + " Format Nilai Pinjaman tidak sesuai;";
                    isErrorExists = true;
                }
                else
                {
                    if (Convert.ToDecimal(item["Pinjaman"].ToString().Trim()) <= 0)
                    {
                        item["Message"] = item["Message"].ToString() + " Pinjaman tidak boleh kurang dari atau samadengan 0;";
                        isErrorExists = true;
                    }
                }
            }

            dr = item;

            return !isErrorExists;
        }

        protected void InitCombo()
        {
            var branccode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var coa = (new BLL.Akuntansi.DetailPencairanPKBll()).GetAkun(branccode);
            var sector = (new BLL.Kemitraan.MasterSektorKemitraanBll()).GetData(new Hashtable());
            var suplier = (new BLL.DdlBll()).getComboSupplier(branccode.ToString());
            var companykind = (new BLL.DdlBll()).getComboCompanyKind(new Hashtable());
            var jenisbunga = (new BLL.DdlBll()).getJenisBunga();
            var jkr = (new BLL.DdlBll()).getJenisKredit();
            var kotas = new BLL.Administer.CityIndexBll().GetDataByBranch(branccode);

            cbbKota.DataSource = kotas;
            cbbKota.TextField = "city_name";
            cbbKota.ValueField = "city_appcode";
            cbbKota.DataBind();

            cbbCOABank.DataSource = coa;
            cbbCOABank.TextField = "display_coa";
            cbbCOABank.ValueField = "account_id";
            cbbCOABank.DataBind();

            cbbSector.TextField = "sector_name";
            cbbSector.ValueField = "id";
            cbbSector.DataSource = sector;
            cbbSector.DataBind();

            cbbSuplier.TextField = "supplier_name";
            cbbSuplier.ValueField = "id";
            cbbSuplier.DataSource = suplier;
            cbbSuplier.DataBind();

            cbbJenisJasa.TextField = "descr";
            cbbJenisJasa.ValueField = "id";
            cbbJenisJasa.DataSource = jenisbunga;
            cbbJenisJasa.DataBind();

            cbbCompanyKind.TextField = "description";
            cbbCompanyKind.ValueField = "id";
            cbbCompanyKind.DataSource = companykind;
            cbbCompanyKind.DataBind();

            cbbJkr.TextField = "descr";
            cbbJkr.ValueField = "id";
            cbbJkr.DataSource = jkr;
            cbbJkr.DataBind();

            DdlBll combo = new DdlBll();

            var marital = combo.getComboMarital(new Hashtable());
            var education = combo.getComboEducation(new Hashtable());

            cbbPendidikanTerakhir.TextField = "description";
            cbbPendidikanTerakhir.ValueField = "id";
            cbbPendidikanTerakhir.DataSource = education;
            cbbPendidikanTerakhir.DataBind();

            cbbStatusPernikahan.TextField = "description";
            cbbStatusPernikahan.ValueField = "id";
            cbbStatusPernikahan.DataSource = marital;
            cbbStatusPernikahan.DataBind();

        }

        protected void btnSave_Click(object sender, EventArgs e)
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
            log.Action = "Upload Realisasi Kemitraan";
            log.UserName = userName;

            try
            {
                var numberRegex = @"^[0-9]*$";

                if (txtPeriode.Text.Trim().Equals("") || txtDeskripsi.Text.Trim().Equals("") || txtBunga.Text.Trim().Equals(""))
                {

                    if (!Regex.IsMatch(txtPeriode.Text, numberRegex) || !Regex.IsMatch(txtGracePeriod.Text, numberRegex))
                    {
                        lblKeterangan.ForeColor = System.Drawing.Color.Red;
                        lblKeterangan.Text = "Terdapat Kesalahan Input";
                        log.Type = "F";
                        log.Description = "Terdapat Kesalahan Input";
                        return;
                    }
                    else
                    {
                        if (decimal.Parse(txtPeriode.Text.Trim()) <= 0)
                        {
                            lblKeterangan.ForeColor = System.Drawing.Color.Red;
                            lblKeterangan.Text = "Periode Tidak Boleh kurang dari atau samadengan nol";
                            log.Type = "F";
                            log.Description = "Periode Tidak Boleh kurang dari atau samadengan nol";
                            return;
                        }
                    }


                    lblKeterangan.ForeColor = System.Drawing.Color.Red;
                    lblKeterangan.Text = "Lengkapi Field Terlebih Dahulu";
                    log.Type = "F";
                    log.Description = "Lengkapi Field Terlebih Dahulu";
                    return;
                }

               

                DateTime lastclose = new BLL.Administer.ClosingBll().GetLastClose();

                if (lastclose > deTglRealisasi.Date)
                {
                    lblKeterangan.ForeColor = System.Drawing.Color.Red;
                    lblKeterangan.Text = "Tanggal realisasi sudah di closing";
                    log.Type = "F";
                    log.Description = "Tanggal realisasi sudah di closing";
                    return;
                }

                var data = (DataTable)Session["oktoupload"];

                try
                {
                    data.Columns.Remove("Message");
                }
                catch (Exception)
                {

                }

            

                System.Collections.Hashtable parameters = new System.Collections.Hashtable();

            
                parameters.Add("@tglPermohonan-varchar-20",deTglPermohonan.Date.ToString("dd/MM/yyyy"));
                parameters.Add("@tglPersetujuan-varchar-20",deTglPersetujuan.Date.ToString("dd/MM/yyyy"));
                parameters.Add("@tglRealisasi-varchar-20", deTglRealisasi.Date.ToString("dd/MM/yyyy"));
                parameters.Add("@coaBank-varchar-30", cbbCOABank.SelectedItem.Value.ToString());
                parameters.Add("@sector_id-int", cbbSector.SelectedItem.Value.ToString());
                parameters.Add("@periode-int", txtPeriode.Text.Trim());
                parameters.Add("@isYarnen-bit", cbIsYarnen.Checked);
                parameters.Add("@createdBy-varchar-100", Session["user"].ToString());
                parameters.Add("@branch_code-int", ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1);
                parameters.Add("@suplier_id-int", (cbbSuplier.SelectedItem == null)? DBNull.Value:cbbSuplier.SelectedItem.Value);
                parameters.Add("@company_kind_id-int", cbbCompanyKind.SelectedItem.Value);
                parameters.Add("@jkr-int", cbbJkr.SelectedItem.Value);
                parameters.Add("@bunga-decimal", Convert.ToDecimal(txtBunga.Text.Trim()));
                parameters.Add("@jenisJasa-int", cbbJenisJasa.SelectedItem.Value);
                parameters.Add("@graceperiod-int", txtGracePeriod.Text.Trim());
                parameters.Add("@deskripsiPencairan-varchar-1000", txtDeskripsi.Text.Trim());

                bll.UploadPencairan(parameters,data);

                ViewState["msg"] = "<script>alert('Upload "+data.Rows.Count.ToString()+" data realisasi kemitraan berhasil');</script>";

                lblKeterangan.ForeColor = System.Drawing.Color.Green;
                lblKeterangan.Text = "Upload Data Berhasil";
                btnSave.Visible = false;

                log.Type = "S";
                log.Description = log.Action + ' ' + data.Rows.Count.ToString() + ' ' + "Row, Sukses oleh id" + ' ' + userName; 
            
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Upload Realisasi Kemitraan Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected DataTable readXls(string path)
        {
            var dt = new DataTable();

            string connection = string.Format(excelConn, path);
            //string connection = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';'Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1\";ImportMixedTypes=Text;'", path);
            string command = "SELECT * FROM [sheet1$]";
            using(System.Data.OleDb.OleDbDataAdapter com = new System.Data.OleDb.OleDbDataAdapter(command,connection))
            {
                com.Fill(dt);
            }

            dt.Columns.Add("Message");

            return dt;

        }

        protected void linkDownload_Click(object sender, EventArgs e)
        {
            var templateBll = new PKBL.BLL.Administer.TemplateBll().DownloadTemplate("realisasiKemitraan");
            
            if(templateBll.Rows.Count > 0)
            {

                var binary = (byte[])templateBll.Rows[0]["fileData"];

                HelpMe.ToDownload(Response, binary, Path.GetFileName(templateBll.Rows[0]["fileName"].ToString()), true);
            }

            

        }

        protected void gPreview_PageIndexChanged(object sender, EventArgs e)
        {
            gPreview.DataSource = (DataTable)Session["oktoupload"];
        }


    }
}