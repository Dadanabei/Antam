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
    public class ClosingBll
    {
        DbHelper db = new DbHelper();

        public DateTime GetLastClose()
        {
            return Convert.ToDateTime(db.GetDataQuery("select dbo.ufc_get_last_close()").Rows[0][0]);
        }

        public void InsertData(Hashtable parameters)
        {

             db.ExecuteNonQuery("[USP_CLOSING_MONTH_NEW]",parameters);
        }

        public void HitungUlangMonth(int bulan,int tahun)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@tahun-int", tahun);
            parameters.Add("@bulan-int", bulan);

            db.ExecuteNonQuery("[USP_CLOSING_MONTH_HITUNG_ULANG]", parameters);
        }

        public void HitungUlangKolekti(int bulan, int tahun)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@tahun-int", tahun);
            parameters.Add("@bulan-int", bulan);

            db.ExecuteNonQuery("[USP_CLOSING_KOLEKTI_HITUNG_ULANG]", parameters);
        }

        public DataTable GetHistory()
        {
            Hashtable ht = new Hashtable();
            return db.GetData("USP_CLOSING_GET_HISTORY", ht);
        }

        public DataTable GetHistoryKolekti()
        {
            Hashtable ht = new Hashtable();
            return db.GetData("[USP_CLOSING_KOLEKTI_GET_HISTORY]", ht);
        }

        public void Kolektabilitas(int bulan,int tahun)
        {
            
            
            

            Hashtable ht = new Hashtable();


            ht.Add("@kualitasPerbulan-int",bulan);
            ht.Add("@kualitasPertahun-int",tahun);

            db.ExecuteNonQuery("USP_REPORT_PERKEMBANGAN_insert", ht);
        }
    }
}
