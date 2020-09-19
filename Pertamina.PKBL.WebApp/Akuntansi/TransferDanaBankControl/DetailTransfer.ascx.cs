using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Akuntansi.TransferDanaBankControl
{
    public partial class DetailTransfer : System.Web.UI.UserControl
    {
        TransferDanaBankBll bll = new TransferDanaBankBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                DataTable dt = new DataTable();
                DataRow detail;
                DataView view;
                dt.Columns.Add("id", typeof(int));
                dt.Columns.Add("Category", typeof(string));

                if (branchCode=="9900")
                {
                    detail = dt.NewRow();
                    detail["id"] = 0;
                    detail["Category"] = "--Select--";
                    dt.Rows.Add(detail);

                    detail = dt.NewRow();
                    detail["id"] = 1;
                    detail["Category"] = "Transfer Pusat ke Cabang - PK";
                    dt.Rows.Add(detail);

                    detail = dt.NewRow();
                    detail["id"] = 2;
                    detail["Category"] = "Transfer Pusat ke Cabang - BL";
                    dt.Rows.Add(detail);

                    view = new DataView(dt);

                    cbbDrop.DataSource = view;
                    cbbDrop.ValueField = "id";
                    cbbDrop.TextField = "Category";
                    cbbDrop.DataBind();
                    cbbDrop.SelectedIndex = 0;

                }
                else
                {
                    detail = dt.NewRow();
                    detail["id"] = 0;
                    detail["Category"] = "--Select--";
                    dt.Rows.Add(detail);

                    detail = dt.NewRow();
                    detail["id"] = 1;
                    detail["Category"] = "Transfer Cabang Ke Pusat - PK";
                    dt.Rows.Add(detail);

                    detail = dt.NewRow();
                    detail["id"] = 2;
                    detail["Category"] = "Transfer Cabang Ke Pusat - BL";
                    dt.Rows.Add(detail);

                    view = new DataView(dt);

                    cbbDrop.DataSource = view;
                    cbbDrop.ValueField = "id";
                    cbbDrop.TextField = "Category";
                    cbbDrop.DataBind();
                    cbbDrop.SelectedIndex = 0;
                }
                GetData();
            }

            btnApprove.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.TransferDanaBank.Add");
            btnCacel.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.TransferDanaBank.Add");
            btnProses.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.TransferDanaBank.Add");
            
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            DataTable dt = new DataTable();
            var data = new Pertamina.PKBL.BLL.Administer.VerifikasiBll().GetData(Convert.ToInt32(branchCode));
            var cabang = bll.GetKantorCabang(Convert.ToInt32(branchCode));

            cbbPengirim.DataSource = cabang;
            cbbPengirim.TextField = "pengirim";
            cbbPengirim.ValueField = "branch_code";
            cbbPengirim.DataBind();
            cbbPengirim.SelectedIndex = 0;


            if (data.Rows.Count > 0)
            {
                txtPermintaan.Text = data.Rows[0]["permintaan_bayar"].ToString();
                txtVerifikasi.Text = data.Rows[0]["verifikasi"].ToString();
                txtPenyetuju.Text = data.Rows[0]["penyetujuan"].ToString();
            }

            txtJnsPembayaran.Text = cbbDrop.SelectedItem.ToString();

            int combo = Convert.ToInt32(cbbDrop.Value);

            if (combo==0)
            {
                Panel.Visible = false;
            }

            else if (combo == 1)
            {

                Panel.Visible = true;
                initCombo(Convert.ToInt32(branchCode), combo);
            }

            else if (combo == 2)
            {

                Panel.Visible = true;
                initCombo(Convert.ToInt32(branchCode), combo);
            }

            
        }

        private void initCombo(int branchCode, int program_id)
        {
            var pengirim = bll.GetNamaAkunPengirim(branchCode, program_id);
            var penerima = bll.GetNamaAkunPenerima(branchCode, program_id);

            cbbKodeAkunPengirim.DataSource = pengirim;
            cbbKodeAkunPengirim.TextField = "coa_display";
            cbbKodeAkunPengirim.ValueField = "COA";
            cbbKodeAkunPengirim.DataBind();
            cbbKodeAkunPengirim.SelectedIndex = 0;

            gvDetailTransfer.DataSource = pengirim;
            gvDetailTransfer.DataBind();

            glAkunPenerima.DataSource = penerima;
            glAkunPenerima.DataBind();
            glAkunPenerima.GridView.GroupBy(glAkunPenerima.GridView.Columns["branch_name"]);
            glAkunPenerima.GridView.ExpandAll();
        }

        protected void cbbDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            int combo = Convert.ToInt32(cbbDrop.Value);

            if(combo==1)
            {
                initCombo(Convert.ToInt32(branchCode), combo);
                lblRepost.Text = "";
            }

            else if(combo==2)
            {
                initCombo(Convert.ToInt32(branchCode), combo);
                lblRepost.Text = "";
            }
            GetData();
        }

        protected void btnProses_Click(object sender, EventArgs e)
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
            log.Action = "Transfer Dana Bank";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();

                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                var codeAkunPenerima = glAkunPenerima.GridView.GetRowValues(glAkunPenerima.GridView.FocusedRowIndex, "COA").ToString();
                var codeCabangPenerima = glAkunPenerima.GridView.GetRowValues(glAkunPenerima.GridView.FocusedRowIndex, "branch_code").ToString();

                ht.Add("@branch_code_pengirim-int",Convert.ToInt32(branchCode));
                ht.Add("@branch_code_penerima-int", Convert.ToInt32(codeCabangPenerima));
                ht.Add("@kodeAkunPengirim-varchar-99",cbbKodeAkunPengirim.SelectedItem.Value.ToString());
                ht.Add("@kepada-varchar-99",txtKepada.Text.ToString());
                ht.Add("@permintaan_bayar-varchar-99",txtPermintaan.Text.ToString());
                ht.Add("@verifikasi-varchar-99",txtVerifikasi.Text.ToString());
                ht.Add("@penyetuju-varchar-99",txtPenyetuju.Text.ToString());
                ht.Add("@tglKirim-varchar-20",DateTime.Parse(deTanggal.Text).ToString("dd/MM/yyyy"));
                ht.Add("@kodeAkunPenerima-varchar-99", codeAkunPenerima.ToString());
                ht.Add("@nominal-float",Convert.ToDecimal(txtJumlah.Text));
                ht.Add("@keperluan-varchar-1000",txtKeperluan.Text.ToString());
                ht.Add("@user-varchar-50",Session["user"].ToString());
                ht.Add("@program_id-int", Convert.ToInt32(cbbDrop.Value));
                ht.Add("@isInsert-bit", 0);

                Session["params"] = ht;

                var dt = bll.InsertData(ht);

                gvPopup.DataSource = dt;
                gvPopup.DataBind();

                puPreview.ShowOnPageLoad = true;

                log.Type = "S";
                log.Description=log.Action+' '+"sukses oleh id "+' '+userName;

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Transfer Dana Bank Error";
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        private void ClearData()
        {

            lblRepost.Text = "Input Sukses";
            lblRepost.ForeColor = System.Drawing.Color.Green;
            Panel.Visible = false;
            cbbDrop.SelectedIndex = 0;
        }

        protected void gvPopup_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            var ht = (Hashtable)Session["params"];
            ht["@isInsert-bit"] = 1;
            puPreview.ShowOnPageLoad = false;
            bll.InsertData(ht);
            ClearData();
        }

        protected void btnCacel_Click(object sender, EventArgs e)
        {
            puPreview.ShowOnPageLoad = false;
        }

    }
}