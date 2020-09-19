<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepKonfirmasiPiutang.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLainLain.RepKonfirmasiPiutang" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="">Report Konfirmasi Piutang</span>
    <br />
    ada label keteranga dsni
    <br />
    <dx:ASPxLabel runat="server" Text="Generate Konfirmasi Piutang Berdasarkan Tahun Salur Periode Generate"></dx:ASPxLabel><dx:ASPxLabel runat="server" ID="lblTahun"></dx:ASPxLabel>
    <br />
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Tahun
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTahun" DisplayFormatString="yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    Cabang
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbRegion" Theme="Youthful"></dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit" Theme="Youthful"></dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnreset" Text="Reset" Theme="Youthful"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    Pilih Periode Generate Untuk Menampilkan Konfirmasi Barang
    <br />
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Tahun Generate
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTahunn" DisplayFormatString="yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtBulan" DisplayFormatString="MM" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    Tahun Salur
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTahnSal" DisplayFormatString="yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    Cabang
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbCabang" Theme="Youthful"></dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnSubmit2" Text="Submit" Theme="Youthful"></dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnReset2" Text="Reset" Theme="Youthful"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div> 

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
