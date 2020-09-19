using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Kemitraan
{
    public class UploadRealisasiKemitraanBll
    {
        DbHelper dh = new DbHelper();



        public void UploadPencairan(Hashtable parameter,DataTable uploadData)
        {

            DataTable wrapedData = new DataTable();

            wrapedData.Columns.Add("id");
            wrapedData.Columns.Add("Nama");
            wrapedData.Columns.Add("Tempatlahir");
            wrapedData.Columns.Add("Tgllahir");
            wrapedData.Columns.Add("NoKTP");
            wrapedData.Columns.Add("NoAnggota");
            wrapedData.Columns.Add("Alamat");
            wrapedData.Columns.Add("Kecamatan");
            wrapedData.Columns.Add("Kotakab");
            wrapedData.Columns.Add("Pendidikanterakhir");
            wrapedData.Columns.Add("Pekerjaan");
            wrapedData.Columns.Add("StatusPernikahan");
            wrapedData.Columns.Add("NamaIbuKandung");
            wrapedData.Columns.Add("NamaPenjamin");
            wrapedData.Columns.Add("NoKTPPenjamin");
            wrapedData.Columns.Add("Tmptlahirpenjamin");
            wrapedData.Columns.Add("TgllahirPenjamin");
            wrapedData.Columns.Add("PekerjaanPenjamin");
            wrapedData.Columns.Add("CIF");
            wrapedData.Columns.Add("Rekening");
            wrapedData.Columns.Add("LuasTanah");
            wrapedData.Columns.Add("Pinjaman");
            wrapedData.Columns.Add("Telfon");

            int i = 0;

            foreach (DataRow item in uploadData.Rows)
            {

                var nr = wrapedData.NewRow();

                nr["id"] = ++i;
                nr["Nama"] = item["NamaKTP"];
                nr["Tempatlahir"] = item["Tempatlahir"];
                nr["Tgllahir"] = item["Tgllahir"];
                nr["NoKTP"] = item["NoKTP"];
                nr["NoAnggota"] = item["NoAnggota"];
                nr["Alamat"] = item["Alamat"].ToString() +" , "+ item["RTRW"].ToString() +" , "+ item["Desa"].ToString();
                nr["Kecamatan"] = item["Kecamatan"];
                nr["Kotakab"] = item["Kotakab"];
                nr["Pendidikanterakhir"] = item["Pendidikanterakhir"];
                nr["Pekerjaan"] = item["Pekerjaan"];
                nr["StatusPernikahan"] = item["StatusPernikahan"];
                nr["NamaIbuKandung"] = item["NamaIbuKandung"];
                nr["NamaPenjamin"] = item["NamaPenjamin"];
                nr["NoKTPPenjamin"] = item["NoKTPPenjamin"];
                nr["Tmptlahirpenjamin"] = item["Tmptlahirpenjamin"];
                nr["TgllahirPenjamin"] = item["TgllahirPenjamin"];
                nr["PekerjaanPenjamin"] = item["PekerjaanPenjamin"];
                nr["CIF"] = item["CIF"];
                nr["Rekening"] = item["Rekening"];
                nr["LuasTanah"] = item["LuasTanah"];
                nr["Pinjaman"] = item["Pinjaman"];
                nr["Telfon"] = item["Telfon"];

                wrapedData.Rows.Add(nr);
            }

            parameter.Add("@data-structured", wrapedData);

            dh.ExecuteNonQuery("[USP_UPLOAD_PENCAIRAN_KEMITRAAN]", parameter);
        }

        public DataTable ValidateKTP(DataTable data)
        {
            Hashtable parameters = new Hashtable();

            DataTable wrapedData = new DataTable();

            wrapedData.Columns.Add("id");
            wrapedData.Columns.Add("Nama");
            wrapedData.Columns.Add("Tempatlahir");
            wrapedData.Columns.Add("Tgllahir");
            wrapedData.Columns.Add("NoKTP");
            wrapedData.Columns.Add("NoAnggota");
            wrapedData.Columns.Add("Alamat");
            wrapedData.Columns.Add("Kecamatan");
            wrapedData.Columns.Add("Kotakab");
            wrapedData.Columns.Add("Pendidikanterakhir");
            wrapedData.Columns.Add("Pekerjaan");
            wrapedData.Columns.Add("StatusPernikahan");
            wrapedData.Columns.Add("NamaIbuKandung");
            wrapedData.Columns.Add("NamaPenjamin");
            wrapedData.Columns.Add("NoKTPPenjamin");
            wrapedData.Columns.Add("Tmptlahirpenjamin");
            wrapedData.Columns.Add("TgllahirPenjamin");
            wrapedData.Columns.Add("PekerjaanPenjamin");
            wrapedData.Columns.Add("CIF");
            wrapedData.Columns.Add("Rekening");
            wrapedData.Columns.Add("LuasTanah");
            wrapedData.Columns.Add("Pinjaman");
            wrapedData.Columns.Add("Telfon");

            int i = 0;

            foreach (DataRow item in data.Rows)
            {

                var nr = wrapedData.NewRow();

                nr["id"] = ++i;
                nr["Nama"] = item["NamaKTP"];
                nr["Tempatlahir"] = item["Tempatlahir"];
                nr["Tgllahir"] = item["Tgllahir"];
                nr["NoKTP"] = item["NoKTP"];
                nr["NoAnggota"] = item["NoAnggota"];
                nr["Alamat"] = item["Alamat"].ToString() + item["RTRW"].ToString() + item["Desa"].ToString();
                nr["Kecamatan"] = item["Kecamatan"];
                nr["Kotakab"] = item["Kotakab"];
                nr["Pendidikanterakhir"] = item["Pendidikanterakhir"];
                nr["Pekerjaan"] = item["Pekerjaan"];
                nr["StatusPernikahan"] = item["StatusPernikahan"];
                nr["NamaIbuKandung"] = item["NamaIbuKandung"];
                nr["NamaPenjamin"] = item["NamaPenjamin"];
                nr["NoKTPPenjamin"] = item["NoKTPPenjamin"];
                nr["Tmptlahirpenjamin"] = item["Tmptlahirpenjamin"];
                nr["TgllahirPenjamin"] = item["TgllahirPenjamin"];
                nr["PekerjaanPenjamin"] = item["PekerjaanPenjamin"];
                nr["CIF"] = item["CIF"];
                nr["Rekening"] = item["Rekening"];
                nr["LuasTanah"] = item["LuasTanah"];
                nr["Pinjaman"] = item["Pinjaman"];
                nr["Telfon"] = item["Telfon"];

                wrapedData.Rows.Add(nr);
            }

            parameters.Add("@data-structured", wrapedData);

            return dh.GetData("[USP_UPLOAD_PENCAIRAN_KEMITRAAN_VALIDATE_KTP]", parameters);

        }
    }
}
