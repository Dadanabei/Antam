using Pertamina.PKBL.BLL.Akuntansi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Administer;
using System.Web.Security;
using Pertamina.PKBL.BLL;


namespace Pertamina.PKBL.WebApp.Akuntansi
{

    public partial class PenyaluranBLDetail : System.Web.UI.Page
    {
        PenyaluranBLDetailBll bll = new PenyaluranBLDetailBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();

            if(!IsPostBack)
            {
                
                initCombo();
                GetData();
            }

            GetGrid();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.BL.Penyaluran.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.BL.Penyaluran.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.BL.Penyaluran.View");

            
            btnPopup.Visible = insert;
            btnSubmit.Visible = insert;
            

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }


        private void GetGrid()
        {
            Penyaluran penyaluran = new Penyaluran();
            penyaluran = (Penyaluran)Session["penyaluran"];

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPenyaluranSaldo.DataSource = ((new PenyaluranBLDetailBll()).GetDataSaldo(branchCode,2));
            gvPenyaluranSaldo.DataBind();

            int idPermohonan = penyaluran.IdPemohon;
            gvPenyaluran.DataSource = bll.GetDetailPenyaluran(idPermohonan);
            gvPenyaluran.DataBind();
        }

        private void GetData()
        {
            Penyaluran penyaluran = new Penyaluran();
            penyaluran = (Penyaluran)Session["penyaluran"];

            hfId.Value = penyaluran.IdPemohon.ToString();
            hfNama.Value = penyaluran.Nama;
            hfNil.Value = penyaluran.NilaiPengajuan.ToString();
            hfNo.Value = penyaluran.No;

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

            int idPermohonan = penyaluran.IdPemohon; 
          
            var data = new VerifikasiBll().GetData(Convert.ToInt32(branchCode));

            if (data.Rows.Count>0)
            {
                txtPermintaanBayar.Text = data.Rows[0]["permintaan_bayar"].ToString();
                txtVerifikasi.Text = data.Rows[0]["verifikasi"].ToString();
                txtPenyetuju.Text = data.Rows[0]["penyetujuan"].ToString();
                dateTglPenyaluran.Date = DateTime.Today;
            }

            txtUsulanBantuan.Text=String.Format(("{0:#,##}.00"),penyaluran.NilaiPengajuan);

            try
            {
                decimal sisa = bll.GetSisaPenyaluran(idPermohonan);

                if (sisa == 0)
                {
                    lblsisaPEnyaluran.Text = "0.00";
                }

                else
                {
                    lblsisaPEnyaluran.Text = String.Format("{0:#,##}.00", sisa);
                }
                txtNilaiPenyaluran.Text = sisa.ToString();
            }
            catch
            {

            }
            txtNamaPemohon.Text = penyaluran.Nama.ToString();
            txtKepada.Text = penyaluran.Nama.ToString();
            txtNoPemohon.Text = penyaluran.No.ToString();
            
      
        }
            

