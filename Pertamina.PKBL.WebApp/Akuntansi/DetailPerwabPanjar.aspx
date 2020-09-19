<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPerwabPanjar.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.DetailPerwabPanjar" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="bodydetail">
        <h1>Pertanggungjawaban Panjar</h1>
        <div class="borderdetail">
            <table style="width:100%">
                <tr>
                    <td style="width:20%">
                        No. Ref
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNoRef" runat="server" Width="40%" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nama
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNama" runat="server" Width="60%" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        NIP
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNip" runat="server" Width="40%" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nilai Pengajuan
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNilai" runat="server" Width="40%" ReadOnly="true" Theme="Youthful">
                            <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>

        <br />
        <div class="borderdetail">
            <table style="width:100%">
                <tr>
                    <td style="width:20%">
                        Tanggal
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="deTanggal" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nilai Sisa
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNilaiPerwab" runat="server" Width="40%" Theme="Youthful">
                            <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Catatan
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtCatatan" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Akun Panjar (Kredit)
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbAkun" runat="server" ValueType="System.String" Theme="Youthful" Width="60%"></dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Akun Lawan (Debet)
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbLawan" runat="server" ValueType="System.String" Theme="Youthful" Width="60%"></dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <dx:ASPxButton ID="btnSubmit" runat="server" Text="Posting" OnClick="btnSubmit_Click"></dx:ASPxButton>
        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Cancel" NavigateUrl="~/Akuntansi/PerwabPanjar.aspx">
        </dx:ASPxHyperLink>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
