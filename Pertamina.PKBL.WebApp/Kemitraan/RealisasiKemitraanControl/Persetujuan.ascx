<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Persetujuan.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.RealisasiKemitraanControl.Persetujuan" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<h2 class="page-header">Realisasi Akad Kredit</h2>

<dx:ASPxGridView ID="gvPersetujuan" runat="server" AutoGenerateColumns="False" Width="100%" Theme="Youthful" 
    OnCustomButtonCallback="gvPersetujuan_CustomButtonCallback" SettingsBehavior-AllowFocusedRow="true" 
    KeyFieldName="proposal_number" OnCustomButtonInitialize="gvPersetujuan_CustomButtonInitialize" OnHtmlRowPrepared="gvPersetujuan_HtmlRowPrepared" >
    <Columns>
        <dx:GridViewDataTextColumn Caption="No."  VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="No. Form" Name="proposal_number" FieldName="proposal_number" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama" Name="requestor_name" FieldName="requestor_name" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama Usaha" Name="company_name" FieldName="company_name" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Kota" Name="city_name" FieldName="city_name" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Max Kredit" Name="NilaiSetuju" FieldName="NilaiSetuju" VisibleIndex="5">
            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="JKR" Name="JenisKredit" FieldName="JenisKredit" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="JDB" Name="descr" FieldName="descr" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Status" Name="Status" FieldName="Status" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewCommandColumn Caption="Opr." VisibleIndex="9" ButtonType="Image" Name="opr" >
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton ID="custom" Text="Tambah" Visibility="AllDataRows"> 
                    <Image Url="~/content/images/new.png"></Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="Cabang" Name="branch_code" FieldName="branch_code" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="User Log" Name="Modified_by" FieldName="Modified_by" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

    <Styles>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
            <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
        </StylesPager>
</dx:ASPxGridView>
