<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Verifikator.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Verifikator" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Verifikator</h2>
        <div id="mappingpanel">
        <table>
            
            <tr>
                <td class="label">
                    <dx:ASPxLabel ID="lblPermintaan" runat="server" Text="Permintaan"></dx:ASPxLabel>
                </td>

                <td>
                    <dx:ASPxLabel ID="lblTitik0" runat="server" Text=":"></dx:ASPxLabel>
                </td>

                <td>
                    <dx:ASPxTextBox ID="txtPermintaan" runat="server" ></dx:ASPxTextBox>
                </td>

            </tr>
            <tr>
                <td class="label">
                    <dx:ASPxLabel ID="lblVerifikasi" runat="server" Text="Verifikasi"></dx:ASPxLabel>
                </td>

                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text=":"></dx:ASPxLabel>
                </td>

                <td>
                    <dx:ASPxTextBox ID="txtVerifikasi" runat="server" ></dx:ASPxTextBox>
                </td>

            </tr>
            <tr>
                <td class="label">
                    <dx:ASPxLabel ID="lblPenyetuju" runat="server" Text="Penyetuju"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblTitik1" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtPenyetuju" runat="server" ></dx:ASPxTextBox> 
                </td>

            </tr>

            <tr>
                <td>
                    <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1"></dx:ASPxButton>
                </td>
                <td>
                    
                </td>
                <td>
                    
                </td>

            </tr>

        </table>
   </div>
           <%-- <div class="mappingpanel">
                <table>
                    <tr>
                           <td class="label"> <dx:ASPxLabel ID="lblPermintaan" runat="server" Text="Permintaan"></dx:ASPxLabel></td>
                            <td> <dx:ASPxTextBox ID="txtPermintaan" runat="server" ></dx:ASPxTextBox> </td>
                    </tr>
                     <tr>
                           <td class="label"> <dx:ASPxLabel ID="lblVerifikasi" runat="server" Text="Verifikasi"></dx:ASPxLabel></td>
                            <td> <dx:ASPxTextBox ID="txtVerifikasi" runat="server" ></dx:ASPxTextBox> </td>
                    </tr>
                     <tr>
                           <td class="label"> <dx:ASPxLabel ID="lblPenyetuju" runat="server" Text="Penyetuju"></dx:ASPxLabel></td>
                            <td> <dx:ASPxTextBox ID="txtPenyetuju" runat="server" ></dx:ASPxTextBox> </td>

                    </tr>

                </table>
                <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1"></dx:ASPxButton>
        </div>--%>
   
</asp:Content>
