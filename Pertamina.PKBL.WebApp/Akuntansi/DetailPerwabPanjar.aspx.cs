﻿using System;
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
    public partial class DetailPerwabPanjar : System.Web.UI.Page
    {
        PanjarBll bll = new PanjarBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["Url"] = Request.UrlReferrer;
                initCombo();
            }
            
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = bll.GetDataPerwabPersetujuan(Convert.ToInt32(branchCode), Session["Nopanjar"].ToString());

            txtNama.Text = data["Nama"].ToString();
            txtNoRef.Text = "--Generated by System--";
            txtNip.Text = data["nip"].ToString();
            txtNilai.Text=data["NilaiPanjar"].ToString();
            deTanggal.Date = DateTime.Today;
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var akun = bll.GetAkun(Convert.ToInt32(branchCode));
            var lawan = bll.GetLawanAkun(Convert.ToInt32(Session["program"]));

            cbbAkun.DataSource = akun;
            cbbAkun.TextField = "coa_display";
            cbbAkun.ValueField = "account_id";
            cbbAkun.DataBind();

            cbbLawan.DataSource = lawan;
            cbbLawan.TextField = "coa_display";
            cbbLawan.ValueField = "account_id";
            cbbLawan.DataBind();
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
            log.Action = "Insert Perwab";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();

                ht.Add("@noPanajr-varchar-50",Session["Nopanjar"].ToString());
                ht.Add("@tglPerwab-varchar-15",DateTime.Parse(deTanggal.Text).ToString("dd/MM/yyyy"));
                ht.Add("@nilaiSisa-float",float.Parse(txtNilaiPerwab.Text));
                ht.Add("@catatan-varchar-1000",txtCatatan.Text);
                ht.Add("@akunPanjar-varchar-40",cbbAkun.Value.ToString());
                ht.Add("@akunLawan-varchar-40",cbbLawan.Value.ToString());
                ht.Add("@user-varchar-50",Session["user"].ToString());

                bll.InsertPerwab(ht);

                log.Type = "S";
                log.Description = log.Action + "Sukses oleh id" + ' ' + userName; 

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Insert Perwab Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);

                if (log.Type == "S")
                {
                    Session["Perwab"] = "S";
                    Response.Redirect(Session["Url"].ToString());
                }
            }
        }
    }
}