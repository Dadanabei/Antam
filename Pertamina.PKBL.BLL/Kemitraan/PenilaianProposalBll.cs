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
    public class PenilaianProposalBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable getData(Hashtable parameter) {
            try {
                return dbHelper.GetData("[USP_KEMITRAAN_SELECT_PENILAIAN_PROPOSAL]",parameter);
            }catch(Exception ex){
                throw ex;
            }
        }

        public DataTable getData(string branchcode) {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-varchar-4", branchcode);
            try
            {
                return dbHelper.GetData("[USP_KEMITRAAN_SELECT_PENILAIAN_PROPOSAL]", ht);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        
        }


    }
}
