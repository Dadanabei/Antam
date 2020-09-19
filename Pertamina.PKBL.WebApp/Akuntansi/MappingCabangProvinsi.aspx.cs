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
using System.Net;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class MappingCabangProvinsi : System.Web.UI.Page
    {
        MappingCabangProvinsiBll bll = new MappingCabangProvinsiBll();
        ActivityLog log = new ActivityLog();
        ActivityLogBll logBll = new ActivityLogBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            GetData();

        }
        private void GetData() 
        {
            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;

            InitCombo();

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }
            gvMapCabangProvinsi.DataSource = dv;
            gvMapCabangProvinsi.DataBind();

        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapCabProv.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapCabProv.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapCabProv.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            btnSubmit.Visible = insert;
            ((GridViewCommandColumn)gvMapCabangProvinsi.Columns["Opr."]).ShowEditButton = edit;  

        }

        private void InitCombo()
        {
            BLL.Administer.ProvinceIndexBll provBll = new BLL.Administer.ProvinceIndexBll();

            var comboProvince = provBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvMapCabangProvinsi.Columns["propinsi"]).PropertiesComboBox.TextField = "province_name";
            ((GridViewDataComboBoxColumn)gvMapCabangProvinsi.Columns["propinsi"]).PropertiesComboBox.ValueField = "province_code";
            ((GridViewDataComboBoxColumn)gvMapCabangProvinsi.Columns["propinsi"]).PropertiesComboBox.DataSource = comboProvince;

            BLL.Administer.MasterKantorCabangBll kancabBll = new BLL.Administer.MasterKantorCabangBll();

            var comboKacab = kancabBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvMapCabangProvinsi.Columns["cabang"]).PropertiesComboBox.TextField = "branch_name";
            ((GridViewDataComboBoxColumn)gvMapCabangProvinsi.Columns["cabang"]).PropertiesComboBox.ValueField = "branch_code";
            ((GridViewDataComboBoxColumn)gvMapCabangProvinsi.Columns["cabang"]).PropertiesComboBox.DataSource = comboKacab.DefaultView;

            var comboProvinceMap = bll.SelectProvince(new Hashtable());

            cbbCabang.DataSource = comboKacab;
            cbbCabang.ValueField = "branch_code";
            cbbCabang.TextField = "branch_name";
            cbbCabang.DataBind();

            cbbProvinsi.DataSource = comboProvinceMap;
            cbbProvinsi.ValueField = "province_code";
            cbbProvinsi.TextField = "province_name";
            cbbProvinsi.DataBind();


        }

        protected void gvMapCabangProvinsi_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
           
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Update Mapping Cabang Provinsi";
            log.UserName = userName;
            try
            {
                string id = e.Keys["id"].ToString();
                string branch_code = e.NewValues["cabang"].ToString();
                string province_code = gvMapCabangProvinsi.GetRowValues(gvMapCabangProvinsi.EditingRowVisibleIndex, "propinsi").ToString();


                Hashtable ht = new Hashtable();
                ht.Add("id-int", id);
                ht.Add("branch_code-varchar-30", branch_code);
                ht.Add("province_code-varchar-50", province_code);
                bll.UpdateData(ht);
                log.Type = "S";
                log.Description=log.Action+' '+ id+' '+"sukses oleh id"+' '+userName ;
                e.Cancel = true;
                gvMapCabangProvinsi.CancelEdit();
                GetData();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Update Error : " + ex.Message; 
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Insert Mapping Cabang Provinsi";
            log.UserName = userName;
            try
            {
                Hashtable ht = new Hashtable();

                ht.Add("@branch_code-varchar-30", cbbCabang.Value.ToString());
                ht.Add("@province_code-varchar-50", cbbProvinsi.Value.ToString());

                bll.InsertData(ht);
                log.Type = "S";
                log.Description=log.Action+' '+"sukses oleh id"+' '+userName;
                cbbProvinsi.Value = string.Empty;
                cbbCabang.Value = string.Empty;
                GetData();
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Insert Error"+' '+ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           


        }

        protected void gvMapCabangProvinsi_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text=(e.VisibleIndex+1).ToString();
            }
        }
    }
}