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

    public partial class ListKemitraanJDB : System.Web.UI.UserControl
    {
        DdlBll bll = new DdlBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblListJDB.Text = GetData();
        }
        private string GetData()
        {
            var data = bll.getJenisDebitur();

            StringBuilder resultJDB = new StringBuilder();
            
            foreach (DataRow item in data.Rows)
            {
                resultJDB.AppendFormat("\n{0}.\t\t\t{1}", item["id"].ToString(), item["descr"].ToString());
            }

            return resultJDB.ToString();
        }
    }
}