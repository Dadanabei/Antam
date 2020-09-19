using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helper;

namespace Pertamina.PKBL.WebApp.Reporting.RepAkuntansUserControl
{
    public partial class PrintNeracaSaldo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    if (Session["PrintNeraca"] != null)
                    {


                        var data = (Pertamina.PKBL.WebApp.Reporting.RepAkuntansi.RepNeracaSaldo.NeracaSaldoParams)Session["PrintNeraca"];
                        txtArea.Text = data.Area + " " + data.Start.ToStringIndonesia("dd MMM yyyy") + " - " + data.End.ToStringIndonesia("dd MMM yyyy");
                        gvPrint.DataSource = data.Data;
                        gvPrint.DataBind();


                        Session.Remove("PrintNeraca");
                    }
                }
                catch (Exception ex)
                {

                }

            }
        }
    }
}