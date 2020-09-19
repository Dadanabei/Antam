using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Data;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Reporting
{
    public class RepKemitraanBll
    {
        DbHelper dh = new DbHelper();

        public DataTable getRepUsulanKemitraan(Hashtable parameter) {
            return dh.GetData("[USP_REPORT_KEMITRAAN_DATA_USULAN]",parameter);
        }

        public DataTable GetRepPerkembanganKemitraan(Hashtable parameters)
        {
            return dh.GetData("[USP_REPORT_PERKEMBANGAN]", parameters);
        }

        public DataPerkembangan GetRepPerkembanganKemitraan(FilterPerkembangan parameters)
        {
            DataPerkembangan retval = new DataPerkembangan();

            DataTable data = null;

            DataTable regions = new DataTable("region");

            regions.Columns.Add(new DataColumn("branch_code",typeof(int)));

            foreach (var item in parameters.Regions)
            {
                var row = regions.NewRow();
                row[0] = Convert.ToInt32(item);
                regions.Rows.Add(row);
            }


            Hashtable ht = new Hashtable();

            ht.Add("@tglSalurMulai-varchar-20", parameters.TglSalurMulai);
            ht.Add("@tglSalurAkhir-varchar-20", parameters.TglSaalurAkhir);
            ht.Add("@kualitasPerbulan-int", parameters.KualitasPerBulan);
            ht.Add("@kualitasPertahun-int", parameters.KualitasPerTahun);
            ht.Add("@sektor-varchar-20", parameters.Sektor);
            ht.Add("@lunas-varchar-20", parameters.Lunas);
            ht.Add("@provinsi-varchar-20", parameters.Provinsi);
            ht.Add("@regions-structured", regions);
            ht.Add("@isMasalah-varchar-10", parameters.Bermasalah);
            //ht.Add("@tglAwalFilter-varchar-20",parameters.TglSalurMulai);
            //ht.Add("@tglAkhirFilter-varchar-20",parameters.TglSaalurAkhir);
            //ht.Add("@periodeBulan-int",parameters.KualitasPerBulan);
            //ht.Add("@periodeTahun-int", parameters.KualitasPerTahun);

            data = dh.GetData("[USP_REPORT_PERKEMBANGAN_V2]", ht);

            //public bool IsLancar { get; set; }
            //public bool IsKurangLancar { get; set; }
            //public bool IsDiragukan { get; set; }
            //public bool IsMacet { get; set; }
            //public string Bermasalah { get; set; }
            //public string Lunas { get; set; }

            //filter laporan by tersebut diatas
            

            if (parameters.IsLancar || parameters.IsKurangLancar || parameters.IsDiragukan || parameters.IsMacet)
            {
                var clone = data.Copy();
                data.Rows.Clear();
                foreach (DataRow item in clone.Rows)
                {
                    if (item["sts"].ToString() == "Lunas")
                    {
                        data.ImportRow(item);
                    }

                    if (item["sts"].ToString() == "Lancar" && parameters.IsLancar)
                    {
                        data.ImportRow(item);
                    }

                    if (item["sts"].ToString() == "Kurang lancar" && parameters.IsKurangLancar)
                    {
                        data.ImportRow(item);
                    }

                    if (item["sts"].ToString() == "Diragukan" && parameters.IsDiragukan)
                    {
                        data.ImportRow(item);
                    }

                    if (item["sts"].ToString() == "Macet" && parameters.IsMacet)
                    {
                        data.ImportRow(item);
                    }


                }
            }


            retval.TabelPerkembangan = data;

            foreach (DataRow item in data.Rows)
            {

                decimal nilaisetuju = 0;
                decimal jasaAdm = 0;
                decimal pengembalianPokok = 0;
                decimal pengembalianJasa = 0;
                decimal sisaPokok = 0;
                decimal sisaJasa = 0;
                decimal tunggakanPokok = 0;
                decimal tunggakanBunga = 0;
                //decimal saldoLunas = 0;
                //decimal saldoLancar = 0;
                //decimal saldoKurangLancar = 0;
                //decimal saldoDiragukan = 0;
                //decimal saldoMacet = 0;

                if (item["NilaiSetuju"] != DBNull.Value)
                {
                    nilaisetuju = Convert.ToDecimal(item["NilaiSetuju"]);
                }

                if (item["JumlahJasaJatuhTempo"] != DBNull.Value)
                {
                    jasaAdm = Convert.ToDecimal(item["JumlahJasaJatuhTempo"]);
                }

                if (item["PengembalianPokok"] != DBNull.Value)
                {
                    pengembalianPokok = Convert.ToDecimal(item["PengembalianPokok"]);
                }

                if (item["PengembalianBunga"] != DBNull.Value)
                {
                    pengembalianJasa = Convert.ToDecimal(item["PengembalianBunga"]);
                }

                if (item["sisaPinjaman"] != DBNull.Value)
                {
                    sisaPokok = Convert.ToDecimal(item["sisaPinjaman"]);
                }

                if (item["tunggakanBunga"] != DBNull.Value)
                {
                    sisaJasa = Convert.ToDecimal(item["Jasa"]) - Convert.ToDecimal(item["PengembalianBunga"]);
                }

                if (item["tunggakanPokok"] != DBNull.Value)
                {
                    tunggakanPokok = Convert.ToDecimal(item["tunggakanPokok"]);
                }

                if (item["tunggakanBunga"] != DBNull.Value)
                {
                    tunggakanBunga = Convert.ToDecimal(item["tunggakanBunga"]);
                }

                

                retval.TotalPenyaluran += nilaisetuju;
                retval.JasaAdm += jasaAdm;
                retval.PengembalianPinjaman += pengembalianPokok;
                retval.PendapatanJasaAdm += pengembalianJasa;
                retval.SisaPokok += sisaPokok;
                //retval.SisaJasaAdm += sisaJasa;
                retval.TunggakanPokok += tunggakanPokok;
                retval.TunggakanBunga += tunggakanBunga;

                if (item["sts"].ToString().Trim().Contains("Lancar"))
                {
                    retval.JumlahLancar += 1;
                    retval.SaldoLancar += sisaPokok;
                }

                else if (item["sts"].ToString().Trim().Contains("Kurang lancar"))
                {
                    retval.JumlahKurangLancar += 1;
                    retval.SaldoKurangLancar += sisaPokok;
                }

                else if (item["sts"].ToString().Trim().Contains("Diragukan"))
                {
                    retval.JumlahDiragukan += 1;
                    retval.SaldoDiragukan += sisaPokok;
                }

                else if (item["sts"].ToString().Trim().Contains("Macet"))
                {
                    retval.JumlahMacet += 1;
                    retval.SaldoMacet += sisaPokok;
                }

                else if (item["sts"].ToString().Trim().Contains("Lunas"))
                {
                    retval.JumlahLunas += 1;
                    retval.SaldoLunas = 0;
                }
                
            }


            retval.TotalPengembalian = retval.PengembalianPinjaman + retval.PendapatanJasaAdm;
            retval.TotalPinjaman = retval.JasaAdm + retval.TotalPenyaluran;
            retval.SisaJasaAdm = retval.JasaAdm - retval.PendapatanJasaAdm;
            retval.TotalSisa = retval.SisaJasaAdm + retval.SisaPokok;
            retval.TotalTunggakan = retval.TunggakanBunga + retval.TunggakanPokok;

            

            return retval;
        }

        public DataRow GetCabangName(int branch_code)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int",branch_code);

            return dh.GetData("[USP_BRANCH_CODE_SELECT_BY_BRANCH]", ht).Rows[0];
        
        }

        public DataTable GetProvinsi(int branch_code)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branch_code);

            return dh.GetData("[USP_BRANCH_CODE_SELECT_PROVINSI]",ht);
        }

        public DataTable GetProvinsiRealisasi(int branch_code)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int", branch_code);

            return dh.GetData("[USP_BRANCH_CODE_SELECT_PROVINSI_REALISASI]", ht);
        }

        public DataTable GetLaporanRealisasi(FilterRealisasi parameters)
        {
            DataTable regions = new DataTable("region");

            regions.Columns.Add(new DataColumn("branch_code", typeof(int)));

            foreach (var item in parameters.Regions)
            {
                var row = regions.NewRow();
                row[0] = Convert.ToInt32(item);
                regions.Rows.Add(row);
            }


            Hashtable ht = new Hashtable();

            ht.Add("@tglMulai-varchar-20", parameters.TglSalurMulai);
            ht.Add("@tglSampai-varchar-20", parameters.TglSaalurAkhir);
            ht.Add("@provinsi-varchar-20", parameters.Provinsi);
            ht.Add("@regions-structured", regions);
            //ht.Add("@tglAwalFilter-varchar-20",parameters.TglSalurMulai);
            //ht.Add("@tglAkhirFilter-varchar-20",parameters.TglSaalurAkhir);
            //ht.Add("@periodeBulan-int",parameters.KualitasPerBulan);
            //ht.Add("@periodeTahun-int", parameters.KualitasPerTahun);

            return dh.GetData("USP_REPORTING_REALISASI_PROGRAM_KEMITRAAN", ht);
        }


    }
    
    public class FilterRealisasi
    {
        public List<string> Regions { get; set; }
        public string TglSalurMulai { get; set; }
        public string TglSaalurAkhir { get; set; }
        public string Provinsi { get; set; }
    }
    public class FilterPerkembangan
    {
        public string TglSalurMulai { get; set; }
        public string TglSaalurAkhir { get; set; }
        public int KualitasPerBulan { get; set; }
        public int KualitasPerTahun { get; set; }
        public bool IsLancar { get; set; }
        public bool IsKurangLancar { get; set; }
        public bool IsDiragukan { get; set; }
        public bool IsMacet { get; set; }
        public string Bermasalah { get; set; }
        public string Sektor { get; set; }
        public string Lunas { get; set; }
        public List<string> Regions { get; set; }
        public string Provinsi { get; set; }
    }

    public class DataPerkembangan
    {
        public DataTable TabelPerkembangan { get; set; }
        public decimal TotalPenyaluran { get; set; } 
        public decimal JasaAdm { get; set; } 
        public decimal TotalPinjaman { get; set; } 
        public decimal PengembalianPinjaman { get; set; }
        public decimal PendapatanJasaAdm { get; set; }
        public decimal TotalPengembalian { get; set; }
        public decimal SisaPokok { get; set; }
        public decimal SisaJasaAdm { get; set; }
        public decimal TotalSisa { get; set; }
        public decimal TunggakanPokok { get; set; }
        public decimal TunggakanBunga { get; set; }
        public decimal TotalTunggakan { get; set; }
        public int JumlahLunas { get; set; }
        public decimal SaldoLunas { get; set; }
        public int JumlahLancar { get; set; }
        public decimal SaldoLancar { get; set; }
        public int JumlahKurangLancar { get; set; }
        public decimal SaldoKurangLancar { get; set; }
        public int JumlahDiragukan { get; set; }
        public decimal SaldoDiragukan { get; set; }
        public int JumlahMacet { get; set; }
        public decimal SaldoMacet { get; set; }
        public string IsMasalah { get; set; }
        public DataPerkembangan()
        {
            TotalPenyaluran = 0;
            JasaAdm = 0;
            TotalPinjaman = 0;
            PengembalianPinjaman = 0;
            PendapatanJasaAdm = 0;
            TotalPengembalian = 0;
            SisaPokok = 0;
            SisaJasaAdm = 0;
            TotalSisa = 0;
            TunggakanPokok = 0;
            TunggakanBunga = 0;
            TotalTunggakan = 0;
            JumlahLunas = 0;
            SaldoLunas = 0;
            JumlahLancar = 0;
            SaldoLancar = 0;
            JumlahKurangLancar = 0;
            SaldoKurangLancar = 0;
            JumlahDiragukan = 0;
            SaldoDiragukan = 0;
            JumlahMacet = 0;
            SaldoMacet = 0;



        }
    }
}
