using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Collections;
using System.Data;
using System.Globalization;
using DevExpress.Web.ASPxGridView;
using Pertamina.PKBL.BLL;
using DevExpress.Web.ASPxEditors;
using System.IO;
using System.Net;

namespace Pertamina.PKBL.WebApp
{
    public partial class PenyaluranBL : System.Web.UI.Page
    {
        PenyaluranBll bll = new PenyaluranBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if(!IsPostBack)
            {
                GetData();
            }
            else
            {
                gvPenyaluran.DataSource = (DataTable)Session["penyalurandata"];
                gvPenyaluran.DataBind();
            }
            
            
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            Session["penyalurandata"] = ((new PenyaluranBll()).GetDatas(branchCode));
            gvPenyaluran.DataSource = (DataTable)Session["penyalurandata"];
            gvPenyaluran.DataBind();
           

        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)Session["userprofile"]).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.BL.Penyaluran.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.BL.Penyaluran.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.BL.Penyaluran.View");
           

            ((GridViewCommandColumn)gvPenyaluran.Columns["Opr."]).CustomButtons["Detail"].Visibility = (insert) ?  GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible ;
            ((GridViewCommandColumn)gvPenyaluran.Columns["Opr."]).CustomButtons["Detail"].Visibility = (edit) ? GridViewCustomButtonVisibility.AllDataRows : GridViewCustomButtonVisibility.Invisible;


            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            

        }

        private void btnCheckListAction(int visibleIndex)
        {

            int id = Convert.ToInt32(gvPenyaluran.GetRowValues(visibleIndex, gvPenyaluran.KeyFieldName));
            string nama = gvPenyaluran.GetRowValues(visibleIndex, "requestor_name").ToString();
            string no = gvPenyaluran.GetRowValues(visibleIndex, "form_number").ToString();
            decimal nilai =Convert.ToDecimal(gvPenyaluran.GetRowValues(visibleIndex, "granted_amount").ToString());

            var penyaluran = new Penyaluran();
            penyaluran.IdPemohon=id;
            penyaluran.Nama=nama;
            penyaluran.No = no;
            penyaluran.NilaiPengajuan = nilai;
            Session["penyaluran"] = penyaluran;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("PenyaluranBLDetail.aspx");
        }

        protected void gvPenyaluran_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
                btnCheckListAction(e.VisibleIndex);
        }

        protected void gvPenyaluran_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {

            var isTotal =gvPenyaluran.GetRowValues(e.VisibleIndex,"total_Penyaluran");
            if (isTotal != null)
            {

                try
                {


                    int total;
                    if (isTotal.ToString() == "")
                    {
                        total = 0;
                    }
                    else
                    {
                        total = Convert.ToInt32(isTotal);
                    }

                    decimal nilai = Convert.ToDecimal(gvPenyaluran.GetRowValues(e.VisibleIndex, "granted_amount").ToString());

                    if (total == 0)
                    {
                        e.Image.Url = "~/content/images/new.png";
                        e.Text = "Tambah";
                    }

                    else if (total < nilai)
                    {
                        e.Image.Url = "~/content/images/edit.png";
                        e.Text = "Tambah";
                    }

                    else
                    {
                        e.Image.Url = "~/content/images/checklist.png";
                    }
                }
                catch
                {

                }
            }
        }

        protected void gvPenyaluran_PageIndexChanged(object sender, EventArgs e)
        {
            GetData();
        }
    }
}