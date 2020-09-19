using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Collections;

namespace Pertamina.PKBL.BLL
{
    public class ActivityLogBll
    {
        DbHelper dbHelper = new DbHelper();
        public void InsertActivity(ActivityLog log)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@UserName-nvarchar-150",log.UserName);
            ht.Add("@IPAddress-nvarchar-15", log.IPAddress);
            ht.Add("@HostName-nvarchar-150", log.HostName);
            ht.Add("@Action-nvarchar-50", log.Action);
            ht.Add("@Type-nchar-1", log.Type);
            ht.Add("@Description-nvarchar-max", log.Description);
            dbHelper.ExecuteNonQuery("[USP_INSERT_ACTIVITY_LOG]", ht);
        }
    }

    public class ActivityLog
    {
        public string UserName { get; set; }
        public string IPAddress { get; set; }
        public string HostName { get; set; }
        public string Action { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public DateTime LoggedDate { get; set; }
    }
}
