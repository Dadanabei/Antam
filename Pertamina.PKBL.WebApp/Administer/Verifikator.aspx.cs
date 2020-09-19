using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class Verifikator : System.Web.UI.Page
    {
        VerifikatorBll bll = new VerifikatorBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = bll.GetData(Convert.ToInt32(branchCode));

            if (data.Rows.Count > 0)
            {
                txtVerifikasi.Text = data.Rows[0]["verifikasi"].ToString();
                txtPenyetuju.Text = data.Rows[0]["penyetujuan"].ToString();
                txtPermintaan.Text = data.Rows[0]["permintaan_bayar"].ToString();
            }
        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
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
            log.Action = "Insert";
            log.UserName = userName;

            try
            {
                Hashtable ht = new Hashtable();
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                ht.Add("@branch_code-int",branchCode);
                ht.Add("@permintaan_bayar-varchar-99", txtPermintaan.Text);
                ht.Add("@penyetujuan-varchar-99", txtPenyetuju.Text);
                ht.Add("@verifikasi-varchar-99", txtVerifikasi.Text);
                ht.Add("@user-varchar-50", Session["user"]);
                bll.InsertData(ht);
                log.Type = "S";
                log.Description=log.Action+' '+"sukses oleh id "+' '+userName;

                GetData();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Insert Error";
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           
        }


    }
}