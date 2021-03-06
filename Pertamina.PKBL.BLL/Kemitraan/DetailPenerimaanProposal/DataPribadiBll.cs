﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Kemitraan.DetailPenerimaanProposal
{
    public class DataPribadiBll
    {
        DbHelper dbHelper = new DbHelper();
        public DataTable getData(Hashtable ht)
        {
            try
            {
                return dbHelper.GetData("[USP_KEMITRAAN_SELECT_DATA_PRIBADI]", ht);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public void updateData(Hashtable parameters)
        {
            try
            {
                dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_ENTRI_DATA_PRIBADI]", parameters);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }
    }
}
