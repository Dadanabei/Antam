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
    public class PengembalianKelebihanBll
    {
        DbHelper dh = new DbHelper();
        public DataTable GetData (Hashtable parameters)
        {
            return dh.GetData("[USP_PENGEMBALIAN_SELECT_MITRA]", parameters);
        }

        public DataTable SelectAkun(int branchCode,int sektor)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code_pengirim-int", branchCode);
            ht.Add("@sektor-int",sektor);

            return dh.GetData("[USP_PENGEMBALIAN_SELECT_AKUN_KAS_BANK]", ht);
        }

        public DataTable SelectLawan(int branchCode, int sektor)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code_pengirim-int", branchCode);
            ht.Add("@sektor-int", sektor);

            return dh.GetData("[USP_PENGEMBALIAN_SELECT_AKUN_ANGSURAN]", ht);
        }

        public DataRow GetDetailData (string proposal_number)
        {
                Hashtable parameters = new Hashtable();
                parameters.Add("@proposal_number-varchar-50", proposal_number);

                return dh.GetData("USP_PENGEMBALIAN_SELECT_DETAIL", parameters).Rows[0];
        }


        public void InsertPengembalian(Hashtable parameters)
        {
            dh.ExecuteNonQuery("[USP_INSERT_PENGEMBALIAN]", parameters);
        }
    }
}
