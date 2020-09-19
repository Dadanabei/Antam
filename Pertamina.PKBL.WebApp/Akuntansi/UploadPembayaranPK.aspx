<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UploadPembayaranPK.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.UploadPembayaranPK" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <%= ViewState["msg"] %> 
    <dx:ASPxGridView ID="gvDetailPembayaran" runat="server" Theme="Youthful" Width="100%" AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No. Akun" Name="COA" FieldName="COA" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo" Name="SaldoAkhir" FieldName="SaldoAkhir" VisibleIndex="2">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
        </Styles>
        <SettingsPager AlwaysShowPager="false" PageSize="50"></SettingsPager>
        <StylesPager>
            <CurrentPageNumber BackColor="#FB000C">
            </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:LinkButton ID="linkDownload" runat="server" Text="Download Template" Font-Size="Larger" OnClick="linkDownload_Click"></asp:LinkButton>
    <br />
    <br />
    <br />
    <br />
    <table id="theform">
        <tr>
            <td>File</td>
            <td style="width:400px;">
                <asp:FileUpload ID="fuUploadData" runat="server" Width="400"/>
            </td>
        </tr>
        <tr>
            <td>Akun Bank</td>
            <td>
                <dx:ASPxComboBox ID="cbbCoa" runat="server" Width="400" Theme="Youthful"></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Akun Lawan</td>
            <td>
                <dx:ASPxComboBox ID="cbbLawanAkun" runat="server" Width="400" Theme="Youthful"></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>Tgl. Bayar</td>
            <td>
                <dx:ASPxDateEdit ID="deTglBayar" runat="server" Width="400" Theme="Youthful" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td>Deskripsi</td>
            <td>
                <dx:ASPxMemo ID="txtDeskripsi" runat="server" Height="71px" Width="400" Theme="Youthful"></dx:ASPxMemo>
            </td>
        </tr>
    </table>

    <asp:Button ID="btnPreview" Text="Preview" runat="server" OnClick="btnPreview_Click" />
    <dx:ASPxLabel ID="lblKeterangan" Font-Bold="true" Font-Size="Larger" runat="server"></dx:ASPxLabel>
    <div class="bodydetail" style="overflow:auto;overflow-y:hidden;overflow-x:scroll;width:100%;">
        <dx:ASPxGridView ID="gPreview" runat="server" Width="100%" SettingsPager-PageSize="100" SettingsPager-Visible="true" SettingsPager-AlwaysShowPager="true" Settings-ShowFooter="true" OnPageIndexChanged="gPreview_PageIndexChanged" Theme="Youthful">
            <Columns>
                <dx:GridViewDataColumn Caption="No" Name="No" VisibleIndex="0"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Error" Name="Message" FieldName="Message" Visible="false" VisibleIndex="0"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="No Mitra" Name="NoMitra" FieldName="NoMitra" Visible="true" VisibleIndex="1"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nama" Name="requestor_name" FieldName="requestor_name"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nama Usaha" Name="company_name" FieldName="company_name"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Alamat" Name="requestor_address" FieldName="requestor_address"></dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn Caption="Nilai Bayar" Name="NominalBayar" FieldName="NominalBayar" PropertiesTextEdit-DisplayFormatString="##,#.00"></dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="NominalBayar" DisplayFormat="##,#.00" ShowInColumn="NominalBayar" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>



    </div>
    <asp:Button ID="btnSave" Text="Save" Visible="false" runat="server" OnClick="btnSave_Click"  />


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
