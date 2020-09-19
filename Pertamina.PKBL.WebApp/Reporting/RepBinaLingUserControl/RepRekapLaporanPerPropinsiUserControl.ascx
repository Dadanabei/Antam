<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RepRekapLaporanPerPropinsiUserControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepBinaLingUserControl.RepRekapLaporanPerPropinsiUserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v13.2.Web, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<span style="font-size:x-large">RekapLaporan Bina lingkungan Per propinsi</span>
<br /><br />
<div class="borderdetail">
    <table>
        <tr>
            <td>
                Mulai Tanggal
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTgl1"></dx:ASPxDateEdit>
            </td>
            <td>
             <td>
               Sampai Tanggal 
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTanggal2"></dx:ASPxDateEdit>
            </td>
            <td>
                Pilih Cabang
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbCabang"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit"></dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnClear" Text="Clear"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
