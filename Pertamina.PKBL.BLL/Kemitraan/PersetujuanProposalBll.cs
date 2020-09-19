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
    public class PersetujuanProposalBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable GetPersetujuan(string branchCode)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int",branchCode);
            return dbHelper.GetData("[USP_KEMITRAAN_PERSETUJUAN_SELECT]", ht);
        }

        public DataTable GetDetailPersetujuan(int idProposal)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@idProposal-int", idProposal);

            return dbHelper.GetData("[USP_KEMITRAAN_SELECT_PERSETUJUAN_DETAIL]", ht);

        }

        public void InsertPersetujuan(Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_PERSETUJUAN_INSERT]", parameters);
        }

    }
}
