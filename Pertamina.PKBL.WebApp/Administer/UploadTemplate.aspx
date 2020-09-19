<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UploadTemplate.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Administer.UploadTemplate" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <table>
        <tr>
            <td style="width:120px;">
                <dx:ASPxLabel ID="lbl" runat="server" Text="Nama Template"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbTemplateName" runat="server" Theme="Youthful"></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="File"></dx:ASPxLabel>
            </td>
            <td>
                <asp:FileUpload ID="fuTemplate" AllowMultiple="false" runat="server" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <dx:ASPxButton ID="btnSave" Text="save" runat="server" OnClick="btnSave_Click" Theme="Youthful"></dx:ASPxButton>
    <%= ViewState["msg"] %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
