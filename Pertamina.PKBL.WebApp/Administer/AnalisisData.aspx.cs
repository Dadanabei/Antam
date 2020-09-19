using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pertamina.PKBL.WebApp
{
    public partial class AnalisisData : System.Web.UI.Page
    {
        public string[] Links { get; private set; }
        public string[] Urls { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Links = new string[] {
                "Kartu MB Bermasalah Sumbagsel",
                "Jurnal Piutang Region",
                "Log Hapus Jurnal"
            };
            Urls = new string[] {
                "~/Administer/KartuMBBermasalah.aspx",
                "~/Administer/JurnalReg1.aspx",
                "~/Administer/HapusJurnal.aspx"
            };
        }
    }
}