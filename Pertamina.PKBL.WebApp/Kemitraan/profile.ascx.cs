using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pertamina.PKBL.BLL.Kemitraan;


namespace Pertamina.PKBL.WebApp.Kemitraan
{
    public partial class profile : System.Web.UI.UserControl
    {
        protected string requestor_name;
        protected string jenisIdentitas;
        protected string identification_number;
        protected string birthdate;
        protected string birthplace;
        protected string requestor_parent_name;
        protected string sector_id;
        protected string company_kind_id;
        protected string requested_amount;
        protected string requestor_address;
        protected string kecamatan;
        protected string city_name;
        protected string postal_code;
        protected string homeStatus;
        protected string telepon;
        protected string requestor_phone2;
        protected string requestor_email;
        protected string maritalStatus;
        protected string edulvl;
        protected string company_sector_detail;
        protected string company_name;
        protected string company_ceo;
        protected string company_address;
        protected string usahakota;
        protected string company_postal;
        protected string company_phone1;
        protected string company_phone2;
        protected string company_fax;
        protected string company_email;
        protected string lahanUsaha;
        protected string company_workplace_end_rent;
        protected string company_active_since;
        protected string company_workforce;
        protected string working_capital;
        protected string company_investment;
        protected string monthly_revenue;
        protected string company_unit;
        protected string pembukuan;
        protected string journal_administration;
        protected string hutang_lain;
        protected string other_loan_at;
        protected string other_loan_amount;


        PenerimaanProposalBll bll = new PenerimaanProposalBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            string proposal_number = Session["proposal_number"].ToString();
            DataTable dt = bll.proposalPrint(proposal_number.ToString());

            if (dt.Rows.Count > 0)
            {
                var detail = dt.Rows[0];
                requestor_name = detail["requestor_name"].ToString();
                jenisIdentitas = detail["jenisIdentitas"].ToString();
                identification_number = detail["identification_number"].ToString();
                birthdate = detail["birthdate"].ToString();
                birthplace = detail["birthplace"].ToString();
                requestor_parent_name = detail["requestor_parent_name"].ToString();
                sector_id = detail["sector_id"].ToString();
                company_kind_id = detail["company_kind_id"].ToString();
                requested_amount = detail["requested_amount"].ToString();
                requestor_address = detail["requestor_address"].ToString();
                kecamatan = detail["kecamatan"].ToString();
                city_name = detail["city_name"].ToString();
                postal_code = detail["postal_code"].ToString();
                homeStatus = detail["homeStatus"].ToString();
                telepon = detail["telepon"].ToString();
                requestor_phone2 = detail["requestor_phone2"].ToString();
                requestor_email = detail["requestor_email"].ToString();
                maritalStatus = detail["maritalStatus"].ToString();
                edulvl = detail["edulvl"].ToString();
                company_sector_detail = detail["company_sector_detail"].ToString();
                company_name = detail["company_name"].ToString();
                company_ceo = detail["company_ceo"].ToString();
                company_address = detail["company_address"].ToString();
                usahakota = detail["usahakota"].ToString();
                company_postal = detail["company_postal"].ToString();
                company_phone1 = detail["company_phone1"].ToString();
                company_phone2 = detail["company_phone2"].ToString();
                company_fax = detail["company_fax"].ToString();
                company_email = detail["company_email"].ToString();
                lahanUsaha = detail["lahanUsaha"].ToString();
                company_workplace_end_rent = detail["company_workplace_end_rent"].ToString();
                company_active_since = detail["company_active_since"].ToString();
                company_workforce = detail["company_workforce"].ToString();
                working_capital = detail["working_capital"].ToString();
                company_investment = detail["company_investment"].ToString();
                monthly_revenue = detail["monthly_revenue"].ToString();
                company_unit = detail["company_unit"].ToString();
                pembukuan = detail["pembukuan"].ToString();
                journal_administration = detail["journal_administration"].ToString();
                hutang_lain = detail["hutang_lain"].ToString();
                other_loan_at = detail["other_loan_at"].ToString();
                other_loan_amount = detail["other_loan_amount"].ToString();

            }

        }
    }
}