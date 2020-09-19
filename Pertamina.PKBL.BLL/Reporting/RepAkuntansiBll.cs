using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Reporting
{
    public class RepAkuntansiBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable GetNeraca(Hashtable parameters)
        {
            var data = dbHelper.GetData("[USP_REPORT_NERACA_SALDO]", parameters);

            //var cpy = data.Copy();

            //var rows = cpy.Select("header_info <> 'H'");

            //data.Clear();

        
            //foreach (DataRow item in rows)
            //{

            //    data.ImportRow(item);

            //}
            

            return data;
        }


        public DataTable GetBaganAkun(Hashtable parameters)
        {
            return dbHelper.GetData("[USP_REPORT_BAGAN_AKUN]", parameters);
        }

        public DataTable GetDetailBaganAkun(BaganAkunDetail detail)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@coa-varchar-40", detail.Coa);
            parameters.Add("@branch_code-int", detail.KodeCabang);
            parameters.Add("@tglAwal-varchar-20", detail.TglMulai);
            parameters.Add("@tglAkhir-varchar-20", detail.Tglselesai);

            var data = dbHelper.GetData("[USP_BAGAN_AKUN_DETAIL]", parameters);

            decimal saldo = Convert.ToDecimal(detail.SaldoAwal);

            foreach (DataRow item in data.Rows)
            {
                var debet = Convert.ToDecimal(item["Debet"]);
                var kredit = Convert.ToDecimal(item["Kredit"]);

                saldo = saldo + debet - kredit;

                item["Saldo"] = saldo;

            }

            var saldoYangDiatas = data.NewRow();

            saldoYangDiatas["Saldo"] = Convert.ToDecimal(detail.SaldoAwal);

            data.Rows.InsertAt(saldoYangDiatas, 0);

            return data;
        }


    }

    public class BaganAkunDetail
    {
        public string Coa { get; set; }
        public string Deskripsi { get; set; }
        public string Periode { get; set; }
        public string SaldoAwal { get; set; }
        public string Debet { get; set; }
        public string Kredit { get; set; }
        public string SaldoAkhir { get; set; }
        public int KodeCabang { get; set; }
        public string TglMulai { get; set; }
        public string Tglselesai { get; set; }

    }
}
