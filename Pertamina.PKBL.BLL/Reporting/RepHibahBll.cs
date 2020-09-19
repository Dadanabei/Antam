using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Reporting
{
    public class RepHibahBll
    {
        DbHelper dbHelper = new DbHelper();


        public DataTable getRepRealisasiBinaLing(Hashtable parameter) {
            return dbHelper.GetData("[USP_REPORTING_REALISASI_PROGRAM_HIBAH]", parameter);
        }
    }
}
