using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Akuntansi;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class MitraBinaanBermasalah : System.Web.UI.Page
    {
        PengakuanMitraBermasalahBll bll = new PengakuanMitraBermasalahBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();

            if (!IsPostBack)
            {
                initCombo();
                txtTanggal.Date = DateTime.Today;

                Session["data"] = null;
            }
            else
            {
                if (Session["data"] != null)
                {
                    var data = (DataTable)Session["data"];

                    gvMitraBermasala.DataSource = data;
                    gvMitraBermasala.DataBind();
                }
            }

        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "AKUN.MBBermasalah.View");
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


        private void GetData()
        {
            Hashtable ht = new Hashtable();

            ht.Add("@branch_code-int",Convert.ToInt32(cbbBranch.Value));
            ht.Add("@mitraid-int",txtMitraid.Text==""?0:Convert.ToInt32(txtMitraid.Text));
            ht.Add("@bulanClosing-int",Convert.ToInt32(cbbBulan.Value));
            ht.Add("@tahunClosing-int",Convert.ToInt32(cbbTahun.Value));
            ht.Add("@bermaslah-varchar-5",cbbJenis.Value.ToString());

            var data = bll.GetData(ht);
            Session["data"] = data.Copy();
            gvMitraBermasala.DataSource = data;
            gvMitraBermasala.DataBind();
        }

        private void initCombo()
        {
            var date = Convert.ToInt32(DateTime.Today.Year.ToString());
            DataTable dt = new DataTable();
            dt.Columns.Add("text", typeof(string));
            dt.Columns.Add("value", typeof(string));
            DataRow dr;

            for (int i = date; i >= 1990; i--)
            {
                dr = dt.NewRow();
                dr["text"] = i.ToString();
                dr["value"] = i;
                dt.Rows.Add(dr);
            }
            cbbTahun.DataSource = dt;
            cbbTahun.TextField = "text";
            cbbTahun.ValueField = "value";
            cbbTahun.DataBind();
            cbbTahun.SelectedIndex = 0;


            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            if (branchCode == "9900")
            {
                var cabang = new Pertamina.PKBL.BLL.Administer.MasterKantorCabangBll().GetData(new Hashtable());
                cbbBranch.DataSource = cabang;
                cbbBranch.TextField = "branch_name";
                cbbBranch.ValueField = "branch_code";
                cbbBranch.DataBind();
                cbbBranch.SelectedItem = cbbBranch.Items.FindByValue("9900");
            }

            else
            {
                var pengirim = new Pertamina.PKBL.BLL.Akuntansi.TransferDanaBankBll().GetKantorCabang(Convert.ToInt32(branchCode));
                cbbBranch.DataSource = pengirim;
                cbbBranch.TextField = "branch_name";
                cbbBranch.ValueField = "branch_code";
                cbbBranch.DataBind();
                cbbBranch.SelectedIndex = 0;
            }

        }

        protected void gvMitraBermasala_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                try
                {
                    if (e.ButtonID == "Kartu")
                    {
                        e.Text = (gvMitraBermasala.GetRowValues(e.VisibleIndex, "requestor_name")).ToString();
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }

       
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            GetData();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect("MitraBinaanBermasalah.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ActivityLog log = new ActivityLog();
            ActivityLogBll logBll = new ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Update Mitra Bermasalah";
            log.UserName = userName;

            try
            {

                var selected = gvMitraBermasala.GetSelectedFieldValues("mitra_id");

                foreach (var item in selected)
                {
                    var nobukti = item.ToString();
                    bll.UpdateBermasalah(nobukti, DateTime.Parse(txtTanggal.Text).ToString("dd/MM/yyyy"));

                }

                GetData();

                log.Type = "S";
                log.Description = log.Action + " sukses";
            }
            catch (Exception Ex)
            {

                log.Type = "E";
                log.Description = log.Action + " error :" + Ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally
            {
                logBll.InsertActivity(log);

            }

        }

        public void getKartuPiutang(int visibleIndex)
        {
            Session["proposal_number"] = gvMitraBermasala.GetRowValues(visibleIndex, "proposal_number");
            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback(@"~/Akuntansi/Detail_Kartu_Piutang.aspx");
        }

        protected void gvMitraBermasala_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            getKartuPiutang(e.VisibleIndex);
        }

        protected void gvMitraBermasala_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if(e.VisibleIndex>=0)
            {
                try
                {

                    if (e.DataColumn.FieldName == "TglBermasalah")
                    e.Cell.ForeColor = System.Drawing.Color.Red;
                }
                catch(Exception ex)
                {

                }
            }
        }

    }
}