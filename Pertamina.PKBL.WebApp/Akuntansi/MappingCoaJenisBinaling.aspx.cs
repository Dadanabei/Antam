using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Akuntansi;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using System.Net;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class MappingCoaJenis : System.Web.UI.Page
    {
        MappingCoaJenisBinalingBll bll = new MappingCoaJenisBinalingBll();
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
            
            gvCoaJenisBinaling.DataSource = dv;
            gvCoaJenisBinaling.DataBind();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapBankCOAJBL.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapBankCOAJBL.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "ADM.AKUN.MapBankCOAJBL.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            ((GridViewCommandColumn)gvCoaJenisBinaling.Columns["Opr."]).ShowEditButton = edit;
            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }
            btnSubmit.Visible = insert;
            
        }

        private void InitCombo()
        {
            BLL.BinaLingk.MasterBLBll blBll = new BLL.BinaLingk.MasterBLBll();
            var comboBl = blBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvCoaJenisBinaling.Columns["bkind_id"]).PropertiesComboBox.TextField = "bl_kind";
            ((GridViewDataComboBoxColumn)gvCoaJenisBinaling.Columns["bkind_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvCoaJenisBinaling.Columns["bkind_id"]).PropertiesComboBox.DataSource = comboBl.DefaultView;

            BLL.Akuntansi.AccIndexBll accBll = new BLL.Akuntansi.AccIndexBll();

            var comboAcc = bll.GetAkun();//accBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvCoaJenisBinaling.Columns["coa"]).PropertiesComboBox.TextField = "account_name";
            ((GridViewDataComboBoxColumn)gvCoaJenisBinaling.Columns["coa"]).PropertiesComboBox.ValueField = "account_id";
            ((GridViewDataComboBoxColumn)gvCoaJenisBinaling.Columns["coa"]).PropertiesComboBox.DataSource = comboAcc.DefaultView;

            cbbBinaling.DataSource = comboBl;
            cbbBinaling.ValueField = "id";
            cbbBinaling.TextField = "bl_kind";
            cbbBinaling.DataBind();

            cbbKodeAkun.DataSource = comboAcc;
            cbbKodeAkun.ValueField = "account_id";
            cbbKodeAkun.TextField = "account_name";
            cbbKodeAkun.DataBind();
  
        }

        protected void gvCoaJenisBinaling_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Update Mapping Coa Jenis Binaling";
            log.UserName = userName;
            try
            {
                string account_name = gvCoaJenisBinaling.GetRowValues(gvCoaJenisBinaling.EditingRowVisibleIndex, "coa").ToString();
                string bkind = e.NewValues["bkind_id"].ToString();
                string id = e.Keys["id"].ToString();

                Hashtable ht = new Hashtable();
                ht.Add("@coa-varchar-50", account_name);
                ht.Add("@bkind-varchar-5", bkind);
                ht.Add("@id-int", id);

                bll.UpdateData(ht);
                log.Type = "S";
                log.Description=log.Action+' '+id+' '+"sukses oleh id"+' '+userName;
                e.Cancel = true;
                gvCoaJenisBinaling.CancelEdit();
                GetData();

            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description="Update Error"+' '+ex.Message;

            }
            finally
            {
                logBll.InsertActivity(log);
            }
            //string account_name = e.NewValues["coa"].ToString();
            
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
            log.Action = "Insert Mapping Coa Jenis Binaling";
            log.UserName = userName;
            try
            {
                Hashtable ht = new Hashtable();
                ht.Add("@coa-varchar-50", cbbKodeAkun.Value.ToString());
                ht.Add("@bkind-varchar-5", cbbBinaling.Value.ToString());

                bll.InsertData(ht);
                log.Type = "S";
                log.Description=log.Action+' '+"sukses oleh id"+' '+userName;
                cbbBinaling.Value = string.Empty;
                cbbKodeAkun.Value = string.Empty;

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

        protected void gvCoaJenisBinaling_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text=(e.VisibleIndex+1).ToString();
            }
        }
    }
}