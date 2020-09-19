<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Administrasi.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.Administrasi" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div class="bodydetail">


<dx:ASPxLabel ID="lblAdm19" runat="server" Text="Rencana Jangka Panjang Perusahaan:"></dx:ASPxLabel>
<dx:ASPxMemo ID="mmRJPP" runat="server" Theme="Youthful" Height="71px" Width="54%"></dx:ASPxMemo>
<br />
<dx:ASPxLabel ID="lblAdm0" runat="server" Text="Rencana Jangka Panjang Perusahaan:"></dx:ASPxLabel>
<dx:ASPxMemo ID="mmRKAP" Theme="Youthful" runat="server" Height="71px" Width="54%"></dx:ASPxMemo>
<br />
<div class="borderdetail">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm" runat="server" Text="Menambah Tenaga Kerja"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtTambahTenaga" Theme="Youthful" runat="server" Width="170px" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm2" runat="server" Text="Orang"></dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm3" runat="server" Text="Membeli Bahan Baku"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbBahanBaku" ClientIDMode="Static" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm4" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtBahanBaku" ClientIDMode="Static" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm5" runat="server" Text="Membeli Mesin"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbMesin" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm6" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtMesin" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm7" runat="server" Text="Membangun / Memperluas Tempat Usaha"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbTempatUsaha" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm8" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtTempatUsaha" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm9" runat="server" Text="Mengikuti Kursus Manajemen"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbKursus" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm10" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtKursus" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm11" runat="server" Text="Meningkatkan Keterampilan Kerja Sendiri"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbKeterampilan" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm12" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtKeterampilan" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm13" runat="server" Text="Membayar Pinjaman Pada Pihak Lain"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbPinjaman" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm14" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtPinjaman" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm15" runat="server" Text="Membeli Peralatan"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbPeralatan" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm16" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtPeralatan" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblAdm17" runat="server" Text="Rencana Lain"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbRencana" Width="50%" Theme="Youthful" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="lblAdm18" runat="server" Text="Rp:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtRencana" runat="server" Width="170px">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" />
                </dx:ASPxTextBox>
            </td>
        </tr>
    </table>
    </div>
    <br />
    <dx:ASPxButton ID="btnUpdate" Theme="Youthful" runat="server" Text="Update" OnClick="btnUpdate_Click"></dx:ASPxButton>
</div>