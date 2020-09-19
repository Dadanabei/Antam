using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.BinaLingk;
using System.Drawing;
using Pertamina.PKBL.BLL;
using System.Net;
using DevExpress.Web.ASPxGridView;

namespace Pertamina.PKBL.WebApp
{
    public partial class MasterBL : System.Web.UI.Page
    {
        MasterBLBll bll = new MasterBLBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            GetData();
           

        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisBinaLing.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisBinaLing.Edit");
            bool delete = RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisBinaLing.Delete");

            ((GridViewCommandColumn)gvJenisBinaLingkungan.Columns["opr"]).ShowNewButtonInHeader = insert;
            ((GridViewCommandColumn)gvJenisBinaLingkungan.Columns["opr"]).ShowEditButton = edit;
            ((GridViewCommandColumn)gvJenisBinaLingkungan.Columns["opr"]).ShowDeleteButton = delete;

            if (!RoleCheck.CheckRoleView(userRoles, "ADM.PKBL.JenisBinaLing.View"))
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        private void GetData()
        {

            Hashtable ht = new Hashtable();
            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }
            gvJenisBinaLingkungan.DataSource = dv;
            gvJenisBinaLingkungan.DataBind();



        }

        protected void gvJenisBinaLingkungan_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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
                string delete_by = Session["user"].ToString();
                Hashtable ht = new Hashtable();
                ht.Add("@ID-int", id);
                ht.Add("@deleted_by-varchar-99", delete_by);
                bll.DeleteData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName;

                e.Cancel = true;
                gvJenisBinaLingkungan.CancelEdit();
                GetData();
            }
            catch(Exception ex) 
            {
                log.Type = "E";
                log.Description="Delete Error : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            

        }

        protected void gvJenisBinaLingkungan_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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

                var keterangan = e.NewValues["remarks"];
                if (keterangan == null)
                {
                    ht.Add("@Keterangan-varchar-100", "");
                }
                else
                {
                    ht.Add("@Keterangan-varchar-100", keterangan.ToString());
                }

                string admin = Session["user"].ToString();
                ht.Add("@Deskripsi-varchar-50", e.NewValues["bl_kind"].ToString());
                ht.Add("@Status-bit", e.NewValues["is_active"]);
                ht.Add("@CreateBy-varchar-50", admin.ToString());

                bll.InsertData(ht);

                log.Type = "S";
                log.Description =  log.Action+' '+' '+"sukses dengan id" + ' ' +userName;


                e.Cancel = true;
                gvJenisBinaLingkungan.CancelEdit();
               
                GetData();
            }
            catch (Exception ex)
            {

                log.Type = "E";
                log.Description = "Insert Error : "+ ex.Message;
               
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           

        }

        protected void gvJenisBinaLingkungan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
                string deskripsi = e.NewValues["bl_kind"].ToString();
                var keterangan = e.NewValues["remarks"];
                var status = e.NewValues["is_active"];
                string modified_by = Session["user"].ToString();

                Hashtable ht = new Hashtable();

                ht.Add("@ID-int", id);
                ht.Add("@Deskripsi-varchar-100", deskripsi);
                if (keterangan == null)
                {
                    ht.Add("@Keterangan-varchar-100", "");
                }
                else
                {
                    ht.Add("@Keterangan-varchar-100", keterangan.ToString());
                }
                ht.Add("@ModifyBy-varchar-50", modified_by);
                ht.Add("@Status-bit", status);

                bll.UpdateData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName;
                e.Cancel = true;
                gvJenisBinaLingkungan.CancelEdit();
                GetData();
            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description = "Update Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            

        }

        protected void gvJenisBinaLingkungan_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
        {

        }

        protected void gvJenisBinaLingkungan_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            //if (e.VisibleIndex + 1 > 0)
            //{
            //    if (e.VisibleIndex % 2 != 0)
            //    {
            //        e.Row.BackColor = ColorTranslator.FromHtml("#e5eecf");
            //    }

            //    e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString() + ".";
            //}
            //else if (e.VisibleIndex + 1 == 0)
            //{
            //    e.Row.Cells[0].Text = "";
            //}

        }
    }
}