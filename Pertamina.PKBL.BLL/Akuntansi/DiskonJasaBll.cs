using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Collections;
using System.Data;


namespace Pertamina.PKBL.BLL.Akuntansi
{
    public class DiskonJasaBll
    {
        DbHelper dbHelper = new DbHelper();
        public DataTable GetData(int branchCode)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-int",branchCode);
            return dbHelper.GetData("[USP_DISKON_JASA_SELECT]", ht);
        }

        public DataTable GetDiskonDiberikan(string proposalNumber)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@proposal_number-varchar-40", proposalNumber);

            return dbHelper.GetData("[USP_DISKON_JASA_SELECT_DISKON_DIBERIKAN]", parameters);
        }

        public DataTable GetDetailDiskonJasa(Hashtable parameters)
        {

            var data = dbHelper.GetData("[USP_DISKON_JASA_SELECT_DETAIL_KARTU]", parameters);

            for (int i = data.Rows.Count-1; i >= 0 ; i--)
            {
                var bunga = Convert.ToDouble(data.Rows[i]["Bunga"]);
                var isLunas = Convert.ToInt32(data.Rows[i]["IsLunas"]);
                

                if(bunga > 0 && isLunas == 0)
                {
                    data.Rows[i]["flag"] = 1;
                    break;
                }
            }

            return data;
        }

        public void InsertDiskon(Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_DISKON_JASA_INSERT_DISKON]", parameters);
        }


    }
}
