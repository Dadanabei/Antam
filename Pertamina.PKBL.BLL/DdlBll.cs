using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Pertamina.PKBL.DAL;
using System.Collections;

namespace Pertamina.PKBL.BLL
{
    public class DdlBll
    {
        public DataTable GetComboItem(string name)
        {
            Hashtable param = new Hashtable();

            param.Add("@name-varchar-50",name);

            return (new DbHelper()).GetData("[USP_DDL_ITEM_SELECT]", param);
        }

        public DataTable getComboMarital(Hashtable parameters)
        {
            return (new DbHelper()).GetData("[USP_SELECT_MARITAL_STATUS]", parameters);
        }

        public DataTable getComboEducation(Hashtable parameters)
        {
            return (new DbHelper()).GetData("[USP_SELECT_EDUCATION_LV]", parameters);
        }

        public DataTable getComboHomeOwner(Hashtable parameters)
        {
            return (new DbHelper()).GetData("[USP_SELECT_HOME_OWNERSHIP]", parameters);
        }
        public DataTable getComboCompanyKind(Hashtable parameters)
        {
            return (new DbHelper()).GetData("[USP_KEMITRAAN_SELECT_COMPANY_KIND]", parameters);
        }
        public DataTable getComboSupplier(Hashtable parameters)
        {
            return (new DbHelper()).GetData("[c]", parameters);
        }

        public DataTable getComboSupplier(string branchCode)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@branchCode-varchar-4", branchCode);
            return (new DbHelper()).GetData("[USP_KEMITRAAN_SELECT_SUPPLIER]", ht);
        }


        public DataTable GetGroupAcc()
        {
            return (new DbHelper()).GetData("[USP_GROUP_AKUN_SELECT]", new Hashtable());

        }

        public DataTable getRegionName(string branchCode) {
            Hashtable ht = new Hashtable();
            ht.Add("@branch_code-varchar-4",branchCode);
            return new DbHelper().GetData("USP_SELECT_REGION",ht);
        }
        public DataTable getJenisDebitur() {
            return (new DbHelper()).GetData("[USP_JENIS_DEBITUR_SELECT]", new Hashtable());
        }
        public DataTable getJenisKredit()
        {
            return (new DbHelper()).GetData("[USP_JENIS_KREDIT_SELECT]", new Hashtable());
        }
        public DataTable getJenisKreditHibah()
        {
            return (new DbHelper()).GetData("[USP_JENIS_KREDIT_HIBAH_SELECT]", new Hashtable());
        }
        public DataTable getJenisBunga() {
            return (new DbHelper()).GetData("[USP_JENIS_BUNGA_SELECT]", new Hashtable());
        }
        
    }
}
