using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pertamina.PKBL.BLL.Administer;
using System.Collections;

namespace Pertamina.PKBL.WebApp.Administer
{
    public partial class UploadTemplate : System.Web.UI.Page
    {
        TemplateBll bll = new TemplateBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (!IsPostBack)
            {
                InitCombo();
            }
        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "User.Admin");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        private void InitCombo()
        {
            cbbTemplateName.TextField = "templateDetail";
            cbbTemplateName.ValueField = "templateName";
            cbbTemplateName.DataSource = bll.GetTemplateList();
            cbbTemplateName.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@templateName-varchar-256", cbbTemplateName.SelectedItem.Value);
            parameters.Add("@templateDetail-varchar-256", cbbTemplateName.SelectedItem.Text);
            parameters.Add("@fileName-varchar-256", fuTemplate.PostedFile.FileName);
            parameters.Add("@fileData-varbinary", fuTemplate.FileBytes);
            parameters.Add("@user-varchar-256", Session["user"].ToString());


            bll.InsertTemplate(parameters);


            ViewState["msg"] = "<script>alert('Upload Template Berhasil');</script>";
        }
    }
}