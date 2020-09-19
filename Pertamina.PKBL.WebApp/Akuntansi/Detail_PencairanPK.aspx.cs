using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class Detail_PencairanPK : System.Web.UI.Page
    {
        DetailPencairanPKBll bll = new DetailPencairanPKBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();

            if (!IsPostBack)
            {
                try
                {

                    initCombo();

                    var detail = bll.GetDetail(Session["Pencairan"].ToString());

                    txtNoMitra.Text = detail["mitraid"].ToString();
                    txtNama.Text = detail["requestor_name"].ToString();
                    txtKepada.Text = detail["requestor_name"].ToString();
                    txtTanggal.Date = DateTime.Today;
                    txtDeskripsi.Text = String.Format("Pencairan atas nama {0} dengan nomor mitra {1}", detail["requestor_name"].ToString(), detail["mitraid"].ToString());
                    var total = bll.GetTotalPencairan(Session["Pencairan"].ToString());
                    decimal Jumlah =0;
                    if (detail["NilaiSetuju"] != DBNull.Value)
                    {
                        Jumlah = Convert.ToDecimal(detail["NilaiSetuju"].ToString());
                    }
                    txtTotalPlafond.Text = Jumlah.ToString();
                    decimal totalPencairan = 0;
                    decimal sisa = 0;

                    if (total.Rows.Count > 0)
                    {
                        foreach (DataRow row in total.Rows)
                        {
                            totalPencairan += Convert.ToDecimal(row["NilaiPencairan"].ToString());
                        }
                        sisa = Jumlah - totalPencairan;

                        txtJumlahPencairan.Text = sisa.ToString();
                        lblSisa.Text = sisa.ToString();

                    }
                    else
                    {

                        txtJumlahPencairan.Text = Jumlah.ToString();
                        lblSisa.Text = Jumlah.ToString();
                    }
                }
                catch (Exception ex)
                {
                    Session["DataAvailable"] = "S";
                    Response.Redirect("PencairanPK.aspx");
                }

            }
            else
            {
                //GetData();
            }
            GetData();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.Pencairan.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.Pencairan.Add");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.Pencairan.Add");

            btnSimpan.Visible = insert;

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
                gvDetailPencairanPK.DataSource = bll.GetAkun(branchCode);
                gvDetailPencairanPK.DataBind();

                var data = new Pertamina.PKBL.BLL.Administer.VerifikasiBll().GetData(Convert.ToInt32(branchCode));

                if (data.Rows.Count > 0 && !IsPostBack)
                {

                    txtPermintaanBayar.Text = data.Rows[0]["permintaan_bayar"].ToString();
                    txtVerifikasi.Text = data.Rows[0]["verifikasi"].ToString();
                    txtPenyetuju.Text = data.Rows[0]["penyetujuan"].ToString();
                }

                var detail = bll.GetDetail(Session["Pencairan"].ToString());
                var total = bll.GetTotalPencairan(Session["Pencairan"].ToString());
                var Jumlah = decimal.Parse(detail["NilaiSetuju"].ToString());
                decimal totalPencairan = 0;
                decimal sisa = 0;

                if (total.Rows.Count > 0)
                {
                    foreach (DataRow row in total.Rows)
                    {
                        totalPencairan += decimal.Parse(row["NilaiPencairan"].ToString());
                    }
                    sisa = Jumlah - totalPencairan;

                    lblSisa.Text = String.Format("{0:#,##}.00", sisa);


                    gvSisaPencairan.DataSource = total;
                    gvSisaPencairan.DataBind();

                }
                else
                {

                    lblSisa.Text = String.Format("{0:#,##}.00", Jumlah);
                }
            }
            catch(Exception ex)
            {
                Session["DataAvailable"] = "S";
                Response.Redirect("PencairanPK.aspx");
            }

        }


        private void initCombo()
        {
             var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
             cbbNamaAkun.DataSource = bll.GetAkun(branchCode);
             cbbNamaAkun.TextField = "display_coa";
             cbbNamaAkun.ValueField = "account_id";
             cbbNamaAkun.DataBind();
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
            log.Action = "Detail Pencairan No. Proposal ";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();
                //var detail = bll.GetDetail(Session["Pencairan"].ToString());
                //var total = bll.GetTotalPencairan(Session["Pencairan"].ToString());
                //float Jumlah = float.Parse(detail["NilaiSetuju"].ToString());

                var sisa = Convert.ToDecimal(lblSisa.Text);
                var Penyaluran = Convert.ToDecimal(txtJumlahPencairan.Text);
                string proposal = Session["Pencairan"].ToString();
                string tanggal = DateTime.Parse(txtTanggal.Text).ToString("dd/MM/yyyy");
                var PermintaanBayar = txtPermintaanBayar.Text;
                var Verifikasi = txtVerifikasi.Text;
                var Penyetuju = txtPenyetuju.Text;

                if(sisa>0)
                {
                    if (Penyaluran == sisa)
                    {
                        ht.Add("@proposal_number-varchar-99", proposal);
                        ht.Add("@TglPencairan-varchar-20", tanggal);
                        ht.Add("@jumlahPencairan-float", Penyaluran);
                        ht.Add("@nomor_akun-varchar-99", cbbNamaAkun.Value.ToString());
                        ht.Add("@user-varchar-50", userName);
                        ht.Add("@deskripsi-varchar-10000", txtDeskripsi.Text.ToString());
                        ht.Add("@kepada-varchar-10000", txtKepada.Text.ToString().Trim());
                        ht.Add("@permintaanbayar-varchar-100", PermintaanBayar);
                        ht.Add("@verifikasi-varchar-100", Verifikasi);
                        ht.Add("@penyetuju-varchar-100", Penyetuju);

                        bll.InsertData(ht);

                        log.Type = "S";
                        log.Description = log.Action + ' ' + proposal + ' ' + "Sukses oleh id" + ' ' + userName;
                        lblRepost.Text = "Input Pencairan Sukses";
                        lblRepost.ForeColor = System.Drawing.Color.Green;

                        GetData();

                    }

                    else
                    {
                        log.Type = "F";
                        log.Description = log.Action + ' ' + proposal + ' ' + "Gagal oleh id" + ' ' + userName + ": Nilai Tidak Balance";
                        lblRepost.Text = "Nilai Tidak Balance";
                        lblRepost.ForeColor = System.Drawing.Color.Red;
                    }
                }

                else
                {
                    log.Type = "F";
                    log.Description = log.Action + ' ' + proposal + ' ' + "Gagal oleh id" + ' ' + userName + ": Dana Sudah Lunas";
                    lblRepost.Text = "Pencairan telah Lunas";
                    lblRepost.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Detail Pencairan Gagal : " + ex.Message;
                lblRepost.Text = "Mohon Isi Semua Field";
                lblRepost.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected void gvSisaPencairan_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if(e.Column.Caption=="No")
            {
                e.DisplayText = (Convert.ToInt32(e.VisibleRowIndex)+1).ToString();
            }
        }
    }
}