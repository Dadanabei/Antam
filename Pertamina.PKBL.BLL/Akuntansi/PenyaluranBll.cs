using Pertamina.PKBL.DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pertamina.PKBL.BLL.Akuntansi
{
    public class PenyaluranBll
    {
        DbHelper dbHelper = new DbHelper();
        public string SetApproval(string sp, Hashtable parameters)
        {
            string err = string.Empty;
            try
            {
                dbHelper.ExecuteNonQuery2(sp, parameters);
            }
            catch (Exception e)
            {
                err = e.ToString();
            }
            return err;
        }

        public DataTable GetDatas(string branchCode)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@branch_code-int", branchCode);
            return dbHelper.GetData("[USP_BINALING_PENYALURAN_SELECT]", parameters);
        }
        public DataTable GetData(string sp, Hashtable parameter)
        {
            return dbHelper.GetData(sp, parameter);
        }

        public DataTable GetData2(string sp, Hashtable parameter)
        {
            return dbHelper.GetData2(sp, parameter);
        }
        public DataTable GetKueri(string query)
        {
            return dbHelper.GetDataQuery(query);

            
        }

    }

    public class Penyaluran
    {
        public int IdPemohon { get; set; }
        public string Nama { get; set; }
        public string No { get; set; }
        public decimal NilaiPengajuan { get; set; }
    }
}
