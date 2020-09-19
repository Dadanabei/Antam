using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Collections;
using System.Data;


namespace Pertamina.PKBL.BLL.Kemitraan
{
    public class SinergiBUMNBll
    {
        DbHelper dh = new DbHelper();

        public DataTable getData(string branchCode) {
            Hashtable ht = new Hashtable();
            ht.Add("@branchCode-varchar",branchCode);

            try
            {
                return dh.GetData("USP_KEMITRAAN_SELECT_SINERGI_BUMN ", ht);
            }
            catch (Exception ex)
            {
                
                throw ex;
            }

            
        }

        public void insertSupplier(Hashtable parameter)
        {

            try
            {
                dh.ExecuteNonQuery("USP_KEMITRAAN_ENTRI_SUPPLIER", parameter);
            }
            catch (Exception Ex)
            {
                
                throw Ex;
            }
        }

        public DataTable getDataSupplier(int id) {
            Hashtable ht = new Hashtable();
            ht.Add("@id-int",id);

            try
            {
                return dh.GetData("[USP_KEMITRAAN_SELECT_DATA_SUPPLIER]", ht);
            }
            catch (Exception Ex)
            {
                
                throw;
            }
        
        }
    }
}
