<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RepRealisasiBinaLingUserControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepBinaLingUserControl.RepRealisasiBinaLingUserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v13.2.Web, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<div id="page-wrapper">
    <h2 class="page-header">Laporan Realisasi Bina Lingkungan</h2>
    
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
                    <dx:ASPxDateEdit ID="dateTanggalMulai" runat="server" DisplayFormatString="dd/MM/yyyy" Width="100%" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblSampaiTanggal" Theme="Youthful" runat="server" Text="s/d"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dateSampaiTanggal" runat="server" DisplayFormatString="dd/MM/yyyy" Width="100%" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" EnableTheming="true" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
                    <dx:ASPxButton ID="btnExport" runat="server" Text="Export" EnableTheming="true" Theme="Youthful" OnClick="btnExport_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>

    <%--<dx:ASPxDocumentViewer ID="dvRepBinaLing" runat="server" Visible="false"></dx:ASPxDocumentViewer>--%>
</div>
<br />
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
        <dx:ASPxGridView runat="server" ID="gvBinalingUser" Width="100%" Theme="Youthful" AutoGenerateColumns="false" OnLoad="gvBinalingUser_Load" OnHtmlRowPrepared="gvBinalingUser_HtmlRowPrepared">
            <Columns>
                <dx:GridViewDataTextColumn Caption="NO">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataColumn Caption="No Bukti" Name="NoBukti" FieldName="NoBukti">
                </dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn Caption="Keterangan" Name="KetBayar" FieldName="KetBayar">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="JBL" Name="JBL" FieldName="JBL">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Tanggal Penyaluran" Name="TglBukti" FieldName="TglBukti" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Instansi" Name="requestor_company" FieldName="requestor_company">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nilai Penyaluran" Name="NilaiJumlah" FieldName="NilaiJumlah" PropertiesTextEdit-DisplayFormatString="##,#.00">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Jenis" Name="bl_kind" FieldName="bl_kind">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Propinsi" Name="province_name" FieldName="province_name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Kota/Kabupaten" Name="city_name" FieldName="city_name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Region" Name="branch_code" FieldName="branch_code">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="##,#.00" FieldName="NilaiJumlah" ShowInColumn="NilaiJumlah" SummaryType="Sum" />
            </TotalSummary>
            <SettingsPager AlwaysShowPager="True">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
                <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
            </SettingsPopup>
            <Settings ShowFilterRow="True" ShowFooter="true" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <CommandColumn Spacing="5px" />
            </Styles>
            <StylesPager>
                <CurrentPageNumber BackColor="#FB000C">
                </CurrentPageNumber>
            </StylesPager>
        </dx:ASPxGridView>

    </ContentTemplate>
</asp:UpdatePanel>
<dx:ASPxGridViewExporter ID="gridExporter" GridViewID="gvBinalingUser" runat="server" ExportedRowType="All" Landscape="true" PaperKind="Legal"></dx:ASPxGridViewExporter>
