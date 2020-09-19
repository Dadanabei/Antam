using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Net;
using DevExpress.Web;
using System.Data;
using System.Collections;
using DevExpress.Web.ASPxEditors;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Account
{
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Login1_Authenticate(object sender, System.Web.UI.WebControls.AuthenticateEventArgs e)
        {
            bool isBypass = false;
            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Login";
            try
            {
                wcf_auth.AuthenticateUserClient myClient = new wcf_auth.AuthenticateUserClient();
                wcf_auth.ResponseUsersData myResponse = new wcf_auth.ResponseUsersData();


                var form = (System.Web.UI.WebControls.Login)sender;
                var x = Page;
                string userName = ((DevExpress.Web.ASPxEditors.ASPxTextBox)form.FindControl("UserName")).Text.Trim();
                string password = ((DevExpress.Web.ASPxEditors.ASPxTextBox)form.FindControl("Password")).Text.Trim();

                var selected = ((DevExpress.Web.ASPxEditors.ASPxComboBox)form.FindControl("cbbDomain")).SelectedItem.Value.ToString().Split(';');

                myResponse = myClient.AuthenticateUserAD(selected[0], selected[1], "pkbl", userName, password);

                if (myResponse.ResponseMessage.Type == "S" || isBypass)
                {
                    string Uname;
                    
                    if (!isBypass)
                    {
                        log.UserName = userName;
                        log.Type = "S";
                        log.Description = "Login Sukses dengan id" + ' ' + userName;

                        Uname = myResponse.UserPropertiesList.mUserName;

                        //log.HostName=;
                    }
                    else
                    {
                        Uname = "bypass";
                        log.UserName = Uname;
                        log.Type = "S";
                        log.Description = "Login bypass dengan id" + ' ' + Uname;
                        
                    }
                    Session["user"] = Uname;
                    Session["userprofile"] = myResponse.UserPropertiesList;

                    FormsAuthentication.RedirectFromLoginPage(Uname, false);

                    DataTable dt = new DataTable();
                    dt.Columns.Add("job");
                    myResponse.UserPropertiesList.mAuthObjectValueList.Where(t => t.mAuthObjectName == "JOBPOSITION").ToList().ForEach(t => dt.Rows.Add(new object[]{t.Value1}));
                    //set cbb datasource
                    
                }
                else 
                {
                    log.UserName = userName;
                    log.Type = "F";
                    log.Description = "Login Gagal dengan id "+' '+ userName;
                    
                    //logBll.InsertActivity(log);
                }

            }
            catch (Exception ex)
            {
               
                log.Type = "E";
                log.Description = "error : " + ex.Message;
                
            }
            finally
            {
                logBll.InsertActivity(log);
            }
            
            
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginform_LoggedIn(object sender, System.EventArgs e)
        {
        }

        protected void Loginform_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                var form = (System.Web.UI.WebControls.Login)sender;

                wcf_domain_list.GetAllDomainClient myDomain = new wcf_domain_list.GetAllDomainClient();
                wcf_domain_list.DomainList[] myDomainList;// = new wcf_domain_list.DomainList();

                myDomainList = myDomain.GetAllDomainName();

                var source = new DataTable();

                source.Columns.Add("Value");
                source.Columns.Add("Text");
                foreach (wcf_domain_list.DomainList item in myDomainList)
                {
                    var row = source.NewRow();
                    row["Value"] = item.CompanyCode + ";" + item.DomainName;
                    row["Text"] = item.CompanyName;

                    source.Rows.Add(row);
                }
                var cbDomain = ((DevExpress.Web.ASPxEditors.ASPxComboBox)form.FindControl("cbbDomain"));
                cbDomain.DataSource = source;
                cbDomain.TextField = "Text";
                cbDomain.ValueField = "Value";
                cbDomain.DataBind();
                cbDomain.SelectedItem = cbDomain.Items.FindByText("PT Pertamina (Persero)");
            }
        }

        //private bool CheckRole(string _UserName)
        //{
        //    bool RoleExist = false;
        //    string[] mRoleList = Roles.GetRolesForUser(_UserName);
        //    Session["Roles"] = mRoleList;
        //    //if (!Roles.IsUserInRole(UserName, "User"))
        //    if (mRoleList.Length > 0)
        //    {
        //        RoleExist = true;
        //    }
        //    else
        //    {
        //        RoleExist = false;
        //    }
        //    return RoleExist;
        //}

        //private void CallInsertLogActivity(string Description)
        //{
        //    bool HostNameFound = false;
        //    string HostName = string.Empty;
        //    try
        //    {
        //        HostName = Dns.GetHostByAddress(Request.UserHostAddress).HostName;
        //        HostNameFound = true;
        //    }
        //    catch
        //    {
        //        HostNameFound = false;
        //    }

        //    if (HostNameFound)
        //    {
        //        HostName = Dns.GetHostByAddress(Request.UserHostAddress).HostName;
        //    }
        //    else
        //    {
        //        HostName = Request.UserHostAddress;
        //    }
        //    // commons.InsertLogActivity("1", "0", "1", Description, DateTime.Now, Request.Browser.Browser + " - " + Request.Browser.Version, HostName + ", " + Request.UserHostAddress, UserName);
        //}
    }
}