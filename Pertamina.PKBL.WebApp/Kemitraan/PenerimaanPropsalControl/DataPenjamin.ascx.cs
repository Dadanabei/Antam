using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class DataPenjamin : System.Web.UI.UserControl
    {
        DataPenjaminBll bll = new DataPenjaminBll();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();


                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnUpdate.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            }
        }

        public void getData()
        {
            Hashtable ht = new Hashtable();

            ht.Add("@mitra_id-int", Session["mitraid"]);

            var data = bll.getData(ht);
            if (data.Rows.Count > 0)
            {

                var detail = data.Rows[0];

                txtNamaLengkap.Text = detail["nama_keluarga"].ToString();
                txtAlamatRumah.Text = detail["alamat_keluarga"].ToString();
                txtPekerjaan.Text = detail["pekerjaan_keluarga"].ToString();
                txtNoTelp.Text = detail["no_telp_keluarga"].ToString();
                txtKota.Text = detail["kota_keluarga"].ToString();

                txtNamaLengkapSaudara.Text = detail["nama_wali"].ToString();
                txtAlamatRumahSaudara.Text = detail["pekerjaan_wali"].ToString();
                txtPekerjaanSaudara.Text = detail["alamat_wali"].ToString();
                txtNoTelpSaudara.Text = detail["no_telp_wali"].ToString();
                txtKotaSaudara.Text = detail["kota_wali"].ToString();

            }
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
            log.Action = "update data penjamin";
            log.UserName = userName;

            try
            {
                Hashtable ht = new Hashtable();

                ht.Add("@family_name-varchar-99", txtNamaLengkap.Text ?? "");
                ht.Add("@family_address-varchar-99", txtAlamatRumah.Text ?? "");
                ht.Add("@family_occupation-varchar-99", txtPekerjaan.Text ?? "");
                ht.Add("@family_phone-varchar-99", txtNoTelp.Text ?? "");
                ht.Add("@family_city-varchar-99", txtKota.Text ?? "");
                ht.Add("@other_name-varchar-99", txtNamaLengkapSaudara.Text ?? "");
                ht.Add("@other_occupation-varchar-99", txtPekerjaanSaudara.Text ?? "");
                ht.Add("@other_address-varchar-99", txtAlamatRumahSaudara.Text ?? "");
                ht.Add("@other_phone-varchar-99", txtNoTelpSaudara.Text ?? "");
                ht.Add("@other_city-varchar-99", txtKotaSaudara.Text ?? "");
                ht.Add("@mitra_id-int", Session["mitraid"]);
                ht.Add("@modified_by-varchar-64", Session["user"]);


                bll.updateData(ht);
                log.Type = "S";
                log.Description = log.Action + " mitra id " + Session["mitraid"].ToString() + " sukses oleh " + userName;
                getData();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = log.Action + " error " + ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally {
                logBll.InsertActivity(log);
            }
        }
    }
}