using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;
using DevExpress.Web.ASPxGridView;


namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class PostingJurnal : System.Web.UI.Page
    {
        JurnalBll jurnalBll = new JurnalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            

            if (!IsPostBack)
            {
                deStart.Value = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
                deEnd.Value = DateTime.Today;
                GetData();
                gvJurnal.DataBind();
                gvJurnal.DetailRows.ExpandAllRows();

                for (int i = 0; i < gvJurnal.VisibleRowCount; i++)
                {

                    var noBukti = gvJurnal.GetRowValues(i, "NoBukti").ToString();

                    var detailData = jurnalBll.GetDetailByNoBukti(noBukti);

                    var gvDetail = (ASPxGridView)gvJurnal.FindDetailRowTemplateControl(i, "gvDetail");
                    if (gvDetail != null)
                    {
                        gvDetail.DataSource = detailData;
                        gvDetail.DataBind();
                    }
                }
            }

            roleAuth();
            

        }
        private void roleAuth()
        {
            
            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response,  Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PostingJurnal.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            //((GridViewCommandColumn)gvBankCOA.Columns["Opr."]).ShowEditButton = edit;
            // ((GridViewDataColumn)gvPenyaluran.Columns["Opr."]).ShowEditButton = edit;

            btnPost.Visible = RoleCheck.CheckRoleView(userRoles, "AKUN.PostingJurnal.Edit");

            //btnSubmit.Visible = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            //btnSubmit.Visible = insert;

        }

        private void GetData()
        {
            

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            object cari = DBNull.Value;
            object tgla = DBNull.Value;
            object tgle = DBNull.Value;
            
            if(!string.IsNullOrEmpty(txtCari.Text.Trim()))
            {
                cari = txtCari.Text;
            }

            if(deStart.Value != null && deEnd.Value != null)
            {
                tgla = Convert.ToDateTime(deStart.Value).ToString("dd/MM/yyyy");
                tgle = Convert.ToDateTime(deEnd.Value).ToString("dd/MM/yyyy");
            }

            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branchCode);
            ht.Add("@cari-varchar-1000", cari);
            ht.Add("@tglStart-varchar-20", tgla);
            ht.Add("@tglEnd-varchar-20", tgle);

            var data = jurnalBll.GetJurnal(ht);

            gvJurnal.DataSource = data;
            gvJurnal.DataBind();

        }

        private void InitCombo()
        {
            
        }

        protected void gvJurnal_DetailRowExpandedChanged(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewDetailRowEventArgs e)
        {
            if (e.Expanded && e.VisibleIndex >= 0 && e.VisibleIndex < gvJurnal.VisibleRowCount)
            {
                var noBukti = gvJurnal.GetRowValues(e.VisibleIndex, "NoBukti").ToString();

                var detailData = jurnalBll.GetDetailByNoBukti(noBukti);

                var gvDetail = (ASPxGridView)gvJurnal.FindDetailRowTemplateControl(e.VisibleIndex, "gvDetail");
                if (gvDetail != null)
                {
                    gvDetail.DataSource = detailData;
                    gvDetail.DataBind();
                }
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            var selected = gvJurnal.GetSelectedFieldValues("NoBukti");

            foreach (var item in selected)
            {
                var nobukti = item.ToString();
                jurnalBll.PostingJurnal(nobukti,Session["user"].ToString());
            }

            GetData();

        }

        protected void gvJurnal_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if(e.ButtonID=="print")
            {
                PrintAction(e.VisibleIndex);
            }
            else if (e.ButtonID == "edit")
            {
                EditAction(e.VisibleIndex);
            }
        }

        private void PrintAction(int index)
        {
            var noBukti = gvJurnal.GetRowValues(index, "NoBukti").ToString();
            //Session["noBukti"] = noBukti;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Reporting/PrintPage.aspx?noref="+noBukti);
        }

        private void EditAction(int index)
        {
            var noBukti = gvJurnal.GetRowValues(index, "NoBukti").ToString();
            Session["lihatjurnal"] = noBukti;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Reporting/RepLainLain/RepLihatDetailJurnal.aspx");
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            GetData();
            gvJurnal.DataBind();
            gvJurnal.DetailRows.ExpandAllRows();

            for (int i = 0; i < gvJurnal.VisibleRowCount; i++)
            {

                var noBukti = gvJurnal.GetRowValues(i, "NoBukti").ToString();

                var detailData = jurnalBll.GetDetailByNoBukti(noBukti);

                var gvDetail = (ASPxGridView)gvJurnal.FindDetailRowTemplateControl(i, "gvDetail");
                if (gvDetail != null)
                {
                    gvDetail.DataSource = detailData;
                    gvDetail.DataBind();
                }
            }
        }

        protected void gvJurnal_PageIndexChanged(object sender, EventArgs e)
        {
            
            GetData();
            gvJurnal.DataBind();
            gvJurnal.DetailRows.ExpandAllRows();

            for (int i = 0; i < gvJurnal.VisibleRowCount; i++)
            {

                var noBukti = gvJurnal.GetRowValues(i, "NoBukti").ToString();

                var detailData = jurnalBll.GetDetailByNoBukti(noBukti);

                var gvDetail = (ASPxGridView)gvJurnal.FindDetailRowTemplateControl(i, "gvDetail");
                if (gvDetail != null)
                {
                    gvDetail.DataSource = detailData;
                    gvDetail.DataBind();
                }
            }
        }
    }
}