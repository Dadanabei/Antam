using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL;
namespace Pertamina.PKBL.WebApp
{
    public partial class ErrorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Application_Error();

        }

        protected void Application_Error()
        {
            Exception theException = null;
            theException = Server.GetLastError().GetBaseException();
            string error = theException.Message;

            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;

            string userName = "N/A";

            try
            {
                userName = Session["user"].ToString();
            }
            catch(Exception e)
            {

            }

            try
            {
                ipaddress = Request.UserHostAddress;
            }
            catch (Exception e)
            {

            }

            try
            {
                host =  Dns.GetHostEntry(HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]).HostName;
                
                
            }
            catch (Exception ex)
            {

            }

            if (ipaddress == null)
            {
                ipaddress = "N/A";
            }


            var page = "";

            try
            {
                page = System.IO.Path.GetFileName(HttpContext.Current.Request.Url.AbsolutePath);
            }
            catch
            {

            }

            

            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "";
            log.UserName = userName;

            log.Type = "E";
            log.Description = "Page :"+page+" ; Error : " + error ;

            ActivityLogBll bll = new ActivityLogBll();
            bll.InsertActivity(log);
            errorlabel.Text = error;
        } 
    }
}