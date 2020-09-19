using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pertamina.PKBL.DAL;
using System.Data;
using System.Collections;

namespace Pertamina.PKBL.BLL.Kemitraan
{
    public class DetailReschedulePiutangKemitraanBll
    {
        DbHelper dh = new DbHelper();
        public DataTable getData(string proposal_number) {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-90", proposal_number);
            try
            {
                return dh.GetData("[USP_KEMITRAAN_SELECT_RESCHEDULE_DETAIL]", ht);
            }
            catch (Exception ex)
            {
                
                throw ex;
            }        
        }

        public DataTable previewRecondition(string ProposalNumber, string tglBaru)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@ProposalNumber-varchar-90", ProposalNumber);
            ht.Add("@tglMulaiBayar-date", tglBaru);
            ht.Add("@isSave-int", 0);
            ht.Add("@type-int", 1);
            try
            {
                return dh.GetData("[USP_KEMITRAAN_PROSES_RESCHEDULE]", ht);
            }
            catch (Exception ex)
            {
                throw ex;
            }        
        }
        public DataTable prosesRecondition(string ProposalNumber, string tglBaru)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@ProposalNumber-varchar-90", ProposalNumber);
            ht.Add("@tglMulaiBayar-date", tglBaru);
            ht.Add("@isSave-int", 1);
            ht.Add("@type-int", 1);
            try
            {
                return dh.GetData("[USP_KEMITRAAN_PROSES_RESCHEDULE]", ht);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //hanya untuk save dan langsung tampilkan hasilnya    
        public DataTable prosesReschedule(string ProposalNumber, string tglBaru)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@ProposalNumber-varchar-90", ProposalNumber);
            ht.Add("@tglMulaiBayar-date", tglBaru);
            ht.Add("@isSave-int", 1);
            ht.Add("@type-int", 0);
            try
            {
                return dh.GetData("[USP_KEMITRAAN_PROSES_RESCHEDULE]", ht);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //hanya untuk preview
        public DataTable previewReschedule(string ProposalNumber,string tglBaru) {
            Hashtable ht = new Hashtable();
            ht.Add("@ProposalNumber-varchar-90",ProposalNumber);
            ht.Add("@tglMulaiBayar-date", tglBaru);
            ht.Add("@isSave-int",0);
            ht.Add("@type-int",0);
            try {
                return dh.GetData("[USP_KEMITRAAN_PROSES_RESCHEDULE]", ht);
            }catch(Exception ex){
                throw ex;
            }
        }

        //hanya untuk preview Reschedule
        public DataTable previewKartuPiutang(string proposalnumber) {
            Hashtable ht = new Hashtable();
            ht.Add("@ProposalNumber-varchar-90", proposalnumber);
            try
            {
                return dh.GetData("[USP_KEMITRAAN_PREVIEW_RESCHEDULE]", ht);
            }
            catch (Exception ex) {
                throw ex;
            }
        }
    }
}
