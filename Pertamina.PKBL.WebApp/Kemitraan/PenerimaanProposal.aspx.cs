using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL.Administer;
using Pertamina.PKBL.BLL;
using DevExpress.Web.ASPxGridView;
using System.Net;
using System.Web.Security;
using System.Data.SqlClient;


namespace Pertamina.PKBL.WebApp
{
    public partial class PenerimaanProposal : System.Web.UI.Page
    {
        PenerimaanProposalBll bll = new PenerimaanProposalBll();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (Session["userprofile"] != null)
            {
                if (!IsPostBack)
                {
                    initCombo();
                }
                GetData();
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();

            }
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPenerimaanProposal.DataSource = ((new PenerimaanProposalBll()).GetData(branchCode)).DefaultView;
            gvPenerimaanProposal.DataBind();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            bool delete = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Delete");
            bool view = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.View"); 

            if(view==false)
            {
                Response.Redirect("~/Default.aspx");
            }

            ((GridViewCommandColumn)gvPenerimaanProposal.Columns["opr"]).ShowEditButton = edit;

          
        }
        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            MasterSektorKemitraanBll mitraBll = new MasterSektorKemitraanBll();
            DdlBll ddlBll = new DdlBll();
            MasterKantorCabangBll cabangBll = new MasterKantorCabangBll();
            CityIndexBll cityBll = new CityIndexBll();

