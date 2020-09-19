using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.BinaLingk
{
    public class UploadPenyaluranBLBll
    {
        DbHelper dbHelper = new DbHelper();

        public void UploadData(Hashtable parameters, DataTable data)
        {
            try
            {
                data.Columns.Add("id", typeof(int)).SetOrdinal(0);
            }
            catch (Exception e)
            {

            }

            data.Columns["NomorProposal"].SetOrdinal(data.Columns.Count - 1);

            for (int i = 0; i < data.Rows.Count; i++)
            {
                data.Rows[i]["id"] = i+1;
            }

            parameters.Add("@data-structured", data);

            dbHelper.ExecuteNonQuery("[USP_UPLOAD_PENCAIRAN_BINALINGKUNGAN]", parameters);
        }

        

    }
}
