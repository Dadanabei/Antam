using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;
namespace Pertamina.PKBL.BLL.Kemitraan
{
    
    
    public class ReschedulePiutangKemitraanBll
    {
        DbHelper dh = new DbHelper();
        public DataTable getData(string branchCode) {
            Hashtable ht = new Hashtable();
            ht.Add("@branchCode-varchar-4",branchCode);
            return dh.GetData("[USP_KEMITRAAN_SELECT_RESCHEDULE]", ht);
        }
    }
}
