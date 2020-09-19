using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Kemitraan;
using System.Collections;

namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class SuratPerjanjianPinjaman : System.Web.UI.Page
    {
        RealisasiBll bll = new RealisasiBll();
        protected void Page_Load(object sender, EventArgs e)
        {

            getData();
        }
        protected void getData() 
        {
           
            //string  proposal=Session["proposal"].ToString();
            //var pro="2016.PK-REG1.000004";
            var proposal = Request.QueryString["proposal"].ToString();
            //string proposal=pro.ToString();
            var data = bll.GetDetailPerjanjian(proposal);
           
            if(data.Rows.Count > 0)
            {

                var row = data.Rows[0];
                ViewState["AlamatCabang"] = row["branch_addr"];
                ViewState["region"] = row["region"];
                ViewState["NoRealisasi"]=row["NoRealisasi"];
                ViewState["TglRealisasi"] = row["TglRealisasi"];
                ViewState["BulanRealisasi"] = row["bulanRealisasi"];
                ViewState["ThnRealisasi"] = row["tahunRealisasi"];
                ViewState["DateRealisasi"] = row["DateRealisasi"];
                ViewState["NamaPic"] = row["NamaPic"];
                ViewState["alamatregion"] = row["branch_addr"];
                ViewState["NamaUsaha"] = row["company_name"];
                ViewState["AlamatUsaha"] = row["company_address"];
                ViewState["NamaRequestor"]=row["NamaRequestor"];
                ViewState["NoRequestor"] = row["noidentitas"];
                ViewState["AlamatRequestor"] = row["AlamatRequestor"];
                ViewState["NamaPenjamin"] = row["penjaminName"];
                ViewState["NilaiSetuju"] = string.Format( "Rp {0:#,##0}",row["NilaiSetuju"]);
                ViewState["TerbilangNilaiSetuju"] = Helper.Terbilang(Convert.ToInt32(row["NilaiSetuju"]));
                ViewState["NamaBank"] = row["nama_bank"];
                ViewState["NomorRekening"] = row["no_rekening"];
                ViewState["Bunga"] = row["SukuBUnga"];
                ViewState["TerbilangBunga"] = Helper.Terbilang(Convert.ToInt32(row["SukuBUnga"]));
                ViewState["Jangka"] = row["JangkaWaktu"];
                ViewState["TerbilangJangka"] = Helper.Terbilang(Convert.ToInt32(row["JangkaWaktu"]));
                ViewState["NamaPenjamin"] = row["penjaminName"];
                ViewState["NoSPPU"]=row["NoSPPU"];
                ViewState["JumlahBayar"]= string.Format("Rp {0:#,##0}",row["NilaiSetuju"]);
                //ViewState["NamaCabang"] = row[""];
                ViewState["Region"]=row["region"];              
                ViewState["JumlahPinjaman"] = string.Format("Rp {0:#,##0}",row["NilaiSetuju"]);
                ViewState["Tglreal"] = row["TglRealisasi"];
                ViewState["KotaRegion"] = row["KotaRegion"];
               // ViewState["NamaSuamiIstriDebitur"]=row[""];
                ViewState["NamaDebitur"]=row["NamaRequestor"];
               // ViewState["lamp"]=row[""];
                ViewState["JasaAdm"] = row["SukuBUnga"];
                ViewState["Grace"] = row["grace_period"];
                ViewState["TerbilangGrace"] = Helper.Terbilang(Convert.ToInt32(row["grace_period"]));
                ViewState["Jumlah Angsuran"] =string.Format("Rp {0:#,##0}",row["NilaiSetuju"]);
                ViewState["AlamatRegion"] = row["KotaRegion"];
                ViewState["telp"] = row["telp"];
            }
            
            string kotaa = ViewState["KotaRegion"].ToString();
            string kota = "TIDAK DIDEFINISIKAN";
            if(kotaa==kota)
            {
                ViewState["KotaRegion"] = " ";
            }
        }
    }
}