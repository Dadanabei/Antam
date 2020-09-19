using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Kemitraan
{
    public class MonitoringMitraBll
    {
        DbHelper dh = new DbHelper();
        public DataTable getData(string branchCode )
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branchCode-varchar",branchCode);
            
            try
            {
                return dh.GetData("USP_KEMITRAAN_SELECT_MONITORING", ht);
            }
            catch (Exception)
            {
                
                throw;
            }
        }


        public DataTable getDataDetail(int mitraId, string tglMonitor)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@mitraId-int", mitraId);
            ht.Add("@tglMonitor-varchar", tglMonitor);
            try
            {
                return dh.GetData("USP_KEMITRAAN_SELECT_MONITORING_DETAIL", ht);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public int insertMonitoring(Hashtable parameter) {
            try
            {
                return dh.ExecuteNonQuery("USP_KEMITRAAN_INSERT_MONITORING_DETAIL", parameter);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
