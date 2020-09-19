using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Kemitraan
{
    public class RealisasiBll
    {
        DbHelper dbHelper = new DbHelper();

        //Persetujuan
        public DataTable GetData(string branchCode)
        {
            Hashtable parameter = new Hashtable();

            parameter.Add("@branch_code-int", branchCode);

            return dbHelper.GetData("[USP_KEMITRAAN_REALISASI_SELECT_SETUJU]", parameter);

        }

        public void InsertRealisasi(Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_INSERT_REALISASI]", parameters);
        }

        public void InsertAkad(Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_INSERT_AKAD]", parameters);
        }

        public DataRow GetDetail(string proposaslNumber)
        {
            Hashtable parameter = new Hashtable();

            parameter.Add("@proposal_number-varchar-99", proposaslNumber);

            if(dbHelper.GetData("[USP_KEMITRAAN_REALISASI_SELECT_DETAIL]", parameter).Rows.Count > 0)
            {
                return dbHelper.GetData("[USP_KEMITRAAN_REALISASI_SELECT_DETAIL]", parameter).Rows[0];
                
            }
            else
            {
                return null;
            }
            
        }



        //List Akad
        public DataTable GetDataAkad(string branchCode)
        {
            Hashtable parameter = new Hashtable();

            parameter.Add("@branch_code-int", branchCode);

            return dbHelper.GetData("[USP_KEMITRAAN_LIST_AKAD_SELECT]", parameter);

        }

        public DataRow GetDetailAkad(int mitraid)
        {
            Hashtable parameter = new Hashtable();

            parameter.Add("@mitraid-int", mitraid);

            var data = dbHelper.GetData("[USP_KEMITRAAN_LIST_AKAD_SELECT_DETAIL]", parameter);

            if (data.Rows.Count > 0)
            {
                return data.Rows[0];
            }
            else
            {
                return null;
            }
        }


         public DataTable GetDetailAkadGrid(int mitraid)
        {
            Hashtable parameter = new Hashtable();

            parameter.Add("@mitraid-int", mitraid);

            return dbHelper.GetData("[USP_KEMITRAAN_LIST_AKAD_SELECT_GRID]", parameter);

        }

        

        public DataTable GetDetailPerjanjian(string noProposal)
        {
            Hashtable parameters = new Hashtable();

            parameters.Add("@noProposal-varchar-40", noProposal);

            return dbHelper.GetData("[USP_KEMITRAAN_PERJANJIAN]", parameters);
        }
    }
}
