using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Collections;
using System.Data;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using DevExpress.Utils;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class Lihatpanjar : System.Web.UI.Page
    {
        PanjarBll bll = new PanjarBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("Text", typeof(string));
                dt.Columns.Add("Value", typeof(int));

                dr = dt.NewRow();
                dr["Text"] = "Kemitraan";
                dr["Value"] = 1;
                dt.Rows.Add(dr);

                dr = dt.NewRow();
                dr["Text"] = "Bina Lingkungan";
                dr["Value"] = 2;
                dt.Rows.Add(dr);


                ((GridViewDataComboBoxColumn)gvLihatPanjar.Columns["program_id"]).PropertiesComboBox.DataSource = dt;
                ((GridViewDataComboBoxColumn)gvLihatPanjar.Columns["program_id"]).PropertiesComboBox.TextField = "Text";
                ((GridViewDataComboBoxColumn)gvLihatPanjar.Columns["program_id"]).PropertiesComboBox.ValueField = "Value";

                if (Session["Panjar"] != null)
                {
                    if (Session["Panjar"].ToString() == "S")
                    {
                        ClientScript.RegisterStartupScript(GetType(), "koreksi", "alert('Perwab Sukses');", true);
                        Session["Panjar"] = null;
                    }
                }

            }
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = bll.GetData(Convert.ToInt32(branchCode));

            gvLihatPanjar.DataSource = data;
            gvLihatPanjar.DataBind();
        }

        protected void gvLihatPanjar_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
            log.Action = "Insert Panjar";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();

                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                ht.Add("@tglPanjar-varchar-20", DateTime.Parse(e.NewValues["TglPanjar"].ToString()).ToString("dd/MM/yyyy"));
                ht.Add("@nama-varchar-99", e.NewValues["Nama"].ToString());
                ht.Add("@nip-varchar-30", e.NewValues["nip"].ToString());
                ht.Add("@jabatan-varchar-30", e.NewValues["jabatan"].ToString());
                ht.Add("@tujuan-varchar-1000", e.NewValues["Tujuan"].ToString());
                ht.Add("@keperluan-varchar-1000", e.NewValues["Keperluan"].ToString());
                ht.Add("@nilaiPanjar-float",float.Parse(e.NewValues["NilaiPanjar"].ToString()));
                ht.Add("@program_id-int",Convert.ToInt32(e.NewValues["program_id"]));
                ht.Add("@tglBerangkat-varchar-20", DateTime.Parse(e.NewValues["TglBerangkat"].ToString()).ToString("dd/MM/yyyy"));
                ht.Add("@tglKembali-varchar-20", DateTime.Parse(e.NewValues["TglKembali"].ToString()).ToString("dd/MM/yyyy"));
                ht.Add("@transportBerangkat-float", float.Parse(e.NewValues["TransportBerangkat"].ToString()));
                ht.Add("@transportKembali-float", float.Parse(e.NewValues["TransportKembali"].ToString()));
                ht.Add("@dibuatOleh-varchar-20", e.NewValues["DibuatOleh"].ToString());
                ht.Add("@user-varchar-99",Session["user"].ToString());
                ht.Add("@branch_code-int", Convert.ToInt32(branchCode));

                bll.InsertData(ht);

                log.Type = "S";
                log.Description = log.Action +  "Sukses oleh id" + ' ' + userName; 

                e.Cancel = true;
                gvLihatPanjar.CancelEdit();
                GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Insert Panjar Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

            
        }

        protected void gvLihatPanjar_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Update Panjar";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();

                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                ht.Add("@tglPanjar-varchar-20", DateTime.Parse(e.NewValues["TglPanjar"].ToString()).ToString("dd/MM/yyyy"));
                ht.Add("@nama-varchar-99", e.NewValues["Nama"].ToString());
                ht.Add("@nip-varchar-30", e.NewValues["nip"].ToString());
                ht.Add("@jabatan-varchar-30", e.NewValues["jabatan"].ToString());
                ht.Add("@tujuan-varchar-1000", e.NewValues["Tujuan"].ToString());
           
                ht.Add("@keperluan-varchar-1000", e.NewValues["Keperluan"].ToString());
                ht.Add("@nilaiPanjar-float", float.Parse(e.NewValues["NilaiPanjar"].ToString()));
                ht.Add("@program_id-int", Convert.ToInt32(e.NewValues["program_id"]));
                ht.Add("@tglBerangkat-varchar-20", DateTime.Parse(e.NewValues["TglBerangkat"].ToString()).ToString("dd/MM/yyyy"));
                ht.Add("@tglKembali-varchar-20", DateTime.Parse(e.NewValues["TglKembali"].ToString()).ToString("dd/MM/yyyy"));
           
                ht.Add("@transportBerangkat-float", float.Parse(e.NewValues["TransportBerangkat"].ToString()));
                ht.Add("@transportKembali-float", float.Parse(e.NewValues["TransportKembali"].ToString()));
                ht.Add("@dibuatOleh-varchar-20", e.NewValues["DibuatOleh"].ToString());
                ht.Add("@user-varchar-99", Session["user"].ToString());
                ht.Add("@NoPanjar-varchar-20", e.NewValues["Nopanjar"].ToString());
                ht.Add("@branch_code-int", Convert.ToInt32(branchCode));

                bll.UpdateData(ht);

                log.Type = "S";
                log.Description = log.Action + "Sukses oleh id" + ' ' + userName; 

                e.Cancel = true;
                gvLihatPanjar.CancelEdit();
                GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Update Panjar Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }
        private void btnPersetujuanPanjar(int visibleIndex)
        {

            var Nopanjar = gvLihatPanjar.GetRowValues(visibleIndex, "Nopanjar").ToString();
            var program = gvLihatPanjar.GetRowValues(visibleIndex, "program_id").ToString();
            Session["Nopanjar"] = Nopanjar;
            Session["program"] = program;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Akuntansi/PanjarIndex.aspx");
        }
        protected void gvLihatPanjar_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            
                btnPersetujuanPanjar(e.VisibleIndex);
        }

        protected void gvLihatPanjar_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["TglBerangkat"] = DateTime.Today;
            e.NewValues["TglPanjar"] = DateTime.Today;
            e.NewValues["TglKembali"] = DateTime.Today;
            e.NewValues["Nopanjar"] = "--Generate by System--";
        }

        protected void gvLihatPanjar_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex > 0)
            {
                int persetujuan = Convert.ToInt32(gvLihatPanjar.GetRowValues(e.VisibleIndex, "isApproved"));

                if (persetujuan == 0)
                {
                    if (e.ButtonType == ColumnCommandButtonType.Update)
                    {
                        e.Visible = true;
                    }

                }

                else if (persetujuan == 1)
                {
                    if (e.ButtonType == ColumnCommandButtonType.Update)
                    {
                        e.Visible = false;
                    }
                }
            }
        }

        protected void gvLihatPanjar_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex > 0)
            {
                int persetujuan = Convert.ToInt32(gvLihatPanjar.GetRowValues(e.VisibleIndex, "isApproved"));

                if (persetujuan == 0)
                {
                    if (e.ButtonID == "Persetujuan")
                    {
                        e.Visible = DefaultBoolean.True;
                    }
                }

                else if (persetujuan == 1)
                {
                    if (e.ButtonID == "Persetujuan")
                    {
                        e.Visible = DefaultBoolean.False;
                    }
                }
            }
        }
    }
}