<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepKemitraaan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepKemitraaan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Laporan Kemitraan</h2>
        
        <div class="row">
            <div class="col-md-6">
                <strong>Proposal</strong>
                <ul>
                    <li>                        
                         <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepKemitraanDetail/RepUsulanPemohonProgramKemitraan.aspx" Text="Laporan Usulan Pemohon Program Kemitraan" ID="re1"></asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <strong>Realisasi</strong>
                <ul>
                    <li>
                         <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepKemitraanDetail/RepRealisasiProgramKemitraan.aspx" Text="Laporan Realisasi Program  kemitraan" ID="re2"></asp:HyperLink>
                      
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepKemitraanDetail/RepPerkembanganPinjamanMitraBinaan.aspx" Text="Laporan Perkembangan Pinjaman Mitra Binaan" ID="re3"></asp:HyperLink>
                       
                    </li>
                   
                   <%-- <li>
                        <a href="/Reporting/RepKemitraanDetail/RepAkumulasiDanaTersediaDanPenggunaandana.aspx">Laporan Akumulasi Dana Tersedia &amp; Penggunaan Dana</a>
                    </li>--%>
                   <%-- <li>
                        <a href="/Reporting/RepKemitraanDetail/RepDanaTersediaDanPenggunaanDana.aspx">Laporan Dana Tersedia &amp; Penggunaan Dana</a>
                    </li>--%>
                   <%-- <li>
                        <a href="/Reporting/RepKemitraanDetail/RepMutasiKas.aspx">Laporan Mutasi Kas</a>
                    </li>--%>
                   <%-- <li>
                        <a href="/Reporting/RepKemitraanDetail/RepPelunasanProgramKemitraan.aspx">Laporan Pelunasan Program Kemitraan</a>
                    </li>--%>
                   <%-- <li>
                        <a href="/Reporting/RepKemitraanDetail/RepMitraBinaanLunas.aspx">Laporan Mitra Binaan Lunas</a>
                    </li>
                    <li>
                        <a href="/Reporting/RepKemitraanDetail/RepMitraBinaanOutstanding.aspx">Laporan Mitra Binaan Outstanding</a>
                    </li>
                    <li>
                        <a href="/Reporting/RepKemitraanDetail/RepMitraBinaanMenunggak.aspx">Laporan Mitra Binaan Menunggak</a>
                    </li>--%>
                   <%-- <li>
                        <a href="/Reporting/RepKemitraanDetail/RepPembayaranPiutang.aspx">Laporan Pembayaran Piutang</a>
                    </li>--%>
                    <%--<li>
                        <a href="/RepKemitraanDetail/RepPembayaranMitraBinaan.aspx">Laporan Pembayaran Mitra Binaan</a>
                    </li>--%>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
