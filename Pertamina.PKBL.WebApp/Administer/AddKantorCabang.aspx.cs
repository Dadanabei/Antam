using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pertamina.PKBL.WebApp
{
    public partial class AddKantorCabang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidateRole();

        }
        public void ValidateRole()
        {
            var roles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            var role = "ADM.PKBL.KotaKab.View";
            if (!RoleCheck.CheckRoleView(roles, role))
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}