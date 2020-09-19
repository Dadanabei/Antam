using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.BinaLingk;
using System.Text;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Kemitraan.ListKemitraan
{
    public partial class ListKemitraanJKR : System.Web.UI.UserControl
    {
        DdlBll bll = new DdlBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblListJKR.Text = GetData();
        }

        private string GetData()
        {
            var data = bll.getJenisKredit();

            StringBuilder resultJKR = new StringBuilder();

            foreach (DataRow item in data.Rows)
            {
                resultJKR.AppendFormat("\n{0}.\t\t\t{1}", item["id"].ToString(), item["descr"].ToString());
            }

            return resultJKR.ToString();
        }
    }
}