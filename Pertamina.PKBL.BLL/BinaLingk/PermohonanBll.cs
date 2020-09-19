using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.BLL.BinaLingk
{
    public class PermohonanBll
    {
        DbHelper dbHelper = new DbHelper();

        public string GetNoForm()
        {
            return "2016.BL-REG3.055180";
        }

        public DataTable GetData()
        {
            return dbHelper.GetData("[USP_BINALING_PERMOHONAN_SELECT]",new Hashtable());
        }

        public DataTable GetData(string branchCode)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@branch_code-int",branchCode);

            return dbHelper.GetData("[USP_BINALING_PERMOHONAN_SELECT]", parameters);
        }

        public int InsertData(Hashtable parameter)
        {
            return Convert.ToInt32(dbHelper.GetData("[USP_BINALING_PERMOHONAN_INSERT]", parameter).Rows[0]["id"]);
        }

        public void DeleteData(Hashtable paramater)
        {

        }

        public DataTable GetFilePath(string id)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@id-int", id);

            return dbHelper.GetData("[USP_BINALING_PERMOHONAN_GET_FILE]", parameters);

        }


        public void UpdateData(Hashtable parameter)
        {
            dbHelper.ExecuteNonQuery("[USP_BINALING_PERMOHONAN_UPDATE]", parameter);
        }

    }
}
