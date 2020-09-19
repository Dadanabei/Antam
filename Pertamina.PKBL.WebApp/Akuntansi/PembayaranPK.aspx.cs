using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Data;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class PembayaranPK : System.Web.UI.Page
    {
        PembayaranPKBll bll = new PembayaranPKBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if(!IsPostBack)
            {
                Session["data"]=null;
                GetData();
            }
            if (Session["data"] != null)
            {
                var data = ((DataTable)Session["data"]).Copy();
                gvPembayaran.DataSource = data;
                gvPembayaran.DataBind();
            }
        }

        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.PK.Pembayaran.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var data = bll.GetData(Convert.ToInt32(branchCode));
            Session["data"] = data.Copy();
            gvPembayaran.DataSource = data;
            gvPembayaran.DataBind();
        }

        private void btnDetail(int visibleIndex)
        {
            var proposal = gvPembayaran.GetRowValues(visibleIndex, gvPembayaran.KeyFieldName).ToString();
            //Session["Proposal"] = proposal;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailPembayaranPK.aspx?Proposal=" + proposal);
        }

        private void btnKartu(int visibleIndex)
        {
            var proposal = gvPembayaran.GetRowValues(visibleIndex, gvPembayaran.KeyFieldName).ToString();
            var mitraid = gvPembayaran.GetRowValues(visibleIndex, "mitraid").ToString();
            Session["mitraid"] = mitraid;
            Session["proposal_number"] = proposal;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("~/Akuntansi/Detail_Kartu_Piutang.aspx?mitraid=" + mitraid + "&prop=" + proposal);
        }

        protected void gvPembayaran_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "Tambah")
            {
                btnDetail(e.VisibleIndex);
            }

            else if (e.ButtonID == "Kartu")
            {
                btnKartu(e.VisibleIndex);
            }
        }

        protected void gvPembayaran_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            //
        }

        protected void gvPembayaran_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if(e.VisibleIndex >= 0)
            {
                
            }
        }

        protected void gvPembayaran_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if(e.VisibleIndex >= 0)
            {
                
            }
        }

        protected void gvPembayaran_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if(e.VisibleRowIndex >=0 )
            {
                if (e.Column.Name == "TglJatuhTempo")
                {
                    var proposalNumber = gvPembayaran.GetRowValues(e.VisibleRowIndex, "proposal_number").ToString();

                    var data = bll.GetComplementColumnValue(proposalNumber);

                    if (data.Rows.Count > 0)
                    {
                        e.DisplayText = data.Rows[0]["JatuhTempo"].ToString();
                    }

                }
                if (e.Column.Name == "Init")
                {
                    var proposalNumber = gvPembayaran.GetRowValues(e.VisibleRowIndex, "proposal_number").ToString();

                    var data = bll.GetComplementColumnValue(proposalNumber);

                    if (data.Rows.Count > 0)
                    {
                        e.DisplayText = data.Rows[0]["Kolekti"].ToString();
                    }
                }
            }
        }
    }
}