        private void initCombo()
        {
            Penyaluran penyaluran = new Penyaluran();
            penyaluran = (Penyaluran)Session["penyaluran"];

            if (Session["userprofile"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                cbbNamaAkun.DataSource = bll.GetDataSaldo(branchCode, 2);
                cbbNamaAkun.TextField = "Display_COA";
                cbbNamaAkun.ValueField = "COA";
                cbbNamaAkun.DataBind();

                checkKoreksi.Checked = false;
                checkAkanDiJurnal.Checked = true;


                cbbLawanAkun.DataSource = bll.GetDataLawanAkunByBinalingID(penyaluran.IdPemohon);
                cbbLawanAkun.TextField = "display_coa";
                cbbLawanAkun.ValueField = "account_id";
                cbbLawanAkun.DataBind();
            }
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
            log.Action = "Penyaluran BL ";
            log.UserName = userName;

            try
            {

                Penyaluran penyaluran = new Penyaluran();
                penyaluran = (Penyaluran)Session["penyaluran"];

                decimal sisa = bll.GetSisaPenyaluran(Convert.ToInt32(hfId.Value));
                var NilaiPenyaluran = Convert.ToDecimal(txtNilaiPenyaluran.Text);
                if (sisa <= 0)
                {
                    lblInfo.Text = "Penyaluran Telah Lunas";
                    lblInfo.ForeColor = System.Drawing.Color.Red;
                    log.Type = "F";
                    log.Description = log.Action + ' ' +  "Gagal oleh id" + ' ' + userName;
                }
                else if (sisa - NilaiPenyaluran < 0)
                {
                    lblInfo.Text = "Nominal melebihi batas Nilai yang Disetujui";
                    lblInfo.ForeColor = System.Drawing.Color.Red;
                    log.Type = "F";
                    log.Description = log.Action + ' ' + "Gagal oleh id" + ' ' + userName;
                }
                else
                {

                    var tglPenyaluran = Convert.ToDateTime(dateTglPenyaluran.Value).ToString("dd/MM/yyyy");
                    var usulanBantuan = txtUsulanBantuan.Text;
                    var noPemohon = txtNoPemohon.Text;
                    var NamaPemohon = txtNamaPemohon.Text;
                    var Kepada = txtKepada.Text;
                    var PermintaanBayar = txtPermintaanBayar.Text;
                    var Verifikasi = txtVerifikasi.Text;
                    var Penyetuju = txtPenyetuju.Text;
                    var DeskripsiBantuan = txtDeskripsiBantuan.Text;
                    var NamaAkun = cbbNamaAkun.Value.ToString();
                    var LawanAkun = cbbLawanAkun.Value.ToString();
                    bool isJurnal = checkAkanDiJurnal.Checked;
                    bool isKoreksi = checkKoreksi.Checked;
                    int idPermohonan = Convert.ToInt32(hfId.Value);
                    string created_by = Session["user"].ToString();
                    var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                    Hashtable ht = new Hashtable();

                    ht.Add("@TglPenyaluran-varchar-20", tglPenyaluran);
                    ht.Add("@NoPemohon-nvarchar-max", noPemohon);
                    ht.Add("@idPermohonan-int", idPermohonan);
                    ht.Add("@Kepada-nvarchar-max", Kepada);
                    ht.Add("@DeskripsiBantuan-nvarchar-max", DeskripsiBantuan);
                    ht.Add("@NilaiPenyaluran-decimal", Convert.ToDecimal(txtNilaiPenyaluran.Text));
                    ht.Add("@IdNamaAkun-varchar-50", NamaAkun);
                    ht.Add("@IdLawanAkun-varchar-50", LawanAkun);
                    ht.Add("@IsJurnal-bit", isJurnal);
                    ht.Add("@isKoreksi-bit", isKoreksi);
                    ht.Add("@CreatedBy-varchar-50", created_by);
                    ht.Add("@branch_code-int", branchCode);
                    ht.Add("@permintaanbayar-varchar-100", PermintaanBayar);
                    ht.Add("@verifikasi-varchar-100", Verifikasi);
                    ht.Add("@penyetuju-varchar-100", Penyetuju);

                    bll.InsertData(ht);

                    log.Type = "S";
                    log.Description = log.Action + ' ' + "dengan No. Pemohon" + ' ' + noPemohon + ' ' + "Sukses oleh id" + ' ' + userName;
                    lblInfo.Text = "Sukses";
                    lblInfo.ForeColor = System.Drawing.Color.Green;
                }
                GetData();
                GetGrid();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Detail Pencairan Gagal : " + ex.Message;
                lblInfo.Text = "Mohon Isi Semua Field";
                lblInfo.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        protected void gvPenyaluran_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        protected void gvPenyaluranSaldo_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            
        }

        protected void gvPenyaluran_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnEdit")
            {
                Session["lihatjurnal"] = gvPenyaluran.GetRowValues(e.VisibleIndex, "NoRef");
                Session["bl"] = "0";
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Reporting/RepLainLain/RepLihatDetailJurnal.aspx");
            }
        }

    }
}