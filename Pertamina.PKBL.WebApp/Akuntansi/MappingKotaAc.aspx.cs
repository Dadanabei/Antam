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
    public partial class MappingKotaAc : System.Web.UI.Page
    {

        MappingKotaAcBll bll = new MappingKotaAcBll();
        ActivityLog log = new ActivityLog();
        ActivityLogBll logBll = new ActivityLogBll();
        protected void Page_Load(object sender, EventArgs e)
        {
           
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



            gvMappingKotaAC.DataSource = dv;       
            gvMappingKotaAC.DataBind();
            
        }
        

        private void InitCombo()
        {
            BLL.Administer.ProvinceIndexBll provBll = new BLL.Administer.ProvinceIndexBll();
            var comboProvince = provBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["province_code"]).PropertiesComboBox.TextField = "province_name";
            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["province_code"]).PropertiesComboBox.ValueField = "province_code";
            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["province_code"]).PropertiesComboBox.DataSource = comboProvince.DefaultView;

            BLL.Administer.CityIndexBll kotaBll = new BLL.Administer.CityIndexBll();

            var comboKota = kotaBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["city_id"]).PropertiesComboBox.TextField = "city_name";
            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["city_id"]).PropertiesComboBox.ValueField = "city_appcode";
            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["city_id"]).PropertiesComboBox.DataSource = comboKota.DefaultView;

            BLL.Administer.MasterKantorCabangBll cabangBll = new BLL.Administer.MasterKantorCabangBll();

            var comboCabang = cabangBll.GetData(new Hashtable());

            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["branch_code"]).PropertiesComboBox.TextField = "branch_name";
            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["branch_code"]).PropertiesComboBox.ValueField = "branch_code";
            ((GridViewDataComboBoxColumn)gvMappingKotaAC.Columns["branch_code"]).PropertiesComboBox.DataSource = comboCabang.DefaultView;

            cbbKota.DataSource = comboKota;
            cbbKota.ValueField = "city_appcode";
            cbbKota.TextField = "city_name";
            cbbKota.DataBind();

            cbbProvinsi.DataSource = comboProvince;
            cbbProvinsi.ValueField = "province_code";
            cbbProvinsi.TextField = "province_name";
            cbbProvinsi.DataBind();

            cbbWilayah.DataSource = comboCabang;
            cbbWilayah.ValueField = "branch_code";
            cbbWilayah.TextField = "branch_name";
            cbbWilayah.DataBind();
            
        }

        protected void gvMappingKotaAC_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Update Mapping Kota AC";
            log.UserName = userName;

            try 
            {
                //string id = e.Keys["No"].ToString();
                // string wilayah = e.NewValues["wilayah"].ToString();
                //string provinsi_old = gvMappingKotaAC.GetRowValues(gvMappingKotaAC.EditingRowVisibleIndex, "Provinsi_old").ToString(); 
                //string kota_old = gvMappingKotaAC.GetRowValues(gvMappingKotaAC.EditingRowVisibleIndex, "Kota_old").ToString();
                string provinsi_old = e.OldValues["province_code"].ToString();
                string kota_old = e.OldValues["city_id"].ToString();
                string kota_new = e.NewValues["city_id"].ToString();
                string provinsi_new = e.NewValues["province_code"].ToString();



                Hashtable ht = new Hashtable();
                //ht.Add("@No-int", id);
                // ht.Add("@Wilayah-varchar-50", wilayah);
                ht.Add("@city_appcode_new-varchar-5", kota_new);
                ht.Add("@province_code_new-int", provinsi_new);
                ht.Add("@province_code_old-int", provinsi_old);
                ht.Add("@city_appcode_old-varchar-5", kota_old);

                bll.UpdateData(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + provinsi_old+","+kota_old + ' ' + "sukses oleh id" + ' ' + userName;
                e.Cancel = true;
                gvMappingKotaAC.CancelEdit();
                GetData();

            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description="Update error"+' '+ex.Message;
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
            log.Action = "Insert Mapping Kota AC";
            log.UserName = userName;

            try 
            {
                Hashtable ht = new Hashtable();
                // ht.Add("@Wilayah-nvarchar-50", cbbWilayah.Value.ToString());
                ht.Add("@city_appcode-varchar-5", cbbKota.Value.ToString());
                ht.Add("@province_code-int", cbbProvinsi.Value.ToString());
                ht.Add("@branch_code-int", cbbWilayah.Value.ToString());

                bll.InsertData(ht);
                log.Type = "S";
                log.Description=log.Action+' '+"sukses oleh id"+' '+userName;


                // cbbWilayah.Value = string.Empty;
                cbbKota.Value = string.Empty;
                cbbProvinsi.Value = string.Empty;
                GetData();
            }
            catch(Exception ex)
            {
                log.Type = "E";
                log.Description="Insert Error"+' '+ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
           
        }

        protected void gvMappingKotaAC_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text=(e.VisibleIndex+1).ToString();
            }
        }

        
    }
}