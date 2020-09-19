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

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class DetailPengembalianKelebihan : System.Web.UI.Page
    {
        PengembalianKelebihanBll bll = new PengembalianKelebihanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var mitraid = Session["proposal_number"].ToString();

                var data = bll.GetDetailData(mitraid);

                if (data != null)
                {
                    txtNama.Text = data["requestor_name"].ToString();
                    txtNoDebitur.Text = data["mitra_id"].ToString();
                    txtCatatan.Text = "Pembayaran ke-" + data["AngsuranKe"].ToString() + " a.n. " + data["requestor_name"].ToString().Trim() + ": " + data["mitra_id"].ToString();
                    txtTanggal.Date = DateTime.Today;
                    lblAngs.Text = data["AngsuranKe"].ToString()+" Rp 0.00";
                    lblAngsJasa.Text = data["AngsuranKe"].ToString()+" Rp 0.00";
                    lblSektor.Text=data["sector_id"].ToString();
                    
                }

                initCombo();

            }
            GetData();
        }

        private void GetData()
        {
            var mitraid = Session["proposal_number"].ToString();
            DataTable kartu = new Pertamina.PKBL.BLL.Akuntansi.KartuPiutangDetailBll().getKartuPiutang(mitraid.ToString());

            int currAngsuran = 0;
            foreach (DataRow item in kartu.Rows)
            {
                if (Convert.ToInt32(item["AngsuranKe"]) == currAngsuran)
                {
                    item["AngsuranKe"] = " ";
                    item["HutangPokok"] = " ";
                    item["Bunga"] = " ";
                    item["Total"] = " ";
                    item["TglJatuhTempo"] = " ";
                }
                else
                {
                    currAngsuran = Convert.ToInt32(item["AngsuranKe"]);
                }
            }
            gvDetailKartuPiutang.DataSource = kartu;
            gvDetailKartuPiutang.DataBind();
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;


            var kas = bll.SelectAkun(Convert.ToInt32(branchCode),Convert.ToInt32(lblSektor.Text));
            var angsuran = bll.SelectLawan(Convert.ToInt32(branchCode), Convert.ToInt32(lblSektor.Text));

            cbbKasBank.DataSource = kas;
            cbbKasBank.ValueField = "coa";
            cbbKasBank.TextField = "coa_display";
            cbbKasBank.DataBind();
            cbbKasBank.SelectedIndex = 0;

            cbbAngsuran.DataSource = angsuran;
            cbbAngsuran.ValueField = "coa";
            cbbAngsuran.TextField = "coa_display";
            cbbAngsuran.DataBind();
            cbbAngsuran.SelectedIndex = 0;
            
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
            log.Action = "Detail Pengembalian Pembayaran No. Proposal ";
            log.UserName = userName;

            try
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                var mitraid = Session["proposal_number"].ToString();
                var data = bll.GetDetailData(mitraid);

                Hashtable ht = new Hashtable();

                ht.Add("@proposal_number-varchar-40",mitraid.ToString());
                ht.Add("@pokok-float",float.Parse(txtBayarPokok.Text));
                ht.Add("@jasa-float",float.Parse(txtxBayarJasa.Text));
                ht.Add("@nilaiAdv-float",float.Parse(txtAdvPayment.Text));
                ht.Add("@tglPengembalian-varchar-20",DateTime.Parse(txtTanggal.Text).ToString("dd/MM/yyyy"));
                ht.Add("@branch_code-int",Convert.ToInt32(branchCode));
                ht.Add("@akunKasBank-varchar-40",cbbKasBank.Value);
                ht.Add("@akunAngsuran-varchar-40",cbbAngsuran.Value);
                ht.Add("@user-nvarchar-50",Session["user"].ToString());
                ht.Add("@AngsuranKe-int",Convert.ToInt32(data["AngsuranKe"]));
                ht.Add("@Catatan-nvarchar-1000",txtCatatan.Text);

                bll.InsertPengembalian(ht);

                log.Type = "S";
                log.Description = log.Action + ' ' + mitraid + ' ' + "Sukses oleh id" + ' ' + userName;
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
                logBll.InsertActivity(log);
            }
        }

        protected void gvDetailKartuPiutang_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "HutangPokok")
            {
                if (e.Value.ToString() != " ")
                {
                    decimal price = Convert.ToDecimal(e.Value);

                    e.DisplayText = string.Format("{0:#,##}", price);
                }

            }
            else if (e.Column.FieldName == "Bunga")
            {
                if (e.Value.ToString() != " ")
                {
                    decimal price = Convert.ToDecimal(e.Value);

                    e.DisplayText = string.Format("{0:#,##}", price);
                }

            }
            else if (e.Column.FieldName == "Total")
            {
                if (e.Value.ToString() != " ")
                {
                    decimal price = Convert.ToDecimal(e.Value);

                    e.DisplayText = string.Format("{0:#,##}", price);
                }

            }
        }

        protected void gvDetailKartuPiutang_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if(e.VisibleIndex>0)
            {
                if(e.DataColumn.FieldName=="NilaiAdv")
                {
                    int adv = Convert.ToInt32(e.GetValue("NilaiAdv"));
                    if(adv!=0)
                    {
                        e.Cell.Text = String.Format("({0:#,#.00})",adv);
                        e.Cell.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}