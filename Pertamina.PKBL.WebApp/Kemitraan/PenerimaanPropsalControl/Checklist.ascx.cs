using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal;
using Pertamina.PKBL.BLL;
using System.Data;
using System.Collections;
using System.Net;


namespace Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl
{
    public partial class Checklist : System.Web.UI.UserControl
    {
        ChecklistBll bll = new ChecklistBll();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();


                var userRoles = ((wcf_auth.GeneralUserProfile)SessionCheck.Check(Response, Session["userprofile"])).mRoleList;
                btnUpdate.Visible = RoleCheck.CheckRoleView(userRoles, "PK.Penerimaan.Edit");
            }
        }
        public void GetData()
        {
            Hashtable ht = new Hashtable();

            ht.Add("@mitra_id-int", Session["mitraid"]);

            var data = bll.getData(ht);

            if (data.Rows.Count > 0)
            {
                var detail = data.Rows[0];

                bool pasfoto = bool.Parse(detail["profile_photo_checked"].ToString());
                bool ktp = bool.Parse(detail["identification_checked"].ToString());
                bool pbb = bool.Parse(detail["residential_tax_checked"].ToString());
                bool npwp = bool.Parse(detail["tax_id_checked"].ToString());
                bool tandaPendaftaran = bool.Parse(detail["company_reg_letter_checked"].ToString());

                bool SuratIzinUsaha = bool.Parse(detail["industrial_permit_checked"].ToString());
                bool domisili = bool.Parse(detail["domicile_permit_checked"].ToString());
                bool DaftarPerdagangan = bool.Parse(detail["trade_permit_checked"].ToString());
                bool LaporanKeuangan = bool.Parse(detail["financial_report_checked"].ToString());
                bool FotoKegiatanUsaha = bool.Parse(detail["work_evidence_photo_checked"].ToString());

                bool Denah = bool.Parse(detail["location_map_checked"].ToString());
                bool Agunan = bool.Parse(detail["collateral_checked"].ToString());

                if (pasfoto)
                {
                    rbPasfotoAda.Checked = true;
                }
                else
                {
                    rbPasFotoTidak.Checked = true;
                }

                if (ktp)
                {

                    rbKTPAda.Checked = true;
                }
                else
                {
                    rbKTPTidak.Checked = true;
                }


                if (pbb)
                {
                    rbPBBAda.Checked = true;
                }
                else
                {
                    rbPBBTidak.Checked = true;
                }


                if (npwp)
                {
                    rbNPWPAda.Checked = true;
                }
                else
                {
                    rbNPWPTidak.Checked = true;
                }


                if (tandaPendaftaran)
                {
                    rbTandaPendaftaranAda.Checked = true;
                }
                else
                {
                    rbTandaPendaftaranTidak.Checked = true;
                }


                if (SuratIzinUsaha)
                {
                    rbSuratIzinUsahaAda.Checked = true;
                }
                else
                {
                    rbSuratIzinUsahaTidak.Checked = true;
                }


                if (domisili)
                {
                    rbSuratDomosiliAda.Checked = true;
                }
                else
                {
                    rbSuratDomosiliTidak.Checked = true;
                }


                if (DaftarPerdagangan)
                {
                    rbDaftarPerdaganganAda.Checked = true;
                }
                else
                {
                    rbDaftarPerdaganganTidak.Checked = true;
                }


                if (LaporanKeuangan)
                {
                    rbLaporanKeuanganAda.Checked = true;
                }
                else
                {
                    rbLaporanKeuanganTidak.Checked = true;
                }


                if (FotoKegiatanUsaha)
                {
                    rbFotoKegiatanUsahaAda.Checked = true;
                }
                else
                {
                    rbFotoKegiatanUsahaTidak.Checked = true;
                }


                if (Denah)
                {
                    rbDenahAda.Checked = true;
                }
                else
                {
                    rbDenahTidak.Checked = true;
                }


                if (Agunan)
                {
                    rbAgunanAda.Checked = true;
                }
                else
                {
                    rbAgunanTidak.Checked = true;
                }
            }
            else
            {
                SetDefaultCheck();
            }
        }

        private void SetDefaultCheck()
        {
            rbAgunanAda.Checked = true;
            rbDaftarPerdaganganAda.Checked = true;
            rbDenahAda.Checked = true;
            rbFotoKegiatanUsahaAda.Checked = true;
            rbKTPAda.Checked = true;
            rbLaporanKeuanganAda.Checked = true;
            rbNPWPAda.Checked = true;
            rbPasfotoAda.Checked = true;
            rbPBBAda.Checked = true;
            rbSuratDomosiliAda.Checked = true;
            rbSuratIzinUsahaAda.Checked = true;
            rbTandaPendaftaranAda.Checked = true;
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            bool pasfoto = false, ktp = false, pbb = false, npwp = false, tandaPendaftaran = false,
                SuratIzinUsaha = false, domisili = false, DaftarPerdagangan = false,
                LaporanKeuangan = false, FotoKegiatanUsaha = false, Denah = false, Agunan = false;

            if (rbPasfotoAda.Checked == true)
            {
                pasfoto = true;
            }
            else if (rbPasFotoTidak.Checked == true)
            {
                pasfoto = false;
            }


            if (rbKTPAda.Checked == true)
            {
                ktp = true;
            }
            else if (rbKTPTidak.Checked == true)
            {
                ktp = false;
            }


            if (rbPBBAda.Checked == true)
            {
                pbb = true;
            }
            else if (rbPBBTidak.Checked == true)
            {
                pbb = false;
            }


            if (rbNPWPAda.Checked == true)
            {
                npwp = true;
            }
            else if (rbNPWPTidak.Checked == true)
            {
                npwp = false;
            }


            if (rbTandaPendaftaranAda.Checked == true)
            {
                tandaPendaftaran = true;
            }
            else if (rbTandaPendaftaranTidak.Checked == true)
            {
                tandaPendaftaran = false;
            }


            if (rbSuratIzinUsahaAda.Checked == true)
            {
                SuratIzinUsaha = true;
            }
            else if (rbSuratIzinUsahaTidak.Checked == true)
            {
                SuratIzinUsaha = false;
            }


            if (rbSuratDomosiliAda.Checked == true)
            {
                domisili = true;
            }
            else if (rbSuratDomosiliTidak.Checked == true)
            {
                domisili = false;
            }


            if (rbDaftarPerdaganganAda.Checked == true)
            {
                DaftarPerdagangan = true;
            }
            else if (rbDaftarPerdaganganTidak.Checked == true)
            {
                DaftarPerdagangan = false;
            }


            if (rbLaporanKeuanganAda.Checked == true)
            {
                LaporanKeuangan = true;
            }
            else if (rbLaporanKeuanganTidak.Checked == true)
            {
                LaporanKeuangan = false;
            }


            if (rbFotoKegiatanUsahaAda.Checked == true)
            {
                FotoKegiatanUsaha = true;
            }
            else if (rbFotoKegiatanUsahaTidak.Checked == true)
            {
                FotoKegiatanUsaha = false;
            }


            if (rbDenahAda.Checked == true)
            {
                Denah = true;
            }
            else if (rbDenahTidak.Checked == true)
            {
                Denah = false;
            }


            if (rbAgunanAda.Checked == true)
            {
                Agunan = true;
            }
            else if (rbAgunanTidak.Checked == true)
            {
                Agunan = false;
            }


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
            log.Action = "update data checklist";
            log.UserName = userName;


            try
            {
                ht.Add("@profile_photo_checked-bit", pasfoto);
                ht.Add("@identification_checked-bit", ktp);
                ht.Add("@residential_tax_checked-bit", pbb);
                ht.Add("@tax_id_checked-bit", npwp);
                ht.Add("@company_reg_letter_checked-bit", tandaPendaftaran);
                ht.Add("@industrial_permit_checked-bit", SuratIzinUsaha);
                ht.Add("@domicile_permit_checked-bit", domisili);
                ht.Add("@trade_permit_checked-bit", DaftarPerdagangan);
                ht.Add("@financial_report_checked-bit", LaporanKeuangan);
                ht.Add("@work_evidence_photo_checked-bit", FotoKegiatanUsaha);
                ht.Add("@location_map_checked-bit", Denah);
                ht.Add("@collateral_checked-bit", Agunan);
                ht.Add("@mitra_id-int", Session["mitraid"]);
                ht.Add("@modified_by-varchar-64", Session["user"]);

                bll.updateData(ht);
                log.Type = "S";
                log.Description = log.Action + " mitra id " + Session["mitraid"].ToString() + " sukses oleh " + userName;
                GetData();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            catch (Exception ex)
            {
                log.Type = "E";
                log.Description = "update data checklist error : " + ex.Message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + HttpUtility.JavaScriptStringEncode(log.Description) + "');", true);
            }
            finally {
                logBll.InsertActivity(log);
            }
        }

    }
}