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
    
    public class PencairanBll
    {
        DbHelper dbHelper = new DbHelper();
        public  DataTable GetData(string branchCode)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@branch_code-int",branchCode);

            return dbHelper.GetData("[USP_KEMITRAAN_PENCAIRAN_SELECT]", parameters);
        }
    }
}
