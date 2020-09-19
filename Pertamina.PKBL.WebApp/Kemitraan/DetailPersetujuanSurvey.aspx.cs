using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using Pertamina.PKBL.BLL.Kemitraan;
using Pertamina.PKBL.BLL;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class DetailPersetujuanSurvey : System.Web.UI.Page
    {
        PersetujuanProposalBll bll = new PersetujuanProposalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
                deTglPersetujuan.Value = DateTime.Today;
                InitCombo();
                GetData();

                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnSimpan.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Persetujuan.Edit");
            }
            
            
        }

        private void GetData()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var id = Convert.ToInt32(Session["proposalID"]);
            var ret = bll.GetDetailPersetujuan(id);
          
            if (ret.Rows.Count > 0)
            {

                var data = ret.Rows[0];
                if (data["proposal_approved_at"] != DBNull.Value)
                {
                    deTglPersetujuan.Value = Convert.ToDateTime(data["proposal_approved_at"]);
                }
                
                txtNama.Text = data["requestor_name"].ToString();
                txtNoPenilaian.Text = data["NoForm"].ToString();
                txtAlamat.Text = data["requestor_address"].ToString();
                txtBunga.Text = data["SukuBUnga"].ToString();
                txtJangkaWaktu.Text = data["JangkaWaktu"].ToString();
                txtNilaiPengajuan.Text = data["requested_amount"].ToString();
                txtNoSrtPermohonan.Text = data["proposal_number"].ToString();
                txtKegunaan.Text = data["Kegunaan"].ToString();
                txtMaksimalKredit.Text = data["NilaiSetuju"].ToString();
                cbPinjamanModalKerja.Text = data["descr"].ToString();
                cbPinjamanModalKerja.Checked = true;

            }
            else
            {
                Response.Redirect("PersetujuanSurvey.aspx");
            }
        }

        private void InitCombo()
        {
            var branchCode = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mAuthObjectValueList.FirstOrDefault(t => t.mAuthObjectName == "REGION").Value1;
            var dt = new DataTable();
            dt.Columns.Add("text");
            dt.Columns.Add("value");

            var newrow = dt.NewRow();
            newrow["text"] = "Disetujui";
            newrow["value"] = "A";

            dt.Rows.Add(newrow);

            newrow = dt.NewRow();
            newrow["text"] = "Ditolak";
            newrow["value"] = "N";

            dt.Rows.Add(newrow);

            cbbSetuju.DataSource = dt;
            cbbSetuju.TextField = "text";
            cbbSetuju.ValueField = "value";
            cbbSetuju.DataBind();
            
            //var penyalur = (new BLL.DdlBll()).getComboSupplier(new Hashtable());
            var penyalur = (new BLL.DdlBll()).getComboSupplier(branchCode.ToString());

            cbbPenyalur.TextField = "supplier_name";
            cbbPenyalur.Value = "id";
            cbbPenyalur.DataSource = penyalur;
            cbbPenyalur.DataBind();
        }

        protected void btnSimpan_Click(object sender, EventArgs e)
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
            log.Action = "insert penyetujuan";
            log.UserName = userName;

            try
            {
                //int Kredit = Convert.ToInt32(txtMaksimalKredit.Text);
                if (true)//Kredit <= 75000000---Permen sekarang tidak boleh  lebih dari 75 juta
                {

                    Hashtable parameter = new Hashtable();
                    parameter.Add("@idProposal-int", Convert.ToInt32(Session["proposalID"]));
                    parameter.Add("@jangkaWaktu-int", txtJangkaWaktu.Text);
                    parameter.Add("@SukuBunga-decimal", txtBunga.Text);
                    parameter.Add("@nilaisetuju-float", Convert.ToDecimal(txtMaksimalKredit.Text));
                    parameter.Add("@status-char-1", cbbSetuju.Value.ToString());
                    parameter.Add("@tglSetuju-varchar-20",Convert.ToDateTime(deTglPersetujuan.Value).ToString("dd/MM/yyyy"));

                    bll.InsertPersetujuan(parameter);

                    Response.Redirect("PersetujuanSurvey.aspx");
                }
                else
                {
                    log.Type = "F";
                    log.Description = "insert penyetujuan proposal error : Nilai lebih besar dari Rp 75.000.000,00 ";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Nilai Persetujuan tidak boleh lebih dari Rp 75.000.000,00');", true);
                }
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "insert penyetujuan proposal error : " + ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally
            {
                logBll.InsertActivity(log);
            }
        }
    }
}