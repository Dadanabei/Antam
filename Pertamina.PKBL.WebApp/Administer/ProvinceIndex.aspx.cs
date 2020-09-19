using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Administer;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class ProvinceIndex : System.Web.UI.Page
    {
        ProvinceIndexBll bll = new ProvinceIndexBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
            RoleAuth();
        }

        private void RoleAuth()
        {
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;

            bool insert = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.Provinsi.Add")) != null) ? true : false;
            bool edit = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.Provinsi.Edit")) != null) ? true : false;
            bool delete = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.Provinsi.Delete")) != null) ? true : false;
            bool view = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.Provinsi.View")) != null) ? true : false; 

            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }

            ((GridViewCommandColumn)gvPropinsi.Columns["opr"]).ShowNewButtonInHeader = insert;
            ((GridViewCommandColumn)gvPropinsi.Columns["opr"]).ShowEditButton = edit;
            ((GridViewCommandColumn)gvPropinsi.Columns["opr"]).ShowDeleteButton = delete;

        }

        private void GetData()
        {
            //Hashtable ht = new Hashtable();
            //ht.Add("@Nama-NVarChar-50", "");

            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;

            InitCombo();

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }
            gvPropinsi.DataSource = dv;
            gvPropinsi.DataBind();
        }

        private void InitCombo()
        {

            MasterKantorCabangBll kacabBll = new MasterKantorCabangBll();

            var comboData = kacabBll.GetData(new Hashtable());

            //((GridViewDataComboBoxColumn)gvPropinsi.Columns["branch_code"]).PropertiesComboBox.TextField = "branch_name";
            //((GridViewDataComboBoxColumn)gvPropinsi.Columns["branch_code"]).PropertiesComboBox.ValueField = "branch_code";
            //((GridViewDataComboBoxColumn)gvPropinsi.Columns["branch_code"]).PropertiesComboBox.DataSource = comboData.DefaultView;


        }

        protected void gvPropinsi_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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
            log.Action = "Delete";
            log.UserName = userName;
            string id = e.Keys["province_code"].ToString();
            string deleted_by = Session["user"].ToString();

            try
            {
            Hashtable ht = new Hashtable();
            ht.Add("@deleted_by-varchar-50", deleted_by);
            ht.Add("@ID-Int", id);
            bll.DeleteData(ht);
                log.Type = "S";
                log.Description = "Delete" + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName; 
            e.Cancel = true;
            gvPropinsi.CancelEdit();
            GetData();
        }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Delete Error : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

           
        }

        protected void gvPropinsi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Update";
            log.UserName = userName;

            try
            {
                string deleted_by = Session["user"].ToString();
            string id = e.Keys["province_code"].ToString();
            string provinsi = e.NewValues["province_name"].ToString();
            string ibukota = e.NewValues["capital_name"].ToString();
            string modified_by = Session["user"].ToString();

            Hashtable ht = new Hashtable();
            ht.Add("@id-Int", id);
            ht.Add("@provinsi-VarChar-50", provinsi);
            ht.Add("@ibukota-VarChar-50", ibukota);
            ht.Add("@modifyby-VarChar-50", modified_by);

            bll.UpdateData(ht);
                log.Type = "S";
                log.Description=log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName;
            e.Cancel = true;
            gvPropinsi.CancelEdit();
            GetData();
        }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Update Error : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

            
        }

        protected void gvPropinsi_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
            ht.Add("@provinsi-varchar-50", e.NewValues["province_name"].ToString());
            ht.Add("@ibukota-varchar-50", e.NewValues["capital_name"].ToString());
            ht.Add("@createby-varchar-50", Session["user"].ToString());
            ht.Add("@Provinsi_code-int", e.NewValues["province_code"].ToString());



            bll.InsertData(ht);
                log.Type="S";
                log.Description = log.Action+ "Sukses oleh id" + ' ' + userName;
            e.Cancel = true;
            gvPropinsi.CancelEdit();
            GetData();
        }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Insert Error "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

            
        }
    }
}