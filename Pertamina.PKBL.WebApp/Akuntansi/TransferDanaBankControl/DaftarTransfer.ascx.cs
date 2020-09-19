using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;

namespace Pertamina.PKBL.WebApp.Akuntansi.TransferDanaBankControl
{
    public partial class DaftarTransfer : System.Web.UI.UserControl
    {
        TransferDanaBankBll bll = new TransferDanaBankBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["tdbnk"] != null)
            {
                gvDaftarTransfer.DataSource = (DataTable)Session["tdbnk"];
                gvDaftarTransfer.DataBind();
                gvDaftarTransfer.GroupBy(gvDaftarTransfer.Columns["NoBukti"]);
                gvDaftarTransfer.ExpandAll();
            }
            
        }



        private void GetData()
        {
            var mulai = Convert.ToDateTime(txtTanggal1.Value).ToString("dd/MM/yyyy");
            var akhir = Convert.ToDateTime(txtTaggal2.Value).ToString("dd/MM/yyyy");

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;

            var data = bll.GetJurnal(mulai, akhir, branchCode);

            Session["tdbnk"] = data;

            gvDaftarTransfer.DataSource = data;
            gvDaftarTransfer.DataBind();

            gvDaftarTransfer.GroupBy(gvDaftarTransfer.Columns["NoBukti"]);
            gvDaftarTransfer.ExpandAll();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            GetData();
        }
    }
}