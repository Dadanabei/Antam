using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal
{
    public class FilesBll
    {
        DbHelper dbHelper = new DbHelper();

        public void updateData(Hashtable parameters)
        {
            try
            {
                dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_ENTRI_FILES]", parameters);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public DataTable getData(Hashtable parameters)
        {
            try
            {
                return dbHelper.GetData("[USP_KEMITRAAN_SELECT_FILES]", parameters);
            }catch(Exception ex){
                throw ex;
            }
        }
        //public string getFileName(int id)
        //{
        //    Hashtable parameters = new Hashtable();
        //    parameters.Add("@mitra_id-int", id);

        //    var data = dbHelper.GetData("[USP_KEMITRAAN_SELECT_FILES]", parameters);
        //    if (data.Rows.Count > 0)
        //    {
        //        return data.Rows[0]["uploaded_file"].ToString();
        //    }
        //    else {
        //        return null;
        //    }
        //}
    }
}
