<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPersetujuanHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Hibah.DetailPersetujuanHibah" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <div class="bodydetail">

        <div class="borderdetail">
        <table style="width:70%" class="tbllayout">
            <tr >
                <td style="width:30%">
                    <dx:ASPxLabel runat="server" ID="lblTanggal" Text="Kode"></dx:ASPxLabel>
                    <span style="color:red"></span>

                </td>
                <td>
                     <dx:ASPxTextBox runat="server" ID="txtProposalNumber" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="ASPxLabel1" Text="Tanggal Pendaftaran"></dx:ASPxLabel>
                    <span style="color:red"></span>

                </td>
                <td>
                     <dx:ASPxDateEdit runat="server" ID="txtTanggalPendaftaran" Theme="Youthful" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
        </div>
        <br />
        <br />
        <dx:ASPxLabel runat="server" ID="ASPxLabel39" Font-Bold="true" Text="Data Pribadi Pemohon" Font-Size="12px"></dx:ASPxLabel>           
        <div class="borderdetail">
        <table style="width:70%" class="tbllayout">
            <tr >
                <td style="width:30%">
                    <dx:ASPxLabel runat="server" ID="ASPxLabel2" Text="Nama"></dx:ASPxLabel>
                </td>
                <td>
                     <dx:ASPxTextBox runat="server" ID="txtNama" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="ASPxLabel3" Text="Alamat"></dx:ASPxLabel>

                </td>
                <td>
                     <dx:ASPxDateEdit runat="server" ID="txtAlamat" Theme="Youthful" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="ASPxLabel4" Text="No Surat Pemohon"></dx:ASPxLabel>

                </td>
                <td>
                     <dx:ASPxDateEdit runat="server" ID="txtNoProposal" Theme="Youthful" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
        </div>


        <br />
        <br />
        <dx:ASPxLabel runat="server" ID="ASPxLabel5" Font-Bold="true" Text="Ketentuan dan Syarat-syarat" Font-Size="12px"></dx:ASPxLabel>           
        <div class="borderdetail">
            <table style="width:70%" class="tbllayout">

            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
