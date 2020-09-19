using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Reporting;
using System.Collections;
using System.Data;
using DevExpress.XtraPrinting;

namespace Pertamina.PKBL.WebApp.Reporting.RepAkuntansi
{
    public partial class RepNeracaSaldo : System.Web.UI.Page
    {
        RepAkuntansiBll bll = new RepAkuntansiBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            roleAuth();
            if (!IsPostBack)
            {
                initCombo();
                deTanggalMulai.Date = new BLL.Administer.ClosingBll().GetLastClose().AddDays(1);
                deTanggalSampai.Date = DateTime.Today;

                Session["dataNeraca"] = null;
            }
            else
            {
                if(Session["dataNeraca"] != null)
                {
                    var data = (DataTable)Session["dataNeraca"];
                    gvNeraca.DataSource = data;
                    gvNeraca.DataBind();
                }
            }

        }
        private void roleAuth()
        {

            var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
            bool view = RoleCheck.CheckRoleView(userRoles, "RPT.Akuntansi.View");
            //((GridViewCommandColumn)gvPermohonan.Columns["opr"]).ShowNewButton = insert;

            if (view == false)
            {
                Response.Redirect("~/Default.aspx");
            }


        }

        private void GetData()
        {
            Hashtable ht = new Hashtable();
            ht.Add("@akun-varchar-1000",txtKode.Text.Trim());
            ht.Add("@tglAwal-varchar-20",DateTime.Parse(deTanggalMulai.Text).ToString("dd/MM/yyyy"));
            ht.Add("@tglSelesai-varchar-20", DateTime.Parse(deTanggalSampai.Text).ToString("dd/MM/yyyy"));
            ht.Add("@branch_code-varchar-6",cbbBranch.Value.ToString());
            ht.Add("@jenis-varchar-3",cbbJenis.Value.ToString());//all,KB,GL
            var data = bll.GetNeraca(ht);
            Session["dataNeraca"] = data.Copy() ;
            gvNeraca.DataSource = data;
            gvNeraca.DataBind();
        }

        private void initCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            DataTable dt = new DataTable();
            DataRow dr;
            DataView view;

            dt.Columns.Add("value", typeof(string));
            dt.Columns.Add("text", typeof(string));

            dr = dt.NewRow();
            dr["value"] = "all";
            dr["text"] = "--semua--";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["value"] = "KB";
            dr["text"] = "Kas / Bank";
            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["value"] = "GL";
            dr["text"] = "Umum";
            dt.Rows.Add(dr);

            view = new DataView(dt);

            cbbJenis.DataSource = view;
            cbbJenis.TextField = "text";
            cbbJenis.ValueField = "value";
            cbbJenis.DataBind();

            if(branchCode=="9900" || branchCode == "9999")
            {
                var data = new Pertamina.PKBL.BLL.Administer.MasterKantorCabangBll().GetData(new Hashtable());
                var cabang = data.Clone();
                cabang.Columns["branch_code"].DataType = typeof(string);

                foreach(DataRow item in data.Rows)
                {
                    cabang.ImportRow(item);
                }
                dr = cabang.NewRow();
                dr["branch_name"] = "--semua--";
                dr["branch_code"]="all";
                cabang.Rows.InsertAt(dr, 0);


                cbbBranch.DataSource = cabang;
                cbbBranch.TextField = "branch_name";
                cbbBranch.ValueField = "branch_code";
                cbbBranch.DataBind();
                cbbBranch.SelectedItem = cbbBranch.Items.FindByValue("all");
            }

            else
            {
                var pengirim = new Pertamina.PKBL.BLL.Akuntansi.TransferDanaBankBll().GetKantorCabang(Convert.ToInt32(branchCode));
                cbbBranch.DataSource = pengirim;
                cbbBranch.TextField = "branch_name";
                cbbBranch.ValueField = "branch_code";
                cbbBranch.DataBind();
            }
            
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            GetData();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }

        protected void bntExport_Click(object sender, EventArgs e)
        {
            string branch = cbbBranch.SelectedItem.ToString();
            string filename = branch + " " + deTanggalMulai.Date.ToString("dd/MM/yyyy") + " sampai " + deTanggalSampai.Date.ToString("dd/MM/yyyy");
            gvExport.ReportHeader = "Laporan Neraca Saldo \n " + filename;


            gvExport.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
        }

        protected void gvNeraca_CustomButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                object[] x = (object[])gvNeraca.GetRowValues(e.VisibleIndex, "SaldoAwal", "Debet", "Kredit", "SaldoAkhir");

                if (Convert.ToDecimal(x[0]) != 0 || Convert.ToDecimal(x[1]) != 0 || Convert.ToDecimal(x[2]) != 0 || Convert.ToDecimal(x[3]) != 0)
                {
                    e.Visible = DevExpress.Utils.DefaultBoolean.True;
                }
                else
                {
                    e.Visible = DevExpress.Utils.DefaultBoolean.False;
                }
            }
        }

        protected void gvNeraca_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            BaganAkunDetail detail = new BaganAkunDetail();

            var row = (object[])gvNeraca.GetRowValues(e.VisibleIndex, "account_id", "account_name", "SaldoAwal", "Debet", "Kredit", "SaldoAkhir","cabang");

            detail.Coa = row[0].ToString();
            detail.Deskripsi = row[1].ToString();
            detail.Periode = Convert.ToDateTime(deTanggalMulai.Value).ToString("dd MMMM yyyy") + " s/d " + Convert.ToDateTime(deTanggalSampai.Value).ToString("dd MMMM yyyy");
            detail.TglMulai = Convert.ToDateTime(deTanggalMulai.Value).ToString("dd/MM/yyyy");
            detail.Tglselesai = Convert.ToDateTime(deTanggalSampai.Value).ToString("dd/MM/yyyy");

            detail.SaldoAwal = row[2].ToString();
            detail.Debet = row[3].ToString();
            detail.Kredit = row[4].ToString();
            detail.SaldoAkhir = row[5].ToString();
            detail.KodeCabang = Convert.ToInt32(row[6]);
            //if (cbbBranch.Value.ToString() == "all")
            //{
            //    detail.KodeCabang = 0;
            //}
            //else
            //{
            //    detail.KodeCabang = Convert.ToInt32(cbbBranch.Value);
            //}



            Session["detailbagan"] = detail;

            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailRepBaganAkun.aspx");
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            var param = new NeracaSaldoParams();

            param.Data = (DataTable)Session["dataNeraca"];
            param.Area = cbbBranch.SelectedItem.Text;
            param.Start = deTanggalMulai.Date;
            param.End = deTanggalSampai.Date;

            Session["PrintNeraca"] = param;

            ViewState["msg"] = "<script>window.open('PrintNeracaSaldo.aspx','_blank');</script>";
        }

        public class NeracaSaldoParams
        {
            public DataTable Data { get; set; }
            public string Area { get; set; }
            public DateTime Start { get; set; }
            public DateTime End { get; set; }

        }
       
    }
}