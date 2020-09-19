using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.BLL.Akuntansi
{
    
    public class PengakuanMitraBermasalahBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable GetData(Hashtable parameters)
        {

            return dbHelper.GetData("[USP_PENGAKUAN_BERMASALAH_SELECT]", parameters);

        }

        public void UpdateBermasalah(string mitraId,string tglBermasalah)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@mitraid-int", mitraId.Trim());
            parameters.Add("@tglBermasalah-varchar-20", tglBermasalah.Trim());

            dbHelper.ExecuteNonQuery("[USP_PENGAKUAN_BERMASALAH_UPDATE]", parameters);
        }



    }
}
