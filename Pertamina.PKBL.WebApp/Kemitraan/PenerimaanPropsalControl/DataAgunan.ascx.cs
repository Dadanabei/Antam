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
    public partial class DataAgunan : System.Web.UI.UserControl
    {
        DataAgunanBll bll = new DataAgunanBll();
        
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


        public void initCombo() {

        }

        public void getData()
        {
            Hashtable ht = new Hashtable();

            ht.Add("@mitra_id-int", Session["mitraid"]);
            var data = bll.getData(ht);

            if (data.Rows.Count > 0)
            {

                var detail = data.Rows[0];

                txtJenis.Text = detail["car_object"].ToString() ?? "";
                txtNilaiAgunan.Text = detail["car_value"].ToString() ?? "";
                cbbKondisi.Text = detail["car_condition"].ToString() ?? "";
                txtJenisMotor.Text = detail["motor_object"].ToString() ?? "";
                txtAgunanMotor.Text = detail["motor_value"].ToString() ?? "";
                cbbKondisiMotor.Text = detail["motor_condition"].ToString() ?? "";
                txtJenisLain.Text = detail["other_object"].ToString() ?? "";
                txtAgunanLain.Text = detail["other_value"].ToString() ?? "";
                txtKondisiLain.Text = detail["other_condition"].ToString() ?? "";
                mmAgunan.Text = detail["mortgage_remarks"].ToString() ?? "";
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
            log.Action = "update data agunan";
            log.UserName = userName;


            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@car_mortgaged_object-varchar-99", txtJenis.Text ?? "");
                ht.Add("@car_mortgaged_value-decimal", txtNilaiAgunan.Text ?? "");
                ht.Add("@car_condition-varchar-200", cbbKondisi.Text.ToString() ?? "");
                ht.Add("@motorbike_mortgaged_object-varchar-99", txtJenisMotor.Text ?? "");
                ht.Add("@motorbike_mortgaged_value-decimal", txtAgunanMotor.Text ?? "");
                ht.Add("@motorbike_condition-varchar-200", cbbKondisiMotor.Text.ToString() ?? "");
                ht.Add("@other_mortgaged_object-varchar-99", txtJenisLain.Text ?? "");
                ht.Add("@other_mortgaged_value-decimal", txtAgunanLain.Text ?? "");
                ht.Add("@other_condition-varchar-200", txtKondisiLain.Text ?? "");
                ht.Add("@mortgage_remarks-varchar-500", mmAgunan.Text ?? "");
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