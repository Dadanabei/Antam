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

namespace Pertamina.PKBL.WebApp.BinaLingk
{
    public partial class ListBInalingkungan : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblList.Text = GetData();
        }

        private string GetData()
        {
            var data = (new MasterBLBll()).GetDataActive();

            StringBuilder result = new StringBuilder();
            
            foreach (DataRow item in data.Rows)
            {
                result.AppendFormat("\n{0}.\t\t\t{1}", item["id"].ToString(), item["bl_kind"].ToString());
            }

            return result.ToString();
        }
    }
}