﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Akuntansi
{
    public class DetailPencairanPKBll
    {
        DbHelper dbHelper = new DbHelper();
        public DataTable GetAkun(string branchCode)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@branch_code-int", branchCode);

            return dbHelper.GetData("[USP_KEMITRAAN_PENCAIRAN_SELECT_AKUN]", parameters);
        }

        public DataRow GetDetail(string no_proposal)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@proposal_number-varchar-99", no_proposal);

            return dbHelper.GetData("[USP_KEMITRAAN_PENCAIRAN_SELECT_DETAIL]", parameters).Rows[0];
        }

        public DataTable GetTotalPencairan(string no_proposal)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@proposal_number-varchar-90", no_proposal);

            return dbHelper.GetData("[USP_KEMITRAAN_PENCAIRAN_SELECT_TOTAL]", parameters);
        }
        public void InsertData(Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_KEMITRAAN_PENCAIRAN_INSERT]", parameters);
        }
    }
}
