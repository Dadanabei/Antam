using Pertamina.PKBL.BLL.Akuntansi;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pertamina.PKBL.WebApp
{
    public partial class AktivaTetap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var tblData = ((new PenyaluranBll()).GetData("[SP_GetPenyaluranBL]", new Hashtable())).DefaultView;
                gvPenyaluran.DataSource = dataPenyaluran(tblData);
                gvPenyaluran.DataBind();
                populatedd();
            }
        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool insert = RoleCheck.CheckRoleView(userRoles, "AKUN.AktivaTetap.Add");
            bool edit = RoleCheck.CheckRoleView(userRoles, "AKUN.AktivaTetap.Edit");
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.AktivaTetap.View");
            
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;
            //((GridViewCommandColumn)gvBankCOA.Columns["Opr."]).ShowEditButton = edit;
           // ((GridViewDataColumn)gvPenyaluran.Columns["Opr."]).ShowEditButton = edit;



            //btnSubmit.Visible = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }
            //btnSubmit.Visible = insert;

        }
        protected DataTable dataPenyaluran(DataView tblData)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Clear();
            dt.Columns.Add("form_number");
            dt.Columns.Add("requestor_name");
            dt.Columns.Add("requestor_company");
            dt.Columns.Add("requestor_address");
            dt.Columns.Add("approval_result_date");
            dt.Columns.Add("granted_amount");
            dt.Columns.Add("nilaiRealisasi");
            dt.Columns.Add("branch_name");
            dt.Columns.Add("userLog");

            var nil = (new PenyaluranBll()).GetKueri("select NoRef, sum(NilaiPenyaluran) as NilaiPenyaluran from TblT_Penyaluran group by NoRef");
            if (tblData.Count != 0)
            {
                foreach (DataRowView item in tblData)
                {
                    DateTime tgl = Convert.ToDateTime(item["approval_result_date"].ToString());
                    dr = dt.NewRow();
                    dr["form_number"] = item["form_number"];
                    dr["requestor_name"] = item["requestor_name"];
                    dr["requestor_company"] = item["requestor_company"];
                    dr["requestor_address"] = item["requestor_address"];
                    dr["approval_result_date"] = tgl.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
                    dr["granted_amount"] = string.Format("{0:#,###0}", item["granted_amount"]);
                    dr["nilaiRealisasi"] = "0";
                    if (nil.Rows.Count != 0)
                    {
                        foreach (DataRow i in nil.Rows)
                        {
                            if (i["NoRef"].ToString() == item["form_number"].ToString())
                                dr["nilaiRealisasi"] = string.Format("{0:#,###0}", i["NilaiPenyaluran"]);
                        }
                    }
                    dr["branch_name"] = item["branch_name"];
                    dr["userLog"] = item["userLog"];
                    dt.Rows.Add(dr);
                }
            }
            return dt;
        }
        protected void populatedd()
        {
            var dd = (new PenyaluranBll()).GetData("[USP_KANTOR_CABANG_SELECT]", new Hashtable());
            if (dd.Rows.Count > 0)
            {
                ddKantorCabang.DataSource = dd;
                ddKantorCabang.DataTextField = "branch_name";
                ddKantorCabang.DataValueField = "branch_code";
                ddKantorCabang.DataBind();
                ddKantorCabang.Items.Insert(0, new ListItem("- Pilih -"));
                ddCabang.DataSource = dd;
                ddCabang.DataTextField = "branch_name";
                ddCabang.DataValueField = "branch_code";
                ddCabang.DataBind();
                ddCabang.Items.Insert(0, new ListItem("- Pilih -"));
            }
        }
        protected void gvPenyaluran_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "Detail")
            {
                PanelList.Visible = false;
                PanelEditList.Visible = true;
            }
        }

        protected void btPilih2_Click(object sender, EventArgs e)
        {
            PanelEditDetail.Visible = true;
        }

        protected void btBatal_Click(object sender, EventArgs e)
        {
            PanelList.Visible = true;
            PanelEditList.Visible = false;
            PanelEditDetail.Visible = false;
        }

    }
}