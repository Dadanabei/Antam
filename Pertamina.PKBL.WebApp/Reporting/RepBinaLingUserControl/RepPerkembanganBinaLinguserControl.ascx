<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RepPerkembanganBinaLinguserControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepBinaLingUserControl.RepPerkembanganBinaLinguserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v13.2.Web, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<div class="borderdetail">
    <table>
        <tr>
            <td>
                Pilih Cabang
            </td>
            <td>
               <dx:ASPxComboBox runat="server" ID="cbbcabang" Theme="Youthful"></dx:ASPxComboBox>
            </td>
        </tr>
         <tr>
            <td>
                Laporan Tahun
            </td>
            <td>
               <dx:ASPxDateEdit runat="server" ID="txtTahun" DisplayFormatString="yyyy" Theme="Youthful"></dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
    <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit"></dx:ASPxButton>
</div>