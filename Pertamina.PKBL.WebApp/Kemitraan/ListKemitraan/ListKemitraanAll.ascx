<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListKemitraanAll.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.ListKemitraan.ListKemitraanAll" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJKR.ascx" TagPrefix="uc1" TagName="ListKemitraanJKR" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJDB.ascx" TagPrefix="uc1" TagName="ListKemitraanJDB" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJSU.ascx" TagPrefix="uc1" TagName="ListKemitraanJSU" %>




    <div>
        <br />
        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Keterangan" Font-Bold="true"></dx:ASPxLabel>
        <br />
        <table style="width:60%">
            <tr>
                <td style="width:33%; vertical-align:top">
                    <uc1:ListKemitraanJKR runat="server" id="ListKemitraanJKR" />
                </td>
                <td style="width:34%; vertical-align:top">
                    <uc1:ListKemitraanJDB runat="server" id="ListKemitraanJDB" />
                </td>
                <td style="width:33%; vertical-align:top">
                    <uc1:ListKemitraanJSU runat="server" id="ListKemitraanJSU" />
                </td>
            </tr>
            
        </table>
    </div>