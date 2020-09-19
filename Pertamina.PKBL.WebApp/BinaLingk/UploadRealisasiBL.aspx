<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UploadRealisasiBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.BinaLingk.UploadRealisasiBL" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <style>
        #theform>tbody>tr{
            height:25px;
        }

        #theform>tbody>tr>:first-child {
            width:200px;
            font-size:larger;
        }
    </style>
    <%= ViewState["msg"] %>
    <dx:ASPxGridView ID="gvPenyaluranSaldo" ClientInstanceName="gvPenyaluranSaldo" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Youthful" Width="100%" >
        <Columns>
            <dx:GridViewDataTextColumn Caption="No Akun" Name="COA" FieldName="COA" VisibleIndex="0" Width="30%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name" VisibleIndex="1" Width="40%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo" Name="SaldoAkhir" FieldName="SaldoAkhir" VisibleIndex="2" Width="30%">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

        </Columns>
        
        <SettingsPager AlwaysShowPager="false" PageSize="100">
         </SettingsPager>
    </dx:ASPxGridView>

    <br />
    <br />
    <br />
    <br />
    <br />

    <asp:LinkButton ID="linkDownload" runat="server" OnClick="linkDownload_Click" Text="Template Upload Penyaluran BL" Font-Size="Larger"></asp:LinkButton>
    <br />
    <asp:HyperLink ID="kot" runat="server" Text="List Kota Kabupaten" Font-Size="Larger" NavigateUrl="~\Administer\DownloadMaster.aspx?mstnm=CityIndex" Target="_blank"></asp:HyperLink>
    <br />
    <asp:HyperLink ID="jbl" runat="server" Text="List JBL" Font-Size="Larger" NavigateUrl="~\Administer\DownloadMaster.aspx?mstnm=JBL" Target="_blank"></asp:HyperLink>
    <br />
    <br />
    <dx:ASPxComboBox ID="cbbKota2" runat="server" Visible="false" ></dx:ASPxComboBox>
    <dx:ASPxComboBox ID="cbbJBL" runat="server" Visible="false"></dx:ASPxComboBox>
    <table id="theform">
        <tr>
            <td>File</td>
            <td>
                <asp:FileUpload ID="fuUploadData" runat="server"/>
            </td>
        </tr>
        <tr>
            <td>Tanggal Realisasi</td>
            <td>
                <dx:ASPxDateEdit ID="deTglRealisasi" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td>Akun</td>
            <td>
                <dx:ASPxComboBox ID="cbbNamaAkun" runat="server" Theme="Youthful"></dx:ASPxComboBox>
            </td>
        </tr>
        
    </table>
    
    
    <asp:Button ID="btnPreview" Text="Preview" runat="server" OnClick="btnPreview_Click" />
    <dx:ASPxLabel ID="lblKeterangan" Font-Bold="true" Font-Size="Larger" runat="server"></dx:ASPxLabel>


    <div class="bodydetail" style="overflow:auto;overflow-y:hidden;overflow-x:scroll">
        <dx:ASPxGridView ID="gPreview" runat="server" SettingsPager-PageSize="100" SettingsPager-AlwaysShowPager="true" Settings-ShowFooter="true" SettingsPager-Visible="true" OnPageIndexChanged="gPreview_PageIndexChanged" Theme="Youthful">
            <Columns>
                <dx:GridViewDataColumn Caption="No" Name="No" VisibleIndex="0"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Message" Name="Message" FieldName="Message" Visible="false" VisibleIndex="1"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="NomorProposal" Name="NomorProposal" FieldName="NomorProposal"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="JudulProposal" Name="JudulProposal" FieldName="JudulProposal"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Tgldaftar" Name="Tgldaftar" FieldName="Tgldaftar"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="TglDiterima" Name="TglDiterima" FieldName="TglDiterima"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Instansi" Name="Instansi" FieldName="Instansi"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="AtasNama" Name="AtasNama" FieldName="AtasNama"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Alamat" Name="Alamat" FieldName="Alamat"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Kecamatan" Name="Kecamatan" FieldName="Kecamatan"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="KotaKab" Name="KotaKab" FieldName="KotaKab"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Kodepos" Name="Kodepos" FieldName="Kodepos"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Telfon" Name="Telfon" FieldName="Telfon"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Handphone" Name="Handphone" FieldName="Handphone"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Email" Name="Email" FieldName="Email"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="BentukKegiatan" Name="Email" FieldName="Email"></dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn Caption="NilaiPengajuan" Name="NilaiPengajuan" FieldName="NilaiPengajuan" PropertiesTextEdit-DisplayFormatString="##,#.00"></dx:GridViewDataTextColumn>
                <dx:GridViewDataColumn Caption="JBL" Name="JBL" FieldName="JBL"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="DeskripsiBantuan" Name="DeskripsiBantuan" FieldName="DeskripsiBantuan"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Kepada" Name="Kepada" FieldName="Kepada"></dx:GridViewDataColumn>
                
            </Columns>

            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="NilaiPengajuan" DisplayFormat="##,#.00" ShowInColumn="NilaiPengajuan" SummaryType="Sum" />
            </TotalSummary>

        </dx:ASPxGridView>

    </div>
    <asp:Button ID="btnSave" Text="Save" Visible="false" runat="server" OnClick="btnSave_Click" />

    

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>

