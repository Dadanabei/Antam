<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.MenuControl" %>

		<ul id="menuUl" class="AspNet-Menu">
			<li class="AspNet-Menu-Leaf  AspNet-Menu-Selected">
				<div class="icon-content-48">
                   <%-- <asp:HyperLink NavigateUrl="~/Default.aspx" CssClass="master-icon icon-48-home AspNet-Menu-Home" Text="Home" ID="HyperLink1" runat="server"></asp:HyperLink>--%>
					<%--<a href=<%: ResolveUrl("/Default.aspx") %> class="master-icon icon-48-home AspNet-Menu-Home" title="Home">
						Home</a>--%>
                    <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Home" CssClass="master-icon icon-48-home AspNet-Menu-Home" ID="Hyperlink1"></asp:HyperLink>
				</div>
			</li>
			<li id="liAdmin" runat="server" data-role="Menu.Admin" class="AspNet-Menu-WithChildren">
                <%--<asp:HyperLink NavigateUrl="~/Default.aspx" Text="Admin" ID="HyperLink2" runat="server"><span class="sf-sub-indicator"> »</span></asp:HyperLink>--%>
				<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Admin" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink3"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
				<ul>
					<%--<li id="liExportData" data-role ="" class="AspNet-Menu-Leaf">
                         <asp:HyperLink NavigateUrl="~/Default.aspx" CssClass="AspNet-Menu-Link" Text="Export Data" ID="HyperLink3" runat="server"></asp:HyperLink>
						<%--<a href="/Default.aspx/#3" class="AspNet-Menu-Link">
						    Export Data</a>
					</li>--%>
					<li id="liAdminPKBL" runat="server" data-role="ADM.PKBL.Menu" class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Default.aspx" CssClass="AspNet-Menu-Link" Text="PKBL" ID="HyperLink4" runat="server"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <%--<a href="/Default.aspx/#2" class="AspNet-Menu-Link">
							PKBL <span class="sf-sub-indicator"> »</span></a>--%>
                        <ul>
                            <li id="liAdmJbl" runat="server" data-role="ADM.PKBL.JenisBinaLing.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/BinaLingk/MasterBL.aspx" CssClass="AspNet-Menu-Link" Text="Jenis Bina Lingkungan" ID="HyperLink5" runat="server"></asp:HyperLink>
                                <%--<a href="../BinaLingk/MasterBL.aspx" class="AspNet-Menu-Link">
                                    Jenis Bina Lingkungan
                                </a>--%>
                            </li>
                            <li id="liAdmJKk" runat="server" data-role="ADM.PKBL.JenisKreditMitra.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Kemitraan/MasterKreditKemitraan.aspx" CssClass="AspNet-Menu-Link" Text="Jenis Kredit Kemitraan" ID="HyperLink6" runat="server"></asp:HyperLink>
                               <%-- <a href="../Kemitraan/MasterKreditKemitraan.aspx" class="AspNet-Menu-Link">
                                    Jenis Kredit Kemitraan
                                </a>--%>
                            </li>
                            <li id="liAdmKacab" runat="server" data-role="ADM.PKBL.KtrCabang.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Administer/MasterKantorCabang.aspx" CssClass="AspNet-Menu-Link" Text="Kantor Area" ID="HyperLink7" runat="server"></asp:HyperLink>
                                <%--<a href="../Administer/MasterKantorCabang.aspx" class="AspNet-Menu-Link">
                                    Kantor Cabang
                                </a>--%>
                            </li>
                            <li id="liAdmKota" runat="server" data-role="ADM.PKBL.KotaKab.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Administer/CityIndex.aspx" CssClass="AspNet-Menu-Link" Text="Kota Kabupaten" ID="HyperLink8" runat="server"></asp:HyperLink>
                                <%--<a href="../Administer/CityIndex.aspx" class="AspNet-Menu-Link">
                                    Kota/Kabupaten
                                </a>--%>
                            </li>
                            <li id="liAdmProvinsi" runat="server" data-role="ADM.PKBL.Provinsi.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Administer/ProvinceIndex.aspx" CssClass="AspNet-Menu-Link" Text="Provinsi" ID="HyperLink9" runat="server"></asp:HyperLink>
                                <%--<a href="../Administer/ProvinceIndex.aspx" class="AspNet-Menu-Link">
                                    Provinsi
                                </a>--%>
                            </li>
                            <li id="liAdmSektorPK" runat="server" data-role="ADM.PKBL.SektorMitra.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Kemitraan/MasterSektorKemitraan.aspx" CssClass="AspNet-Menu-Link" Text="Sektor Kemitraan" ID="HyperLink10" runat="server"></asp:HyperLink>
                                <%--<a href="../Kemitraan/MasterSektorKemitraan.aspx" class="AspNet-Menu-Link">
                                    Sektor Kemitraan
                                </a>--%>
                            </li>
                            <li id="liAdmVerifikator" runat="server" data-role="ADM.PKBL.Verifikator.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Administer/Verifikator.aspx" CssClass="AspNet-Menu-Link" Text="Verifikator" ID="HyperLink11" runat="server"></asp:HyperLink>
                            </li>
                            
                        </ul>
					</li>
					<li id="liAdminAkuntansiMaster" runat="server" data-role="ADM.AKUN.Menu"  class="AspNet-Menu-Leaf">
                          <%--<asp:HyperLink NavigateUrl="~/Default.aspx" CssClass="AspNet-Menu-Link" Text="Akuntansi" ID="HyperLink12" runat="server"></asp:HyperLink>--%>
						<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Akuntansi" CssClass="AspNet-Menu-Link" ID="Hyperlink12"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <ul>
                            <li id="liAdmAccIndex" runat="server" data-role="ADM.AKUN.NoAkun.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Akuntansi/AccIndex.aspx" CssClass="AspNet-Menu-Link" Text="Nomer Akun" ID="HyperLink13" runat="server"></asp:HyperLink>
                                <%--<a href="../Akuntansi/AccIndex.aspx" class="AspNet-Menu-Link">
                                    Nomer Akun | Perkiraan
                                </a>--%>
                            </li>
                            <li id="liAdmMappingCoa" runat="server" data-role="ADM.AKUN.MapBankCOA.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Akuntansi/MappingBankCoa.aspx" runat="server" Text="Mapping Bank COA" CssClass="AspNet-Menu-Link" ID="HyperLink14"></asp:HyperLink>                   
                            </li>
                            <li id="liAdmMapCabProv" runat="server" data-role="ADM.AKUN.MapCabProv.View" class="AspNet-Menu-Leaf">
                                 <asp:HyperLink NavigateUrl="~/Akuntansi/MappingCabangProvinsi.aspx" runat="server" Text="Mapping Kantor Cabang provinsi" CssClass="AspNet-Menu-Link" ID="HyperLink15"></asp:HyperLink> 
                               <%-- <a href="../Akuntansi/MappingCabangProvinsi.aspx" class="AspNet-Menu-Link">
                                    Mapping Kantor Cabang Provinsi
                                </a>--%>
                            </li>
                            <li id="liMapBankCOAJBL" runat="server" data-role="ADM.AKUN.MapBankCOAJBL.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Akuntansi/MappingCoaJenisBinaling.aspx" runat="server" Text="Mapping Bank COA Jenis Bina Lingkungan" CssClass="AspNet-Menu-Link" ID="Hyperlink16"></asp:HyperLink>
                                <%--<a href="../Akuntansi/MappingCoaJenisBinaling.aspx" class="AspNet-Menu-Link">
                                    Mapping Bank COA Jenis Bina Lingkungan
                                </a>--%>
                            </li>
                            <li id="liMapKotaAc" runat="server" data-role="ADM.AKUN.MappingKota.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Akuntansi/MappingKotaAc.aspx" runat="server" Text="Mapping Kota" CssClass="AspNet-Menu-Link" ID="Hyperlink17"></asp:HyperLink>
                                <%--<a href="../Akuntansi/MappingKotaAc.aspx" class="AspNet-Menu-Link">
                                    Mapping Kota Account
                                </a>--%>
                            </li>
                        </ul>
					</li>
					<li class="AspNet-Menu-Leaf" id="liClosingKolekti" runat="server" data-role ="ADM.ClosingKolektibilitas.View">
                        <asp:HyperLink NavigateUrl="~/Administer/ClosingKolekti.aspx" runat="server" Text="Closing Kolektibilitas" CssClass="AspNet-Menu-Link" ID="Hyperlink188"></asp:HyperLink>
						<%--<a href="~/Administer/ClosingKolekti.aspx" class="AspNet-Menu-Link">
							Closing Kolektibilitas</a>--%>
					</li>
                    <li class="AspNet-Menu-Leaf" id="liClosingMonth" runat="server" data-role ="ADM.ClosingMonth.View">
                        <asp:HyperLink NavigateUrl="~/Administer/ClosingMonth.aspx" runat="server" Text="Closing Month" CssClass="AspNet-Menu-Link" ID="Hyperlink19"></asp:HyperLink>
						<%--<a href="/Page/RiskContext/SkalaProbability.aspx" class="AspNet-Menu-Link">
							Closing Month</a>--%>
					</li>
                    <li class="AspNet-Menu-Leaf" id="liUploadTemplate" runat="server" data-role ="ADM.UploadTemplate.View">
                        <asp:HyperLink NavigateUrl="~/Administer/UploadTemplate.aspx" runat="server" Text="Upload Template" CssClass="AspNet-Menu-Link" ID="Hyperlink55"></asp:HyperLink>
						<%--<a href="~/Administer/ClosingKolekti.aspx" class="AspNet-Menu-Link">
							Closing Kolektibilitas</a>--%>
					</li>
				</ul>
			</li>
			<li id="liAdminMenuPK" runat="server" data-role="Menu.PK" class="AspNet-Menu-WithChildren">
                <%--<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" CssClass="sf-sub-indicator" ID="Hyperlink20">Program Kemitraan <span class="sf-sub-indicator"> »</span></asp:HyperLink>--%>

				<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Program Kemitraan" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink18"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
				<ul>
					<li id="liAdmPKPenerimaan" runat="server" data-role="PK.Penerimaan.View" class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Kemitraan/PenerimaanProposal.aspx" runat="server" Text="Penerimaan proposal" CssClass="AspNet-Menu-Link" ID="Hyperlink21"></asp:HyperLink>
						<%--<a href="/Kemitraan/PenerimaanProposal.aspx" class="AspNet-Menu-Link">
							Penerimaan Proposal</a>--%>
					</li>
					<li class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Survey" CssClass="AspNet-Menu-Link" ID="Hyperlink22"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <%--<a href="/Default.aspx/#6" class="AspNet-Menu-Link">
							Survey <span class="sf-sub-indicator"> »</span></a>--%>
                        <ul>
                            <li id="liAdmPkPenilaian" runat="server" data-role="PK.Penilaian.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Kemitraan/PenilaianSurvey.aspx" runat="server" Text="Penilaian" CssClass="AspNet-Menu-Link" ID="Hyperlink23"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Penilaian
                                </a>--%>
                            </li>
                            <li id="liAdmPkPersetujuan" runat="server" data-role="PK.Persetujuan.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Kemitraan/PersetujuanSurvey.aspx" runat="server" Text="Persetujuan" CssClass="AspNet-Menu-Link" ID="Hyperlink24" ></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Persetujuan
                                </a>--%>
                            </li>
                        </ul>
					</li>
					<li class="AspNet-Menu-Leaf" data-role="PK.Penilaian.View" id="liRealisasi" runat="server">
                        <asp:HyperLink NavigateUrl="~/Kemitraan/RealisasiKemitraan.aspx"  runat="server" Text="Realisasi" CssClass="AspNet-Menu-Link" ID="Hyperlink25"></asp:HyperLink>
						<%--<a href="/Default.aspx/#7" class="AspNet-Menu-Link">
							Realisasi</a>--%>
					</li>
					<li class="AspNet-Menu-Leaf" data-role="PK.Penilaian.View" id="liJadwalPembayaran" runat="server">
                        <asp:HyperLink NavigateUrl="~/Kemitraan/JadwalPembayaran.aspx" runat="server" Text="Jadwal Pembayaran" CssClass="AspNet-Menu-Link" ID="Hyperlink26"></asp:HyperLink>
						<%--<a href="/Default.aspx/#8" class="AspNet-Menu-Link">
							Jadwal Pembayaran</a>--%>
					</li>
                    <li class="AspNet-Menu-Leaf" runat="server" ID="liMenuHibah" data-role="PK.Hibah.Menu">
                        <asp:HyperLink NavigateUrl="~/Default.aspx"  Text="Hibah" CssClass="AspNet-Menu-Link" ></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <%--<a href="/Default.aspx/#6" class="AspNet-Menu-Link">
							Survey <span class="sf-sub-indicator"> »</span></a>--%>
                        <ul>
                            <li id="liHibahPermohonan" runat="server" data-role="PK.Hibah.Permohonan.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Hibah/PengajuanHibah.aspx" runat="server" Text="Permohonan Hibah" CssClass="AspNet-Menu-Link" ID="Hyperlink57"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Penilaian
                                </a>--%>
                            </li>
                            <li id="liHibahPersetujuan" runat="server" data-role="PK.Hibah.Persetujuan.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Hibah/PersetujuanHibah.aspx" runat="server" Text="Persetujuan Hibah" CssClass="AspNet-Menu-Link" ID="Hyperlink58" ></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Persetujuan
                                </a>--%>
                            </li>
                        </ul>
					</li>
					<li class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Kemitraan/ReschedulePiutangKemitraan.aspx" runat="server" Text="Reschedule Piutang" CssClass="AspNet-Menu-Link" ID="Hyperlink27"></asp:HyperLink>
						<%--<a href="/Default.aspx/#9" class="AspNet-Menu-Link">
							Reschedule Piutang</a>--%>
					</li>
					<li class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Kemitraan/PerhitunganBungaPinjaman.aspx" runat="server" Text="Perhitungan Bunga Pinjaman" CssClass="AspNet-Menu-Link" ID="Hyperlink28"></asp:HyperLink>
						<%--<a href="/Default.aspx/#10" class="AspNet-Menu-Link">
							Perhitungan Bunga Pinjaman</a>--%>
					</li>
					<li class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Kemitraan/SinergiBUMN.aspx" runat="server" Text="Sinergi BUMN" CssClass="AspNet-Menu-Link" ID="Hyperlink29"></asp:HyperLink>
						<%--<a href="/Default.aspx/#11" class="AspNet-Menu-Link">
							Sinergi BUMN</a>--%>
					</li>
					<li class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Kemitraan/MonitoringMitra.aspx" runat="server" Text="Monitoring Mitra" CssClass="AspNet-Menu-Link" ID="Hyperlink30"></asp:HyperLink>
					</li>
                    
				</ul>
			</li>
            <li id="liAdminBinaLingk"  runat="server" data-role="Menu.BL" class="AspNet-Menu-WithChildren">
               <%-- <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Bina Lingkungan" CssClass="sf-sub-indicator" ID="Hyperlink31"></asp:HyperLink>--%>
				<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Bina Lingkungan" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink20"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
				<ul>
					                    <li id="liAdmBLPermohonan" runat="server" data-role="BL.Permohonan.View" class="AspNet-Menu-Leaf">
                                        <asp:HyperLink NavigateUrl="~/BinaLingk/PermohonanBL.aspx" runat="server" Text="Permohonan" CssClass="AspNet-Menu-Link" ID="Hyperlink32"></asp:HyperLink>
						<%--<a href="../BinaLingk/PermohonanBL.aspx" class="AspNet-Menu-Link">
						    Permohonan</a>--%>
					</li>
                    	                <li id="liAdmBLPenilaian" runat="server" data-role="BL.Penilaian.View" class="AspNet-Menu-Leaf">
                                        <asp:HyperLink NavigateUrl="~/BinaLingk/PenilaianBL.aspx" runat="server" Text="Penilaian" CssClass="AspNet-Menu-Link" ID="Hyperlink33"></asp:HyperLink>
						<%--<a href="../BinaLingk/PenilaianBL.aspx" class="AspNet-Menu-Link">
						    Penilaian</a>--%>
					</li>
                    					<li id="iliAdmPersetujan" runat="server" data-role="BL.Persetujuan.View" class="AspNet-Menu-Leaf">
                                          <asp:HyperLink NavigateUrl="~/BinaLingk/PersetujuanBL.aspx" runat="server" Text="Persetujuan" CssClass="AspNet-Menu-Link" ID="Hyperlink34"></asp:HyperLink>    
						<%--<a href="../BinaLingk/PersetujuanBL.aspx" class="AspNet-Menu-Link">
						    Persetujuan</a>--%>
					</li>
                    				
                 					
                </ul>
            </li>
            <li id="liAdminAkuntansi" runat="server" data-role="Menu.Akuntansi" class="AspNet-Menu-WithChildren">
              <%--  <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Akuntansi" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink38"></asp:HyperLink>--%>
				<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Akuntansi" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink31"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
				<ul>
					<li id="liAdmKemitraan" runat="server" data-role="" class="AspNet-Menu-Leaf">
                       <%-- <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Program Kemitraan" CssClass="sf-sub-indicator" ID="Hyperlink39"></asp:HyperLink>--%>
						<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Program Kemitraan" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink35"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <ul>
                            <li id="liKemitraanPencairan" runat="server" data-role="AKUN.PK.Pencairan.View" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Akuntansi/PencairanPK.aspx" runat="server" Text="Pencairan" CssClass="AspNet-Menu-Link" ID="Hyperlink40"></asp:HyperLink>
                               <%-- <a href="/Akuntansi/PencairanPK.aspx" class="AspNet-Menu-Link">
                                    Pencairan
                                </a>--%>
                            </li>
                            <li id="liUploadRealisasiPK" runat="server" data-role="AKUN.PK.Pencairan.Upload" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Kemitraan/UploadRealisasiKemitraan.aspx" runat="server" Text="Upload Realisasi PK" CssClass="AspNet-Menu-Link" ID="Hyperlink47"></asp:HyperLink>
						
					        </li>
                            <li  class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Pembayaran" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink48"></asp:HyperLink>
						        <span class="sf-sub-indicator"> »</span>
                                <ul>
                                    <li id="liPembayaran" runat="server" data-role="AKUN.PK.Pembayaran.View" class="AspNet-Menu-Leaf">
                                    <asp:HyperLink NavigateUrl="~/Akuntansi/PembayaranPK.aspx" runat="server" Text="Input Pembayaran" CssClass="AspNet-Menu-Link" ID="Hyperlink2"></asp:HyperLink></li>
                                
                                    <li id="liUploadPembayaran" runat="server" data-role="AKUN.PK.Pembayaran.Upload" class="AspNet-Menu-Leaf">
                                    <asp:HyperLink NavigateUrl="~/Akuntansi/UploadPembayaranPK.aspx" runat="server" Text="Upload Pembayaran" CssClass="AspNet-Menu-Link" ID="Hyperlink54"></asp:HyperLink></li>
                                
                                </ul>
                                
                                
                               <%-- <a href="/Akuntansi/PencairanPK.aspx" class="AspNet-Menu-Link">
                                    Pencairan
                                </a>--%>
                            </li>
                            
                            
                            <li id="liKartupiutang" runat="server" data-role="AKUN.PK.KartuPiutang.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/Kartu_Piutang.aspx" runat="server" Text="Kartu Piutang" CssClass="AspNet-Menu-Link" ID="Hyperlink42"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Kartu Piutang
                                </a>--%>
                            </li>
                            <li id="liPenyaluranHibah" runat="server" data-role="AKUN.PK.Hibah.Penyaluran.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/PenyaluranHibah.aspx" runat="server" Text="Penyaluran Hibah" CssClass="AspNet-Menu-Link" ID="Hyperlink59"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Kartu Piutang
                                </a>--%>
                            </li>
                            <li id="liDiskonJasa" runat="server" data-role="AKUN.PK.DiskonJasa.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/DiskonJasa.aspx" runat="server" Text="Diskon Jasa" CssClass="AspNet-Menu-Link" ID="Hyperlink43"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Diskon Jasa
                                </a>--%>
                            </li>
                            <li id="lilebihBayar" runat="server" data-role="AKUN.PK.LebihBayar.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/PengembalianKelebihan.aspx" runat="server" Text="Pengembalian Kelebihan" CssClass="AspNet-Menu-Link" ID="Hyperlink44"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Pengembalian Kelebihan
                                </a>--%>
                            </li>
                        </ul>
					</li>
					<li id="liAdminKemitraanBinaLingk" runat="server" data-role=""  class="AspNet-Menu-Leaf">
                        <%--<asp:hyperlink navigateurl="~/default.aspx" runat="server" text="bina lingkungan" cssclass="sf-sub-indicator" id="hyperlink45"></asp:hyperlink>--%>
						<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Bina Lingkungan" CssClass="AspNet-Menu-Link" ID="Hyperlink36"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <ul>
                            <li id="liKemitraanBinaLingkPenyaluranBL" runat="server" data-role="AKUN.BL.Penyaluran.View" class="AspNet-Menu-Leaf" >
                                <asp:HyperLink NavigateUrl="~/Akuntansi/PenyaluranBL.aspx" runat="server" Text="Penyaluran BL" CssClass="AspNet-Menu_Link" ID="Hyperlink46"></asp:HyperLink>
                                <%--<a href="/Akuntansi/PenyaluranBL.aspx" class="AspNet-Menu-Link">
                                    Penyaluran BL
                                </a>--%>
                            </li>
                            <li id="liUploadBL" runat="server" data-role="AKUN.BL.Penyaluran.Upload" class="AspNet-Menu-Leaf">
                                <asp:HyperLink NavigateUrl="~/BinaLingk/UploadRealisasiBL.aspx" runat="server" Text="Upload Penyaluran BL" CssClass="AspNet-Menu-Link" ID="Hyperlink45"></asp:HyperLink>    
						
					        </li>
                            
                        </ul>
					</li>
					<li class="AspNet-Menu-Leaf">
                         <%-- <asp:HyperLink NavigateUrl="#" runat="server" Text="Jurnal" CssClass="AspNet-Menu-Link" ID="Hyperlink48"></asp:HyperLink>--%>
						<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Jurnal" CssClass="AspNet-Menu-Link" ID="Hyperlink37"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <ul>
                            <li id="liTransaksiKas" runat="server" data-role="AKUN.JURNAL.KasBank.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/TransaksiKasBank.aspx" runat="server" Text="Jurnal Transaksi Kas Bank" CssClass="AspNet-Menu-Link" ID="Hyperlink49"></asp:HyperLink>
                               <%-- <a href="/Akuntansi/TransaksiKasBank.Aspx" class="AspNet-Menu-Link">
                                    Jurnal Transaksi Kas Bank
                                </a>--%>
                            </li>
                            <li id="liJurnalUmum" runat="server" data-role="AKUN.JURNAL.Umum.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/JurnalUmum.aspx" runat="server" Text="Jurnal Umum" CssClass="AspNet-Menu-Link" ID="Hyperlink50"></asp:HyperLink>
                              <%--  <a href="/Akuntansi/JurnalUmum.Aspx" class="AspNet-Menu-Link">
                                    Jurnal Umum
                                </a>--%>
                            </li>
                            <li id="liReportAdjust" runat="server" data-role="AKUN.JURNAL.Adjusment.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/Adjustment.aspx" runat="server" Text="Jurnal Adjustment" CssClass="AspNet-Menu-Link" ID="Hyperlink51"></asp:HyperLink>
                                <%--<a href="/Akuntansi/Adjustment.Aspx" class="AspNet-Menu-Link">
                                    Jurnal Adjusment
                                </a>--%>
                            </li>
                            <li id="liPostingjurnal" runat="server" data-role="AKUN.PostingJurnal.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/PostingJurnal.aspx" runat="server" Text="Posting Jurnal" CssClass="AspNet-Menu-Link" ID="Hyperlink52"></asp:HyperLink>
                                
                            </li>
                        </ul>
					</li>

                    

					<li id="liTransferDana" runat="server" data-role="AKUN.TransferDanaBank.View" class="AspNet-Menu-Leaf">
                          <asp:HyperLink NavigateUrl="~/Akuntansi/TransferDanaBank.aspx" runat="server" Text="Transfer Dana Bank" CssClass="AspNet-Menu-Link" ID="Hyperlink53"></asp:HyperLink>
						<%--<a href="/Akuntansi/TransferDanaBank.aspx" class="AspNet-Menu-Link">
							Transfer Dana Bank</a>--%>
					</li>
					<%--<li id="liAktivaTetap" runat="server" data-role="AKUN.AktivaTetap.View" class="AspNet-Menu-Leaf">
                          <asp:HyperLink NavigateUrl="~/Akuntansi/AktivaTetap.aspx" runat="server" Text="Aktiva Tetap" CssClass="AspNet-Menu-Link" ID="Hyperlink54"></asp:HyperLink>
						<a href="/Akuntansi/AktivaTetap.aspx" class="AspNet-Menu-Link">
							Aktiva Tetap</a>
					</li>--%>
					<li class="AspNet-Menu-Leaf">
                          <%--<asp:HyperLink NavigateUrl="#" runat="server" Text="Daftar Pengakuan" CssClass="AspNet-Menu-Link" ID="Hyperlink55"></asp:HyperLink>--%>
						<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Daftar Pengakuan" CssClass="AspNet-Menu-Link" ID="Hyperlink38"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <ul>
                            <li id="liMitraBermasalah" runat="server" data-role="AKUN.MBBermasalah.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/MitraBinaanBermasalah.aspx" runat="server" Text="Mitra Binaan Bermasalah" CssClass="AspNet-Menu-Link" ID="Hyperlink56"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Mitra Binaan Bermasalah
                                </a--%>
                            </li>
                            <%--<li id="liMitraLunas" runat="server" data-role="AKUN.MBLunas.View" class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/MitraBinaanLunas.aspx" runat="server" Text="Mitra Binaan Lunas" CssClass="AspNet-Menu-Link" ID="Hyperlink57"></asp:HyperLink>
                                <a href="#" class="AspNet-Menu-Link">
                                    Mitra Bunaa Lunas
                                </a>
                            </li>--%>
                        </ul>
                            </li>
					<li class="AspNet-Menu-Leaf">
                          <%--<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Panjar" CssClass="sf-sub-indicator" ID="Hyperlink58"></asp:HyperLink>--%>
						<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Panjar" CssClass="AspNet-Menu-Link" ID="Hyperlink39"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
                        <ul>
                            <%--<li class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/TambahPanjar.aspx" runat="server" Text="Tambah Panjar" CssClass="AspNet-Menu-Link" ID="Hyperlink59"></asp:HyperLink>
                               <a href="/Akuntansi/TambahPanjar.aspx" class="AspNet-Menu-Link">
                                    Tambah Panjar
                                </a>
                            </li>--%>
                            <li class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/LihatPanjar.aspx" runat="server" Text="Daftar Panjar" CssClass="AspNet-Menu-Link" ID="Hyperlink60"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Lihat Daftar Panjar
                                </a>--%>
                            </li>
                            <li class="AspNet-Menu-Leaf">
                                  <asp:HyperLink NavigateUrl="~/Akuntansi/PerwabPanjar.aspx" runat="server" Text="Perwab Panjar" CssClass="AspNet-Menu-Link" ID="Hyperlink61"></asp:HyperLink>
                                <%--<a href="#" class="AspNet-Menu-Link">
                                    Perwab Panjar
                                </a>--%>
                            </li>
                        </ul>
					</li>
				</ul>
			</li>
            <li id="liAdminReport" runat="server" data-role="Menu.Reporting" class="AspNet-Menu-WithChildren">
                 <%-- <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Reporting" CssClass="sf-sub-indicator" ID="Hyperlink62"></asp:HyperLink>--%>
				<asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Reporting" CssClass="AspNet-Menu-Link sf-with-ul" ID="Hyperlink41"></asp:HyperLink>
						<span class="sf-sub-indicator"> »</span>
				<ul>
					<li id="liReportkemitraan" data-role="RPT.Kemitraan.View" runat="server" class="AspNet-Menu-Leaf">
                        <asp:HyperLink NavigateUrl="~/Reporting/RepKemitraaan.aspx" runat="server" Text="Kemitraan" CssClass="AspNet-Menu-Link" ID="Hyperlink63"></asp:HyperLink>
						<%--<a href="/Default.aspx/#5" class="AspNet-Menu-Link">
							Kemitraan</a>--%>
					</li>
					<li id="liReportBinaLing" runat="server" data-role="RPT.BinaLing.View" class="AspNet-Menu-Leaf">
                         <asp:HyperLink NavigateUrl="~/Reporting/RepBinaLingk.aspx" runat="server" Text="Bina Lingkungan" CssClass="AspNet-Menu-Link" ID="Hyperlink64"></asp:HyperLink>
						<%--<a href="../Reporting/RepBinaLingk.aspx" class="AspNet-Menu-Link">
							Bina Lingkungan</a>--%>
					</li>
					<li id="liReportAkuntansi" runat="server" data-role="RPT.Akuntansi.View"  class="AspNet-Menu-Leaf">
                         <asp:HyperLink NavigateUrl="~/Reporting/RepAkuntansii.aspx" runat="server" Text="Akuntansi" CssClass="AspNet-Menu-Link" ID="Hyperlink65"></asp:HyperLink>
						<%--<a href="/Default.aspx/#7" class="AspNet-Menu-Link">
							Akuntansi</a>--%>
					</li>
					<%--<li id="liReportLain" runat="server" data-role="RPT.Lain.View" class="AspNet-Menu-Leaf">
                         <asp:HyperLink NavigateUrl="~/Reporting/RepLain2.aspx" runat="server" Text="Lain-Lain" CssClass="AspNet-Menu-Link" ID="Hyperlink66"></asp:HyperLink>
						<a href="/Default.aspx/#8" class="AspNet-Menu-Link">
							Lain-lain</a>
					</li>--%>
				</ul>
			</li>
		</ul>
