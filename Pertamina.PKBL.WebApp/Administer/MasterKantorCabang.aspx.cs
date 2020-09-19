using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Administer;
using System.Collections;
using System.Data;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class MasterKantorCabang : System.Web.UI.Page
    {
        MasterKantorCabangBll bll = new MasterKantorCabangBll();
        ProvinceIndexBll provBll = new ProvinceIndexBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
            RoleAuth();
        }

        protected void RoleAuth()
        {
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KtrCabang.Add")) != null) ? true : false;
            bool edit = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KtrCabang.Edit")) != null) ? true : false;
            bool delete = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KtrCabang.Delete")) != null) ? true : false;
            bool view = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KtrCabang.View")) != null) ? true : false;

            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }

            ((GridViewCommandColumn)gvKantorCabang.Columns["opr"]).ShowNewButtonInHeader = insert;
            ((GridViewCommandColumn)gvKantorCabang.Columns["opr"]).ShowEditButton = edit;
            ((GridViewCommandColumn)gvKantorCabang.Columns["opr"]).ShowDeleteButton = delete;
        }
        private void GetData()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@Nama-NVarChar-50", "");

            DataTable provinceData = provBll.GetData(new Hashtable());

            //((GridViewDataComboBoxColumn)gvKantorCabang.Columns["province_code"]).PropertiesComboBox.TextField = "province_name";
            //((GridViewDataComboBoxColumn)gvKantorCabang.Columns["province_code"]).PropertiesComboBox.ValueField = "province_code";
            //((GridViewDataComboBoxColumn)gvKantorCabang.Columns["province_code"]).PropertiesComboBox.DataSource = provinceData;

            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }
            gvKantorCabang.DataSource = dv;
            gvKantorCabang.DataBind();


        }

        protected void gvKantorCabang_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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
            string id = e.Keys["branch_code"].ToString();

            Hashtable ht = new Hashtable();
            ht.Add("@ID-Int", id);
            ht.Add("@deleted_by-varchar-99", Session["user"]);
            bll.DeleteData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName; 
            e.Cancel = true;
            gvKantorCabang.CancelEdit();
            GetData();
            
        }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description="Delete Error : "+ex.Message;

            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
        }

        protected void gvKantorCabang_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-varchar-10", e.Keys["branch_code"].ToString());
            ht.Add("@branch_name-varchar-200", e.NewValues["branch_name"].ToString());
            ht.Add("@branch_details-varchar-560", e.NewValues["branch_details"].ToString());
            ht.Add("@head_of_branch-varchar-200", e.NewValues["head_of_branch"].ToString());
            ht.Add("@head_title-varchar-200", e.NewValues["head_title"].ToString());
            ht.Add("@branch_addr-varchar-560", e.NewValues["branch_addr"].ToString());
            //ht.Add("@province_code-int", e.NewValues["province_code"].ToString());
            ht.Add("@modifyBy-varchar-99", Session["user"]);

            bll.UpdateData(ht);
                string id= e.Keys["branch_code"].ToString();
                log.Type = "S";
                log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName;
            e.Cancel = true;
            gvKantorCabang.CancelEdit();
            GetData();
        }
            catch(Exception ex)
            {
                log.Type="E";
                log.Description="Update Error "+ ex.Message;

            }
            finally
            {
                logBll.InsertActivity(log);
            }


           
        }

        protected void gvKantorCabang_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
            ht.Add("@branch_name-varchar-200", e.NewValues["branch_name"].ToString());
            ht.Add("@branch_details-varchar-560", e.NewValues["branch_details"].ToString());
            ht.Add("@head_of_branch-varchar-200", e.NewValues["head_of_branch"].ToString());
            ht.Add("@head_title-varchar-200", e.NewValues["head_title"].ToString());
            ht.Add("@branch_addr-varchar-560", e.NewValues["branch_addr"].ToString());
            //ht.Add("@province_code-int", e.NewValues["province_code"].ToString());
            ht.Add("@branch_code-varchar-10", e.NewValues["branch_code"].ToString());
            ht.Add("@created_by-varchar-99", Session["user"]);


            bll.InsertData(ht);
                log.Type="S";
                log.Description = log.Action+' '+"Sukses oleh id" + ' ' + userName; 
            e.Cancel = true;
            gvKantorCabang.CancelEdit();
            GetData();
        }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description="Insert Error : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
        }

        protected void gvKantorCabang_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {

        }

    }
}