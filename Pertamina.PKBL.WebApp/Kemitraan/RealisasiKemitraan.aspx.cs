using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pertamina.PKBL.WebApp
{
    public partial class RealisasiKemitraan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int flag = Convert.ToInt32(Session["Flag"]);

            if(flag==1)
            {
                ASPxPageControl1.ActiveTabIndex = 1;
                Session["Flag"] = null;
                
            }
        }
        private void GetData()
        { 
        
        }
        
        
    }
}