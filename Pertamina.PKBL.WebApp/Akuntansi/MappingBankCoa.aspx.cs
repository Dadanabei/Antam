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
    public partial class MappingBankCoa : System.Web.UI.Page
    {

        MappingBankCoaBll bll = new MappingBankCoaBll();
       
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            GetData();


        }


        private void GetData()
        {
           //DataTable dv=bll.GetData(new Hashtable());
            DataView dv = ((DataTable)bll.GetData(new Hashtable())).DefaultView;

            initCombo();

            if (ViewState["sort"] != null)
            {
                dv.Sort = ViewState["sort"].ToString();
            }

            int rowcount = dv.Count;
            //int i;
        
       

            gvBankCOA.DataSource = dv;

            gvBankCOA.DataBind();
        
        
        }
       


        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapBankCOA.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapBankCOA.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapBankCOA.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            ((GridViewCommandColumn)gvBankCOA.Columns["Opr."]).ShowEditButton = edit;
            

            btnSubmit.Visible = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
             btnSubmit.Visible = insert;
           
        }
        

        private void initCombo()
        {

            var comboNoAkun = bll.SelectAccount(new Hashtable());

            ((GridViewDataComboBoxColumn)gvBankCOA.Columns["coa"]).PropertiesComboBox.TextField = "keterangan";
            ((GridViewDataComboBoxColumn)gvBankCOA.Columns["coa"]).PropertiesComboBox.ValueField = "account_id";
            ((GridViewDataComboBoxColumn)gvBankCOA.Columns["coa"]).PropertiesComboBox.DataSource = comboNoAkun.DefaultView;

            BLL.Administer.MasterKantorCabangBll kancabBll = new BLL.Administer.MasterKantorCabangBll();

            var comboKacab = kancabBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvBankCOA.Columns["cabang"]).PropertiesComboBox.TextField = "branch_name";
            ((GridViewDataComboBoxColumn)gvBankCOA.Columns["cabang"]).PropertiesComboBox.ValueField = "branch_code";
            ((GridViewDataComboBoxColumn)gvBankCOA.Columns["cabang"]).PropertiesComboBox.DataSource = comboKacab.DefaultView;

            cbbCabang.DataSource = comboKacab;
            cbbCabang.ValueField = "branch_code";
            cbbCabang.TextField = "branch_name";
            cbbCabang.DataBind();

            cbbKodeAkun.DataSource = comboNoAkun;
            cbbKodeAkun.ValueField = "account_id";
            cbbKodeAkun.TextField = "keterangan";
            cbbKodeAkun.DataBind();
        }
        
        protected void gvBankCOA_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Update Mapping Bank Coa";
            log.UserName = userName;
            try
            {
                string id = e.Keys["id"].ToString();
                string account_id = gvBankCOA.GetRowValues(gvBankCOA.EditingRowVisibleIndex, "coa").ToString();
                string branch_code = e.NewValues["cabang"].ToString();




                Hashtable ht = new Hashtable();

                ht.Add("branch_code-varchar-10", branch_code);
                ht.Add("account_id-varchar-20", account_id);
                ht.Add("id-int", id);
                bll.UpdateData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + id + ' ' + "Sukses oleh id" + ' ' + userName; 
                e.Cancel = true;
                gvBankCOA.CancelEdit();
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

        protected void btnSubmit_Click(object sender, EventArgs e)
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
            log.Action = "Insert Mapping Bank Coa";
            log.UserName = userName;
            try 
            {
                Hashtable ht = new Hashtable();
                ht.Add("@account_id-varchar-20", cbbKodeAkun.Value.ToString());
                ht.Add("@branch_code-varchar-10", cbbCabang.Value.ToString());


                bll.InsertData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + "Sukses oleh id" + ' ' + userName; 

                cbbKodeAkun.Value = string.Empty;
                cbbCabang.Value = string.Empty;
                GetData();
            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description = "Insert Error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           

                




        }

        protected void gvBankCOA_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

       
    }
}