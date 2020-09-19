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

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class UploadPembayaranPK : System.Web.UI.Page
    {
        Pertamina.PKBL.BLL.Akuntansi.UploadPembayaranKemitraanBll bll = new BLL.Akuntansi.UploadPembayaranKemitraanBll();
        string savePath = System.Configuration.ConfigurationManager.AppSettings["RealisasiKemitraanXls"].ToString();
        string excelConn = System.Configuration.ConfigurationManager.AppSettings["excelConn"].ToString();
        int minCount = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["minimalUploadPembayaran"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (!IsPostBack)
            {
                InitCombo();
                deTglBayar.MinDate = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
                deTglBayar.Date = DateTime.Today;
                cbbCoa.SelectedIndex = 0;

                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                gvDetailPembayaran.DataSource = new Pertamina.PKBL.BLL.Akuntansi.PenyaluranBLDetailBll().GetDataSaldo(branchCode, 1);
                gvDetailPembayaran.DataBind();
            }
        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.Pembayaran.Upload");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        protected void gPreview_PageIndexChanged(object sender, EventArgs e)
        {
            gPreview.DataSource = (DataTable)Session["oktouploadpembayaran"];
            gPreview.DataBind();
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

        protected void InitCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            //var lawan = bll.GetLawanAkun(Request.QueryString["Proposal"].ToString());
            var akun = bll.GetAkun(Convert.ToInt32(branchCode));
            cbbCoa.DataSource = akun;
            cbbCoa.TextField = "display_coa";
            cbbCoa.ValueField = "account_id";
            cbbCoa.DataBind();
            cbbCoa.SelectedIndex = 0;

            var lawan = bll.GetLawanAkun();
            cbbLawanAkun.DataSource = lawan;
            cbbLawanAkun.TextField = "display_coa";
            cbbLawanAkun.ValueField = "account_id";
            cbbLawanAkun.DataBind();
            cbbLawanAkun.SelectedIndex = 0;


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
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

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

                dr = item;

                return !isErrorExists;
            }

            try
            {
                decimal.Parse(item["NominalBayar"].ToString().Trim());
            }
            catch (Exception)
            {
                isErrorExists = true;
                item["Message"] = item["Message"].ToString() + " Format NominalBayar tidak sesuai;";
            }

            if (!Regex.IsMatch(item["NoMitra"].ToString(), numberRegex))
            {
                item["Message"] = item["Message"].ToString() + " Format NoMitra tidak sesuai;";
                isErrorExists = true;
            }

            if (item["isExists"].ToString() != "1")
            {
                item["Message"] = item["Message"].ToString() + " NoMitra tidak ada;";
                isErrorExists = true;
            }

            if (item["branch_code"].ToString().Trim() != branchCode)
            {
                item["Message"] = item["Message"].ToString() + " Mitra tidak sesuai region;";
                isErrorExists = true;
            }

            dr = item;

            return !isErrorExists;
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

            if (!File.Exists(fullpath))
            {
                DataTable dt;

                File.WriteAllBytes(fullpath, fuUploadData.FileBytes);
                try
                {


                    dt = readXls(fullpath);
                }
                catch(Exception ex)
                {
                    lblKeterangan.ForeColor = System.Drawing.Color.Red;
                    lblKeterangan.Text = "File tidak dapat terbaca";

                    log.Type = "E";
                    log.Description = "Preview Pembayaran Kemitraan Error : " + ex.Message;

                    logBll.InsertActivity(log);
                    return;
                }
                DataTable prevData;

                if (dt.Rows.Count > minCount)
                {



                    var dbPreview = bll.PreviewUploadPembayaran(dt);

                    dbPreview.Columns.Add("Message");

                    try
                    {

                        if (DataCheck(dbPreview, out prevData))
                        {
                            lblKeterangan.ForeColor = System.Drawing.Color.Green;
                            lblKeterangan.Text = "Data Siap Diupload";
                            btnSave.Visible = true;
                            Session["oktouploadpembayaran"] = prevData;
                            gPreview.SettingsPager.Visible = true;
                            gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowPager;
                        }
                        else
                        {
                            lblKeterangan.ForeColor = System.Drawing.Color.Red;
                            lblKeterangan.Text = "Terdapat Kesalahan Format";
                            btnSave.Visible = false;
                            gPreview.Columns["Message"].Visible = true;
                            Session["oktouploadpembayaran"] = null;
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
                        Session["oktouploadpembayaran"] = null;
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
                    lblKeterangan.Text = "Minimal upload data pembayaran adalah "+minCount;
                    btnSave.Visible = false;
                    Session["oktouploadpembayaran"] = null;
                    gPreview.SettingsPager.Visible = false;
                    gPreview.SettingsPager.Mode = DevExpress.Web.ASPxGridView.GridViewPagerMode.ShowAllRecords;
                }

            }

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
            log.Action = "Upload Pembayaran PK";
            log.UserName = userName;

            try
            {

                DateTime lastclose = new BLL.Administer.ClosingBll().GetLastClose();

                if (lastclose > deTglBayar.Date)
                {
                    lblKeterangan.ForeColor = System.Drawing.Color.Red;
                    lblKeterangan.Text = "Tanggal bayar sudah di closing";
                    log.Type = "F";
                    log.Description = "Tanggal realisasi sudah di closing";
                    return;
                }


                var data = (DataTable)Session["oktouploadpembayaran"];

                try
                {
                    data.Columns.Remove("Message");
                }
                catch (Exception)
                {

                }

                Hashtable parameters = new Hashtable();

                parameters.Add("@coaBank-varchar-50", cbbCoa.SelectedItem.Value);
                parameters.Add("@coaLawan-varchar-50", cbbLawanAkun.SelectedItem.Value);
                parameters.Add("@tglPembayaran-varchar-20", deTglBayar.Date.ToString("dd/MM/yyyy"));
                parameters.Add("@deskripsi-varchar-1000", txtDeskripsi.Text);
                parameters.Add("@createdBy-varchar-300", Session["user"].ToString());


                bll.UploadPembayaran(parameters, data);

                ViewState["msg"] = "<script>alert('Upload " + data.Rows.Count.ToString() + " data pembayaran kemitraan berhasil');</script>";

                lblKeterangan.ForeColor = System.Drawing.Color.Green;
                lblKeterangan.Text = "Upload Data Berhasil";
                btnSave.Visible = false;

                log.Type = "S";
                log.Description = log.Action + ' ' + data.Rows.Count.ToString() + ' ' + "Row, Sukses oleh id" + ' ' + userName;

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Upload Pembayaran PK Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected void linkDownload_Click(object sender, EventArgs e)
        {
            var templateBll = new PKBL.BLL.Administer.TemplateBll().DownloadTemplate("pembayaranPK");

            if (templateBll.Rows.Count > 0)
            {

                var binary = (byte[])templateBll.Rows[0]["fileData"];

                HelpMe.ToDownload(Response, binary, Path.GetFileName(templateBll.Rows[0]["fileName"].ToString()), true);
            }


        }

    }
}