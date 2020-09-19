<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepRealisasiHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepKemitraan.RepRealisasiHibah" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:x-large">Lap.Realisasi Prog.kemitraan Hibah</span>
    <br />
    <div class="borderdetail">
    <table style="width:100%">
        <tr>
            <td>
                Mulai Tanggal
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTgl1" DisplayFormatString="dd/MM/yyyy" Theme="Youthful"></dx:ASPxDateEdit>
            </td>
            <td>
                Sampai Tanggal
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txttgl2" DisplayFormatString="dd/MM/yyyy" Theme="Youthful"></dx:ASPxDateEdit>
            </td>
            <td>
                Cabang
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbCabang" Theme="Youthful" ></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
            </td>
            
            <td>
                <dx:ASPxButton runat="server" ID="btnClear" Text="Clear" Theme="Youthful"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>

    <br />
    <dx:ASPxButton ID="btnReport" runat="server" Text="Export XLS" OnClick="btnReport_Click"></dx:ASPxButton>



<div class="bodydetail" style="overflow:auto;overflow-y:hidden;overflow-x:scroll">
    <dx:ASPxGridView ID="gv" runat="server" Width="100%" Theme="Youthful" AutoGenerateColumns="False" OnHtmlRowPrepared="gv_HtmlRowPrepared">
        <Columns>

            <dx:GridViewDataTextColumn Caption="No." VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Deb" VisibleIndex="1" FieldName="mitraid">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" VisibleIndex="2" FieldName="requestor_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Usaha" VisibleIndex="3" FieldName="company_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Alamat" VisibleIndex="4" FieldName="requestor_address">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="JKR" VisibleIndex="5" FieldName="JenisKredit">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="JDB" VisibleIndex="6" FieldName="company_kind_id">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="JSU" VisibleIndex="7" FieldName="sector_id">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Maks. Kredit" VisibleIndex="8" FieldName="requested_amount">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Pencairan Kredit" HeaderStyle-HorizontalAlign="Center">
                <Columns>
                    <dx:GridViewDataDateColumn Caption="Tanggal" VisibleIndex="12" FieldName="TglPencairan">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Jumlah" VisibleIndex="13" FieldName="NilaiPencairan">
                        <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="Kota" VisibleIndex="14" FieldName="city_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Region" VisibleIndex="15" FieldName="branch_code">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" ShowInColumn="requested_amount" FieldName="requested_amount" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" ShowInColumn="NilaiPencairan" FieldName="NilaiPencairan" SummaryType="Sum" />
        </TotalSummary>
        <SettingsPager AlwaysShowPager="True" PageSize="100"></SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowFooter="true" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
        </SettingsPopup>
        <Styles>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
            <Header HorizontalAlign="Center">
            </Header>
            <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>
</div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
