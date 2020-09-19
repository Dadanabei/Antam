using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;
using Pertamina.PKBL.DAL;
using System.IO;

namespace Pertamina.PKBL.BLL.BinaLingk
{
    public class CheckListBll
    {
        DbHelper dbHelper = new DbHelper();
        public DataTable GetCurrent(string id)
        {
            Hashtable parameter = new Hashtable();
            parameter.Add("@id-int",id);
            return dbHelper.GetData("[USP_BINALING_GETCHECKLIST]",parameter); 
        }
        public void SetData(Hashtable parameter)
        {
            dbHelper.ExecuteNonQuery("[USP_BINALING_CHECKLIST_INSERT]",parameter);
        }

        public void SetData(Hashtable parameter, Hashtable file)
        {
            dbHelper.ExecuteNonQuery("[USP_BINALING_CHECKLIST_INSERT]", parameter);

        }
        public void SetWithOutFile(Hashtable parameter)
        {
            dbHelper.ExecuteNonQuery("[USP_BINALING_CHECKLIST_INSERT_NO_FILE]", parameter);
        }

    }
}
