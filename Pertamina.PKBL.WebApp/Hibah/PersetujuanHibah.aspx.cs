using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using Pertamina.PKBL.BLL.Administer;
using Pertamina.PKBL.BLL.Hibah;
using DevExpress.Web.ASPxGridView;
using System.Net;
using System.Web.Security;
using System.Data.SqlClient;

namespace Pertamina.PKBL.WebApp.Hibah
{
    public partial class PersetujuanHibah : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initCombo();
            }
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPersetujuan.DataSource = ((new PersetujuanHibahBll()).GetData(branchCode)).DefaultView;
            gvPersetujuan.DataBind();
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            DdlBll ddlBll = new DdlBll();

            var comboPersetujuan = ddlBll.GetComboItem("ddl_input_persetujuan");
            var jenisKredit = ddlBll.getJenisKreditHibah();
            

            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["creditkind_id"]).PropertiesComboBox.TextField = "descr";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["creditkind_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["creditkind_id"]).PropertiesComboBox.DataSource = jenisKredit;

            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["status"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["status"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvPersetujuan.Columns["status"]).PropertiesComboBox.DataSource = comboPersetujuan;

        }

        protected void gvPersetujuan_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.Edit)
            {
                string status = gvPersetujuan.GetRowValues(e.VisibleIndex, "status").ToString();
                if (status ==null || status=="")
                {
                    e.Image.Url = "../content/images/new.png";
                }
            }
        }

        protected void gvPersetujuan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Insert Persetujuan Hibah";
            log.UserName = userName;

            try
            {
                Hashtable ht = new Hashtable();
                var regDate = DateTime.Parse(e.NewValues["registration_date"].ToString());
                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                ht.Add("@proposal_number-varchar-99", e.NewValues["proposal_number"] ?? "");
                ht.Add("@registration_date-varchar-10", regDate.ToString("MM/dd/yyyy") ?? "");
                ht.Add("@requestor_name-varchar-99", e.NewValues["requestor_name"] ?? "");
                ht.Add("@requestor_address-varchar-300", e.NewValues["requestor_address"] ?? "");
                ht.Add("@NilaiSetuju-decimal-18", e.NewValues["NilaiSetuju"] ?? "");
                ht.Add("@Kegunaan-varchar-255", e.NewValues["Kegunaan"] ?? "");
                ht.Add("@JenisKredit-int", e.NewValues["creditkind_id"] ?? "");
                ht.Add("@modified_by-varchar-64", Session["user"] ?? "");
                ht.Add("@status-char-1", e.NewValues["status"] ?? "");
                ht.Add("@syaratAkad-varchar-512", e.NewValues["syaratAkad"] ?? "");
                ht.Add("@syaratPenarikan-varchar-512", e.NewValues["syaratPenarikan"] ?? "");

                //ht.Add("@Modified_by-varchar-64", Session["user"] ?? "");

                (new PersetujuanHibahBll()).InsertData(ht);
                log.Type = "S";
                log.Description = log.Action + " " + e.NewValues["proposal_number"].ToString() + " sukses oleh id " + userName;

                e.Cancel = true;
                gvPersetujuan.CancelEdit();
                GetData();
                gvPersetujuan.JSProperties["cpMessage"] = true;
                //}
            }
            catch (Exception ex)
            {
                gvPersetujuan.JSProperties["cpMessage"] = ex.Message;
                log.Type = "E";
                log.Description = "insert form kemitraan error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
        }


    }
}