using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using System.Data;
using System.Collections;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class SinergiBUMN : System.Web.UI.Page
    {
        DdlBll ddl = new DdlBll();
        SinergiBUMNBll bll = new SinergiBUMNBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack){
                tglDaftar.Date = DateTime.Today;
                getData();
                initCombo();                
            }
        }
        private void getData() {
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
            log.Action = "get data supplier";
            log.UserName = userName;

            try
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                gvPenyalur.DataSource = bll.getData(branchCode.ToString());
                gvPenyalur.DataBind();
                log.Type = "S";
                log.Description = "get data supplier cabang "+branchCode.ToString()+" sukses";                
            }
            catch (Exception Ex)
            {

                log.Type = "E";
                log.Description = " get data supplier error :" + Ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally {
                logBll.InsertActivity(log);
            
            }
        }
        private void initCombo(){
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            DataTable dt = ddl.getRegionName(branchCode.ToString());
            ddlRegion.DataSource = dt;
            ddlRegion.DataValueField = "branch_code";
            ddlRegion.DataTextField = "branch_name";
            ddlRegion.DataBind();
        }

        protected void save_Click(object sender, EventArgs e)
        {
            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Dns.GetHostEntry(HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]).HostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "update data supplier";
            log.UserName = userName;


            try
            {
                Hashtable ht = new Hashtable();

                ht.Add("@id-int", idText.Text == "" ? "0" : idText.Text);
                ht.Add("@supplier_name-varchar-99", nama.Text);
                ht.Add("@alamat-varchar-255", alamat.Text);
                ht.Add("@telepon-varchar-50", telepon.Text);
                ht.Add("@fax-varchar-50", fax.Text);
                ht.Add("@keterangan-varchar-255", keterangan.Text);
                ht.Add("@PIC-varchar-255", pic.Text);
                ht.Add("@jabatan-varchar-255", jabatan.Text);
                ht.Add("@branchCode-varchar-4", ddlRegion.SelectedValue.ToString());
                ht.Add("@supplier_code-varchar-50", kode.Text);
                ht.Add("@tglDaftar-varchar-12", tglDaftar.Date.ToShortDateString());

                bll.insertSupplier(ht);
                log.Type = "S";
                log.Description = log.Action + ' ' + nama.Text + " sukses oleh " + Session["user"];
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
                getData();
            }
            catch (Exception Ex)
            {

                log.Type = "E";
                log.Description = " update data supplier error : " + Ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally {
                logBll.InsertActivity(log);
            }
        }

        protected void gvPenyalur_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            //nama.Text = e.ButtonID.ToString();
        }

        protected void gvPenyalur_DataBinding(object sender, EventArgs e)
        {

        }



        //protected void gvPenyalur_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        //{
        //    nama.Text = e.ButtonID.ToString();
        //    //if(e.ButtonID=="detail"){
        //    //    int id = int.Parse(gvPenyalur.GetRowValues(e.VisibleIndex, "id").ToString());
        //    //    DataTable dt = bll.getDataSupplier(id);
        //    //    idText.Text = dt.Rows[0]["id"].ToString();
        //    //    nama.Text = "eeeee";//dt.Rows[0]["nama"].ToString();
        //    //    alamat.Text = dt.Rows[0]["alamat"].ToString();
        //    //    telepon.Text = dt.Rows[0]["telepon"].ToString();
        //    //    fax.Text = dt.Rows[0]["fax"].ToString();
        //    //    keterangan.Text = dt.Rows[0]["keterangan"].ToString();
        //    //    kode.Text = dt.Rows[0]["kode"].ToString();
        //    //    tglDaftar.Date = DateTime.Parse(dt.Rows[0]["tglDaftar"].ToString());
        //    //    ddlRegion.SelectedValue = dt.Rows[0]["branchCode"].ToString();
        //    //}
        //}
    }
}