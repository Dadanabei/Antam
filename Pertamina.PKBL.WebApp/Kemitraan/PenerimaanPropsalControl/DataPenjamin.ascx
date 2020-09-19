<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataPenjamin.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.DataPenjamin" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div class="bodydetail">
    <dx:ASPxLabel runat="server" ID="lblPenjamins" Font-Bold="true" Text="Suami / Istri / Orang Tua" Font-Size="14px"></dx:ASPxLabel>
    <div class="borderdetail">
    <table>
      <tr>
        <td style="width:10%">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Nama Lengkap"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNamaLengkap" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Pekerjaan"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtPekerjaan" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Alamat Rumah"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtAlamatRumah" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="No Telp/HP"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNoTelp" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Kota"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtKota" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
    </table>
</div>
<br />
<dx:ASPxLabel runat="server" ID="lblPenjamins2" Font-Bold="true" Text="Saudara di Luar Keluarga" Font-Size="14px"></dx:ASPxLabel>
<div class="borderdetail">
    <table>
      <tr>
        <td style="width:10%">
            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Nama Lengkap"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNamaLengkapSaudara" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Pekerjaan"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtPekerjaanSaudara" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Alamat Rumah"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtAlamatRumahSaudara" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="No Telp/HP"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNoTelpSaudara" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Kota"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtKotaSaudara" Theme="Youthful" runat="server" Width="60%"></dx:ASPxTextBox>
        </td>
      </tr>
    </table>
</div>
<br />
<div>
    <dx:ASPxButton ID="btnUpdate" runat="server" Theme="Youthful" OnClick="btnUpdate_Click" Text="Update"></dx:ASPxButton>
</div>
</div>