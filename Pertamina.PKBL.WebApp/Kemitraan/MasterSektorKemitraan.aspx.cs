using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using System.Net;
using DevExpress.Web.ASPxGridView;


namespace Pertamina.PKBL.WebApp
{
    public partial class MasterSektorKemitraan : System.Web.UI.Page
    {
       
        MasterSektorKemitraanBll bll = new MasterSektorKemitraanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
            RoleAuth();
        }

        private void RoleAuth()
        {
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;

            bool insert = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.SektorMitra.Add")) != null) ? true : false;
            bool edit = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.SektorMitra.Edit")) != null) ? true : false;
            bool delete = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.SektorMitra.Delete")) != null) ? true : false;
            bool view = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.SektorMitra.View")) != null) ? true : false;

            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }

            ((GridViewCommandColumn)gvSektorkemitraan.Columns["opr"]).ShowNewButtonInHeader = insert;
            ((GridViewCommandColumn)gvSektorkemitraan.Columns["opr"]).ShowEditButton = edit;
            ((GridViewCommandColumn)gvSektorkemitraan.Columns["opr"]).ShowDeleteButton = delete;
        }

        private void GetData()
        {
            
            Hashtable ht = new Hashtable();
            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;
            
            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }
            gvSektorkemitraan.DataSource = dv;
            gvSektorkemitraan.DataBind();


        }

        protected void gvSektorkemitraan_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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
                string id = e.Keys["id"].ToString();
            string delete_by = Page.User.Identity.Name.ToString();
            Hashtable ht = new Hashtable();
                ht.Add("@ID-int", id);
                ht.Add("@deleted_by-varchar-99", delete_by);
            bll.DeleteData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName;                
                e.Cancel = true;
            gvSektorkemitraan.CancelEdit();
            GetData();
            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description="Delete Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);

            }
        

        
        }

        protected void gvSektorkemitraan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            string id = e.Keys["id"].ToString();
            string deskripsi=e.NewValues["sector_name"].ToString();
            var keterangan = e.NewValues["remarks"];
            string modified_by = Page.User.Identity.Name.ToString();
            var is_active = e.NewValues["is_active"];

            Hashtable ht = new Hashtable();

            ht.Add("id-int",id);
            ht.Add("@sector_name-varchar-50",deskripsi);
            if (keterangan == null)
            {
                ht.Add("@remarks-varchar-1024", "");
            }
            else
            {
                ht.Add("@remarks-varchar-1024", keterangan.ToString());
            }
            ht.Add("@modified_by-varchar-99",modified_by);
            ht.Add("@status-bit",is_active);
          
            bll.UpdateData(ht);
                log.Type = "S";
                log.Description = "Update" + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName;
            e.Cancel = true;
            gvSektorkemitraan.CancelEdit();
            GetData();

            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description="Update Error  : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            



        }

        protected void gvSektorkemitraan_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
            var status = e.NewValues["is_active"];
            var keterangan = e.NewValues["remarks"];
            if (keterangan == null)
            {
                ht.Add("@remarks-varchar-1024","");
            }
            else
            {
                ht.Add("@remarks-varchar-1024", keterangan.ToString());
            }
            string createdBy = Page.User.Identity.Name.ToString();
            ht.Add("@sector_name-varchar-200",e.NewValues["sector_name"].ToString());
            ht.Add("@created_by-varchar-99",createdBy);
            ht.Add("@status-bit",status);
            bll.InsertData(ht);
                log.Type = "S";
                log.Description = "Insert Sukses oleh id" + ' ' + userName; ;
            e.Cancel = true;
            gvSektorkemitraan.CancelEdit();
            GetData();
            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description = "Insert Error : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

            

            

        }

       
        
      

    }
}