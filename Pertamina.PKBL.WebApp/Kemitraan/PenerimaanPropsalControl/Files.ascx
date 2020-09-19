<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Files.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.Files" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div class="bodydetail">
<div class="borderdetail">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="File" Theme="Youthful"></dx:ASPxLabel>
            </td>
            <td>
                <asp:LinkButton ID="download" runat="server" OnClick="download_Click" CommandArgument="">
                </asp:LinkButton>
            </td>
        </tr>
      <tr style="height:20px;">
        <td colspan="3">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Upload file untuk mengganti file yang sudah ada" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>

        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td colspan="2">
                        <asp:FileUpload ID="fileUpload" runat="server" />
        </td>
        <td>

        </td>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Max File Size" ></asp:Label>
        </td>
      </tr>
    </table>
</div>
<br />
<div>
    <dx:ASPxButton ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Update" Theme="Youthful"></dx:ASPxButton>
</div>
</div>