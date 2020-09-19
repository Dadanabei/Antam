using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Akuntansi
{
    public class UploadPembayaranKemitraanBll
    {
        DbHelper dh = new DbHelper();

        public DataTable PreviewUploadPembayaran(DataTable uploadData)
        {
            DataTable wrapedData = new DataTable();

            wrapedData.Columns.Add("nomitra");
            wrapedData.Columns.Add("nilaibayar");

            foreach (DataRow item in uploadData.Rows)
            {
                var nr = wrapedData.NewRow();

                nr["nomitra"] = item["NoMitra"];
                nr["nilaibayar"] = item["NominalBayar"];

                wrapedData.Rows.Add(nr);
            }

            Hashtable parameter = new Hashtable();

            parameter.Add("@data-structured", wrapedData);

            return dh.GetData("[USP_UPLOAD_PEMBAYARAN_KEMITRAAN_PREVIEW]", parameter);
        }

        public DataTable GetAkun(int branchCode)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@branch_code-int", branchCode);

            return dh.GetData("[USP_UPLOAD_PEMBAYARAN_KEMITRAAN_SELECT_AKUN]", parameters);

        }

        public void UploadPembayaran(Hashtable parameter,DataTable uploadData)
        {
            DataTable wrapedData = new DataTable();

            wrapedData.Columns.Add("nomitra");
            wrapedData.Columns.Add("nilaibayar");

            foreach (DataRow item in uploadData.Rows)
            {
                var nr = wrapedData.NewRow();

                nr["nomitra"] = item["NoMitra"];
                nr["nilaibayar"] = item["NominalBayar"];

                wrapedData.Rows.Add(nr);
            }

            parameter.Add("@data-structured", wrapedData);

            dh.ExecuteNonQuery("[USP_UPLOAD_PEMBAYARAN_KEMITRAAN]", parameter);

        }


        public DataTable GetLawanAkun()
        {

            return dh.GetData("[USP_UPLOAD_PEMBAYARAN_SELECT_LAWAN_AKUN]", new Hashtable());
        }
    }
}
