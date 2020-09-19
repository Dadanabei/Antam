using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Administer
{
    public class TemplateBll
    {
        DbHelper dbHelper = new DbHelper();
        
        public DataTable GetTemplateList()
        {
            return dbHelper.GetData("[USP_SELECT_TEMPLATE_LIST]", new Hashtable());
        }

        public void InsertTemplate(Hashtable parameter)
        {
            dbHelper.ExecuteNonQuery("[USP_UPLOAD_TEMPLATE]", parameter);
        }

        public DataTable DownloadTemplate(string templateName)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@templateName-varchar-100", templateName);

            return dbHelper.GetData("[USP_DOWNLOAD_TEMPLATE]", parameters);
        }


    }
}
