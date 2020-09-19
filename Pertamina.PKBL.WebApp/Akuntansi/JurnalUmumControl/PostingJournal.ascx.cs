using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Collections;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp.Akuntansi.Jurnal_Umum_Control
{
    public partial class PostingJournal : System.Web.UI.UserControl
    {
        JurnalBll bll = new JurnalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if(!IsPostBack)
            {
                deTglBukti.Date = DateTime.Today;
                Session["Report"] = bll.DetailTable;
            }
            GetData();



            btnSimpan.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.JURNAL.KasBank.Add"); 
            btnTambah.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.JURNAL.KasBank.Add"); 
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Umum.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Umum.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Umum.View");


            //((GridViewCommandColumn)gvDaftarJrnal.Columns["Opr."]).CustomButtons["Detail"].Visibility = (insert) ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;
            //((GridViewCommandColumn)gvDaftarJrnal.Columns["Opr."]).CustomButtons["Detail"].Visibility = (edit) ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;


            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }


        private void GetData()
        {

            var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = new Pertamina.PKBL.BLL.Administer.VerifikasiBll().GetData(Convert.ToInt32(branchCode));

            if (!IsPostBack)
            {
                if (data.Rows.Count > 0)
                {
                    txtMintaBayar.Text = data.Rows[0]["permintaan_bayar"].ToString();
                    txtVerifikasi.Text = data.Rows[0]["verifikasi"].ToString();
                    txtPenyetuju.Text = data.Rows[0]["penyetujuan"].ToString();
                }
            }

            if(cbbJenisProgram.Value.ToString()=="0")
            {
                Panel.Visible = false;
                Header.Visible = true;
            }

            else
            {
                Panel.Visible = true;
                Header.Visible = false;
            }

            
        }

        private void ComboAkun(int index0, int index1, int index2, int index3)
        {
            var akun = bll.GetNamaAkun(index0, index1, index2, index3);
            cbbNamaAkun.DataSource = akun;
            cbbNamaAkun.TextField = "coa_display";
            cbbNamaAkun.ValueField = "account_id";
            cbbNamaAkun.DataBind();
        }

        private void ComboPembayaran(int index0, int index1, int index2)
        {
            var pembayaran = bll.GetPembayaran(index0, index1, index2);
            cbbJenisPembayaran.DataSource = pembayaran;
            cbbJenisPembayaran.TextField = "Jenis";
            cbbJenisPembayaran.ValueField = "IdJnsPembayaran";
            cbbJenisPembayaran.DataBind();
        }

      
        protected void btnTambah_Click(object sender, EventArgs e)
        {
            try
            {
                var dt = (DataTable)Session["Report"];

                var coa = cbbNamaAkun.Value.ToString();
                var namaCoa = cbbNamaAkun.SelectedItem.ToString().Split('-');
                string nama = namaCoa[1];
                for (int i = 0; i < namaCoa.Count(); i++)
                {
                    if (i != 0 && i != 1)
                        nama = nama + " - " + namaCoa[i];
                }

                decimal debet = 0, kredit = 0;
                if (radioDebet.Checked)
                {
                    debet = Convert.ToDecimal(txtNilai.Text);
                }
                else if (radioKredit.Checked)
                {
                    kredit = Convert.ToDecimal(txtNilai.Text);
                }

                var catatan = txtKeterangan.Text.ToString();


                var newRow = dt.NewRow();

                if (string.IsNullOrEmpty(catatan))
                {
                    catatan = "-";
                }
                newRow["id"] = Guid.NewGuid().ToString("");
                newRow["COA"] = coa;
                newRow["Debet"] = debet;
                newRow["Kredit"] = kredit;
                newRow["Deskripsi"] = catatan;
                newRow["NamaCoa"] = nama;

                dt.Rows.Add(newRow);

                Session["Report"] = dt;

                RefreshTable();

                lblKet.Text = "Sukses Tambah";
                lblKet.ForeColor = System.Drawing.Color.Green;

                ReadOnly();
                GetData();
            }
            catch(Exception ex)
            {
                lblKet.Text = "Mohon Isi Semua Field";
                lblKet.ForeColor = System.Drawing.Color.Red;
            }
            
        }

        private void RefreshTable()
        {
            var data = ((DataTable)Session["Report"]);
            gvDetailKas.DataSource = data;
            gvDetailKas.DataBind();
        }


        private void ReadOnly()
        {
            //txtKepada.ReadOnly = true;
            //txtKetBayar.ReadOnly = true;
            //txtMintaBayar.ReadOnly = true;
            //txtJnsPembayaran.Visible = true;
            //txtJnsPembayaran.Text = cbbJenisPembayaran.SelectedItem.ToString();
            //cbbJenisPembayaran.Visible = false;
            radioDebet.Checked = true;
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
            log.Action = "Insert Jurnal Umum ";
            log.UserName = userName;

            try
            {

            Hashtable ht = new Hashtable();

            var data = (DataTable)Session["Report"];
            var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            string date = DateTime.Parse(deTglBukti.Text).ToString("dd/MM/yyyy");
            int jnsProgram = Convert.ToInt32(cbbJenisProgram.Value);
            int jnsPembayaran = Convert.ToInt32(cbbJenisPembayaran.Value);

            decimal Debet = 0;
            decimal Kredit = 0;

            foreach (DataRow item in data.Rows)
            {
                Debet += Convert.ToDecimal(item["Debet"].ToString());
                Kredit += Convert.ToDecimal(item["Kredit"].ToString());
            }

            decimal Sisa = Debet - Kredit;

            if(Sisa==0)
            {
                ht.Add("@NilaiJumlah-float", Debet);
                ht.Add("@details-structured", data);
                ht.Add("@KodeCabang-smallint", branchCode);
                ht.Add("@TglBukti-varchar-20", date);
                ht.Add("@KetBayar-nvarchar-1000", txtKetBayar.Text.ToString());
                ht.Add("@CreatedBy-nvarchar-50", Session["user"].ToString());
                ht.Add("@Noref-varchar-40", bll.NoRefJurnal(branchCode));
                ht.Add("@JnsPembayaran_id-int", jnsPembayaran);
                ht.Add("@program_id-int", jnsProgram);
                ht.Add("@permintaan_bayar-varchar-99", txtMintaBayar.Text.ToString());
                ht.Add("@verifikasi-varchar-99", txtVerifikasi.Text.ToString());
                ht.Add("@penyetujuan-varchar-99", txtPenyetuju.Text.ToString());
                ht.Add("@kepada-varchar-99", txtKepada.Text);

                if (bll.InsertJurnal(ht))
                {
                    Session["Report"] = null;
                    lblSukses.Text = "Sukses Simpan Jurnal";
                    lblSukses.ForeColor = System.Drawing.Color.Green;
                    lblKet.Text = "Sukses Simpan Jurnal";
                    lblKet.ForeColor = System.Drawing.Color.Green;

                         
                    log.Type = "S";
                    log.Description = log.Action + ' ' + branchCode + ' ' + "Sukses oleh id" + ' ' + userName;


                    RefreshTable();

                    //Panel.Visible = false;
                    Response.Write("<script>alert('input jurnal sukses');</script>");
                    Response.Redirect("~/Akuntansi/JurnalUmum.aspx");

                }
                else
                {
                    string keterangan = "Jumlah Debit dan Kredit Harus Balance";
                    lblKet.Text = keterangan;
                    lblKet.ForeColor = System.Drawing.Color.Red;

                    log.Type = "F";
                    log.Description = log.Action + ' ' + branchCode + ' ' + "Gagal Karena" + ' ' +keterangan;
                }
            }

            else
            {
                string keterangan = "Jumlah Debit dan Kredit Harus Balance";
                lblKet.Text = keterangan;
                lblKet.ForeColor = System.Drawing.Color.Red;

                log.Type = "F";
                log.Description = log.Action + ' ' + branchCode + ' ' + "Gagal Karena" + ' ' + keterangan;
            }

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Insert Jurnal Umum Gagal : " + ex.Message;

                string keterangan = "Debit dan Kredit belum di tentukan";
                lblKet.Text = keterangan;
                lblKet.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
        }

        protected void cbbJenisProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (cbbJenisProgram.Value.ToString() == "1")
            {
                ComboAkun(0, 0, 0, 1);
                ComboPembayaran(0, 0, 1);
                lblHeader.Text = "JURNAL UMUM : Program Kemitraan";
            }

            else if (cbbJenisProgram.Value.ToString() == "2")
            {
                ComboAkun(2, 2, 2, 2);
                ComboPembayaran(2, 2, 2);
                lblHeader.Text = "JURNAL UMUM : Bina Linkungan";
            }

            else if (cbbJenisProgram.Value.ToString() == "3")
            {
                ComboAkun(0, 1, 2, 3);
                ComboPembayaran(0, 1, 2);
                lblHeader.Text = "JURNAL UMUM : Program Kemitraan dan Bina Lingkungan";
            }
        }

        protected void gvDetailKas_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            var data = (DataTable)Session["Report"];
            var row = data.Rows.Find(e.Keys["id"].ToString());

            var index = data.Rows.IndexOf(row);

            var Deskripsi =e.NewValues["Deskripsi"].ToString();
            var Kredit = e.NewValues["Kredit"].ToString();
            var Debet = e.NewValues["Debet"].ToString();


            data.Rows[index]["Deskripsi"] = Deskripsi;
            data.Rows[index]["Kredit"] = Kredit;
            data.Rows[index]["Debet"] = Debet;

            Session["Report"] = data;

            e.Cancel = true;
            gvDetailKas.CancelEdit();
            RefreshTable();

        }

        protected void gvDetailKas_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var data = (DataTable)Session["Report"];
            var row = data.Rows.Find(e.Keys["id"].ToString());

            data.Rows.Remove(row);

            Session["Report"] = data;
            e.Cancel = true;
            gvDetailKas.CancelEdit();
            RefreshTable();
        }

        protected void gvDetailKas_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        
    }
}