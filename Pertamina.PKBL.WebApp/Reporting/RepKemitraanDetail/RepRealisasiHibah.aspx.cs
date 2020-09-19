using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Reporting;

namespace Pertamina.PKBL.WebApp.Reporting.RepKemitraan
{
    public partial class RepRealisasiHibah : System.Web.UI.Page
    {
        RepHibahBll bll = new RepHibahBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                InitCombo();
            }
        }

        private void InitCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            BLL.Administer.MasterKantorCabangBll bll = new BLL.Administer.MasterKantorCabangBll();

            var data = bll.GetData(new System.Collections.Hashtable());

            var dr = data.NewRow();
            dr["branch_name"] = "- All -";
            dr["branch_code"] = 0;

            data.Rows.InsertAt(dr, 0);

            DataView dv = new DataView(data);

            if (branchCode != "9900")
            {
                dv.RowFilter = "branch_code=" + branchCode.ToString();
            }

            cbbCabang.DataSource = dv;
            cbbCabang.ValueField = "branch_code";
            cbbCabang.TextField = "branch_name";
            cbbCabang.DataBind();

            cbbCabang.SelectedIndex = 0;

        }

        private void InitReport()
        {
            Session["dt"] = null;
            DateTime start = (DateTime)txtTgl1.Value;
            DateTime end = (DateTime)txttgl2.Value;
            int branchCode = int.Parse(cbbCabang.SelectedItem.Value.ToString());
            string branchName = cbbCabang.SelectedItem.ToString();
            //report.Parameters["startDate"].Value = start;
            //report.Parameters["endDate"].Value = end;
            //report.Parameters["branchCode"].Value = branchCode;
            //report.Parameters["branchName"].Value = branchName;

            Hashtable ht = new Hashtable();

            ht.Add("@branch_code-int", branchCode);
            ht.Add("@tglMulai-varchar-20", start.ToString("dd/MM/yyyy"));
            ht.Add("@tglSampai-varchar-20", end.ToString("dd/MM/yyyy"));

            DataTable dt = bll.getRepRealisasiBinaLing(ht);
            Session["dt"] = dt;
            gv.DataSource = dt;
            gv.DataBind();

        }

        protected void gv_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (Convert.ToInt32(e.VisibleIndex) + 1).ToString();
            }
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            InitReport();
        }
    }
}