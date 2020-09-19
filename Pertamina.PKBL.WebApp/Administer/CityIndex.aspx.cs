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
    public partial class CityIndex : System.Web.UI.Page
    {
        CityIndexBll bll = new CityIndexBll();
        ProvinceIndexBll provBll = new ProvinceIndexBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            GetData();
            RoleAuth();
        }


        //public void ValidateRole()
        //{
        //    var roles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
        //    var role = "ADM.PKBL.KotaKab.View";
        //    if (!RoleCheck.CheckRoleView(roles, role))
        //    {
        //        Response.Redirect("~/Default.aspx");
        //    }
        //}

        protected void RoleAuth()
        {
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KotaKab.Add")) != null) ? true : false;
            bool edit = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KotaKab.Edit")) != null) ? true : false;
            bool delete = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KotaKab.Delete")) != null) ? true : false;
            bool view = (userRoles.FirstOrDefault(t => t.Contains("ADM.PKBL.KotaKab.View")) != null) ? true : false; ;

            ((GridViewCommandColumn)gvKota.Columns["opr"]).ShowNewButtonInHeader = insert;
            ((GridViewCommandColumn)gvKota.Columns["opr"]).ShowEditButton = edit;
            ((GridViewCommandColumn)gvKota.Columns["opr"]).ShowDeleteButton = delete;
            if(view==false){
                Response.Redirect("~/Default.aspx");
            }
        }

        private void GetData()
        {

            //Hashtable ht = new Hashtable();
            //ht.Add("@Nama-NVarChar-50", "");
            var provinceData = provBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvKota.Columns["province_code"]).PropertiesComboBox.TextField = "province_name";
            ((GridViewDataComboBoxColumn)gvKota.Columns["province_code"]).PropertiesComboBox.ValueField = "province_code";
            ((GridViewDataComboBoxColumn)gvKota.Columns["province_code"]).PropertiesComboBox.DataSource = provinceData;


            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }

            gvKota.DataSource = dv;
            gvKota.DataBind();
        }


        protected void gvKota_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
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
                string appcode = e.Keys["city_appcode"].ToString();
                string deletedby = Session["user"].ToString();

                Hashtable ht = new Hashtable();
                ht.Add("@deleted_by-varchar-50", deletedby);
                ht.Add("@city_appcode-varchar-9", appcode);

                bll.DeleteData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + appcode + ' ' + "Sukses oleh id" + ' ' + userName; 
                e.Cancel = true;
                gvKota.CancelEdit();
                GetData();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Delete Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           
        }

        protected void gvKota_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            //ht.Add("@City_id-varchar-5", city_id);
                string city_appcode = e.NewValues["city_appcode"].ToString();
                string kota = e.NewValues["city_name"].ToString();
                string province_code = e.NewValues["province_code"].ToString();
                string modify = Session["user"].ToString();

                ht.Add("@city_appcode-varchar-9", city_appcode);
                ht.Add("@city_name-VarChar-200", kota);
                ht.Add("@province_code-int", province_code);
                ht.Add("@modified_by-VarChar-99", modify);

                bll.UpdateData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + city_appcode + ' ' + "Sukses oleh id" + ' ' + userName;
                e.Cancel = true;
                gvKota.CancelEdit();
                GetData();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Update Error : "+ ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            //string city_id = e.Keys["city_id"].ToString();
          
            
        }

        protected void gvKota_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
                //ht.Add("@City_id-varchar-5",e.NewValues["city_id"]);
                //ht.Add("@city_appcode-varchar-9", e.NewValues["city_appcode"]);
                ht.Add("@city_name-varchar-200", e.NewValues["city_name"].ToString());
                ht.Add("@province_code-int", e.NewValues["province_code"]);
                ht.Add("@created_by-varchar-50", Session["user"].ToString());

                bll.InsertData(ht);
                log.Type = "S";
                log.Description = log.Action +' '+ "Sukses oleh id" + ' ' + userName; ;
                e.Cancel = true;
                gvKota.CancelEdit();
                GetData();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Insert Error : "+ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           
        }
    }
}