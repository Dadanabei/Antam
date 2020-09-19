using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using Pertamina.PKBL.BLL.Administer;
using Pertamina.PKBL.BLL.Hibah;
using DevExpress.Web.ASPxGridView;
using System.Net;
using System.Web.Security;
using System.Data.SqlClient;

namespace Pertamina.PKBL.WebApp.Hibah
{
    public partial class PengajuanHibah : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                initCombo();
            }
            GetData();
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            gvPermohonan.DataSource = ((new PengajuanHibahBll()).GetData(branchCode)).DefaultView;
            gvPermohonan.DataBind();
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            DdlBll ddlBll = new DdlBll();
            MasterSektorKemitraanBll mitraBll = new MasterSektorKemitraanBll();
            MasterKantorCabangBll cabangBll = new MasterKantorCabangBll();
            CityIndexBll cityBll = new CityIndexBll();
            Hashtable param = new Hashtable();

            var identitasComboData = ddlBll.GetComboItem("ddl_identity_type");
            var sektorKemitraanComboData = mitraBll.GetData(new Hashtable());
            var cityComboData = cityBll.GetDataByBranch(branchCode);
            var jenisKredit = ddlBll.getJenisKreditHibah();
            var companyKind = ddlBll.getComboCompanyKind(param);
            var homeOwnership = ddlBll.getComboHomeOwner(param);
            var education = ddlBll.getComboEducation(param);
            var maritalStatus = ddlBll.getComboMarital(param);

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["identification_type"]).PropertiesComboBox.TextField = "ddl_item";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["identification_type"]).PropertiesComboBox.ValueField = "ddl_value";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["identification_type"]).PropertiesComboBox.DataSource = identitasComboData;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["requestor_city_id"]).PropertiesComboBox.TextField = "city_name";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["requestor_city_id"]).PropertiesComboBox.ValueField = "city_appcode";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["requestor_city_id"]).PropertiesComboBox.DataSource = cityComboData;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["sector_id"]).PropertiesComboBox.TextField = "sector_name";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["sector_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["sector_id"]).PropertiesComboBox.DataSource = sektorKemitraanComboData;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["company_kind_id"]).PropertiesComboBox.TextField = "description";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["company_kind_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["company_kind_id"]).PropertiesComboBox.DataSource = companyKind;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["credit_kind_id"]).PropertiesComboBox.TextField = "descr";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["credit_kind_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["credit_kind_id"]).PropertiesComboBox.DataSource = jenisKredit;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["education_lv_id"]).PropertiesComboBox.TextField = "description";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["education_lv_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["education_lv_id"]).PropertiesComboBox.DataSource = education;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["marital_status_id"]).PropertiesComboBox.TextField = "description";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["marital_status_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["marital_status_id"]).PropertiesComboBox.DataSource = maritalStatus;

            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["home_ownership_id"]).PropertiesComboBox.TextField = "description";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["home_ownership_id"]).PropertiesComboBox.ValueField = "id";
            ((GridViewDataComboBoxColumn)gvPermohonan.Columns["home_ownership_id"]).PropertiesComboBox.DataSource = homeOwnership;
        }

        protected void gvPermohonan_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["proposal_number"] = "--Generate by System--";
        }

        protected void gvPermohonan_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
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
            log.Action = "Insert Pengajuan Hibah";
            log.UserName = userName;

            try
            {
                Hashtable ht = new Hashtable();
                var regDate = DateTime.Parse(e.NewValues["registration_date"].ToString());
                var bDate = DateTime.Parse(e.NewValues["birthdate"].ToString());
                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

                var span = DateTime.Today.Subtract(bDate);
                var umur = span.TotalDays / 365;
                //if (umur < 17)
                //{
                //    e.Cancel = false;
                //    throw new Exception("Umur minimal harus 17 tahun");
                //}
                //else
                //{

                    ht.Add("@proposal_number-varchar-99", e.NewValues["proposal_number"] ?? "");
                    ht.Add("@registration_date-varchar-10", regDate.ToString("dd/MM/yyyy") ?? "");
                    ht.Add("@requestor_name-varchar-99", e.NewValues["requestor_name"] ?? "");
                    ht.Add("@jenis_kelamin-varchar-1", e.NewValues["jenis_kelamin"] ?? "");
                    ht.Add("@identification_type-varchar-15", e.NewValues["identification_type"] ?? "");
                    ht.Add("@identification_number-varchar-99", e.NewValues["identification_number"] ?? "");
                    ht.Add("@birth_place-varchar-99", e.NewValues["birthplace"] ?? "");
                    ht.Add("@birth_date-varchar-10", bDate.ToString("dd/MM/yyyy") ?? "");
                    ht.Add("@requestor_address-varchar-300", e.NewValues["requestor_address"] ?? "");
                    ht.Add("@address_district-varchar-99", e.NewValues["address_district"] ?? "");
                    ht.Add("@requestor_city_id-int", e.NewValues["requestor_city_id"] ?? "");
                    ht.Add("@postal_code-varchar-10", e.NewValues["postal_code"] ?? "");
                    ht.Add("@home_ownership_id-int", e.NewValues["home_ownership_id"] ?? "");
                    ht.Add("@requestor_phone1-varchar-64", e.NewValues["requestor_phone1"] ?? "");
                    ht.Add("@requestor_phone2-varchar-64", e.NewValues["requestor_phone2"] ?? "");
                    ht.Add("@requestor_email-varchar-64", e.NewValues["requestor_email"] ?? "");
                    ht.Add("@marital_status_id-int", e.NewValues["marital_status_id"] ?? "");
                    ht.Add("@education_lv_id-int", e.NewValues["education_lv_id"] ?? "");
                    ht.Add("@requestor_parent_name-varchar-99", e.NewValues["requestor_parent_name"] ?? "");
                    ht.Add("@requested_amount-decimal-18", e.NewValues["requested_amount"] ?? "");
                    ht.Add("@credit_kind_id-int", e.NewValues["creditkind_id"] ?? "");
                    ht.Add("@company_kind_id-int", e.NewValues["company_kind_id"] ?? "");
                    ht.Add("@sector_id-int", e.NewValues["sector_id"] ?? "");
                    ht.Add("@company_sector_detail-varchar-200", e.NewValues["company_sector_detail"] ?? "");
                    ht.Add("@branch_code-int", branchCode);
                    ht.Add("@Created_by-varchar-64", Session["user"] ?? "");
                    //ht.Add("@Modified_by-varchar-64", Session["user"] ?? "");
                
                    (new PengajuanHibahBll()).InsertData(ht);
                    log.Type = "S";
                    log.Description = log.Action + " " + e.NewValues["proposal_number"].ToString() + " sukses oleh id " + userName;

                    e.Cancel = true;
                    gvPermohonan.CancelEdit();
                    GetData();
                    gvPermohonan.JSProperties["cpMessage"] = true;
                //}
            }
            catch (Exception ex)
            {
                gvPermohonan.JSProperties["cpMessage"] = ex.Message;
                log.Type = "E";
                log.Description = "insert form kemitraan error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected void gvPermohonan_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Update Pengajuan Hibah";
            log.UserName = userName;

            try
            {
                Hashtable ht = new Hashtable();
                var regDate = DateTime.Parse(e.NewValues["registration_date"].ToString());
                var bDate = DateTime.Parse(e.NewValues["birthdate"].ToString());
                var branchCode = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                string modified_by = Session["user"].ToString();

                //add parameter

                ht.Add("@proposal_number-varchar-99", e.NewValues["proposal_number"] ?? "");
                ht.Add("@registration_date-varchar-10", regDate.ToString("MM/dd/yyyy") ?? "");
                ht.Add("@requestor_name-varchar-99", e.NewValues["requestor_name"] ?? "");
                ht.Add("@jenis_kelamin-varchar-1", e.NewValues["jenis_kelamin"] ?? "");
                ht.Add("@identification_type-varchar-15", e.NewValues["identification_type"] ?? "");
                ht.Add("@identification_number-varchar-99", e.NewValues["identification_number"] ?? "");
                ht.Add("@birth_place-varchar-99", e.NewValues["birthplace"] ?? "");
                ht.Add("@birth_date-varchar-10", bDate.ToString("MM/dd/yyyy") ?? "");
                ht.Add("@requestor_address-varchar-300", e.NewValues["requestor_address"] ?? "");
                ht.Add("@address_district-varchar-99", e.NewValues["address_district"] ?? "");
                ht.Add("@requestor_city_id-int", e.NewValues["requestor_city_id"] ?? "");
                ht.Add("@postal_code-varchar-10", e.NewValues["postal_code"] ?? "");
                ht.Add("@home_ownership_id-int", e.NewValues["home_ownership_id"] ?? "");
                ht.Add("@requestor_phone1-varchar-64", e.NewValues["requestor_phone1"] ?? "");
                ht.Add("@requestor_phone2-varchar-64", e.NewValues["requestor_phone2"] ?? "");
                ht.Add("@requestor_email-varchar-64", e.NewValues["requestor_email"] ?? "");
                ht.Add("@marital_status_id-int", e.NewValues["marital_status_id"] ?? "");
                ht.Add("@education_lv_id-int", e.NewValues["education_lv_id"] ?? "");
                ht.Add("@requestor_parent_name-varchar-99", e.NewValues["requestor_parent_name"] ?? "");
                ht.Add("@requested_amount-decimal-18", e.NewValues["requested_amount"] ?? "");
                ht.Add("@credit_kind_id-int", e.NewValues["creditkind_id"] ?? "");
                ht.Add("@company_kind_id-int", e.NewValues["company_kind_id"] ?? "");
                ht.Add("@sector_id-int", e.NewValues["sector_id"] ?? "");
                ht.Add("@company_sector_detail-varchar-200", e.NewValues["company_sector_detail"] ?? "");
                ht.Add("@branch_code-int", branchCode);
                ht.Add("@Modified_by-varchar-64", Session["user"].ToString());


                //execute
                (new PengajuanHibahBll()).UpdateData(ht);
                e.Cancel = true;
                gvPermohonan.CancelEdit();

                //log
                log.Type = "S";
                log.Description = log.Action + " " + e.NewValues["proposal_number"].ToString() + " Sukses oleh id " + userName;

                //refresh data
                GetData();
                gvPermohonan.JSProperties["cpMessage"] = true;
            }
            catch (Exception ex)
            {
                gvPermohonan.JSProperties["cpMessage"] = ex.Message;
                log.Type = "E";
                log.Description = "Update error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        private void btnCheckListAction(int visibleIndex)
        {
            var id = gvPermohonan.GetRowValues(visibleIndex, gvPermohonan.KeyFieldName);
            var mitraId = gvPermohonan.GetRowValues(visibleIndex, "mitra_id");
            Session["idProposal"] = id;
            Session["proposal_number"] = gvPermohonan.GetRowValues(visibleIndex, "proposal_number"); ;
            Session["mitraid"] = mitraId;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("HibahCheckList.aspx");
            //("CheckList.aspx");
        }

        protected void gvPermohonan_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "Checklist")
            {
                btnCheckListAction(e.VisibleIndex);
            }
        }

        protected void gvPermohonan_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {

        }


    }
}