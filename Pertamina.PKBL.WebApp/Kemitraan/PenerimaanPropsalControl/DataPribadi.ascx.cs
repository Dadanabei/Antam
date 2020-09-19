using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using Pertamina.PKBL.BLL;
using System.Data;
using System.Collections;
using System.Net;
using DevExpress.Web.ASPxEditors;

namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class DataPribadi : System.Web.UI.UserControl
    {
        DataPribadiBll bll = new DataPribadiBll();
        DdlBll combo = new DdlBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initCombo();
                getData();


                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnUpdate.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            }

            
        }

        public void getData()
        {
            //var Data = bll.getData(Int32.Parse(Session["idProposal"].ToString())).Rows[0];

            Hashtable ht = new Hashtable();

            ht.Add("@mitra_id-int", Session["mitraid"]);

            var data = bll.getData(ht);
            if (data.Rows.Count > 0)
            {
                var detail = data.Rows[0];

                txtAlamat.Text = detail["requestor_address"].ToString();
                txtKecamatan.Text = detail["address_district"].ToString();
                cbbKepRumah.SelectedItem = cbbKepRumah.Items.FindByValue((detail["home_ownership_id"]).ToString());
                txtTelepon.Text = detail["requestor_phone1"].ToString();
                txtHandphone.Text = detail["requestor_phone2"].ToString();
                txtEmail.Text = detail["requestor_email"].ToString();
                txtKodepos.Text = detail["postal_code"].ToString();
                cbbStatPernikahan.SelectedItem = cbbStatPernikahan.Items.FindByValue(detail["marital_status_id"].ToString());
                cbbPendTerakhir.SelectedItem = cbbPendTerakhir.Items.FindByValue(detail["education_lv_id"].ToString());
            }
        }
        public void initCombo()
        {
            var marital = combo.getComboMarital(new Hashtable());
            DataRow rmar = marital.NewRow();
            var education = combo.getComboEducation(new Hashtable());
            DataRow redu = education.NewRow();
            var homeOwner = combo.getComboHomeOwner(new Hashtable());
            DataRow r = homeOwner.NewRow();


            cbbKepRumah.TextField = "description";
            cbbKepRumah.ValueField = "id";
            r["description"] = "-";
            r["id"] = 0;
            homeOwner.Rows.Add(r);
            cbbKepRumah.DataSource = homeOwner;
            cbbKepRumah.DataBind();


            redu["description"] = "-";
            redu["id"] = 0;
            education.Rows.Add(redu);
            cbbPendTerakhir.TextField = "description";
            cbbPendTerakhir.ValueField = "id";
            cbbPendTerakhir.DataSource = education;
            cbbPendTerakhir.DataBind();


            rmar["description"] = "-";
            rmar["id"] = 0;
            marital.Rows.Add(rmar);
            cbbStatPernikahan.TextField = "description";
            cbbStatPernikahan.ValueField = "id";
            cbbStatPernikahan.DataSource = marital;
            cbbStatPernikahan.DataBind();
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
            log.Action = "update data pribadi";
            log.UserName = userName;

            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@requestor_address-varchar-300", txtAlamat.Text);
                ht.Add("@address_district-varchar-99", txtKecamatan.Text);
                ht.Add("@home_ownership_id-int", cbbKepRumah.Value);
                ht.Add("@requestor_phone1-varchar-64", txtTelepon.Text);
                ht.Add("@requestor_phone2-varchar-64", txtHandphone.Text);
                ht.Add("@requestor_email-varchar-64", txtEmail.Text);
                ht.Add("@marital_status_id-int", cbbStatPernikahan.Value);
                ht.Add("@education_lv_id-int", cbbPendTerakhir.Value);
                ht.Add("@proposal_id-int", Session["idProposal"]);
                ht.Add("@postal_code-varchar-10", txtKodepos.Text);
                ht.Add("@user-varchar-64", Session["user"]);

                bll.updateData(ht);
                log.Type = "S";
                log.Description = log.Action + " mitra id " + Session["mitraid"].ToString() + " sukses oleh " + userName;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('"+HttpUtility.JavaScriptStringEncode(log.Description)+"');", true);
                getData();

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