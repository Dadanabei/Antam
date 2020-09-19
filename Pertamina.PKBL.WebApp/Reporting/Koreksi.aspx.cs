using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Collections;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Reporting
{
    public partial class Koreksi : System.Web.UI.Page
    {
        JurnalBll bll = new JurnalBll();
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {

                Session["Url"] = Request.UrlReferrer;
            }
            var data = bll.GetJurnalByNoRef(Session["noBukti"].ToString());
            var detail = data["detail"];

            gvJurnal.DataSource = detail;
            gvJurnal.DataBind();

            gvPopup.DataSource = detail;
            gvPopup.DataBind();


        }

        protected void btnKoreksi_Click(object sender, EventArgs e)
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
            log.Action = "Koreksi Jurnal";
            log.UserName = userName;

            try
            {

            var data = bll.GetJurnalByNoRef(Session["noBukti"].ToString());
            var detail = data["detail"];

            Hashtable ht = new Hashtable();
            var noBukti = Session["noBukti"].ToString();
            ht.Add("@noBukti-varchar-99", noBukti);
            ht.Add("@user-varchar-99", userName);
            ht.Add("@tglKoreksi-varchar-15",DateTime.Parse(deTanggal.Text).ToString("dd/MM/yyyy"));

            bll.InsertKoreksi(ht);

            log.Type = "S";
            log.Description = log.Action + ' ' + noBukti + ' ' + "Sukses oleh id" + ' ' + userName;


            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Koreksi Jurnal Gagal : " + ex.Message;

            }
            finally
            {
                logBll.InsertActivity(log);
                if(log.Type=="S")
                {
                    ClientScript.RegisterStartupScript(GetType(), "koreksi", "alert('Koreksi Sukses');", true);

                    string Koreksi = "S";
                    Session["Koreksi"] = Koreksi;
                    Response.Redirect(Session["Url"].ToString());
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "koreksi", "alert('Koreksi Gagal');", true);
                }
            }
        }

        protected void gvJurnal_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Session["Url"].ToString());
        }
    }
}