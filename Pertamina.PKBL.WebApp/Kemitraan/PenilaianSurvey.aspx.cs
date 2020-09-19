using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using DevExpress.Web.ASPxGridView;

namespace Pertamina.PKBL.WebApp
{
    public partial class PenilaianSurvey : System.Web.UI.Page
    {
        PenilaianProposalBll bll = new PenilaianProposalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                roleAuth();
                
            }
            GetData();
                
            
        }

        

        public void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

            gvPenilaianSurvey.DataSource = bll.getData(branchCode);
            gvPenilaianSurvey.DataBind();
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "PK.Penilaian.Add");
           

            ((GridViewCommandColumn)gvPenilaianSurvey.Columns["opr"]).ShowNewButton = insert;


            if (!RoleCheck.CheckRoleView(userRoles, "PK.Penilaian.View"))
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void gvPenilaianSurvey_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Response.Redirect("#");
        }

        protected void gvPenilaianSurvey_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "Tambah")
            {
                
                tambahButtonAction(e.VisibleIndex);
            }
            else
            {
                //
            }
        }

        public void tambahButtonAction(int visible)
        {
            var id = gvPenilaianSurvey.GetRowValues(visible, "proposal_number");
            Session["proposal_number"] = id;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailPenilaianSurvey.aspx");
        }

        protected void gvPenilaianSurvey_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.ButtonID == "Tambah")
            {
                try
                {


                    string a = gvPenilaianSurvey.GetRowValues(e.VisibleIndex, "Keputusan").ToString();
                    var data = gvPenilaianSurvey.GetRowValues(e.VisibleIndex, "Keputusan").ToString();
                    if (data.Equals("DITERIMA") || data.Equals("DISETUJUI"))
                    {
                        //e.Visible = DevExpress.Utils.DefaultBoolean.False;
                        e.Image.Url = "../content/images/checklist.png";
                    }
                }
                catch
                {

                }

            }
        }

        protected void gvPenilaianSurvey_PageIndexChanged(object sender, EventArgs e)
        {
            GetData();
        }
    }
}