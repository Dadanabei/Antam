<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepUsulanPemohonProgramKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepKemitraan.RepUsulanPemohonProgramKemitraan" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <span style="font-size:xx-large">Daftar Proposal Program Kemitraan</span>
    <br />
    <div class="borderdetail">
        <table style="width:100%">
            <tr>
                <td>
                    Mulai Tanggal
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggalM" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
                <td>
                    Sampai Tanggal
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggalS" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
                <td>
                    Status  
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbStatus" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
        </table>
        <div class="borderdetail">
            Region<br />
            <dx:ASPxComboBox runat="server" ID="cbbRegion" Theme="Youthful"></dx:ASPxComboBox>
        </div>
        <table>
            <tr>
                <td>
                    Search
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtSearch" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxButton runat="server" ID="btnGo" Text="Go" Theme="Youthful" OnClick="btnGo_Click"></dx:ASPxButton>                    
                </td>
            </tr>
        </table>        
    </div>
    <div> 
        <dx:ASPxButton runat="server" ID="btnExport" Text="Export XLS" Theme="Youthful" OnClick="btnExport_Click"></dx:ASPxButton>                    
    </div>
    <br />
    <asp:UpdatePanel ID="updPanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnGo" EventName="Click" />            
        </Triggers>
        <ContentTemplate>        
    <dx:ASPxGridView runat="server" ID="gvUsulan" Width="100%" Theme="Youthful" OnLoad="gvUsulan_Load">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No" FieldName="NomorPersetujuan">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Nama Pemohon" FieldName="requestor_name">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Nama Usaha" FieldName="company_name">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Alamat" FieldName="requestor_address">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Telp/Hp" FieldName="requestor_phone1">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Kota/Kabupaten" FieldName="city_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal Daftar" FieldName="registration_date" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
            </dx:GridViewDataDateColumn>
              <dx:GridViewDataTextColumn Caption="Nilai Pengajuan" FieldName="requested_amount" PropertiesTextEdit-DisplayFormatString="##,#.00"> 
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Cabang" FieldName="branch_code">
            </dx:GridViewDataTextColumn>
        </Columns>                   
        <TotalSummary>
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="requested_amount" DisplayFormat="Total : ##,#.00"/>
        </TotalSummary>
        <SettingsPager AlwaysShowPager="true" Mode="ShowPager" PageSize="100"> </SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowGroupFooter="VisibleIfExpanded" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
            <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
         </StylesPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="true" />

    </dx:ASPxGridView>
    </ContentTemplate>
   </asp:UpdatePanel>    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
    <dx:ASPxGridViewExporter ID="gridExporter" GridViewID="gvUsulan" Landscape="false" runat="server"></dx:ASPxGridViewExporter>
</asp:Content>
