using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using System.Collections;
using System.Net;

namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class Administrasi : System.Web.UI.UserControl
    {
        AdministrasiBll bll = new AdministrasiBll();
        ActivityLogBll logBll = new ActivityLogBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();

                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnUpdate.Visible= RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            }
        }

        private void GetData()
        {
            //var data = bll.GetCurrent(Session["mitraid"].ToString());
            Hashtable ht = new Hashtable();
            ht.Add("@mitra_id-int", Session["mitraid"]);
            var data = bll.getData(ht);
            InitCombo();
            if (data.Rows.Count > 0)
            {
                var detail = data.Rows[0];

                cbbBahanBaku.SelectedItem = cbbBahanBaku.Items.FindByValue(detail["is_purchasing_materials"]);
                cbbMesin.SelectedItem = cbbMesin.Items.FindByValue(detail["is_purchasing_machinary"]);
                cbbTempatUsaha.SelectedItem = cbbTempatUsaha.Items.FindByValue(detail["is_developing_workplace"]);
                cbbKursus.SelectedItem = cbbKursus.Items.FindByValue(detail["is_attending_mg_course"]);
                cbbKeterampilan.SelectedItem = cbbKeterampilan.Items.FindByValue(detail["is_upgrading_skill"]);
                cbbPinjaman.SelectedItem = cbbPinjaman.Items.FindByValue(detail["is_paying_loan"]);
                cbbPeralatan.SelectedItem = cbbPeralatan.Items.FindByValue(detail["is_purchasing_tools"]);
                cbbRencana.SelectedItem = cbbRencana.Items.FindByValue(detail["has_other_plans"]);

                mmRJPP.Text = detail["company_longterm_plan"].ToString();
                mmRKAP.Text = detail["company_wbs"].ToString();
                txtTambahTenaga.Text = detail["adds_workforce"].ToString();

                txtMesin.Text = detail["machinary_purchase"].ToString();
                txtBahanBaku.Text = detail["material_purchases"].ToString();
                txtPeralatan.Text = detail["tool_purchases"].ToString();
                txtKursus.Text = detail["mg_course_cost"].ToString();
                txtTempatUsaha.Text = detail["workplace_development_cost"].ToString();
                txtKeterampilan.Text = detail["skill_upgrade_cost"].ToString();
                txtPinjaman.Text = detail["loan_payment"].ToString();
                txtRencana.Text = detail["other_plans_cost"].ToString();

            }
            else
            {
                cbbBahanBaku.Value = "true";
                cbbMesin.Value = "true";
                cbbTempatUsaha.Value = "true";
                cbbKursus.Value = "true";
                cbbKeterampilan.Value = "true";
                cbbPinjaman.Value = "true";
                cbbPeralatan.Value = "true";
                cbbRencana.Value = "true";
                txtTambahTenaga.Text = "0";
            }

        }

        private void InitCombo()
        {
            DdlBll ddlBll = new DdlBll();

            var comboData = ddlBll.GetComboItem("ddl_administrasi");
            cbbBahanBaku.DataSource = comboData;
            cbbBahanBaku.TextField = "ddl_item";
            cbbBahanBaku.ValueField = "ddl_value";
            cbbBahanBaku.DataBind();
            cbbBahanBaku.SelectedIndex=0;


            cbbMesin.DataSource = comboData;
            cbbMesin.TextField = "ddl_item";
            cbbMesin.ValueField = "ddl_value";
            cbbMesin.DataBind();
            cbbMesin.SelectedIndex = 0;

            cbbTempatUsaha.DataSource = comboData;
            cbbTempatUsaha.TextField = "ddl_item";
            cbbTempatUsaha.ValueField = "ddl_value";
            cbbTempatUsaha.DataBind();

            cbbKursus.DataSource = comboData;
            cbbKursus.TextField = "ddl_item";
            cbbKursus.ValueField = "ddl_value";
            cbbKursus.DataBind();
            cbbKursus.SelectedIndex = 0;

            cbbKeterampilan.DataSource = comboData;
            cbbKeterampilan.TextField = "ddl_item";
            cbbKeterampilan.ValueField = "ddl_value";
            cbbKeterampilan.DataBind();
            cbbKeterampilan.SelectedIndex = 0;


            cbbPinjaman.DataSource = comboData;
            cbbPinjaman.TextField = "ddl_item";
            cbbPinjaman.ValueField = "ddl_value";
            cbbPinjaman.DataBind();
            cbbPinjaman.SelectedIndex = 0;

            cbbPeralatan.DataSource = comboData;
            cbbPeralatan.TextField = "ddl_item";
            cbbPeralatan.ValueField = "ddl_value";
            cbbPeralatan.DataBind();
            cbbPeralatan.SelectedIndex = 0;

            cbbRencana.DataSource = comboData;
            cbbRencana.TextField = "ddl_item";
            cbbRencana.ValueField = "ddl_value";
            cbbRencana.DataBind();
            cbbRencana.SelectedIndex = 0;

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
            log.Action = "Update Data Administrasi";
            log.UserName = userName;


            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@company_longterm_plan-text", mmRJPP.Text);
                ht.Add("@company_wbs-text", mmRKAP.Text);
                ht.Add("@adds_workforce-int", txtTambahTenaga.Text);
                ht.Add("@is_purchasing_machinary-bit", cbbMesin.Value.ToString());
                ht.Add("@is_purchasing_materials-bit", cbbBahanBaku.Value.ToString());
                ht.Add("@is_purchasing_tools-bit", cbbPeralatan.Value.ToString());
                ht.Add("@is_attending_mg_course-bit", cbbKursus.Value.ToString());
                ht.Add("@is_developing_workplace-bit", cbbTempatUsaha.Value.ToString());
                ht.Add("@is_upgrading_skill-bit", cbbKeterampilan.Value.ToString());
                ht.Add("@is_paying_loan-bit", cbbPinjaman.Value.ToString());
                ht.Add("@has_other_plans-bit", cbbRencana.Value.ToString());
                ht.Add("@machinary_purchase-decimal", txtMesin.Text);
                ht.Add("@material_purchases-decimal", txtBahanBaku.Text);
                ht.Add("@tool_purchases-decimal", txtPeralatan.Text);
                ht.Add("@mg_course_cost-decimal", txtKursus.Text);
                ht.Add("@workplace_development_cost-decimal", txtTempatUsaha.Text);
                ht.Add("@skill_upgrade_cost-decimal", txtKeterampilan.Text);
                ht.Add("@loan_payment-decimal", txtPinjaman.Text);
                ht.Add("@other_plans_cost-decimal", txtRencana.Text);
                ht.Add("@mitra_id-int", Session["mitraid"]);
                ht.Add("@modified_by-varchar-64", Session["user"]);
                bll.updateData(ht);

                log.Type = "S";
                log.Description = log.Action +" mitra id " +Session["mitraid"].ToString()+" sukses oleh "+userName;
                GetData();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            catch (Exception ex)
            {

                log.Type = "E";
                log.Description = "update data administrasi error : " + ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally {
                logBll.InsertActivity(log);
            }
        }

    }
}