<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepJurnalDetail.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLainLain.RepJurnalDetail" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:xx-large">Daftar Jurnal Detail</span>
    <br />
    <div class="borderdetail">
        <table style="width:100%">
            <tr>
                <td>
                    No Bukti
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNo" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                <td>
                    Dari
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtDari" Theme="Youthful" Width="100px" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
                <td>
                    Hingga
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtHingga" Theme="Youthful" Width="100px" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
                <%--<td>
                    Nama bank
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbBank" Theme="Youthful" Width="100px"></dx:ASPxComboBox>
                </td>--%>
                <td>
                    Cabang
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbCabang" Theme="Youthful" Width="100px"></dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnFilter" Text="Filter" Theme="Youthful" OnClick="btnFilter_Click" > </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxButton runat="server" ID="btnExport" Text="Export XLS" Theme="Youthful" OnClick="btnExport_Click"></dx:ASPxButton>                    
    </div>
    <br />
    <dx:ASPxGridView runat="server" ID="gvDetail" Width="100%" Theme="Youthful" OnLoad="gvDetail_Load" 
        SettingsPager-PageSize="100" OnHtmlRowPrepared="gvDetail_HtmlRowPrepared">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal" FieldName="TglBayar" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
            </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn Caption="No.Bukti" FieldName="NoBukti">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="KodeAkun#NamaAkun" FieldName="kodeNamaAkun">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Deskripsi" FieldName="Deskripsi">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Debet" FieldName="Debet" PropertiesTextEdit-DisplayFormatString="##,#.00">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kredit" FieldName="Kredit" PropertiesTextEdit-DisplayFormatString="##,#.00">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Area" FieldName="KodeCabang">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="Debet" ShowInColumn="Debet" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="Kredit" ShowInColumn="Kredit" />
        </TotalSummary>
          <SettingsPager AlwaysShowPager="True">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowFooter="true" />
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
    <dx:ASPxGridViewExporter ID="gridExporter" GridViewID="gvDetail" Landscape="false" runat="server"></dx:ASPxGridViewExporter>
</asp:Content>
