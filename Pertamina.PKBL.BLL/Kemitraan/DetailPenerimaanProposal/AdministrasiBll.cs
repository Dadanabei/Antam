using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal
{
    public class AdministrasiBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable getData(Hashtable parameters)
        {
            try
            {
                return dbHelper.GetData("[USP_KEMITRAAN_SELECT_ADMINISTRASI]", parameters);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public void updateData(Hashtable parameters)
        {
            try
            {
                dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_ENTRI_ADMINISTRASI]", parameters);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }
    }
}
