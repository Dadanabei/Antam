﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Collections;
using Pertamina.PKBL.DAL;

namespace Pertamina.PKBL.BLL.Akuntansi
{
    public class AccIndexBll
    {
        DbHelper dbHelper = new DbHelper();

        public DataTable GetData(Hashtable parameters)
        {
            try
            {
                return dbHelper.GetData("[USP_NOMOR_AKUN_SELECT]", parameters);
            }
            catch (Exception e)
            {
                //Exception ex = new Exception("Ambil Data Gagal", e);
                //throw ex;
                throw e;
            }

        }

        public void InsertData(Hashtable parameters)
        {
            try
            {
                dbHelper.ExecuteNonQuery("[USP_NOMOR_AKUN_INSERT]", parameters);
            }
            catch (Exception e)
            {
                //Exception ex = new Exception("Insert Data Gagal", e);
                //throw ex;
                throw e;
            }

        }

        public void UpdateData(Hashtable parameters)
        {
            try
            {
                dbHelper.ExecuteNonQuery("[USP_NOMOR_AKUN_UPDATE]", parameters);
            }
            catch (Exception e)
            {
                //Exception ex = new Exception("Edit Data Gagal", e);
                //throw ex;
                throw e;
            }

        }

        public void DeleteData(Hashtable parameters)
        {
            try
            {
                dbHelper.ExecuteNonQuery("[USP_NOMOR_AKUN_DELETE]", parameters);
            }
            catch (Exception e)
            {
                //Exception ex = new Exception("Hapus Data Gagal", e);
                //throw ex;
                throw e;
            }
        }
    }
}
