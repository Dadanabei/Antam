using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Administer
{
    public class VerifikasiBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable GetData(int branchCode)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);

            return dbHelper.GetData("[USP_SELECT_VERIVIKATOR]", parameters);

        }

    }
}
