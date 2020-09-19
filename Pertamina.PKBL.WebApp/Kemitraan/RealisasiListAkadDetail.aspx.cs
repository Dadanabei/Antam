using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class RealisasiListAkadDetail : System.Web.UI.Page
    {
        RealisasiBll bll = new RealisasiBll();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                initCombo();
            }
            GetData();

            btnSubmit.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "PK.Penilaian.Edit");
        }

        private void GetData()
        {
           var data = bll.GetDetailAkad(Convert.ToInt32(Session["mitraid"]));

           if (data != null)
           {
               txtNoDebitur.Text = data["mitraid"].ToString();
               txtNama.Text = data["requestor_name"].ToString();
               txtAlamatRumah.Text = data["requestor_address"].ToString();
               txtAlamatUsaha.Text = data["company_address"].ToString();
               txtNamaPerusahaan.Text = data["company_name"].ToString();
               txtNoKtp.Text = data["identification_number"].ToString();
               txtJenisUsaha.Text = data["BidangUsaha"].ToString();
               cbbKota.SelectedItem = cbbKota.Items.FindByValue(data["requestor_city_id"].ToString());
               cbbPenyalur.SelectedItem = cbbPenyalur.Items.FindByValue(data["supplier_id"].ToString());
               cbbSektorUsaha.SelectedItem = cbbSektorUsaha.Items.FindByValue(data["sector_id"].ToString());

           }
           else
           {
               Response.Redirect("RealisasiKemitraan.aspx");
           }

           var grid = bll.GetDetailAkadGrid(Convert.ToInt32(Session["mitraid"]));
           if (grid.Rows.Count>0)
           {
               gvRealisasiAkadDetail.DataSource = grid;
               gvRealisasiAkadDetail.DataBind();
           }
           else
           {
               Response.Redirect("RealisasiKemitraan.aspx");
           }
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var ddl = new Pertamina.PKBL.BLL.DdlBll();
            var kota = new Pertamina.PKBL.BLL.Administer.CityIndexBll().GetDataByBranch(branchCode);
            var penyalur = ddl.getComboSupplier(branchCode.ToString());
            var sektor = new Pertamina.PKBL.BLL.Kemitraan.MasterSektorKemitraanBll().GetData(new Hashtable());
            
            cbbKota.DataSource = kota;
            cbbKota.TextField = "city_name";
            cbbKota.ValueField = "city_appcode";
            cbbKota.DataBind();

            cbbPenyalur.DataSource = penyalur;
            cbbPenyalur.TextField = "supplier_name";
            cbbPenyalur.ValueField = "id";
            cbbPenyalur.DataBind();

            cbbSektorUsaha.DataSource = sektor;
            cbbSektorUsaha.TextField = "sector_name";
            cbbSektorUsaha.ValueField = "id";
            cbbSektorUsaha.DataBind();

        }
        protected void gvRealisasiAkadDetail_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "Opr1")
            {
                btnEditAction(e.VisibleIndex);
            }
            if (e.ButtonID == "Opr2")
            {
                btnDetailAction(e.VisibleIndex);
            }

        }

        private void btnEditAction(int visibleindex)
        {
            var proposal_numb = gvRealisasiAkadDetail.GetRowValues(visibleindex, gvRealisasiAkadDetail.KeyFieldName);
            Session["Realisasi"] = proposal_numb;
            Session["IsReal"] = "0";
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~\Kemitraan\RealisasiPersetujuanTambah.aspx");
        }

        private void btnDetailAction(int visibleIndex)
        {
                var proposal_numb=gvRealisasiAkadDetail.GetRowValues(visibleIndex,gvRealisasiAkadDetail.KeyFieldName);
            Session["proposal"]=proposal_numb;
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Kemitraan/SuratPerjanjianPinjaman.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
          //var data = bll.GetDetailAkad(Convert.ToInt32(Session["mitraid"]));
       
          // string proposal_numb  = data["proposal_number"].ToString();            
          //  Session["proposal"] = proposal_numb;
          //  Response.Redirect("~/Kemitraan/SuratPerjanjianPinjaman.aspx");
        }

    }
}