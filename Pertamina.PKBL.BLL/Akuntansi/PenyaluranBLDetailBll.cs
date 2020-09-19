using Pertamina.PKBL.DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pertamina.PKBL.BLL.Akuntansi
{
    public class PenyaluranBLDetailBll
    {
        DbHelper dbHelper = new DbHelper();
        public DataTable GetDataSaldo(string Cabang,int program)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@Cabang-smallint", Cabang);
            parameters.Add("@idProgram-int", program);
            return dbHelper.GetData("[USP_SALDO_SELECT]", parameters);
        }

        public DataTable GetDetailPenyaluran(int idPermohonan)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@idPermohonan-int", idPermohonan);
            return dbHelper.GetData("[USP_BINALING_PENYALURAN_SELECT_DETAIL]", parameters);
        }

        public void InsertData(Hashtable parameters)
        {
            try
            {
                dbHelper.ExecuteNonQuery("[USP_BINALING_PENYALURAN_INSERT]", parameters);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public DataTable GetDataLawanAkun(int jenisBinalingId)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@BLKind-int", jenisBinalingId);

            return dbHelper.GetData("[USP_BINALING_PENYALURAN_GET_LAWANAKUN]", parameters);
        }

        public DataTable GetDataLawanAkunByBinalingID(int binalingID)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@bl_id-int", binalingID);

            return dbHelper.GetData("[USP_BINALING_PENYALURAN_GET_LAWANAKUN_BY_BINALING]", parameters);
        }

        public decimal GetSisaPenyaluran(int binalingId)
        {
            //USP_BINALING_PENYALURAN_GET_SISA
            Hashtable parameters = new Hashtable();
            parameters.Add("@bl_id-int", binalingId);

            return Convert.ToDecimal(dbHelper.GetData("[USP_BINALING_PENYALURAN_GET_SISA]", parameters).Rows[0]["sisa"].ToString());
        }
    }
}
