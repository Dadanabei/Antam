using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Administer;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Administer
{
    public partial class ClosingMonth : System.Web.UI.Page
    {
        ClosingBll bll = new ClosingBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var date = Convert.ToInt32(DateTime.Today.Year.ToString());
                DataTable dt = new DataTable();
                dt.Columns.Add("text", typeof(string));
                dt.Columns.Add("value", typeof(string));
                DataRow dr;
                DataView dv;

                for (int i = date; i >= 1990; i--)
                {
                    dr = dt.NewRow();
                    dr["text"] = i.ToString();
                    dr["value"] = i;
                    dt.Rows.Add(dr);
                }

                dr = dt.NewRow();
                dr["text"] = "--pilih--";
                dr["value"] = 0;
                dt.Rows.InsertAt(dr, 0);

                dv = new DataView(dt);
                cbbTahun.DataSource = dv;
                cbbTahun.TextField = "text";
                cbbTahun.ValueField = "value";
                cbbTahun.DataBind();
                cbbTahun.SelectedIndex = 0;

                gvClosingMonth.DataSource = bll.GetHistory();
                gvClosingMonth.DataBind();
            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
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
            log.Action = "Closing Month ";
            log.UserName = userName;

            try
            {

                Hashtable ht = new Hashtable();
                ht.Add("@bulan-int",Convert.ToInt32(cbbBulan.Value));
                ht.Add("@tahun-int",Convert.ToInt32(cbbTahun.Value));
                ht.Add("@user-varchar-99", Session["user"].ToString());

                bll.InsertData(ht);

                gvClosingMonth.DataSource = bll.GetHistory();
                gvClosingMonth.DataBind();

                ViewState["script"] = "<script>alert('closing bulan " + cbbBulan.SelectedItem.Text + " " + cbbTahun.SelectedItem.Value + " sukses'); </script>";

                log.Type = "S";
                log.Description = log.Action + "Sukses oleh id" + ' ' + userName;
            }

            catch (Exception ex)
            {
                ViewState["script"] = "<script>alert('closing bulan " + cbbBulan.SelectedItem.Text + " " + cbbTahun.SelectedItem.Value + " gagal'); </script>";
                log.Type = "E";
                log.Description = "Closing Month Gagal : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected void gvClosingMonth_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnHitungUlang")
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
                log.Action = "Hitung Ulang Closing Month ";
                log.UserName = userName;

                try
                {

                    var tahun = Convert.ToInt32(gvClosingMonth.GetRowValues(e.VisibleIndex, "tahun").ToString().Trim());
                    var bulan = Convert.ToInt32(gvClosingMonth.GetRowValues(e.VisibleIndex, "bulan").ToString().Trim());


                    bll.HitungUlangMonth(bulan,tahun);

                    gvClosingMonth.DataSource = bll.GetHistory();
                    gvClosingMonth.DataBind();

                    ViewState["script"] = "<script>alert('hitung ulang closing bulan " + cbbBulan.SelectedItem.Text + " " + cbbTahun.SelectedItem.Value + " sukses'); </script>";

                    log.Type = "S";
                    log.Description = log.Action + "Sukses oleh id" + ' ' + userName;

                }

                catch (Exception ex)
                {
                    ViewState["script"] = "<script>alert('hitung ulang closing bulan " + cbbBulan.SelectedItem.Text + " " + cbbTahun.SelectedItem.Value + " gagal'); </script>";
                    log.Type = "E";
                    log.Description = "Hitung Ulang Closing Month Gagal : " + ex.Message;
                }
                finally
                {
                    logBll.InsertActivity(log);
                }
            }
        }

        protected void gvClosingMonth_PageIndexChanged(object sender, EventArgs e)
        {
            gvClosingMonth.DataSource = bll.GetHistory();
            gvClosingMonth.DataBind();
        }



    }
}