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
using Pertamina.PKBL.BLL.Kemitraan;

namespace Pertamina.PKBL.WebApp.Kemitraan.ListKemitraan
{
    public partial class ListKemitraanJSU : System.Web.UI.UserControl
    {
        MasterSektorKemitraanBll bll = new MasterSektorKemitraanBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblListJSU.Text = GetData();
        }

        private string GetData()
        {
            var data = bll.GetData(new Hashtable());

            StringBuilder resultJDB = new StringBuilder();

            foreach (DataRow item in data.Rows)
            {
                resultJDB.AppendFormat("\n{0}.\t\t\t{1}", item["id"].ToString(), item["sector_name"].ToString());
            }

            return resultJDB.ToString();
        }
    }
}