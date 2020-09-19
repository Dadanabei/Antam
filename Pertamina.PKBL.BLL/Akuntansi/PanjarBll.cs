using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Akuntansi
{
    public class PanjarBll
    {
        DbHelper db = new DbHelper();

        public void InsertData (Hashtable parameters)
        {
            db.ExecuteNonQuery("[USP_PANJAR_INSERT]", parameters);
        }

        public DataTable GetData(int branchCode)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branchCode);

            return db.GetData("[USP_PANJAR_SELECT_DAFTAR]", ht);
        }
 
        public DataTable GetAkun(int branchCode)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branchCode);

            return db.GetData("[USP_PANJAR_SELECT_AKUN]", ht);
        }

        public DataTable GetLawanAkun(int program_id)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@program_id-int", program_id);

            return db.GetData("[USP_PANJAR_SELECT_LAWAN]", ht);
        }

        public DataTable GetDataPersetujuan(int branchCode, string Nopanjar)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branchCode);
            ht.Add("@Nopanjar-varchar-50", Nopanjar);

            return db.GetData("[USP_PANJAR_SELECT_DAFTAR_PERSETUJUAN]", ht);
        }

        public DataTable GetDataPerwab(int branchCode)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branchCode);

            return db.GetData("[USP_PANJAR_SELECT_DAFTAR_PERWAB]", ht);
        }

        public DataRow GetDataPerwabPersetujuan(int branchCode, string Nopanjar)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branchCode);
            ht.Add("@Nopanjar-varchar-50", Nopanjar);

            return db.GetData("[USP_PANJAR_SELECT_DAFTAR_PERWAB_PERSETUJUAN]", ht).Rows[0];
        }

        public void UpdateData (Hashtable parameters)
        {
            db.ExecuteNonQuery("[USP_PANJAR_UPDATE]", parameters);
        }

        public void InsertPersetujuan (Hashtable parameters)
        {
            db.ExecuteNonQuery("[USP_PANJAR_SETUJU]", parameters);
        }

        public void InsertPerwab (Hashtable parameters)
        {
            db.ExecuteNonQuery("[USP_PANJAR_PERWAB_INSERT]", parameters);
        }
    }
}