            var identitasComboData = ddlBll.GetComboItem("ddl_identity_type");
            var sektorKemitraanComboData = mitraBll.GetData(new Hashtable());
            var companyKindComboData = ddlBll.getComboCompanyKind(new Hashtable());
            var supplierComboData = ddlBll.getComboSupplier(branchCode.ToString());
            var cityComboData = cityBll.GetDataByBranch(branchCode);            
            var jenisKredit = ddlBll.getJenisKredit();                

            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["identification_type"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["identification_type"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["identification_type"]).PropertiesComboBox.DataSource = identitasComboData;            
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["requestor_city_id"]).PropertiesComboBox.TextField = "city_name";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["requestor_city_id"]).PropertiesComboBox.ValueField = "city_appcode";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["requestor_city_id"]).PropertiesComboBox.DataSource = cityComboData;

            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["sector_id"]).PropertiesComboBox.TextField = "sector_name";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["sector_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["sector_id"]).PropertiesComboBox.DataSource = sektorKemitraanComboData;

            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["company_kind_id"]).PropertiesComboBox.TextField = "description";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["company_kind_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["company_kind_id"]).PropertiesComboBox.DataSource = companyKindComboData;

            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["supplier_id"]).PropertiesComboBox.TextField = "supplier_name";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["supplier_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPenerimaanProposal.Columns["supplier_id"]).PropertiesComboBox.DataSource = supplierComboData;

        }

        protected void gvPenerimaanProposal_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
            log.Action = "Insert Permohonan";
            log.UserName = userName;

            

            try
            {
                Hashtable ht = new Hashtable();
                var regDate = DateTime.Parse(e.NewValues["registration_date"].ToString());
                var bDate = DateTime.Parse(e.NewValues["birthdate"].ToString());
                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                var span = DateTime.Today.Subtract(bDate);
                var umur = span.TotalDays / 365;
                if (umur < 17)
                {
                    e.Cancel = false;
                    throw new Exception("Umur minimal harus 17 tahun");
                }
                else
                {


                    ht.Add("@proposal_number-varchar-99", e.NewValues["proposal_number"] ?? "");
                    ht.Add("@proposal_title-varchar-200", e.NewValues["proposal_title"] ?? "");
                    ht.Add("@registration_date-varchar-10", regDate.ToString("dd/MM/yyyy") ?? "");
                    ht.Add("@requestor_name-varchar-99", e.NewValues["requestor_name"] ?? "");
                    ht.Add("@identification_type-varchar-15", e.NewValues["identification_type"] ?? "");
                    ht.Add("@identification_number-varchar-99", e.NewValues["identification_number"] ?? "");
                    ht.Add("@birthplace-varchar-99", e.NewValues["birthplace"] ?? "");
                    ht.Add("@birthdate-varchar-10", bDate.ToString("dd/MM/yyyy") ?? "");
                    ht.Add("@requestor_parent_name-varchar-99", e.NewValues["requestor_parent_name"] ?? "");
                    ht.Add("@supplier_id-int", e.NewValues["supplier_id"] ?? "");
                    ht.Add("@sector_id-int", e.NewValues["sector_id"] ?? "");
                    ht.Add("@company_kind_id-int", e.NewValues["company_kind_id"] ?? "");
                    ht.Add("@requestor_city_id-varchar-5", e.NewValues["requestor_city_id"] ?? "");
                    ht.Add("@requested_amount-decimal-18", e.NewValues["requested_amount"] ?? "");
                    ht.Add("@Created_by-varchar-64", Session["user"] ?? "");
                    ht.Add("@Modified_by-varchar-64", Session["user"] ?? "");
                    ht.Add("@branch_code-int", branchCode);

                    bll.InsertData(ht);
                    log.Type = "S";
                    log.Description = log.Action + " " + e.NewValues["proposal_number"].ToString() + " sukses oleh id " + userName;

                    e.Cancel = true;
                    gvPenerimaanProposal.CancelEdit();
                    GetData();
                    gvPenerimaanProposal.JSProperties["cpMessage"] = true;
                }
            }catch(Exception ex){
                gvPenerimaanProposal.JSProperties["cpMessage"] = ex.Message;
                log.Type = "E";
                log.Description = "insert form kemitraan error : " + ex.Message;               
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected void gvPenerimaanProposal_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            
            if (e.ButtonID == "Detail")
            {                
                btnDetailAction(e.VisibleIndex);
            }
        }



        private void btnDetailAction(int visibleIndex)
        {
            var id = gvPenerimaanProposal.GetRowValues(visibleIndex, gvPenerimaanProposal.KeyFieldName);
            var mitraId = gvPenerimaanProposal.GetRowValues(visibleIndex, "mitra_id");
            Session["idProposal"] = id;
            Session["proposal_number"] = gvPenerimaanProposal.GetRowValues(visibleIndex, "proposal_number"); ;
            Session["mitraid"] = mitraId;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailPenerimaanProposal.aspx");
            //("CheckList.aspx");
        }

        protected void gvPenerimaanProposal_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Update Penerimaan";
            log.UserName = userName;

            try
            {
                Hashtable ht = new Hashtable();
                var regDate = DateTime.Parse(e.NewValues["registration_date"].ToString());
                var bDate = DateTime.Parse(e.NewValues["birthdate"].ToString());
                string modified_by = Session["user"].ToString();


                //add parameter
                ht.Add("@id-int", e.Keys["id"].ToString());

                ht.Add("@proposal_number-varchar-99", e.NewValues["proposal_number"] ?? "");
                ht.Add("@proposal_title-varchar-200", e.NewValues["proposal_title"] ?? "");
                ht.Add("@registration_date-varchar-10", regDate.ToString("dd/MM/yyyy") ?? "");
                ht.Add("@requestor_name-varchar-99", e.NewValues["requestor_name"] ?? "");
                ht.Add("@identification_type-varchar-15", e.NewValues["identification_type"] ?? "");
                ht.Add("@identification_number-varchar-99", e.NewValues["identification_number"] ?? "");
                ht.Add("@birthplace-varchar-99", e.NewValues["birthplace"] ?? "");
                ht.Add("@birthdate-varchar-10", bDate.ToString("dd/MM/yyyy") ?? "");
                ht.Add("@requestor_parent_name-varchar-99", e.NewValues["requestor_parent_name"] ?? "");
                ht.Add("@supplier_id-int", e.NewValues["supplier_id"] ?? "");
                ht.Add("@sector_id-int", e.NewValues["sector_id"] ?? "");
                ht.Add("@company_kind_id-int", e.NewValues["company_kind_id"] ?? "");
                ht.Add("@requestor_city_id-varchar-5", e.NewValues["requestor_city_id"] ?? "");
                ht.Add("@requested_amount-decimal-18", e.NewValues["requested_amount"] ?? "");
                ht.Add("@Modified_by-varchar-64", Session["user"].ToString());


                //execute
               bll.UpdateData(ht);
                e.Cancel = true;                
                gvPenerimaanProposal.CancelEdit();

                //log
                log.Type = "S";
                log.Description = log.Action + " " + e.NewValues["proposal_number"].ToString() + " Sukses oleh id " + userName;

                //refresh data
                GetData();                
                gvPenerimaanProposal.JSProperties["cpMessage"] = true;
            }
            catch (Exception ex)
            {
                gvPenerimaanProposal.JSProperties["cpMessage"] = ex.Message;
                log.Type = "E";
                log.Description = "Update error : " + ex.Message;                
            }
            finally {
                logBll.InsertActivity(log);
            }


        }

        protected void gvPenerimaanProposal_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["registration_date"] = new DateTime(Convert.ToInt32(DateTime.Now.Year), Convert.ToInt32(DateTime.Now.Month), Convert.ToInt32(DateTime.Now.Day));
            e.NewValues["identification_type"] = "1";
            e.NewValues["supplier_id"] = 0;
            e.NewValues["proposal_number"] = "--Generate by System--";
        }

        protected void gvPenerimaanProposal_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            //if (e.ButtonID == "Detail")
            //{
            //    string status = gvPenerimaanProposal.GetRowValues(e.VisibleIndex, "status").ToString();
            //    if (status != "DALAM PROSES")
            //    {
            //        e.Visible=DevExpress.Utils.DefaultBoolean.False;
            //    }            
            //}
        }

        protected void gvPenerimaanProposal_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.Edit)
            {
                string status = gvPenerimaanProposal.GetRowValues(e.VisibleIndex, "status").ToString();
                if (status != "DALAM PROSES" && status != "DITERIMA")
                {
                    e.Visible = false;
                }
            }
        }

        protected void gvPenerimaanProposal_CustomErrorText(object sender, ASPxGridViewCustomErrorTextEventArgs e)
        {
            String error = gvPenerimaanProposal.JSProperties["cpMessage"].ToString();
            e.ErrorText = error;
        }


    }
}