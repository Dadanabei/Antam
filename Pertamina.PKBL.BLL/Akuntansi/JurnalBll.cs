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
    public class JurnalBll
    {
        DbHelper dbHelper = new DbHelper();
        public DataTable DetailTable
        {
            get
            {
                return GetTableTemplate().Clone();
            }
        }

        public string NoRefJurnal(string branchCode)
        {
            return dbHelper.GetDataQuery("select dbo.UFC_KEMITRAAN_NOREF_JURNAL_UMUM (" + branchCode + ")").Rows[0][0].ToString();
        }
        public string NoRefJurnalKasBank(string branchCode)
        {
            return dbHelper.GetDataQuery("select dbo.UFC_KEMITRAAN_NOREF_JURNAL_KASBANK (" + branchCode + ")").Rows[0][0].ToString();
        }
        public string NoRefJurnalPenyesuaian(string branchCode)
        {
            return dbHelper.GetDataQuery("select dbo.UFC_KEMITRAAN_NOREF_JURNAL_ADJUSTMENT (" + branchCode + ")").Rows[0][0].ToString();
        }



        private DataTable GetTableTemplate()
        {
            DataTable template = new DataTable();
            DataColumn pk = new DataColumn("id",typeof(string));

            template.Columns.Add(pk);
            template.Columns.Add("COA");
            template.Columns.Add("Debet",typeof(decimal));
            template.Columns.Add("Kredit", typeof(decimal));
            template.Columns.Add("NamaCoa");
            template.Columns.Add("Deskripsi");

            DataColumn[] key = new DataColumn[1];

            key[0] = pk;
            template.PrimaryKey = key;


            return template;
        }


        /// <summary>
        /// method untuk insert jurnal
        /// <para>tabel detail jurnalnya bisa diambil dari Properti DetailTable</para>
        /// </summary>
        /// <param name="parameters"></param>
        public bool InsertJurnal(Hashtable parameters)
        {
            var detail = (DataTable)parameters["@details-structured"];

            decimal d = 0;
            decimal k = 0;

            foreach (DataRow item in detail.Rows)
            {
                d += Convert.ToDecimal(item["Debet"]);
                k += Convert.ToDecimal(item["Kredit"]);
            }
            if (d == k)
            {
                detail.PrimaryKey = null;
                detail.Columns.Remove("id");
                detail.Columns.Remove("NamaCoa");
                parameters["@details-structured"] = detail;
                dbHelper.ExecuteNonQuery("[USP_JURNAL_INSERT_WITH_NOREF]", parameters);
                return true;
            }
            else
            {
                return false;
            }
            
        }

        public void PostingJurnal(string noBukti,string user)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@NoBukti-nvarchar-30", noBukti);
            parameters.Add("@user-varchar-99", user);

            dbHelper.ExecuteNonQuery("[USP_JURNAL_POSTING_POST]", parameters);
        }

        public DataTable GetDetailByNoBukti(string noBukti)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@NoBukti-varchar-30", noBukti);

            return dbHelper.GetData("[USP_JURNAL_SELECT_DETAIL]", parameters);

        }

        public DataTable GetJurnal(string branchCode)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-varchar-30", branchCode);

            return dbHelper.GetData("[USP_JURNAL_POSTING_SELECT]", parameters);

        }

        public DataTable GetJurnal(Hashtable parameters)
        {

            return dbHelper.GetData("[USP_JURNAL_POSTING_SELECT]", parameters);

        }

        public DataTable GetNamaAkun(int index0, int index1, int index2, int index3)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@kodejenis0-int", index0);
            parameters.Add("@kodejenis1-int", index1);
            parameters.Add("@kodejenis2-int", index2);
            parameters.Add("@kodejenis3-int", index3);

            return dbHelper.GetData("[USP_JURNAL_UMUM_SELECT_AKUN]", parameters);

        }

        public DataTable GetPembayaran(int index0, int index1, int index2)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@JnsProgram0-int", index0);
            parameters.Add("@JnsProgram1-int", index1);
            parameters.Add("@JnsProgram2-int", index2);

            return dbHelper.GetData("[USP_JENIS_PEMBAYARAN_SELECT]", parameters);

        }

        public DataTable GetAkunKasBank(int jenis, string branchCode)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);
            parameters.Add("@jenis-int", jenis);

            return dbHelper.GetData("[USP_JURNAL_KASBANK_SELECT_AKUN]", parameters);

        }

        public DataTable GetDataJurnalUmum(int branchCode, string tglMulai, string tglSampai, int program_id, string NoBukti)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);
            parameters.Add("@tglMulai-varchar-20", tglMulai);
            parameters.Add("@tglSampai-varchar-20", tglSampai);
            parameters.Add("@program_id-int", program_id);
            parameters.Add("@NoBukti-varchar-40", NoBukti);


            return dbHelper.GetData("[USP_JURNAL_UMUM_SELECT_JURNAL]", parameters);

        }

        public DataTable GetDataJurnalAdjusment(int branchCode, string tglMulai, string tglSampai, int program_id, string NoBukti)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);
            parameters.Add("@tglMulai-varchar-20", tglMulai);
            parameters.Add("@tglSampai-varchar-20", tglSampai);
            parameters.Add("@program_id-int", program_id);
            parameters.Add("@NoBukti-varchar-40", NoBukti);


            return dbHelper.GetData("[USP_JURNAL_ADJUSMENT_SELECT_JURNAL]", parameters);

        }

        public DataTable GetDataJurnalKasBank(int branchCode, string tglMulai, string tglSampai, int program_id, string NoBukti)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);
            parameters.Add("@tglMulai-varchar-20", tglMulai);
            parameters.Add("@tglSampai-varchar-20", tglSampai);
            parameters.Add("@program_id-int", program_id);
            parameters.Add("@NoBukti-varchar-40", NoBukti);


            return dbHelper.GetData("[USP_JURNAL_KASBANK_SELECT_JURNAL]", parameters);

        }

        public DataTable GetPreviewJurnal(DataTable dt)
        {
            Hashtable parameter = new Hashtable();
            dt.PrimaryKey = null;
            dt.Columns.Remove("id");
            dt.Columns.Remove("NamaCoa");
            parameter.Add("@detail-structured", dt);

            return dbHelper.GetData("[USP_JURNAL_PREVIEW]", parameter);

        }

        public Hashtable GetJurnalByNoRef(string noRef)
        {
            Hashtable ht = new Hashtable();


            Hashtable parameters = new Hashtable();

            parameters.Add("@noref-varchar-99",noRef);

            var master = dbHelper.GetData("[USP_JURNAL_GET_JURNAL_MASTER]", parameters).Rows[0];

            var detail = dbHelper.GetData("[USP_JURNAL_GET_JURNAL_DETAIL]", parameters);

            ht.Add("master", master);
            ht.Add("detail", detail);

            return ht;

        }

        public void InsertKoreksi (Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_JURNAL_KOREKSI]", parameters);
        }

        
        public void EditKeterangan (Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_JURNAL_EDIT_KETERANGAN]", parameters);
        }

        public void EditDetailKeterangan(Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_JURNAL_DETAIL_EDIT_KETERANGAN]", parameters);
        }

    }
}
