using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Pertamina.PKBL.BLL.Akuntansi;

namespace Pertamina.PKBL.WebApp
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();
                //Response.Redirect(@"Account\Login.aspx");
            }
            else if (Session["user"] == null || Session["userprofile"] == null)
            {
                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {

                var roles = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mRoleList;
                MenuControl.ValidateRole(roles);
            }

            

        }

        protected void lnk_Logout_ServerClick(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Account/Login.aspx");
        }



    }
}