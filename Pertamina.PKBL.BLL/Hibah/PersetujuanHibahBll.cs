using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Hibah
{
    public partial class PersetujuanHibahBll
    {
        DbHelper dbHelper = new DbHelper();
        public DataTable GetData(string branchCode)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@branch_code-int", branchCode);
            try
            {
                return dbHelper.GetData("[USP_HIBAH_PERSETUJUAN_SELECT]", parameters);
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
                return dbHelper.ExecuteNonQuery("[USP_HIBAH_PERSETUJUAN_INSERT]", parameters);
            }
            catch (Exception e)
            {
                //Exception ex = new Exception("Insert Data Gagal", e);
                //throw ex;
                throw e;
            }

        }

        public int UpdateData(Hashtable parameters)
        {
            try
            {

                return dbHelper.ExecuteNonQuery("[USP_HIBAH_PERMOHONAN_UPDATE]", parameters);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
