using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Reporting;
using System.Collections;
using DevExpress.Web.ASPxGridView;
namespace Pertamina.PKBL.WebApp.Reporting.RepLainLain
{
    public partial class RepLihatDetailJurnal : System.Web.UI.Page
    {
        ReportLainBll bll = new ReportLainBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();

                if(Session["bl"] != null)
                {
                    if (Session["bl"].ToString() == "0")
                    {
                        txtKetBayar.Enabled = false;

                        ((GridViewCommandColumn)gvDetailKas.Columns["opr"]).ShowEditButton = false;
                        txtKepada.Enabled = false;
                        deTglBukti.Enabled = false;
                        Session["bl"] = null;
                    }
                }
            }

            btnTambah.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.JURNAL.KasBank.Edit");
            
        }


        private void GetData()
        {
            if(Session["lihatjurnal"] != null)
            {
                var data = bll.reportLihatDetailJurnal(Session["lihatjurnal"].ToString());

                if(data != null && data.Rows.Count > 0)
                {
                    var row = data.Rows[0];

                    txtRegion.Text = row["branch_name"].ToString();
                    txtNoRef.Text = Session["lihatjurnal"].ToString();
                    deTglBukti.Date = DateTime.Parse(row["tglBukti"].ToString());
                    txtKetBayar.Text = row["ketbayar"].ToString();
                    txtJnsPembayaran.Text = row["jnspembayaran"].ToString();
                    txtNilaiJumlah.Text = row["nilaiJumlah"].ToString();
                    txtPenyetuju.Text = row["penyetujuan"].ToString();
                    txtVerifikasi.Text = row["verifikasi"].ToString();
                    txtMintaBayar.Text = row["permintaan_bayar"].ToString();
                    txtKepada.Text = row["kepada"].ToString();

                    gvDetailKas.DataSource = bll.reportLihatDetailJurnalTable(Session["lihatjurnal"].ToString());
                    gvDetailKas.DataBind();


                }
            }

        }

        protected void gvDetailKas_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = (e.VisibleIndex + 1).ToString();
            }
        }

        protected void btnTambah_Click(object sender, EventArgs e)
        {
            Pertamina.PKBL.BLL.ActivityLog log = new Pertamina.PKBL.BLL.ActivityLog();
            Pertamina.PKBL.BLL.ActivityLogBll logBll = new Pertamina.PKBL.BLL.ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Edit keterangan jurnal";
            log.UserName = userName;

            try
            {
            Hashtable parameters = new Hashtable();

            var tgl = deTglBukti.Date.ToString("dd/MM/yyyy");

            parameters.Add("@nobukti-varchar-99", txtNoRef.Text.Trim());
            parameters.Add("@tglBukti-varchar-15", tgl);
            parameters.Add("@keteranganBayar-varchar-1000", txtKetBayar.Text);
            parameters.Add("@permintaanBayar-varchar-99", txtMintaBayar.Text);
            parameters.Add("@kepada-varchar-99", txtKepada.Text);
            parameters.Add("@verifikator-varchar-99", txtVerifikasi.Text);
            parameters.Add("@penyetuju-varchar-99", txtPenyetuju.Text);

            var jurnlaBll = new Pertamina.PKBL.BLL.Akuntansi.JurnalBll();

            jurnlaBll.EditKeterangan(parameters);

            GetData();
            ViewState["msg"] = "<font color=\"green\" size=\"8\"> Edit Berhasil </font>";



            log.Type = "S";
            log.Description = log.Action + ' ' + "sukses oleh id " + ' ' + userName;
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = System.IO.Path.GetFileName(this.AppRelativeVirtualPath) + "Error "+ex.GetBaseException().Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }

        }

        protected void gvDetailKas_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Pertamina.PKBL.BLL.ActivityLog log = new Pertamina.PKBL.BLL.ActivityLog();
            Pertamina.PKBL.BLL.ActivityLogBll logBll = new Pertamina.PKBL.BLL.ActivityLogBll();
            string host = Request.UserHostName;
            string ipaddress = Request.UserHostAddress;
            string userName = Session["user"].ToString();
            if (String.IsNullOrEmpty(ipaddress))
            {
                ipaddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
            log.HostName = host;
            log.IPAddress = ipaddress;
            log.Action = "Edit deskripsi detail jurnal";
            log.UserName = userName;

            try
            {


                var jurnlaBll = new Pertamina.PKBL.BLL.Akuntansi.JurnalBll();

                Hashtable parameters = new Hashtable();

                parameters.Add("@nobukti-varchar-99", Session["lihatjurnal"]);
                parameters.Add("@coa-varchar-20", e.NewValues["coa"]);
                parameters.Add("@ket-varchar-1000", e.NewValues["deskripsi"]);

                jurnlaBll.EditDetailKeterangan(parameters);

                GetData();

                e.Cancel = true;
                gvDetailKas.CancelEdit();

                log.Type = "S";
                log.Description = log.Action + ' ' + "sukses oleh id " + ' ' + userName;
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = System.IO.Path.GetFileName(this.AppRelativeVirtualPath) + "Edit deskripsi detail jurnal ";
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }
    }
}