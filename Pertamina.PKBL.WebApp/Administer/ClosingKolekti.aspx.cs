using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Administer
{
    public partial class Closingkolekti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable tahun = new DataTable();
                tahun.Columns.Add("tahun");

                for (int i = DateTime.Today.Year; i > 1993; i--)
                {
                    var nr = tahun.NewRow();
                    nr["tahun"] = i;
                    tahun.Rows.Add(nr);
                }

                DataTable bulan = new DataTable();
                bulan.Columns.Add("value");
                bulan.Columns.Add("text");

                bulan.Rows.Add(1, "Januari");
                bulan.Rows.Add(2, "Februari");
                bulan.Rows.Add(3, "Maret");
                bulan.Rows.Add(4, "April");
                bulan.Rows.Add(5, "Mei");
                bulan.Rows.Add(6, "Juni");
                bulan.Rows.Add(7, "Juli");
                bulan.Rows.Add(8, "Agustus");
                bulan.Rows.Add(9, "September");
                bulan.Rows.Add(10, "Oktober");
                bulan.Rows.Add(11, "November");
                bulan.Rows.Add(12, "Desember");


                cbbBulan.DataSource = bulan;
                cbbBulan.TextField = "text";
                cbbBulan.ValueField = "value";
                cbbBulan.DataBind();


                cbbTahun.DataSource = tahun;
                cbbTahun.TextField = "tahun";
                cbbTahun.ValueField = "tahun";
                cbbTahun.DataBind();
                
                Pertamina.PKBL.BLL.Administer.ClosingBll bll = new BLL.Administer.ClosingBll();

                gvClosing.DataSource = bll.GetHistoryKolekti();
                gvClosing.DataBind();
            }
        }

        protected void btnClosing_Click(object sender, EventArgs e)
        {
            Pertamina.PKBL.BLL.Administer.ClosingBll bll = new BLL.Administer.ClosingBll();

            bll.Kolektabilitas(Convert.ToInt32(cbbBulan.SelectedItem.Value),Convert.ToInt32(cbbTahun.SelectedItem.Value));

            gvClosing.DataSource = bll.GetHistoryKolekti();
            gvClosing.DataBind();

            ViewState["script"] = string.Format("<script>alert('klosing kolektibilitas bulan {0} tahun {1} sukses');</script>", cbbBulan.SelectedItem.Text, cbbTahun.SelectedItem.Value);
        }

        protected void gvClosing_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnHitungUlang")
            {
                Pertamina.PKBL.BLL.Administer.ClosingBll bll = new BLL.Administer.ClosingBll();

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
                log.Action = "Hitung Ulang Closing Kolektibilitas ";
                log.UserName = userName;

                try
                {

                    var tahun = Convert.ToInt32(gvClosing.GetRowValues(e.VisibleIndex, "tahun").ToString().Trim());
                    var bulan = Convert.ToInt32(gvClosing.GetRowValues(e.VisibleIndex, "bulan").ToString().Trim());


                    bll.HitungUlangKolekti(bulan, tahun);

                    gvClosing.DataSource = bll.GetHistoryKolekti();
                    gvClosing.DataBind();

                    ViewState["script"] = "<script>alert('hitung ulang closing bulan " + cbbBulan.SelectedItem.Text + " " + cbbTahun.SelectedItem.Value + " sukses'); </script>";

                    log.Type = "S";
                    log.Description = log.Action + "Sukses oleh id" + ' ' + userName;
                
                }

                catch (Exception ex)
                {
                    ViewState["script"] = "<script>alert('hitung ulang closing bulan " + cbbBulan.SelectedItem.Text + " " + cbbTahun.SelectedItem.Value + " gagal'); </script>";
                    log.Type = "E";
                    log.Description = "Hitung Ulang Closing Kolektibilitas Gagal : " + ex.Message;
                }
                finally
                {
                    logBll.InsertActivity(log);
                }
            }
        }

        protected void gvClosing_PageIndexChanged(object sender, EventArgs e)
        {
            gvClosing.DataSource = (new BLL.Administer.ClosingBll()).GetHistoryKolekti();
            gvClosing.DataBind();
        }
    }
}