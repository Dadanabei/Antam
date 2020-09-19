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
    public class KartuPiutangBll
    {
        DbHelper dll = new DbHelper();

        public DataTable getData(string branchCode) {
            Hashtable ht = new Hashtable();
            ht.Add("@branchCode-varchar-4", branchCode);
            try
            {
                return dll.GetData("[USP_KEMITRAAN_SELECT_KARTU_PIUTANG]", ht);
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
        public DataTable getSuratPiutang(string proposal)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-99",proposal);
            try 
            {
                return dll.GetData("[SP_SuratPiutang]", ht);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

    }
}
