using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using Pertamina.PKBL.BLL.BinaLingk;
using System.Data;
using System.Collections;
using System.IO;
using System.Text.RegularExpressions;
using Helper;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.BinaLingk
{
    public partial class UploadRealisasiBL : System.Web.UI.Page
    {
        Pertamina.PKBL.BLL.BinaLingk.UploadPenyaluranBLBll bll = new BLL.BinaLingk.UploadPenyaluranBLBll();
        string savePath = System.Configuration.ConfigurationManager.AppSettings["PenyaluranBLXls"].ToString();
        string excelConn = System.Configuration.ConfigurationManager.AppSettings["excelConn"].ToString();
        int minCount = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["minimalUploadPenyaluranBL"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if(!IsPostBack)
            {
                GetGrid();
                InitCombo();
                deTglRealisasi.MinDate = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
                deTglRealisasi.Date = DateTime.Today;
                cbbNamaAkun.SelectedIndex = 0;
            }
            
        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.BL.Penyaluran.Upload");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }


        private void GetGrid()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPenyaluranSaldo.DataSource = ((new PenyaluranBLDetailBll()).GetDataSaldo(branchCode, 2));
            gvPenyaluranSaldo.DataBind();
        }

        private void InitCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            cbbNamaAkun.DataSource = (new BLL.Akuntansi.PenyaluranBLDetailBll()).GetDataSaldo(branchCode, 2);
            cbbNamaAkun.TextField = "Display_COA";
            cbbNamaAkun.ValueField = "COA";
            cbbNamaAkun.DataBind();


            var jenisBlBll = new MasterBLBll();

            var binalingComboData = jenisBlBll.GetDataActive();

            cbbJBL.TextField = "name";
            cbbJBL.ValueField = "id";
            cbbJBL.DataSource = binalingComboData;
            cbbJBL.DataBind();


            var citydata = new BLL.Administer.CityIndexBll().GetDataByBranch(branchCode);
            cbbKota2.TextField = "city_appcode";
            cbbKota2.ValueField = "city_appcode";
            cbbKota2.DataSource = citydata;
            cbbKota2.DataBind();


        }


        protected void gPreview_PageIndexChanged(object sender, EventArgs e)
        {
            gPreview.DataSource = (DataTable)Session["bloktoupload"];
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
            string filename = userName + DateTime.Now.ToString("yyyyMMddhhmmss") + ".xls";

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
                        log.Description = "Preview Realisasi Bina Lingkungan Error : " + ex.Message;

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
                                Session["bloktoupload"] = prevData;
                                gPreview.SettingsPager.Visible = true;
                                gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowPager;
                            }
                            else
                            {
                                lblKeterangan.ForeColor = System.Drawing.Color.Red;
                                lblKeterangan.Text = "Terdapat Kesalahan Format";
                                btnSave.Visible = false;
                                gPreview.Columns["Message"].Visible = true;
                                Session["bloktoupload"] = null;
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
                            Session["bloktoupload"] = null;
                            gPreview.SettingsPager.Visible = false;
                            gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowAllRecords;

                            log.Type = "E";
                            log.Description = "Preview Realisasi BL Error : " + ex.Message;

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
                        lblKeterangan.Text = "Minimal upload data Penyaluran BL adalah " + minCount;
                        btnSave.Visible = false;
                        Session["oktouploadpembayaran"] = null;
                        gPreview.SettingsPager.Visible = false;
                        gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowAllRecords;
                    }

                }


            }
        }

        protected bool DataCheck(DataTable data, out DataTable prevData)
        {
            bool isErrorExists = false;

            var errorTable = data.Clone();
            errorTable.Rows.Clear();

            foreach (DataRow item in data.Rows)
            {

                DataRow dr;
                if (!RowCheck(item, data.Columns, out dr))
                {
                    isErrorExists = true;
                    errorTable.ImportRow(dr);
                }

            }

            if (isErrorExists)
            {
                prevData = errorTable;
            }
            else
            {
                prevData = data;
            }

            return !isErrorExists;
        }


        protected bool RowCheck(DataRow item, DataColumnCollection cols, out DataRow dr)
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

            if (!Regex.IsMatch(allstring, textRegex))
            {
                item["Message"] = "Terdapat karakter ilegal;";
                isErrorExists = true;
            }

            if (!Regex.IsMatch(item["TglDiterima"].ToString(), dateRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format TglDiterima tidak sesuai;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["KotaKab"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " KotaKab tidak boleh kosong;";
                isErrorExists = true;
            }
            else
            {
                if (!Regex.IsMatch(item["Kotakab"].ToString(), fourNumberRegex))
                {
                    item["Message"] = item["Message"].ToString() + " Format Kotakab tidak sesuai;";
                    isErrorExists = true;
                }
                else
                {
                    var cityExists = cbbKota2.Items.FindByValue(item["Kotakab"].ToString().Trim());
                    if (cityExists == null)
                    {
                        item["Message"] = item["Message"].ToString() + " Kotakab tidak sesuai region;";
                        isErrorExists = true;
                    }
                }
            }

            if (!Regex.IsMatch(item["Tgldaftar"].ToString(), dateRegex) && !string.IsNullOrEmpty(item["Tgldaftar"].ToString().Trim()))
            {
                item["Message"] = item["Message"].ToString() + " Format Tgldaftar tidak sesuai;";
                isErrorExists = true;
            }
            

            if (!Regex.IsMatch(item["Telfon"].ToString(), numberRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format Telfon tidak sesuai;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["JudulProposal"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " JudulProposal tidak boleh kosong;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["JBL"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " JBL tidak boleh kosong;";
                isErrorExists = true;
            }
            else
            {
                if (!Regex.IsMatch(item["JBL"].ToString(), numberRegex))
                {
                    item["Message"] = item["Message"].ToString() + "format JBL tidak sesuai;";
                    isErrorExists = true;
                }
                else
                {
                    var jblExists = cbbJBL.Items.FindByValue(item["JBL"].ToString().Trim());
                    if (jblExists == null)
                    {
                        item["Message"] = item["Message"].ToString() + " JBL tidak terdaftar;";
                        isErrorExists = true;
                    }
                }
            }

            if (string.IsNullOrWhiteSpace((item["DeskripsiBantuan"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " DeskripsiBantuan tidak boleh kosong;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["AtasNama"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " AtasNama tidak boleh kosong;";
                isErrorExists = true;
            }

            if (string.IsNullOrWhiteSpace((item["Instansi"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " Instansi tidak boleh kosong;";
                isErrorExists = true;
            }

            

            if (string.IsNullOrWhiteSpace((item["NilaiPengajuan"].ToString().Trim())))
            {
                item["Message"] = item["Message"].ToString() + " NilaiPengajuan tidak boleh kosong;";
                isErrorExists = true;
            }
            else
            {
                if (!Regex.IsMatch(item["NilaiPengajuan"].ToString(), decimalRegex))
                {
                    item["Message"] = item["Message"].ToString() + " Format NilaiPengajuan tidak sesuai;";
                    isErrorExists = true;
                }
                else if (Convert.ToDecimal(item["NilaiPengajuan"].ToString().Trim()) <= 0)
                {
                    item["Message"] = item["Message"].ToString() + " NilaiPengajuan tidak boleh kurang dari atau samadengan 0;";
                    isErrorExists = true;
                }
            }

            dr = item;

            return !isErrorExists;
        }

        protected DataTable readXls(string path)
        {
            var dt = new DataTable();

            string connection = string.Format(excelConn, path);
            //string connection = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='{0}';Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1\";ImportMixedTypes=Text;", path);
            string command = "SELECT * FROM [sheet1$]";
            using (System.Data.OleDb.OleDbDataAdapter com = new System.Data.OleDb.OleDbDataAdapter(command, connection))
            {
                com.Fill(dt);
            }

            dt.Columns.Add("Message");

            return dt;

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
            log.Action = "Upload Penyaluran BL";
            log.UserName = userName;

            try
            {
                DateTime lastclose = new BLL.Administer.ClosingBll().GetLastClose();

                if (lastclose > deTglRealisasi.Date)
                {
                    lblKeterangan.ForeColor = System.Drawing.Color.Red;
                    lblKeterangan.Text = "Tanggal realisasi sudah di closing";
                    log.Type = "F";
                    log.Description = "Tanggal realisasi sudah di closing";
                    return;
                }

                var data = (DataTable)Session["bloktoupload"];

                try
                {
                    data.Columns.Remove("Message");
                }
                catch (Exception)
                {

                }

                System.Collections.Hashtable parameters = new System.Collections.Hashtable();

                parameters.Add("@coaBank-varchar-50", cbbNamaAkun.SelectedItem.Value);
                parameters.Add("@tglPenyaluran-varchar-30", deTglRealisasi.Date.ToString("dd/MM/yyyy"));
                parameters.Add("@user-varchar-200", Session["user"].ToString());
                parameters.Add("@branch_code-int", ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1);

                bll.UploadData(parameters, data);

                ViewState["msg"] = "<script>alert('Upload " + data.Rows.Count.ToString() + " data penyaluran BL berhasil');</script>";

                lblKeterangan.ForeColor = System.Drawing.Color.Green;
                lblKeterangan.Text = "Upload Data Berhasil";
                btnSave.Visible = false;

                log.Type = "S";
                log.Description = log.Action + ' ' + data.Rows.Count.ToString() + ' ' + "Row, Sukses oleh id" + ' ' + userName;

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Upload Penyaluran BL Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        protected void linkDownload_Click(object sender, EventArgs e)
        {
            var templateBll = new PKBL.BLL.Administer.TemplateBll().DownloadTemplate("penyaluranBL");

            if (templateBll.Rows.Count > 0)
            {

                var binary = (byte[])templateBll.Rows[0]["fileData"];

                HelpMe.ToDownload(Response, binary, Path.GetFileName(templateBll.Rows[0]["fileName"].ToString()), true);
            }

        }
    }
}