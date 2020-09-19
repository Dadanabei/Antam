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
    public class KartuPiutangDetailBll
    {
        DbHelper dh = new DbHelper();
        public DataTable getDataDebitur(string proposal_number)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-99", proposal_number);
            try
            {
                return dh.GetData("[USP_KEMITRAAN_SELECT_DATA_DEBITUR]", ht);
            }
            catch (Exception Ex)
            {
                
                throw Ex;
            }
        }

        public DataTable getKartuPiutang(string proposal_number) {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-99", proposal_number);
      
                var data = dh.GetData("[USP_KEMITRAAN_SELECT_KARTU_PIUTANG_DETAIL]", ht);
                //var copy = data.Copy();
                //var drCopy = copy.Select("HutangPokok <> '0' AND Bunga <> '0'");

                //data.Rows.Clear();

                //foreach (var item in drCopy)
                //{
                //    data.ImportRow(item);

                //}

                if (data.Rows.Count > 0)
                {


                    decimal sisaPokok = Convert.ToDecimal(data.Rows[0]["sisaPokok"]);
                    decimal sisaBunga = Convert.ToDecimal(data.Rows[0]["sisaBunga"]);
                    decimal sisaAdv = 0;


                    foreach (DataRow item in data.Rows)
                    {
                        decimal bayarPokok = 0; 
                        decimal bayarBunga = 0;
                        decimal bayarAdv = 0;

                        if (item["BayarPokok"] != DBNull.Value)
                        {
                            bayarPokok = Convert.ToDecimal(item["BayarPokok"]);
                        }

                        if (item["BayarBunga"] != DBNull.Value)
                        {
                            bayarBunga = Convert.ToDecimal(item["BayarBunga"]);
                        }
                        if(item["NilaiAdv"] != DBNull.Value)
                        {
                            bayarAdv = Convert.ToDecimal(item["NilaiAdv"]);
                        }


                        sisaBunga -= bayarBunga;
                        sisaPokok -= bayarPokok;
                        sisaAdv -= bayarAdv;

                        item["sisaPokok"] = sisaPokok;
                        item["sisaBunga"] = sisaBunga;
                        item["totalSisa"] = sisaBunga + sisaPokok + sisaAdv;
                    }


                    return data;
                }
                else
                {
                    return null;
                }
            

         
        }

        public string getKolektibilitas(string proposal)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-1000", proposal);

            return dh.GetData("[USP_KEMITRAAN_SELECT_KETERANGAN_KARTU_PIUTANG]", ht).Rows[0]["ket"].ToString();
        }

        public Hashtable getPrintKartuPiutang(string proposal)
        {
            Hashtable ht = new Hashtable();

            Hashtable parameters = new Hashtable();

            parameters.Add("@proposal_number-varchar-99",proposal);
            var detail = dh.GetData("USP_REPORT_KARTU_PIUTANG_SELECT_DATA", parameters);
            DataRow dr;
            if (detail.Rows.Count>0)
            {
                 dr = detail.Rows[0];
                 ht.Add("data", dr);
            }
            
            var kartu = dh.GetData("[USP_KEMITRAAN_SELECT_KARTU_PIUTANG_DETAIL]", parameters);

            ht.Add("kartu",kartu);

            return ht;
        }
    }
}
