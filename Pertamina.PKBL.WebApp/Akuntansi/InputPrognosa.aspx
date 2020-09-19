<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="InputPrognosa.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.InputPrognosa" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div>
        <fieldset style="border:1px solid #808080">
            <legend>Tambah Data</legend>
            <table>
                <tr>
                    <td style="width:200px">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Propinsi :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtPropinsi" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Sektor :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtSektor" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Program :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtProgram" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Tahun :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtTahun" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Region :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtRegion" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Nilai(Rp) :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNilai" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Jumlah Mitra Bina :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtJumlahMitraBina" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Triwulan :" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbTriwulan" runat="server" Theme="Youthful"></dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
        </fieldset>
        <dx:ASPxButton ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"></dx:ASPxButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
