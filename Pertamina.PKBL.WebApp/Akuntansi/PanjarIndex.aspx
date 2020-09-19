<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PanjarIndex.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PanjarIndex" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="bodydetail">
        <div class="borderdetail">
            <table style="width:100%">
                <tr>
                    <td colspan="2">
                        <dx:ASPxLabel ID="lblTerima" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dx:ASPxLabel ID="lblBanyaknya" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Untuk Pembayaran"></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dx:ASPxLabel ID="lblJumlah" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%">

                    </td>
                    <td style="text-align:center">
                        <dx:ASPxLabel ID="lblTanggal" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Catatan : Pembayaran dianggap syah/lunas setelah Bilyet Giro - Cheque dapat diuangkan"></dx:ASPxLabel>
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
                        <dx:ASPxDateEdit ID="deTanggal" runat="server" Theme="Youthful"></dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        No. Ref
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNoref" runat="server" Width="40%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nama 
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNama" runat="server" Width="60%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        NIP
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNIP" runat="server" Width="40%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nilai Yang Disetujui
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNilai" runat="server" Width="60%" Theme="Youthful">
                            <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Akun Kas/Bank
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbKasBank" runat="server" ValueType="System.String" Width="60%" Theme="Youthful" ></dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Akun Panjar
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbPanjar" runat="server" ValueType="System.String" Width="60%" Theme="Youthful"></dx:ASPxComboBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <dx:ASPxButton ID="btnSubmit" runat="server" Text="Posting" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
            &nbsp
            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Batal" NavigateUrl="~/Akuntansi/LihatPanjar.aspx" Theme="Youthful">
            </dx:ASPxHyperLink>
        </div>
    </div>
</asp:Content>
