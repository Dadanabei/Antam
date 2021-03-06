﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Collections;
using System.Data;

namespace Pertamina.PKBL.BLL.BinaLingk
{
    public class PersetujuanBll
    {
        DbHelper dbHelper = new DbHelper();

        public void SetApproval(Hashtable parameters)
        {
            dbHelper.ExecuteNonQuery("[USP_BINALING_PERSETUJUAN_SETAPPROVAL]", parameters);
        }

        public DataTable GetData(Hashtable parameter)
        {
            return dbHelper.GetData("[USP_BINALING_PERSETUJUAN_SELECT]", parameter);
        }

        public DataTable GetData(string branchCode)
        {
            Hashtable parameters = new Hashtable();
            parameters.Add("@branch_code-int", branchCode);

            return dbHelper.GetData("[USP_BINALING_PERSETUJUAN_SELECT]", parameters);
        }
    }
}
