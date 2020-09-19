<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataPribadi.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.DataPribadi" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:ScriptManager runat="server" ID="scriptManDataPribadi"></asp:ScriptManager>
<div class="bodydetail">
    <div class="borderdetail">
    <table>
        <tr>
            <td style="width:20%">
                <dx:ASPxLabel ID="lblDP1" runat="server" Text="Alamat Rumah *"></dx:ASPxLabel>
            </td>
            <td >
                <dx:ASPxTextBox ID="txtAlamat" Theme="Youthful" runat="server" Width="100%"></dx:ASPxTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Alamat tidak boleh kosong.." ForeColor="Red" ControlToValidate="txtAlamat" Display="Dynamic" ValidationGroup="dataPribadi"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP2" runat="server" Text="Kecamatan"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtKecamatan" Theme="Youthful" runat="server" Width="100%"></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP3" runat="server" Text="Kode Pos"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtKodepos" Theme="Youthful" runat="server" Width="100%"></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP4" runat="server" Text="Kepemilikan Rumah"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbKepRumah" Theme="Youthful" runat="server"></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP5" runat="server" Text="No. Telepon *"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtTelepon" Theme="Youthful" runat="server" Width="100%"></dx:ASPxTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Nomor Telepon tidak boleh kosong.." ForeColor="Red" ControlToValidate="txtTelepon" Display="Dynamic" ValidationGroup="dataPribadi"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP6" runat="server" Text="Handphone"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtHandphone" Theme="Youthful" runat="server" Width="100%"></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP7" runat="server" Text="Email"></dx:ASPxLabel>
                <%--<asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="lblDP7" ErrorMessage="Invalid Email Format" ValidationGroup="dataPribadi"></asp:RegularExpressionValidator>--%>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtEmail" Theme="Youthful" runat="server" Width="100%"></dx:ASPxTextBox>
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ValidationGroup="dataPribadi"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP8" runat="server" Text="Status Pernikahan"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbStatPernikahan" Theme="Youthful" runat="server"></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDP9" runat="server" Text="Pendidikan Terakhir"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbPendTerakhir" Theme="Youthful" runat="server"></dx:ASPxComboBox>
            </td>
        </tr>
    </table>
    </div>
    <br />
    <dx:ASPxButton ID="btnUpdate" runat="server" Theme="Youthful" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="dataPribadi"></dx:ASPxButton>
</div>