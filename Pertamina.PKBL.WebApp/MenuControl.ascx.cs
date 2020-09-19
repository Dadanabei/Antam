using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Pertamina.PKBL.WebApp
{
    public partial class MenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ValidateRole(string[] roles)
        {
            var menus = initLI();
            
            foreach (var item in menus)
            {
                var menurole = item.Attributes["data-role"].ToString();
                var role = roles.Where(t => t.Contains(menurole)).ToList().Count;

                item.Visible = (role > 0) ? true : false;
                item.Attributes.Remove("data-role");
            }
        }

        private List<HtmlGenericControl> initLI()
        {
            List<HtmlGenericControl> menu = new List<HtmlGenericControl>();

            menu.Add(liAdmin);
            menu.Add(liAdminPKBL);
            menu.Add(liAdmJbl);
            menu.Add(liAdmJKk);
            menu.Add(liAdmKacab);
            menu.Add(liAdmKota);
            menu.Add(liAdmProvinsi);
            menu.Add(liAdmSektorPK);
            menu.Add(liAdmVerifikator);
            menu.Add(liAdminAkuntansiMaster);
            menu.Add(liAdmAccIndex);
            menu.Add(liAdmMappingCoa);
            menu.Add(liAdmMapCabProv);
            menu.Add(liMapBankCOAJBL);
            menu.Add(liAdminMenuPK);
            menu.Add(liAdmPKPenerimaan);
            menu.Add(liClosingKolekti);
            menu.Add(liClosingMonth);
            menu.Add(liAdminBinaLingk);
            menu.Add(liAdmBLPermohonan);
            menu.Add(liAdmBLPenilaian);
            menu.Add(iliAdmPersetujan);
            menu.Add(liAdminAkuntansi);
            menu.Add(liAdmKemitraan);
            menu.Add(liAdminKemitraanBinaLingk);
            menu.Add(liAdminReport);
            menu.Add(liAdmPkPenilaian);
            menu.Add(liAdmPkPersetujuan);
            menu.Add(liRealisasi);
            menu.Add(liJadwalPembayaran);
            menu.Add(liKemitraanBinaLingkPenyaluranBL);
            menu.Add(liReportAkuntansi);
            menu.Add(liReportBinaLing);
            menu.Add(liReportkemitraan);
            //menu.Add(liReportLain);
            //menu.Add(liAktivaTetap);
            menu.Add(liReportAdjust);
            menu.Add(liTransaksiKas);
            menu.Add(liJurnalUmum);
            menu.Add(liMitraBermasalah);
           // menu.Add(liMitraLunas);
            menu.Add(liDiskonJasa);
            menu.Add(liKartupiutang);
            menu.Add(lilebihBayar);
            menu.Add(liKemitraanPencairan);
            menu.Add(liPostingjurnal);
            menu.Add(liTransferDana);
            menu.Add(liUploadBL);
            menu.Add(liUploadPembayaran);
            menu.Add(liUploadRealisasiPK);
            menu.Add(liUploadTemplate);
            menu.Add(liHibahPermohonan);
            menu.Add(liHibahPersetujuan);
            menu.Add(liPenyaluranHibah);
            menu.Add(liMenuHibah);
            return menu;
        }
    }
}
