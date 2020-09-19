using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using Pertamina.PKBL.BLL;
using Pertamina.PKBL.BLL.Administer;
using System.Collections;
using System.Data;
using System.Net;


namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class DataUsaha : System.Web.UI.UserControl
    {
        DataUsahaBll bll = new DataUsahaBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initCombo();
                GetData();


                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnUpdate.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            }
            
        }
        public void GetData()
        {
            Hashtable ht = new Hashtable();

            ht.Add("@mitra_id-int", Session["mitraid"]);

            var data = bll.getData(ht);
            

            if (data.Rows.Count > 0)
            {

                var detail = data.Rows[0];

                txtBidangUsaha.Text = detail["company_sector_detail"].ToString();
                txtNamaPerusahaan.Text = detail["company_name"].ToString();
                txtNamaPimpinan.Text = detail["company_ceo"].ToString();
                txtalamatUsaha.Text = detail["company_address"].ToString();
                cbbKota.SelectedItem = cbbKota.Items.FindByValue(detail["company_city_id"].ToString());

                txtKodePos.Text = detail["company_postal"].ToString();
                txtNoHp.Text = detail["company_phone2"].ToString();
                txtNoTelp.Text = detail["company_phone1"].ToString();
                txtNoFax.Text = detail["company_fax"].ToString();
                txtEmail.Text = detail["company_email"].ToString();

                cbbLahanUsaha.SelectedItem = cbbLahanUsaha.Items.FindByValue(detail["company_owns_workplace"].ToString());
                try
                {
                    deTglAkhirSewa.Value = Convert.ToDateTime(detail["company_workplace_end_rent"].ToString());
                }
                catch(Exception ex)
                {
                    deTglAkhirSewa.Value = null;
                }
                    
                txtAktifMulaiUsaha.Text = detail["company_active_since"].ToString();
                txtJumlahTenagaKerja.Text = detail["company_workforce"].ToString();
                txtPermohonanJumlahGaji.Text = detail["working_capital"].ToString();

                txtInvestasi.Text = detail["company_investment"].ToString();
                txtOmzet.Text = detail["monthly_revenue"].ToString();
                txtUnit.Text = detail["company_unit"].ToString();
                cbbAdmPembukuan.SelectedItem = cbbAdmPembukuan.Items.FindByValue(detail["has_journal_administration"].ToString());
                txtBerupa.Text = detail["journal_administration"].ToString();

                cbbPinjaman.SelectedItem = cbbPinjaman.Items.FindByValue(detail["has_other_loan"].ToString());
                txtBankBUMN.Text = detail["other_loan_at"].ToString();
                txtBesarnya.Text = detail["other_loan_amount"].ToString();
            }
            else
            {
                txtJumlahTenagaKerja.Text = "0";                
            }
        }

        public void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            CityIndexBll city = new CityIndexBll();
            DdlBll combo = new DdlBll();
            var cityComboData = city.GetDataByBranch(branchCode);

            var lahanUsaha = combo.GetComboItem("ddl_workplace");
            var pembukuan = combo.GetComboItem("ddl_pembukuan");
            var pinjaman = combo.GetComboItem("ddl_pinjaman");

            
            cbbKota.TextField = "city_name";
            cbbKota.ValueField = "city_appcode";
            cbbKota.DataSource = cityComboData;
            cbbKota.DataBind();            
            
            cbbLahanUsaha.TextField = "ddl_item";
            cbbLahanUsaha.ValueField = "ddl_value";            
            cbbLahanUsaha.DataSource = lahanUsaha;
            cbbLahanUsaha.DataBind();

            //pembukuan.Rows.Add(new object[] { "-", 0 });  
            cbbAdmPembukuan.TextField = "ddl_item";
            cbbAdmPembukuan.ValueField = "ddl_value";
            cbbAdmPembukuan.DataSource = pembukuan;
            cbbAdmPembukuan.DataBind();
            cbbAdmPembukuan.SelectedItem = cbbAdmPembukuan.Items.FindByText("Tidak");

            //pinjaman.Rows.Add(new object[] { "-", 0 });
            cbbPinjaman.TextField = "ddl_item";
            cbbPinjaman.ValueField = "ddl_value";
            cbbPinjaman.DataSource = pinjaman;
            cbbPinjaman.DataBind();
            cbbPinjaman.SelectedItem = cbbPinjaman.Items.FindByText("Tidak");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
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
            log.Action = "update data usaha";
            log.UserName = userName;


            try
            {
                Hashtable ht = new Hashtable();
                //var tglAkhirSewa = DateTime.Parse(deTglAkhirSewa.Text);
                //26
                object tglAkhir;

                if(string.IsNullOrEmpty(deTglAkhirSewa.Text.Trim()))
                {
                    tglAkhir = "-";
                }
                else
                {
                    tglAkhir = (DateTime.Parse(deTglAkhirSewa.Text)).ToString("dd/MM/yyyy") ;
                }

                ht.Add("@company_sector_detail-varchar-200", txtBidangUsaha.Text);
                ht.Add("@company_name-varchar-99", txtNamaPerusahaan.Text);
                ht.Add("@company_ceo-varchar-99", txtNamaPimpinan.Text);
                ht.Add("@company_address-varchar-300", txtalamatUsaha.Text);
                ht.Add("@company_city_id-int", cbbKota.Value.ToString());
                ht.Add("@company_postal-varchar-9", txtKodePos.Text);
                ht.Add("@company_phone2-varchar-64", txtNoHp.Text);
                ht.Add("@company_phone1-varchar-64", txtNoTelp.Text);
                ht.Add("@company_fax-varchar-64", txtNoFax.Text);
                ht.Add("@company_email-varchar-64", txtEmail.Text);
                ht.Add("@company_owns_workplace-bit", cbbLahanUsaha.Value.ToString());
                ht.Add("@company_workplace_end_rent-varchar-10", tglAkhir);
                ht.Add("@company_active_since-varchar-99", txtAktifMulaiUsaha.Text);
                ht.Add("@company_workforce-int", txtJumlahTenagaKerja.Text);
                ht.Add("@working_capital-decimal", txtPermohonanJumlahGaji.Text);
                ht.Add("@company_investment-decimal", txtInvestasi.Text);
                ht.Add("@monthly_revenue-decimal", txtOmzet.Text);
                ht.Add("@company_unit-decimal", txtUnit.Text);
                ht.Add("@has_journal_administration-bit", cbbAdmPembukuan.Value.ToString());
                ht.Add("@journal_administration-varchar-99", txtBerupa.Text);
                ht.Add("@has_other_loan-bit", cbbPinjaman.Value.ToString());
                ht.Add("@other_loan_at-varchar-99", txtBankBUMN.Text);
                ht.Add("@other_loan_amount-decimal", txtBesarnya.Text);
                ht.Add("@mitra_id-int", Session["mitraid"]);
                ht.Add("@modified_by-varchar-64", Session["user"]);
                //ht.Add("@proposal_id-int", Session["idProposal"]);

                bll.updateData(ht);
                log.Type = "S";
                log.Description = log.Action + " mitra id " + Session["mitraid"].ToString() + " sukses oleh " + userName;
                GetData();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            catch (Exception ex)
            {

                log.Type = "E";
                log.Description = log.Action + " error " + ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

    }
}