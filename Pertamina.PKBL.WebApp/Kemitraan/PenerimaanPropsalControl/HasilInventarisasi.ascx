<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HasilInventarisasi.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.HasilInventarisasi" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div class="bodydetail">
    <div class="borderdetail">
    <table>
      <tr>
        <td style="width:10%">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Alamat Rumah Baru" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtAlamatRumahBaru" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Telepon Baru" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtTelelponBaru" runat="server" Width="14%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
      </tr>
      <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Handphone Baru" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtHandphoneBaru" runat="server" Width="18%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
      </tr>
    </table>
</div>
<br />
<div>
    <dx:ASPxButton ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Theme="Youthful"></dx:ASPxButton>
</div>
</div>