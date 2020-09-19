using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Akuntansi
{
   public  class PembayaranPKBll
    {
       DbHelper dbHelper = new DbHelper();

       public DataTable GetData(int branchCode)
       {
           Hashtable parameters = new Hashtable();
           parameters.Add("@branch_code-int", branchCode);
           return dbHelper.GetData("[USP_KEMITRAAN_PEMBAYARAN_SELECT]", parameters);
       }

       public DataTable GetDataDetail(int branchCode, string proposal_number)
       {
           Hashtable parameters = new Hashtable();
           parameters.Add("@branch_code-int", branchCode);
           parameters.Add("@proposal_number-varchar-99", proposal_number);
           return dbHelper.GetData("[USP_KEMITRAAN_PEMBAYARAN_SELECT_MITRA]", parameters);
       }

       public string InsertData(Hashtable parameters,bool isKoreksi)
       {
           try
           {
               if (!isKoreksi)
               {
                   return dbHelper.GetData("[USP_KEMITRAAN_PEMBAYARAN_BAYAR]", parameters).Rows[0][0].ToString();
               }
               else
               {
                   dbHelper.ExecuteNonQuery("[USP_KOREKSI_PEMBAYARAN]", parameters);
                   return "Koreksi";
               }
           }
           catch (Exception exc)
           {
               throw exc;
           }
       }

       public DataTable GetLawanAkun(string no_proposal)
       {
           Hashtable parameters = new Hashtable();
           parameters.Add("@proposal_number-varchar-99", no_proposal);

           return dbHelper.GetData("[USP_KEMITRAAN_PEMBAYARAN_SELECT_LAWAN_AKUN]", parameters);
       }

       public DataTable GetAkun(int branchCode,string proposal_number)
       {
           Hashtable parameters = new Hashtable();
           parameters.Add("@branch_code-int", branchCode);
           parameters.Add("@proposal_number-varchar-99",proposal_number);

           return dbHelper.GetData("[USP_KEMITRAAN_PEMBAYARAN_SELECT_AKUN]", parameters);
       }

       public DataTable GetDataKartu(string no_proposal)
       {
           //Hashtable parameters = new Hashtable();
           //parameters.Add("@proposal_number-varchar-99", no_proposal);

           Pertamina.PKBL.BLL.Akuntansi.KartuPiutangDetailBll kpBll = new KartuPiutangDetailBll();

           return kpBll.getKartuPiutang(no_proposal);//dbHelper.GetData("[USP_KEMITRAAN_SELECT_KARTU_PIUTANG_DETAIL]", parameters);
       }

       public object GetNilaiPelunasan(string proposal)
       {
           Hashtable ht = new Hashtable();

           ht.Add("@proposal_number-varchar-100", proposal);

           var data = dbHelper.GetData("USP_KEMITRAAN_PEMBAYARAN_GET_NILAI_LUNAS", ht);

           if(data.Rows.Count > 0)
           {
               return data.Rows[0][0];
           }
           else
           {
               return 0;
           }
       }
       public DataTable GetDaftarAngsuran(string noProposal)
       {
           Hashtable parameters= new Hashtable();
           parameters.Add("@proposalnumber-varchar-99",noProposal);

           var data = dbHelper.GetData("[USP_KEMITRAAN_DAFTAR_ANGSURAN]", parameters);

           var sisa = Convert.ToDecimal(data.Rows[0]["sisa"]);

           foreach (DataRow item in data.Rows)
           {
               if(!item["id"].ToString().Equals("0"))
               {
                   sisa -= Convert.ToDecimal(item["jumlah"]);
                   item["sisa"] = sisa;
               }
           }

           return data;
       }


       public DataTable GetComplementColumnValue(string proposalNumber)
       {
           var parameters = new Hashtable();
           parameters.Add("@proposalNumber-varchar-100",proposalNumber);

           return dbHelper.GetData("[USP_KEMITRAAN_PEMBAYARAN_SELECT_COMPLEMENT_COLUMN]", parameters);
       }
    }
}
