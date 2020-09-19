using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Collections;
using Pertamina.PKBL.BLL;
using System.Net;
using System.Data;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class DetailPembayaranPK : System.Web.UI.Page
    {
        PembayaranPKBll bll = new PembayaranPKBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if(!IsPostBack)
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                var data = bll.GetDataDetail(Convert.ToInt32(branchCode), Request.QueryString["Proposal"].ToString());

                if(data.Rows.Count>0)
                {
                    var detail = data.Rows[0];
                    deTglBayar.Date = DateTime.Today;
                    txtNoRef.Text = "--Generate by System--";
                    txtNoDebitur.Text = detail["mitraid"].ToString();
                    txtNama.Text = detail["requestor_name"].ToString();
                    try
                    {
                        deTglAktif.Date = DateTime.Parse(detail["TglRealisasi"].ToString());
                    }
                    catch
                    {

                    }
                    txtCatatan.Text = String.Format("Pembayaran atas nama {0} dengan nomor debitur {1}", detail["requestor_name"].ToString(), detail["mitraid"].ToString());

                    lblConfNama.Text = detail["requestor_name"].ToString();
                    lblConfNoMitra.Text = detail["mitraid"].ToString();
                    

                }
                initCombo();
                Panel.Visible = false;
            }
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvDetailPembayaran.DataSource = new Pertamina.PKBL.BLL.Akuntansi.PenyaluranBLDetailBll().GetDataSaldo(branchCode,1);
            gvDetailPembayaran.DataBind();
            
            var detail = bll.GetDataKartu(Request.QueryString["Proposal"].ToString());

            if (detail != null)
            {

                int currAngsuran = 0;

                foreach (DataRow item in detail.Rows)
                {
                    if (Convert.ToInt32(item["AngsuranKe"]) == currAngsuran)
                    {
                        item["AngsuranKe"] = " ";
                        item["HutangPokok"] = "";
                        item["Bunga"] = " ";
                        item["Total"] = " ";
                        item["TglJatuhTempo"] = " ";
                    }
                    else
                    {
                        currAngsuran = Convert.ToInt32(item["AngsuranKe"]);
                    }
                }


                gvReport.DataSource = detail;
                gvReport.DataBind();
            }
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "Menu.Akuntansi");

            btnCancelConfirm.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.PK.Pembayaran.Add");
            btnConfirmYes.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.PK.Pembayaran.Add");
            btnSubmit.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.PK.Pembayaran.Add");
            btnUpdate.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.PK.Pembayaran.Add");

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        private void initCombo()
        {

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var lawan = bll.GetLawanAkun(Request.QueryString["Proposal"].ToString());
            var akun = bll.GetAkun(Convert.ToInt32(branchCode), Request.QueryString["Proposal"].ToString());
            cbbNamaAkun.DataSource = akun;
            cbbNamaAkun.TextField = "display_coa";
            cbbNamaAkun.ValueField = "account_id";
            cbbNamaAkun.DataBind();
            cbbNamaAkun.SelectedIndex = 0;

            cbbLawanAkun.DataSource = lawan;
            cbbLawanAkun.TextField = "coa_display";
            cbbLawanAkun.ValueField = "account_id";
            cbbLawanAkun.DataBind();
            cbbLawanAkun.SelectedIndex = 0;
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            GetData();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblConfTgl.Text = deTglBayar.Date.ToString("dd/MM/yyyy");
            lblConfJumlahBayar.Text = "Rp. "+ Convert.ToDecimal( txtJmlPembayaran.Text.ToString()).ToString("##,#.00");
            txtUangSebesar.Text = lblConfJumlahBayar.Text + " ?";
            lblConfNamaAkun.Text = cbbNamaAkun.SelectedItem.Text;
            lblConfLawanAkun.Text = cbbLawanAkun.SelectedItem.Text;
            
            puConfirm.ShowOnPageLoad = true;
        }

        protected void gvReport_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (!String.IsNullOrEmpty(e.Value.ToString()))
            {

                if (e.Column.FieldName == "HutangPokok")
                {
                    if (e.Value.ToString() != "" && e.Value.ToString() != " ")
                    {
                        if (e.Value.ToString() != "0")
                        {

                            double price = Convert.ToDouble(e.Value);

                            e.DisplayText = string.Format("{0:#,##}", price);
                        }
                    }

                }
                else if (e.Column.FieldName == "Bunga")
                {
                    if (e.Value.ToString() != "" && e.Value.ToString() != " ")
                    {
                        if (e.Value.ToString() != "0")
                        {

                            double price = Convert.ToDouble(e.Value);

                            e.DisplayText = string.Format("{0:#,##}", price);
                        }
                    }

                }
                else if (e.Column.FieldName == "Total")
                {
                    if (e.Value.ToString() != "" && e.Value.ToString() != " ")
                    {
                        if (e.Value.ToString() != "0")
                        {

                            double price = Convert.ToDouble(e.Value);

                            e.DisplayText = string.Format("{0:#,##}", price);
                        }
                    }

                }
                else if (e.Column.FieldName == "NoRef")
                {
                    if(!String.IsNullOrEmpty(e.Value.ToString()))
                    {
                        if(e.Column.FieldName=="NilaiAdv")
                        {
                                e.DisplayText = "asad";
                        }
                    }

                    else
                    {
                        if (e.Column.FieldName == "NilaiAdv")
                        {
                            e.DisplayText = "udin";
                        }
                    }

                }
            }
        }

        protected void checkPelunasan_CheckedChanged(object sender, EventArgs e)
        {
            if (checkPelunasan.Checked)
            {
                var sisa = bll.GetNilaiPelunasan(Request.QueryString["proposal"].ToString());//gvReport.GetRowValues(gvReport.VisibleRowCount - 1, "totalSisa")??0;
                txtJmlPembayaran.Text = Convert.ToDecimal(sisa).ToString("##,#.00");
            }
            else
            {
                txtJmlPembayaran.Text = "0";
            }
        }

        protected void gvReport_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if(e.VisibleIndex >= 0)
            {
                if (e.DataColumn == gvReport.Columns["BayarPokok"] || e.DataColumn == gvReport.Columns["BayarBunga"] || e.DataColumn == gvReport.Columns["NilaiAdv"] || e.DataColumn == gvReport.Columns["Totalbayar"])
                {

                    var value = 0m;
                    try
                    {
                        value = Convert.ToDecimal(e.CellValue.ToString());
                    }
                    catch(Exception ex)
                    {

                    }
                    if (value < 0)
                    {
                        e.Cell.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void btnConfirmYes_Click(object sender, EventArgs e)
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
            log.Action = "Detail Pembayaran No. Proposal ";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();

                string proposal = Request.QueryString["Proposal"].ToString();

                ht.Add("@proposal_number-varchar-99", proposal);
                ht.Add("@uangMasuk-float", txtJmlPembayaran.Text.ToString());
                ht.Add("@NamaAkun-char-99", cbbNamaAkun.Value.ToString());
                ht.Add("@deskripsi-nvarchar-1000", txtCatatan.Text.ToString());
                ht.Add("@user-varchar-100", Session["user"].ToString());
                ht.Add("@COA-varchar-99", cbbLawanAkun.Value.ToString());

                string date = DateTime.Parse(deTglBayar.Text.ToString()).ToString("dd/MM/yyyy");
                ht.Add("@tglPembayaran-varchar-20", date);

                ViewState["msg"] = "Berhasil , Pembayaran " + bll.InsertData(ht, chkKoreksi.Checked);
                ViewState["color"] = "green";
                log.Type = "S";
                log.Description = log.Action + ' ' + proposal + ' ' + "Sukses oleh id" + ' ' + userName;

                GetData();
                
            }
            catch (Exception ex)
            {
                ViewState["msg"] = "Simpan Gagal ";
                ViewState["color"] = "red";
                log.Type = "E";
                log.Description = "Detail Pembayaran Gagal : " + ex.Message;
            }
            finally
            {
                puConfirm.ShowOnPageLoad = false;
                logBll.InsertActivity(log);
            }
        }
    }
}