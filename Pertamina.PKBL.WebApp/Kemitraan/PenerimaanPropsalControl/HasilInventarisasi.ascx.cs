using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class HasilInventarisasi : System.Web.UI.UserControl
    {
        HasilInventarisasiBll bll = new HasilInventarisasiBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

                txtAlamatRumahBaru.Text = detail["new_home_address"].ToString();
                txtTelelponBaru.Text = detail["new_phone1"].ToString();
                txtHandphoneBaru.Text = detail["new_phone2"].ToString();

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
            log.Action = "update data inventarisasi";
            log.UserName = userName;


            try
            {
                Hashtable ht = new Hashtable();

                ht.Add("@new_home_address-varchar-300", txtAlamatRumahBaru.Text);
                ht.Add("@new_phone1-varchar-64", txtTelelponBaru.Text);
                ht.Add("@new_phone2-varchar-64", txtHandphoneBaru.Text);
                ht.Add("@mitra_id-int", Session["mitraid"]);
                ht.Add("@modified_by-varchar-64", Session["user"]);
                bll.updateData(ht);
                log.Type = "S";
                log.Description = log.Action + " mitra id " + Session["mitraid"].ToString() + " sukses oleh " + userName;

                GetData();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = log.Action + " error " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }
    }
}