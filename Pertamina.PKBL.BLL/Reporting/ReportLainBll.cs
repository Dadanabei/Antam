using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Reporting
{
    public class ReportLainBll
    {
        DbHelper dh = new DbHelper();

        public DataTable reportDetailJurnal(Hashtable parameter) {

            return dh.GetData("USP_REPORTING_DETAIL_JURNAL", parameter);
        }


        public DataTable reportLihatDetailJurnal(string proposalNumber)
        {
            Hashtable parameter = new Hashtable();
            parameter.Add("@noref-varchar-99",proposalNumber);

            return dh.GetData("USP_REPORT_LIHAT_DETAIL_JURNAL", parameter);
        }

        public DataTable reportLihatDetailJurnalTable(string proposalNumber)
        {
            Hashtable parameter = new Hashtable();
            parameter.Add("@noref-varchar-99", proposalNumber);

            return dh.GetData("USP_JURNAL_GET_JURNAL_DETAIL", parameter);
        }
    }
}
