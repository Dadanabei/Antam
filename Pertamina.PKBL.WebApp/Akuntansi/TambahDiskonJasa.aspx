<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TambahDiskonJasa.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.TambahDiskonJasa" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <p>
        <span style="font-size:large">Discount Mitra</span>
    <br />
    </p>
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    No debitur
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNoDebitur" Theme="Youthful"></dx:ASPxTextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Tanggal
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful"></dx:ASPxDateEdit>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Nilai Diskon
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtDiskon"></dx:ASPxTextBox>
                    
                </td>
            </tr>
        </table>
        <dx:ASPxButton runat="server" ID="btnSimpan" Text="Simpan"></dx:ASPxButton><span></span><dx:ASPxHyperLink runat="server" ID="btnbatal" Text="Batal"></dx:ASPxHyperLink>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
