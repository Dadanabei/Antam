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
    public class DownloadMasterBll
    {
        DbHelper db = new DbHelper();

        public DataTable GetData(string masterName)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@masterName-varchar-50",masterName);

            return db.GetData("[USP_DOWNLOAD_MASTER]", parameters);
        }
    }
}
