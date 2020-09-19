using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Kemitraan;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using System.Net;
namespace Pertamina.PKBL.WebApp
{
    public partial class MasterKreditKemitraan : System.Web.UI.Page
    {
        MasterKreditKemitraanBll bll = new MasterKreditKemitraanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            GetData();
           
        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisKreditMitra.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisKreditMitra.Edit");           
            bool delete = RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisKreditMitra.Delete");

            ((GridViewCommandColumn)gvJenisKreditKemitraan.Columns["opr"]).ShowNewButtonInHeader = insert;
            ((GridViewCommandColumn)gvJenisKreditKemitraan.Columns["opr"]).ShowEditButton = edit;
            ((GridViewCommandColumn)gvJenisKreditKemitraan.Columns["opr"]).ShowDeleteButton = delete;
            if (!RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisKreditMitra.View"))
            {
                Response.Redirect("~/Default.aspx");
            }
           
        }

        private void GetData()
        {
            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }
            gvJenisKreditKemitraan.DataSource = dv;
            gvJenisKreditKemitraan.DataBind();
        }

        protected void gvJenisKreditKemitraan_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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
                string deletedby = Page.User.Identity.Name.ToString();

                Hashtable ht = new Hashtable();
                ht.Add("@deleted_by-varchar-50", deletedby);
                ht.Add("@ID-Int", id);

                bll.DeleteData(ht);
                log.Type="S";
                log.Description=log.Action+' '+"sukses oleh id"+' '+userName;
                e.Cancel = true;
                gvJenisKreditKemitraan.CancelEdit();
                GetData();
            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description = "Delete Error : "+ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           
        }

        protected void gvJenisKreditKemitraan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
                string deskripsi = e.NewValues["descr"].ToString();
                var status = e.NewValues["is_active"];
                string modify = Page.User.Identity.Name.ToString();

                Hashtable ht = new Hashtable();
                ht.Add("@ID-Int", id);
                ht.Add("@Deskripsi-VarChar-50", deskripsi);
                ht.Add("@Status-bit", status);
                ht.Add("@ModifyBy-VarChar-50", modify);

                bll.UpdateData(ht);
                log.Type = "S";
                log.Description = log.Action+' '+"sukses oleh id" + ' ' + userName;

                e.Cancel = true;
                gvJenisKreditKemitraan.CancelEdit();
                GetData();
            }
            catch(Exception ex)
            {
                log.Type="E";
                log.Description = "Update error : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
        }

        protected void gvJenisKreditKemitraan_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
                ht.Add("@CreateBy-varchar-50", Page.User.Identity.Name.ToString());
                ht.Add("@Deskripsi-varchar-20", e.NewValues["descr"].ToString());
                ht.Add("@Status-bit", e.NewValues["is_active"]);

                bll.InsertData(ht);
                log.Type = "S";
                log.Description = log.Action+' '+"sukses oleh id" + ' ' + userName;
                e.Cancel = true;
                gvJenisKreditKemitraan.CancelEdit();
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