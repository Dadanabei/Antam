<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepLain2.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLain2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Laporan Lain-lain</h2>
        
        <div class="row">
            <div class="col-md-6">
                <ul style="list-style:none;" >
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepUsulanPenyaluran.aspx" Text="Laporan Usulan Penyaluran" ID="re1"></asp:HyperLink>
                      
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepAlokasiPenyisihanLaba.aspx" Text="Laporan Alokasi Penyisihan Laba" ID="re2"></asp:HyperLink>
                       
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepAkumulasiRealisasiPenyaluranDana.aspx" Text="Laporan Akumulasi Realisasi Penyaluran Dana" ID="re3"></asp:HyperLink>
                        
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepRealisasiDanaProgramKemitraan.aspx" Text="Laporan Realisasi Dana Program Kemitraan" ID="re4"></asp:HyperLink>
                        
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepDaftarAktivaDanPenyusutan.aspx" Text="Daftar Aktiva tetap" ID="re5"></asp:HyperLink>
                        
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepJurnalDetail.aspx" Text="Report Detail Jurnal" ID="HyperLink1"></asp:HyperLink>
                        
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepKonfirmasiPiutang.aspx" ID="re6" Text="Konfirmasi Piutang"></asp:HyperLink>
                       
                    </li>
                     <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepJurnalDetail.aspx" ID="re7" Text="Daftar Jurnal Detail"></asp:HyperLink>
                       
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
