using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using Pertamina.PKBL.DAL;
using System.Data;

namespace Pertamina.PKBL.BLL.Kemitraan
{
    public class JadwalPembayaranBll
    {
        DbHelper dh = new DbHelper();
        public DataTable getData(string branchCode) {
            Hashtable ht = new Hashtable();
            ht.Add("@branchCode-varchar-4", branchCode);

            try
            {
                return dh.GetData("[USP_KEMITRAAN_SELECT_JADWAL_PEMBAYARAN]", ht);
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }


        public Hashtable PrintJadwalAngsuranItems(string proposal,string branch)
        {
            Hashtable ht = new Hashtable();

            Hashtable tbl = new Hashtable();
            Hashtable footer = new Hashtable();

            tbl.Add("@proposal_number-varchar-100",proposal);
            footer.Add("@branch_code-int",branch.Trim());

            var tabel = dh.GetData("[USP_KEMITRAAN_PRINT_JADWAL_ANGSURAN]", tbl);
            var footerres = dh.GetData("[USP_KEMITRAAN_PRINT_JADWAL_ANGSURAN_FOOTER]", footer);

            ht.Add("tabel", tabel);
            ht.Add("footer", footerres);

            return ht;
        }
    }
}
