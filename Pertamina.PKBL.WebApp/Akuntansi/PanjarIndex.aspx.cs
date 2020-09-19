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

namespace Pertamina.PKBL.WebApp
{
    public partial class PanjarIndex : System.Web.UI.Page
    {
        PanjarBll bll = new PanjarBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                initCombo();
                Session["Url"] = Request.UrlReferrer;
            }
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            string Nopanjar = Session["Nopanjar"].ToString();
            var data = bll.GetDataPersetujuan(Convert.ToInt32(branchCode), Nopanjar);

            if(data.Rows.Count>0)
            {
                lblTerima.Text = String.Format("Sudah terima dari, {0}",data.Rows[0]["Nama"].ToString());
                lblBanyaknya.Text = String.Format("Banyaknya {0} Rupiah", Helper.Terbilang(Convert.ToInt32(data.Rows[0]["NilaiPanjar"])));
                lblJumlah.Text = String.Format("Jumlah Rp{0:#,##}.00", Convert.ToInt32(data.Rows[0]["NilaiPanjar"].ToString()));

                lblTanggal.Text = String.Format(",{0}", DateTime.Today.ToString("dd MMMM yyyy"));
                deTanggal.Date = DateTime.Parse(data.Rows[0]["TglPanjar"].ToString());
                txtNoref.Text = data.Rows[0]["Nopanjar"].ToString();
                txtNIP.Text = data.Rows[0]["nip"].ToString();
                txtNilai.Text = Convert.ToInt32(data.Rows[0]["NilaiPanjar"]).ToString();
                txtNama.Text = data.Rows[0]["Nama"].ToString();
            }
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var akun = bll.GetAkun(Convert.ToInt32(branchCode));
            var lawan = bll.GetLawanAkun(Convert.ToInt32(Session["program"]));

            cbbKasBank.DataSource = akun;
            cbbKasBank.TextField = "coa_display";
            cbbKasBank.ValueField = "account_id";
            cbbKasBank.DataBind();

            cbbPanjar.DataSource = lawan;
            cbbPanjar.TextField = "coa_display";
            cbbPanjar.ValueField = "account_id";
            cbbPanjar.DataBind();
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
            log.Action = "Persetujuan Panjar";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                ht.Add("@noPanajar-varchar-50",txtNoref.Text);
                ht.Add("@tglSetuju-varchar-20",DateTime.Parse(deTanggal.Text).ToString("dd/MM/yyyy"));
                ht.Add("@approved_amount-float",float.Parse(txtNilai.Text));
                ht.Add("@akunkas-varchar-40",cbbKasBank.Value.ToString());
                ht.Add("@akunpanjar-varchar-40",cbbPanjar.Value.ToString());
                ht.Add("@user-varchar-50",Session["user"].ToString());
                ht.Add("@branch_code-varchar-50",branchCode);

                bll.InsertPersetujuan(ht);

                log.Type = "S";
                log.Description = log.Action + "Sukses oleh id" + ' ' + userName; 

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Persetujuan Panjar Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);

                if(log.Type=="S")
                {
                    Session["Panjar"] = "S";
                    Response.Redirect(Session["Url"].ToString());
                }
            }

    
        }
    }
}