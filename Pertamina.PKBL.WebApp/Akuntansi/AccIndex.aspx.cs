using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;
using Pertamina.PKBL.BLL;
using DevExpress.Web.ASPxGridView;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class AccIndex : System.Web.UI.Page
    {
        
        AccIndexBll bll = new AccIndexBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitCombo();
            }
            roleAuth();
            GetData();
            

        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.NoAkun.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.NoAkun.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.NoAkun.View");
            bool delete= RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.NoAkun.Delete");

            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }

            ((GridViewCommandColumn)gvNomorAkun.Columns["opr"]).ShowNewButtonInHeader = insert;
            ((GridViewCommandColumn)gvNomorAkun.Columns["opr"]).ShowEditButton = edit;          
            
            
        }

        private void GetData()
        {
            var data = bll.GetData(new Hashtable());
            DataView dv = data.DefaultView;

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }

            gvNomorAkun.DataSource = dv;
            gvNomorAkun.DataBind();
        }

        protected void InitCombo()
        {
            DdlBll ddlBll = new DdlBll();

            var debtCredComboData = ddlBll.GetComboItem("ddl_debt_cred");
            var programCombo = ddlBll.GetComboItem("ddl_program");
            var headerCombo = ddlBll.GetComboItem("ddl_headerinfo");
            var groupCombo = ddlBll.GetGroupAcc();
            var data = bll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["debt_cred"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["debt_cred"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["debt_cred"]).PropertiesComboBox.DataSource = debtCredComboData;


            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["program_id"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["program_id"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["program_id"]).PropertiesComboBox.DataSource = programCombo;

            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["header_info"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["header_info"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["header_info"]).PropertiesComboBox.DataSource = headerCombo;

            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["group_id"]).PropertiesComboBox.TextField = "group_nama";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["group_id"]).PropertiesComboBox.ValueField = "group_id";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["group_id"]).PropertiesComboBox.DataSource = groupCombo;

            foreach (DataRow item in data.Rows)
            {
                item["account_name"] = item["account_id"].ToString() +" - "+ item["account_name"].ToString();
            }

            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["parent_account_id"]).PropertiesComboBox.TextField = "account_name";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["parent_account_id"]).PropertiesComboBox.ValueField = "account_id";
            ((GridViewDataComboBoxColumn)gvNomorAkun.Columns["parent_account_id"]).PropertiesComboBox.DataSource = data;

        }

        protected void gvNomorAkun_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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

            try
            {
            string id = e.Keys["account_id"].ToString();

            Hashtable ht = new Hashtable();
                ht.Add("@No-varchar-50", id);
            ht.Add("@deleted_by-varchar-99", Page.User.Identity.Name);
            bll.DeleteData(ht);
                log.Type = "S";
                log.Description=log.Action+' '+id+' '+"sukses oleh id "+' '+log.UserName;
            e.Cancel = true;
            gvNomorAkun.CancelEdit();
            GetData();
            InitCombo();
        }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Delete Error : "+ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        protected void gvNomorAkun_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            //string no = e.Keys["No"].ToString();
            string noAkun = e.Keys["account_id"].ToString();
            string deskripsiAkun = e.NewValues["account_name"].ToString();
            string grupAkun = e.NewValues["group_id"].ToString();
            string keterangan = e.NewValues["debt_cred"].ToString();
            string program = e.NewValues["program_id"].ToString();
            string parent = e.NewValues["parent_account_id"].ToString();
            string modify = Page.User.Identity.Name.ToString();

            Hashtable ht = new Hashtable();
                ht.Add("@account_id-varchar-50", noAkun);
                ht.Add("@account_name-varchar-359", deskripsiAkun);
                ht.Add("@group_id-int", grupAkun);
                ht.Add("@header_info-char-1", e.NewValues["header_info"].ToString());
                ht.Add("@program_id-int", program);
                ht.Add("@debt_cred-char-2", keterangan);
                ht.Add("@parrent_account_id-varchar-50", parent);
                ht.Add("@modified_by-varchar-99", modify);

              
            bll.UpdateData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + noAkun + ' ' + "sukses oleh id" + ' ' + log.UserName; 
            e.Cancel = true;
            gvNomorAkun.CancelEdit();
            GetData();
            InitCombo();  
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

        protected void gvNomorAkun_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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

                ht.Add("@account_id-varchar-50", e.NewValues["account_id"].ToString());
            ht.Add("@account_name-varchar-359", e.NewValues["account_name"].ToString());
            ht.Add("@group_id-int", e.NewValues["group_id"].ToString());
                //ht.Add("@header_info-varchar-50", e.NewValues["Ket"].ToString());
                ht.Add("@header_info-char-1", e.NewValues["header_info"].ToString());
                ht.Add("@program_id-int", e.NewValues["program_id"].ToString());
                ht.Add("@debt_cred-char-5", e.NewValues["debt_cred"].ToString());
                ht.Add("@parrent_account_id-varchar-50", e.NewValues["parent_account_id"].ToString());
                ht.Add("@created_by-varchar-50", Page.User.Identity.Name.ToString());

            bll.InsertData(ht);
                log.Type = "S";
                log.Description = log.Action +' '+ "sukses oleh id" + ' ' + log.UserName; 
            e.Cancel = true;
            gvNomorAkun.CancelEdit();
            GetData();
            InitCombo();
        }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Insert Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
        }
    }
}