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
    public class PerhitunganBungaPinjamanBll
    {
        DbHelper dh = new DbHelper();

        public DataTable getData(Hashtable parameter) {

            try
            {
                parameter.Add("@bulanJatuhTempo-int", 1);
                return dh.GetData("USP_KEMITRAAN_SELECT_PERHITUNGAN_BUNGA", parameter);
            }
            catch (Exception Ex)
            {
                
                throw Ex;
            }
        }
    }
}
