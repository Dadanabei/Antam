using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Pertamina.PKBL.DAL;
using System.Collections;

namespace Pertamina.PKBL.BLL.Kemitraan
{
    public class DetailPenilaianProposalBll
    {
        DbHelper dh = new DbHelper();
        public DataTable getData(string proposal_number) {
            Hashtable ht = new Hashtable();
            ht.Add("@Proposal_number-varchar", proposal_number);

            try {
                return dh.GetData("[USP_KEMITRAAN_SELECT_PENILAIAN_PROPOSAL_DETAIL]", ht);
            }catch(Exception ex){
                throw ex;
            }
        }

        public void insertData(Hashtable parameters) {

            try
            {
                dh.ExecuteNonQuery("[USP_KEMITRAAN_INSERT_PENILAIAN_PROPOSAL_DETAIL]", parameters);
            }
            catch (Exception Ex)
            {
                
                throw Ex;
            }
        }

    }
}
