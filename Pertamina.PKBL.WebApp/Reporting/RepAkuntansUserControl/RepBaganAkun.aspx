<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepBaganAkun.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepAkuntansi.RepBaganAkun" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:x-large">Bagan Akun</span>
    <br />
    <table style="width:100%">
        <tr>
            <td>
                Kode
            </td>
            <td>
                <dx:ASPxTextBox runat="server" ID="txtKode" Theme="Youthful"></dx:ASPxTextBox>
            </td>
            <td>
<%--                <dx:ASPxCheckBox runat="server" ID="cbbPilihan" Text="Banyak Pilihan" Theme="Youthful"></dx:ASPxCheckBox>
                <span style="font-size:7px">Tanda pemisah antar teks (;)</span>--%>
            </td>
            <td>
                Periode
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="deTanggalMulai" Theme="Youthful" DisplayFormatString="dd/MM/yyyy" Width="100px"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="deTanggalSampai" Theme="Youthful" DisplayFormatString="dd/MM/yyyy" Width="100px"></dx:ASPxDateEdit>
            </td>
            <td>
                Region
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbRegion" Theme="Youthful" Width="100px"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbJenis" Theme="Youthful" Width="100px"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnFilter" Text="Filter" Theme="Youthful" OnClick="btnFilter_Click"></dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnReset" Text="Reset" Theme="Youthful"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <dx:ASPxButton ID="btnExport" runat="server" Text="Export to XLS" OnClick="btnExport_Click"></dx:ASPxButton>
    <br />
    <dx:ASPxGridView runat="server" ID="gvBaganAkun" Width="100%" Theme="Youthful" OnHtmlRowPrepared="gvBaganAkun_HtmlRowPrepared"
         OnCustomColumnDisplayText="gvBaganAkun_CustomColumnDisplayText" OnCustomButtonInitialize="gvBaganAkun_CustomButtonInitialize"
        OnCustomButtonCallback="gvBaganAkun_CustomButtonCallback" Settings-ShowFooter="true">
        <Columns>
            <dx:GridViewDataTextColumn Caption="Kode" Name="account_id" FieldName="account_id">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Akun" Width="40%" Name="account_name" FieldName="account_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Grup" Name="grup_nama" FieldName="grup_nama">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo Awal" Name="SaldoAwal" FieldName="SaldoAwal">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Debet" Name="Debet" FieldName="Debet">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kredit" Name="Kredit" FieldName="Kredit">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo Akhir" Name="SaldoAkhir" FieldName="SaldoAkhir">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn Caption="isTransaksi" Name="isTransaksi" FieldName="isTransaksi" Visible="false">
            </dx:GridViewDataColumn>

            <dx:GridViewCommandColumn ButtonType="Image" Caption="Opr" Name="opr">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="detail">
                        <Image Url="~/content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="SaldoAwal" ShowInColumn="SaldoAwal" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="Debet" ShowInColumn="Debet" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="Kredit" ShowInColumn="Kredit" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="SaldoAkhir" ShowInColumn="SaldoAkhir" />
        </TotalSummary>
        <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
        <Settings ShowFilterRow="True" />
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C">
             </CurrentPageNumber>
         </StylesPager>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
    <dx:ASPxGridViewExporter ID="gvExporter" GridViewID="gvBaganAkun" Landscape="false" runat="server" OnRenderBrick="gvExporter_RenderBrick"></dx:ASPxGridViewExporter>
</asp:Content>
