using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraGrid;
using DevExpress.Utils;
using Pertamina.PKBL.BLL.Akuntansi;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class DetailDiskonJasa : System.Web.UI.Page
    {
        DiskonJasaBll bll = new DiskonJasaBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               
            }
            GetData();

            
        }

        private void GetData()
        {
            Hashtable detail = new KartuPiutangDetailBll().getPrintKartuPiutang(Session["proposal_number"].ToString());
            DataRow data = (DataRow)detail["data"];

            Hashtable ht = new Hashtable();
            ht.Add("@proposaal_number-varchar-40", Session["proposal_number"].ToString());
            var detalKartu = bll.GetDetailDiskonJasa(ht);
            var diskon = bll.GetDiskonDiberikan(Session["proposal_number"].ToString());

            if(diskon.Rows.Count>0)
            {
                gvDetailDiskonJasa2.DataSource = diskon;
                gvDetailDiskonJasa2.DataBind();
               
            }
            if (data!=null)
            {
                lblKodeMitra2.Text = data["mitraid"].ToString();
                lblNama2.Text = data["requestor_name"].ToString();
                lblAlamat2.Text = data["requestor_address"].ToString();
                lblJtuhTempo2.Text = String.Format("per {0} bulan ", data["jatuhtempo_bulan"]);

                lblPinjaman2.Text = String.Format("{0:#,##}.00", Convert.ToDecimal(data["NilaiSetuju"]));
                lblTanggalRealisasi2.Text = DateTime.Parse(data["TglRealisasi"].ToString()).ToString("dd/MM/yyyy");
                lblTglJatuhTempo2.Text = data["maturityDate"].ToString();

                lblJangkaWaktu2.Text = String.Format("{0} Bulan", data["JangkaWaktu"]);
                lblGracePeriod2.Text = String.Format("{0} Bulan", data["grace_period"]);
                lblPersentaseJasa2.Text = String.Format("{0}%", data["SukuBUnga"]); 
            }
            

            gvDetailDiskonJasa.DataSource = detalKartu;
            gvDetailDiskonJasa.DataBind();
        }
        protected void gvDetailDiskonJasa_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCommandButtonEventArgs e)
        {
            int flag = Convert.ToInt32(gvDetailDiskonJasa.GetRowValues(e.VisibleIndex, "flag"));
            if (e.ButtonType == DevExpress.Web.ASPxGridView.ColumnCommandButtonType.Edit)
            {
                if (flag == 1)
                {
                    e.Visible = true;
                }
                else
                {
                    e.Visible = false;
                }

                e.Visible = RoleCheck.CheckRoleView(((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList, "AKUN.PK.DiskonJasa.Add");
            }
        }

        protected void gvDetailDiskonJasa_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
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
            log.Action = "Diskon Jasa";
            log.UserName = userName;

            try
            {

            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            Hashtable ht = new Hashtable();

            ht.Add("@proposal_number-varchar-40",Session["proposal_number"].ToString());
            ht.Add("@nominal-float",float.Parse(e.NewValues["Bunga"].ToString()));
            ht.Add("@angsuranKe-int", e.NewValues["AngsuranKe"].ToString());
            ht.Add("@tglDiskon-varchar-20", Convert.ToDateTime(e.NewValues["Tanggal"]).ToString("dd/MM/yyyy"));
            ht.Add("@branch_code-int",Convert.ToInt32(branchCode));
            ht.Add("@user-varchar-50", Session["user"].ToString());

            bll.InsertDiskon(ht);

            gvDetailDiskonJasa.JSProperties["cpIsUpdated"] = true;

            e.Cancel = true;
            gvDetailDiskonJasa.CancelEdit();
            

            log.Type = "S";
            log.Description = log.Action + " " + e.NewValues["mitra_id"].ToString() + " Sukses oleh id " + userName;

            GetData();


            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "Diskon Jasa error : " + ex.Message;
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }

        protected void gvDetailDiskonJasa_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            //if (e.Exception == null)
            //{
            //    gvDetailDiskonJasa.JSProperties["cpIsUpdated"] = true;
            //}
        }

        protected void gvDetailDiskonJasa2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.VisibleIndex >= 0)
            {
                e.Row.Cells[0].Text = ((e.VisibleIndex) + 1).ToString();
            }
        }

        protected void gvDetailDiskonJasa2_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            var diskon = bll.GetDiskonDiberikan(Session["proposal_number"].ToString());

            if (diskon.Rows.Count > 0)
            {
                gvDetailDiskonJasa2.DataSource = diskon;
                gvDetailDiskonJasa2.DataBind();

            }
        }

    }
}