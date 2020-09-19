using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using DevExpress.XtraPrinting;

namespace Pertamina.PKBL.WebApp.Administer
{
    public partial class DownloadCityIndexMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var data = new BLL.Administer.DownloadMasterBll().GetData(Request.QueryString["mstnm"].ToString());
            
            gvCity.DataSource = data;
            gvCity.DataBind();

            gve.WriteXlsToResponse(Request.QueryString["mstnm"].ToString() + " Master", new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
        }
    }
}