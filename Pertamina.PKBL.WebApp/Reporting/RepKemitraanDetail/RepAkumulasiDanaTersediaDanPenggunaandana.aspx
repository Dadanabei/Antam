<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepAkumulasiDanaTersediaDanPenggunaandana.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepKemitraan.RepAkumulasiDanaTersediaDanPenggunaandana" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:x-large">Lap. Akumulasi Dana Tersedia dan Penggunaan Dana (Lamp. II-4)</span>
    <br />
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Tahun
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtahun" DisplayFormatString="yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    Cabang
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbCabang" Theme="Youthful"></dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit" Theme="Youthful"></dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnReset" Text="Reset" Theme="Youthful"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
