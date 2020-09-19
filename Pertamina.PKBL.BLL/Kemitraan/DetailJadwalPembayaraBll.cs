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
    public class DetailJadwalPembayaraBll
    {
        DbHelper dh = new DbHelper();
        public DataTable getPreviewData(string proposal_number)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-90", proposal_number);
            ht.Add("@isSave-bit", 0);

            try
            {
                var draw = dh.GetData("[USP_KEMITRAAN_GENERATE_DRAWDOWN_V2]", ht);
                //var copy = draw.Copy();
                //var drCopy = copy.Select("HutangPokok<>0 and Bunga<>0");
                //draw.Rows.Clear();

                //foreach (var item in drCopy)
                //{
                //    draw.ImportRow(item);

                //}

                return draw;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }

        public int prosesData(string proposal_number)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-90", proposal_number);
            ht.Add("@isSave-bit", 1);

            try
            {
                return dh.ExecuteNonQuery("[USP_KEMITRAAN_GENERATE_DRAWDOWN_V2]", ht);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public DataTable getDataDebitur(string proposal)
        {
            Hashtable ht = new Hashtable();
            ht.Add("@proposal_number-varchar-90", proposal);

            try
            {
                return dh.GetData("[USP_KEMITRAAN_SELECT_JADWAL_PEMBAYARAN_DETAIL]", ht);
            }
            catch (Exception E)
            {

                throw E;
            }


        }
    }
}
