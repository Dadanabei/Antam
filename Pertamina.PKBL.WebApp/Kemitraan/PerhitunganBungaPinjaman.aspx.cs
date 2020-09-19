using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.WebApp
{
    public partial class PerhitunganBungaPinjaman : System.Web.UI.Page
    {
        PerhitunganBungaPinjamanBll bll = new PerhitunganBungaPinjamanBll();
        DdlBll ddl = new DdlBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                initCombo();
            }
        }


        private void getData() {
            Hashtable ht = new Hashtable();

            ht.Add("@pokok_hutang-decimal", usulan.Text);
            ht.Add("@rate-float", bunga.Text);
            ht.Add("@tenor-int", JangkaWaktu.Text);
            ht.Add("@jenisJasa-int", jenisJasa.Value);
            ht.Add("@gracePeriod-int", gracePeriod.Text);
            DataTable dt = bll.getData(ht);

            angsuranTotal.Text = dt.Rows[1 + int.Parse(gracePeriod.Text)]["AngsuranKe"].ToString().Trim();
            angsuranPokok.Text = dt.Rows[1 + int.Parse(gracePeriod.Text)]["HutangPokok"].ToString().Trim();
            angsuranBunga.Text = dt.Rows[1 + int.Parse(gracePeriod.Text)]["Bunga"].ToString().Trim();            

            GridView1.DataSource = dt;
            GridView1.DataBind();
        
        }
        protected void generate_Click(object sender, EventArgs e)
        {
            getData();
        }

        private void initCombo() {
            DataTable dt = ddl.getJenisBunga();
            jenisJasa.DataSource = dt;
            jenisJasa.ValueField = "id";
            jenisJasa.TextField = "descr";                
            jenisJasa.DataBind();
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerhitunganBungaPinjaman.aspx");
        }
    }
}