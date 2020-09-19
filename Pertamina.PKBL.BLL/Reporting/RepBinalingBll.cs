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
    public class RepBinalingBll
    {
        DbHelper dbHelper = new DbHelper();


        public DataTable getRepRealisasiBinaLing(Hashtable parameter) {
            return dbHelper.GetData("[USP_REPORT_BINALING_REALISASI]",parameter);
        }
        public DataTable getRepUsulanBinaling(Hashtable parameter) {
            return dbHelper.GetData("[USP_REPORT_BINALING_USULAN_PERMOHONAN]", parameter);
        }
    }
}
