<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RepArusDanaProgramBinaLingUserControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepBinaLingUserControl.RepArusDanaProgramBinaLingUserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v13.2.Web, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<span style="font-size:xx-large">Lap. Arus Dana</span>
<div class="borderdetail">
    <table style="width:100%">
        <tr>
            <td>
                Tahun
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTahun" DisplayFormatString="yyyy"></dx:ASPxDateEdit>
            </td>
            <td>
                Bulan
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtBulan" DisplayFormatString="MMMMM"></dx:ASPxDateEdit>
            </td>
            <td>
                Cabang
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbCabang" ></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnFilter" Text="Filter"></dx:ASPxButton>
            </td>
            
            <td>
                <dx:ASPxButton runat="server" ID="btnKosong" Text="Kosongkan"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
<br />
