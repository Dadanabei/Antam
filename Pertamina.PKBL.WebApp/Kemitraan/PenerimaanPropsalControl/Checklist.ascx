<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Checklist.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.Checklist" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div class="bodydetail">
<div class="borderdetail">
<dx:ASPxLabel ID="lblPasFoto" runat="server" Text="Pas Foto Ukuran 4x6, berwarna" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbPasfotoAda" runat="server" GroupName="PasFoto" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbPasFotoTidak" runat="server" GroupName="PasFoto" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblKTP" runat="server" Text="Foto Copy KTP" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbKTPAda" runat="server" GroupName="KTP" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbKTPTidak" runat="server" GroupName="KTP" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblPBB" runat="server" Text="Foto Copy PBB" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbPBBAda" runat="server" GroupName="PBB" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbPBBTidak" runat="server" GroupName="PBB" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblNPWP" runat="server" Text="Foto Copy NPWP" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbNPWPAda" runat="server" GroupName="NPWP" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbNPWPTidak" runat="server" GroupName="NPWP" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblTandaPendaftaran" runat="server" Text="Foto Copy Surat Tanda Pendaftaran Usaha" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbTandaPendaftaranAda" runat="server" GroupName="TandaPendaftaran" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbTandaPendaftaranTidak" runat="server" GroupName="TandaPendaftaran" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblSuratIzinUsaha" runat="server" Text="Foto Copy Surat Izin Usaha" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbSuratIzinUsahaAda" runat="server" GroupName="SuratIzinUsaha" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbSuratIzinUsahaTidak" runat="server" GroupName="SuratIzinUsaha" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblSuratDomisili" runat="server" Text="Foto Copy Surat Izin Tempat Usaha dari Kelurahan (Domisili)" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbSuratDomosiliAda" runat="server" GroupName="Domisili" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbSuratDomosiliTidak" runat="server" GroupName="Domisili" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblTandaDaftarPerdagangan" runat="server" Text="Foto Copy Tanda Daftar Perdagangan" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbDaftarPerdaganganAda" runat="server" GroupName="DaftarPerdagangan" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbDaftarPerdaganganTidak" runat="server" GroupName="DaftarPerdagangan" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblLaporanKeuangan" runat="server" Text="Laporan Keuangan 1 (satu) Tahun Terakhir" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbLaporanKeuanganAda" runat="server" GroupName="LaporanKeuangan" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbLaporanKeuanganTidak" runat="server" GroupName="LaporanKeuangan" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblFotoKegiatanUsaha" runat="server" Text="Foto Kegiatan Usaha (Ukuran Postcard)" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbFotoKegiatanUsahaAda" runat="server" GroupName="FotoUsaha" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbFotoKegiatanUsahaTidak" runat="server" GroupName="FotoUsaha" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel29" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="lblDenah" runat="server" Text="Denah Lokasi Usaha" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbDenahAda" runat="server" GroupName="Denah" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbDenahTidak" runat="server" GroupName="Denah" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel32" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />

<dx:ASPxLabel ID="rbAgunan" runat="server" Text="Foto Copy Agunan / Jaminan" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbAgunanAda" runat="server" GroupName="Agunan" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel34" runat="server" Text="Ada" Theme="Youthful"></dx:ASPxLabel><br />
<dx:ASPxRadioButton ID="rbAgunanTidak" runat="server" GroupName="Agunan" Theme="Youthful"></dx:ASPxRadioButton>
<dx:ASPxLabel ID="ASPxLabel35" runat="server" Text="Tidak Ada" Theme="Youthful"></dx:ASPxLabel><br />
</div>
<br />
<dx:ASPxButton ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Theme="Youthful"></dx:ASPxButton>
</div>
