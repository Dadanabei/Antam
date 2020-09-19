using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;
using System.Collections;
using Pertamina.PKBL.BLL;
using System.Net;
namespace Pertamina.PKBL.WebApp
{
    public partial class JadwalPembayaran : System.Web.UI.Page
    {
        JadwalPembayaranBll bll = new JadwalPembayaranBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                panel.Visible = false;
                label.Visible = false;
            }

            getData();
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
            log.Action = "get data jadwal supplier";
            log.UserName = userName;



            try
            {
                var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
                DataTable dt = bll.getData(branchCode.ToString());
                gvJadwalPembayaran.DataSource = dt;
                gvJadwalPembayaran.DataBind();

                log.Type = "S";
                log.Description = "get data jadwal pembayaran sukses";
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "get data jadwal pembayaran error :" + ex.Message;
            }
            finally {
                logBll.InsertActivity(log);
            
            }

        }

        protected void btnCari_Click(object sender, EventArgs e)
        {

        }

        protected void btnKosong_Click(object sender, EventArgs e)
        {

        }
        private void btnDetailAction(int visibleIndex)
        {

                var id = gvJadwalPembayaran.GetRowValues(visibleIndex, gvJadwalPembayaran.KeyFieldName);
                Session["proposal_number"] = id;
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailJadwalPembayaran.aspx");
    
        }


        protected void gvJadwalPembayaran_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "Detail")
            {
                if (gvJadwalPembayaran.GetRowValues(e.VisibleIndex, "existPiutang").ToString() == "1")
                {
                    //e.Image.Url = "../content/images/checklist.png";
                    //var id = gvJadwalPembayaran.GetRowValues(e.VisibleIndex, gvJadwalPembayaran.KeyFieldName);
                    //Session["proposal_number"] = id;
                    //DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("../Akuntansi/Detail_Kartu_Piutang.aspx");

                    btnDetailAction(e.VisibleIndex);
                }
                else { 
                    btnDetailAction(e.VisibleIndex);
                }
            }


        }

        protected void gvJadwalPembayaran_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            try
            {


                if (e.ButtonID == "Detail")
                {
                    if (gvJadwalPembayaran.GetRowValues(e.VisibleIndex, "existPiutang").ToString() == "1")
                    {
                        e.Image.Url = "../content/images/checklist.png";
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void gvJadwalPembayaran_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex>=0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }
    }
}