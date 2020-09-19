using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();

            if (Session["Koreksi"] != null)
            {
                if (Session["Koreksi"].ToString() == "S")
                {
                    ClientScript.RegisterStartupScript(GetType(), "koreksi", "alert('Koreksi Sukses');", true);
                    Session["Koreksi"] = null;
                }
            }
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.JURNAL.Adjusment.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            //((GridViewCommandColumn)gvBankCOA.Columns["Opr."]).ShowEditButton = edit;
            // ((GridViewDataColumn)gvPenyaluran.Columns["Opr."]).ShowEditButton = edit;



            //btnSubmit.Visible = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            //btnSubmit.Visible = insert;

        }

    }
}