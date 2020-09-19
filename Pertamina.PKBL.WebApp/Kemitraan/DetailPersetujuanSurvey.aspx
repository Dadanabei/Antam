<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPersetujuanSurvey.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.DetailPersetujuanSurvey" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

 
<div class="bodydetail">    
<div class="borderdetail">

    <table style="width:100%">
        <tr>
            <td style="width:20%"">
                <asp:Label ID="Label17"  runat="server" Text="Tanggal Persetujuan"></asp:Label>
            </td>
            <td >
                <dx:ASPxDateEdit ID="deTglPersetujuan" runat="server" DisplayFormatString="dd/MM/yyyy" Theme="Youthful" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td style="width:20%"">
                <asp:Label ID="Label1"  runat="server" Text="Nama"></asp:Label>
            </td>
            <td >
                <dx:ASPxTextBox ID="txtNama" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Alamat"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtAlamat" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
                <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="No. Srt. Permohonan"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtNoSrtPermohonan" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
                <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="No. Penilaian"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtNoPenilaian" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
                <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Penyalur"></asp:Label>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbPenyalur" runat="server" ValueType="System.String" Theme="Youthful" ></dx:ASPxComboBox>
            </td>
        </tr>
                <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Nilai Pengajuan"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtNilaiPengajuan" Width="60%" runat="server" ReadOnly="true" Theme="Youthful" >
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>


        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Maksimal Kredit"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtMaksimalKredit" Width="60%" runat="server" Theme="Youthful">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Kegunaan"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtKegunaan" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Jenis Kredit"></asp:Label>
            </td>
            <td>
                <dx:ASPxCheckBox ID="cbPinjamanModalKerja" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Jangka Waktu"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtJangkaWaktu" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Bunga"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtBunga" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Pengembalian"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtPengembalian" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Pembayaran"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtPembayaran" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="Syarat Akad Kredit"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtSyaratAkadKredit" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="Syarat Penarikan"></asp:Label>
            </td>
            <td>
                <dx:ASPxTextBox  ID="txtSyaratPenarikan" Width="60%" runat="server" Theme="Youthful" ></dx:ASPxTextBox>
            </td>

        </tr>
    </table>
    </div>
    <asp:Label ID="Label16" runat="server" Text="Keputusan"></asp:Label>

    <dx:ASPxComboBox ID="cbbSetuju" runat="server" ValueType="System.String" Theme="Youthful" ></dx:ASPxComboBox>
    <br />
    <dx:ASPxButton ID="btnSimpan" runat="server" Text="Simpan" OnClick="btnSimpan_Click" Theme="Youthful" ></dx:ASPxButton>
    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Kembali" NavigateUrl="PersetujuanSurvey.aspx">
    </dx:ASPxHyperLink>

    <dx:ASPxLabel ID="lblInfo" runat="server" Text=""></dx:ASPxLabel>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
