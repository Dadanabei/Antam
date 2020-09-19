using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Reporting;
using DevExpress.Web.ASPxEditors;
using DevExpress.XtraPrinting;
using DevExpress.Web.ASPxGridView;
using System.Drawing;

namespace Pertamina.PKBL.WebApp.Reporting.RepAkuntansi
{
    
    public partial class RepBaganAkun : System.Web.UI.Page
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

                Session["data"] = null;
            }
            else
            {
                if(Session["data"] != null)
                {
                    var data = (DataTable)Session["data"];
                    gvBaganAkun.DataSource = data;
                    gvBaganAkun.DataBind();
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

        public void getData() {

            Hashtable ht = new Hashtable();
            ht.Add("@akun-varchar-1000", txtKode.Text.Trim());
            ht.Add("@tglAwal-varchar-20", DateTime.Parse(deTanggalMulai.Text).ToString("dd/MM/yyyy"));
            ht.Add("@tglSelesai-varchar-20", DateTime.Parse(deTanggalSampai.Text).ToString("dd/MM/yyyy"));
            ht.Add("@branch_code-varchar-6", cbbRegion.Value.ToString());
            ht.Add("@jenis-varchar-3", cbbJenis.Value.ToString());//all,KB,GL
            var data = bll.GetBaganAkun(ht);

            Session["data"] = data.Copy();
            gvBaganAkun.DataSource = data;
            gvBaganAkun.DataBind();


        }

        public void initCombo() {
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
            cbbJenis.SelectedIndex = 0;

            if (branchCode == "9900" || branchCode == "9999")
            {
                var data = new Pertamina.PKBL.BLL.Administer.MasterKantorCabangBll().GetData(new Hashtable());

                var cabang = data.Clone();
                cabang.Columns["branch_code"].DataType = typeof(string);

                foreach (DataRow item in data.Rows)
                {
                    cabang.ImportRow(item);
                }
                dr = cabang.NewRow();
                dr["branch_name"] = "--semua--";
                dr["branch_code"] = "all";
                cabang.Rows.InsertAt(dr, 0);
                cbbRegion.DataSource = cabang;
                cbbRegion.TextField = "branch_name";
                cbbRegion.ValueField = "branch_code";
                cbbRegion.DataBind();
                cbbRegion.SelectedItem = cbbRegion.Items.FindByValue("all");
            }

            else
            {
                var pengirim = new Pertamina.PKBL.BLL.Akuntansi.TransferDanaBankBll().GetKantorCabang(Convert.ToInt32(branchCode));
                cbbRegion.DataSource = pengirim;
                cbbRegion.TextField = "branch_name";
                cbbRegion.ValueField = "branch_code";
                cbbRegion.DataBind();
                cbbRegion.SelectedIndex = 0;
            }
            
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            getData();

        }

        protected void gvBaganAkun_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            

                if (e.VisibleIndex >= 0)
                {
                    var header = e.GetValue("header_info").ToString();
                    if(header=="H")
                    {
                        e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#f0f4c3");
                    }
                }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            string branch = cbbRegion.SelectedItem.ToString();
            string filename = branch  + " " + deTanggalMulai.Date.ToString("dd/MM/yyyy") + " sampai " + deTanggalSampai.Date.ToString("dd/MM/yyyy");
            gvExporter.ReportHeader = "Laporan Bagan Akun \n " + filename;


            gvExporter.WriteXlsToResponse(filename, new XlsExportOptions { ExportMode = XlsExportMode.SingleFile });
           
        }

        protected void gvExporter_RenderBrick(object sender, DevExpress.Web.ASPxGridView.Export.ASPxGridViewExportRenderingEventArgs e)
        {
            GridViewDataColumn dataColumn = e.Column as GridViewDataColumn;
            if (e.RowType == GridViewRowType.Data && dataColumn != null)
            {
                if (e.GetValue("header_info").ToString().Equals("H"))
                {
                    e.BrickStyle.BackColor = Color.Yellow;
                }


            }

        }

        
        protected void gvBaganAkun_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (!String.IsNullOrEmpty(e.Value.ToString()))
            {
                
                        if (e.Column.FieldName == "SaldoAwal")
                        {
                            decimal price = Convert.ToDecimal(e.Value);
                            if (price != 0)
                                e.DisplayText = String.Format("{0:#,#.00}", price);
                            else
                                e.DisplayText = String.Format("{0}.00", price);
                        }
                        else if (e.Column.FieldName == "Debet")
                        {
                            decimal price = Convert.ToDecimal(e.Value);
                            if (price != 0)
                                e.DisplayText = String.Format("{0:#,#.00}", price);
                            else
                                e.DisplayText = String.Format("{0}.00", price);
                        }
                        else if (e.Column.FieldName == "Kredit")
                        {
                            decimal price = Convert.ToDecimal(e.Value);
                            if (price != 0)
                                e.DisplayText = String.Format("{0:#,#.00}", price);
                            else
                                e.DisplayText = String.Format("{0}.00", price);
                        }
                        else if (e.Column.FieldName == "SaldoAkhir")
                        {
                            decimal price = Convert.ToDecimal(e.Value);
                            if(price!=0)
                                e.DisplayText = String.Format("{0:#,#.00}", price);
                            else
                                e.DisplayText = String.Format("{0}.00", price);
                        }
                
            }
        }

        protected void gvBaganAkun_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            if(e.VisibleIndex >= 0)
            {
                object[] x = (object[]) gvBaganAkun.GetRowValues(e.VisibleIndex, "SaldoAwal", "Debet", "Kredit", "SaldoAkhir","isTransaksi");

                if (Convert.ToDecimal(x[0]) != 0 || Convert.ToDecimal(x[1]) != 0 || Convert.ToDecimal(x[2]) != 0 || Convert.ToDecimal(x[3]) != 0 || Convert.ToDecimal(x[4]) == 1)
                {
                    e.Visible = DevExpress.Utils.DefaultBoolean.True;
                }
                else
                {
                    e.Visible = DevExpress.Utils.DefaultBoolean.False;
                }
            }
        }

        protected void gvBaganAkun_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            BaganAkunDetail detail = new BaganAkunDetail();

            var row = (object[]) gvBaganAkun.GetRowValues(e.VisibleIndex,"account_id","account_name","SaldoAwal", "Debet", "Kredit", "SaldoAkhir");

            detail.Coa = row[0].ToString();
            detail.Deskripsi = row[1].ToString();
            detail.Periode = Convert.ToDateTime(deTanggalMulai.Value).ToString("dd MMMM yyyy") + " s/d " + Convert.ToDateTime(deTanggalSampai.Value).ToString("dd MMMM yyyy");
            detail.TglMulai = Convert.ToDateTime(deTanggalMulai.Value).ToString("dd/MM/yyyy");
            detail.Tglselesai = Convert.ToDateTime(deTanggalSampai.Value).ToString("dd/MM/yyyy");

            detail.SaldoAwal = row[2].ToString();
            detail.Debet = row[3].ToString();
            detail.Kredit = row[4].ToString();
            detail.SaldoAkhir = row[5].ToString();

            if (cbbRegion.Value.ToString() == "all")
            {
                detail.KodeCabang = 0;
            }
            else
            {
                detail.KodeCabang = Convert.ToInt32(cbbRegion.Value);
            }

            

            Session["detailbagan"] = detail;

            DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("DetailRepBaganAkun.aspx");
        } 


        
    }
}