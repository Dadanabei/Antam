<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RepUsulanBinaLingUserControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepBinaLingUserControl.RepUsulanBinaLingUserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraReports.v13.2.Web, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<div id="page-wrapper">
    <h2 class="page-header">Laporan Usulan Bina Lingkungan</h2>   
    <div id="reportpanel">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblCabang" Theme="Youthful" runat="server" Text="Cabang"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbltitik3" Theme="Youthful" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbCabang" runat="server" ValueType="System.String" Width="100%" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <dx:ASPxLabel ID="lblTanggalMulai" Theme="Youthful" runat="server" Text="Mulai Tanggal"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblTitik1" Theme="Youthful" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td class="tdmepet">
                    <dx:ASPxDateEdit ID="dateTanggalMulai" runat="server" Width="100%" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblSampaiTanggal" Theme="Youthful" runat="server" Text="s/d"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dateSampaiTanggal" runat="server" Width="100%" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" EnableTheming="true" Theme="Youthful"></dx:ASPxButton>
                    <dx:ASPxButton ID="btnExport" runat="server" Text="Export" EnableTheming="true" Theme="Youthful" OnClick="btnExport_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            Processing...
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
        </Triggers>
        <ContentTemplate>
            <dx:ASPxGridView ID="gvReportUsulanBinaling" runat="server" Width="100%" Theme="Youthful" OnLoad="gvReportUsulanBinaling_Load" AutoGenerateColumns="false">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Nama Pemohon" Name="requestor_name" FieldName="requestor_name"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Instansi" Name="requestor_company" FieldName="requestor_company"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Alamat" Name="requestor_address" FieldName="requestor_address"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="No.Telp/HP" Name="requestor_phone1" FieldName="requestor_phone1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Kota/Kabupaten" Name="city_name" FieldName="city_name"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Tgl. Daftar" Name="registration_date" FieldName="registration_date" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Nilai Pengajuan" Name="requested_amount" FieldName="requested_amount" PropertiesTextEdit-DisplayFormatString="##,#.00"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Cabang" Name="branch_code" FieldName="branch_code"></dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <dx:ASPxGridViewExporter ID="gridExporter" runat="server" ExportedRowType="All"></dx:ASPxGridViewExporter>

</div>
