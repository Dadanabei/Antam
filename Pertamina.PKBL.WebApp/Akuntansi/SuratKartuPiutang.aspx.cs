using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pertamina.PKBL.BLL.Akuntansi;
using Helper;

namespace Pertamina.PKBL.WebApp.Akuntansi
{
    public partial class SuratKartuPiutang : System.Web.UI.Page
    {
        KartuPiutangBll bll = new KartuPiutangBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
        }
        protected void GetData()
        {
            string proposal = "";

            if(Request.QueryString["prop"] != null)
            {
                proposal = Request.QueryString["prop"].ToString();
            }
            else if (Session["proposal_number"] != null && Request.QueryString["prop"] == null)
            {
                proposal = Session["proposal_number"].ToString();
            }
            
           // string proposal = "21102237";
            var data= bll.getSuratPiutang(proposal);
            if(data.Rows.Count>0)
            {
                var row = data.Rows[0];
                  
                ViewState["KotaRegion"]=row["kota_lengkap"] ;
                ViewState["TanggalSurat"] = Convert.ToDateTime(row["tanggal"]).ToStringIndonesia("dd MMMM yyyy");
                ViewState["NoRequestor"]=row["noDebitur"];
                ViewState["NamaRequestor"]=row["namaa"];
                ViewState["AlamatRequestor"]=row["alamat"];
                ViewState["KabupatenRegion"]=row["city_name"];
                ViewState["ProvinsiRegion"]=row["province_name"];
                ViewState["NoProposal"]=row["no_sppu"];
                ViewState["tglProposal"] = Convert.ToDateTime(row["registration_date"]).ToStringIndonesia("dd MMMM yyyy");
                ViewState["Region"]=row["branch_name"];
                ViewState["JumlahPinjaman"]=string.Format("Rp {0:#,##0}", row["NilaiSetuju"]);
                ViewState["JumlahJasa"]= string.Format ("Rp {0:#,##0}",row["JumlahBunga"]);
                ViewState["TotalPinjamJasa"] = string.Format("Rp {0:#,##0}", row["TotalHutang"]);
                ViewState["JumlahBayar"] = string.Format("Rp {0:#,##0}", row["BayarPokok"]);
                ViewState["JumlahBayarJasa"] = string.Format("Rp {0:#,##0}", row["BayarBunga"]);
                ViewState["TotalBayarJasa"]=string.Format("Rp {0:#,##0}", row["TotalBayar"]);
                ViewState["SisaBayar"] = string.Format("Rp {0:#,##0}", row["SisaPokok"]);
                ViewState["SisaJasa"]= string.Format("Rp {0:#,##0}", row["SisaBunga"]);
                ViewState["TotalSisaPokokJasa"]=string.Format("Rp {0:#,##0}", row["SisaTotalBayar"]);
                ViewState["Todaydate"] = Convert.ToDateTime(row["tanggal"]).ToStringIndonesia("dd MMMM yyyy"); ;
                ViewState["TglLastPaid"]=row["TglTerakhirBayar"];
                ViewState["Pic"] = row["head_of_branch"];
                ViewState["AlamatRegion"] = row["address1"];
                ViewState["fak"] = row["facs"];
                ViewState["regionname"] = row["nama"];
                ViewState["jabatann"] = row["jabatan"];
                ViewState["branch_code"] = row["branch_code"];
                ViewState["rekening"] = row["rekening"];
                ViewState["TelpRegion"] = row["telp"];
                ViewState["tglSelambat"] = Convert.ToDateTime(row["tglSelambat"]).ToStringIndonesia("dd MMMM yyyy");

                decimal tPokok = (Convert.ToDecimal(row["tunggakanPokok"])>=0)?Convert.ToDecimal(row["tunggakanPokok"]):0;
                decimal tBunga = (Convert.ToDecimal(row["tunggakanBunga"]) >= 0) ? Convert.ToDecimal(row["tunggakanBunga"]) : 0;

                ViewState["tunggakanPokok"] = string.Format("Rp {0:#,##0}", tPokok);
                ViewState["tunggakanBunga"] = string.Format("Rp {0:#,##0}", tBunga);
                ViewState["totalTunggakan"] = string.Format("Rp {0:#,##0}",  tPokok + tBunga );

            }
        }
    }
}