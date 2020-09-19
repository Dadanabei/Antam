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
    public class PenerimaanProposalBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable GetData(Hashtable parameters)
        {
            try
            {
                return dbHelper.GetData("[USP_KEMITRAAN_SELECT_PENERIMAAN_PROPOSAL]", parameters);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public DataTable GetData(string branchCode)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@branch_code-int", branchCode);
            try
            {
                return dbHelper.GetData("[USP_KEMITRAAN_SELECT_PENERIMAAN_PROPOSAL]", parameters);
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        public int InsertData(Hashtable parameters)
        {
            try
            {
                return dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_INSERT_PENERIMAAN_PROPOSAL]", parameters);
            }
            catch (Exception e)
            {
                //Exception ex = new Exception("Insert Data Gagal", e);
                //throw ex;
                throw e;
            }

        }

        public int UpdateData(Hashtable parameters) {
            try {

               return dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_UPDATE_PENERIMAAN_PROPOSAL]", parameters);
            }  
            catch(Exception ex){
                throw ex;
            }
        }

        public DataTable proposalPrint(string proposal_number)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-90", proposal_number);

            return dbHelper.GetData("[USP_KEMITRAAN_SELECT_DATA_PROPOSAL]", ht);

        }


    }
}

