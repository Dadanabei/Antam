<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepAkuntansii.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepAkuntansii" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Laporan Akuntansi</h2>
        
        <div class="row">
            <div class="col-md-6">
                <ol >
                    <li>
                         <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepAkuntansUserControl/RepBaganAkun.aspx" Text="Bagan Akun" ID="re2"></asp:HyperLink>
                       
                    </li>
                    <li>
                         <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepAkuntansUserControl/RepNeracaSaldo.aspx" Text="Neraca Saldo" ID="re3"></asp:HyperLink>
                       
                    </li>
                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepLainLain/RepJurnalDetail.aspx" ID="re7" Text="Daftar Jurnal Detail"></asp:HyperLink>
                       
                    </li>
                  <%--  <li>
                         <asp:HyperLink runat="server" NavigateUrl="~/Reporting/RepAkuntansUserControl/RepJurnalDetail.aspx" Text="Daftar Jurnal Detail" ID="re4"></asp:HyperLink>
                       
                    </li>--%>
                    <%--<li>
                        <a href="#">Laporan Posisi Keuangan</a>
                    </li>
                    <li>
                        <a href="#">Laporan Aktifitas </a>
                    </li>
                    <li>
                        <a href="#">Laporan Arus Kas</a>
                    </li>
                    <li>
                        <a href="#">Laporan Aktifitas (periode)</a>
                    </li>
                    <li>
                        <a href="#">Laporan Arus Kas (periode)</a>
                    </li>
                    <li>
                        <a href="#">Laporan Posisi Keuangan (rev.2012)</a>
                    </li>
                    <li>
                        <a href="#">Laporan Aktifitas (rev.2012)</a>
                    </li>
                    <li>
                        <a href="#">Laporan Arus Kas (rev.2012)</a>
                    </li>
                    <li>
                        <a href="#">Laporan Posisi Keuangan (format Pertamina)</a>
                    </li>
                    <li>
                        <a href="#">Laporan Aktifitas (format Pertamina)</a>
                    </li>
                    <li>
                        <a href="#">Laporan Arus Kas Metode Tidak Langsung (format Pertamina)</a>
                    </li>--%>
                </ol>
            </div>
        </div>
    </div>
</asp:Content>
