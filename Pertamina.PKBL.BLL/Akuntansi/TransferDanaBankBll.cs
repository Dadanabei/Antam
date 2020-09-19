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
    public class TransferDanaBankBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable InsertData(Hashtable ht)
        {
           return dbHelper.GetData("[USP_TRANSFER_DANA_BANK]", ht);
        }

        

        public DataTable GetKantorCabang(int branchCode)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);

            return dbHelper.GetData("[USP_KANTOR_CABANG_SELECT_CABANG]", parameters);
        }


        public DataTable GetNamaAkunPengirim(int branchCode, int program_id)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);
            parameters.Add("@program_id-int", program_id);

            return dbHelper.GetData("[USP_TRANSFER_DANA_BANK_SELECT_AKUN_PENGIRIM]", parameters);
        }

        public DataTable GetNamaAkunPenerima(int branchCode, int program_id)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code_pengirim-int", branchCode);
            parameters.Add("@program_id-int", program_id);

            return dbHelper.GetData("[USP_TRANSFER_DANA_BANK_SELECT_AKUN_PENERIMA]", parameters);
        }

        public DataTable GetJurnal(string tglMulai,string tglAkhir,string branchCode)
        {
            Hashtable parameters = new Hashtable();



            parameters.Add("@tglMulai-varchar-20", tglMulai);
            parameters.Add("@tglAkhir-varchar-20", tglAkhir);
            parameters.Add("@branch_code-int", branchCode);

            return dbHelper.GetData("[USP_TRANSFER_DANA_BANK_SELECT_JURNAL]", parameters);
        }
    }
}
