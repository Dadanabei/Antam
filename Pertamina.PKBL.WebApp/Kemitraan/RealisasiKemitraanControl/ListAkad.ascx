<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListAkad.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.RealisasiKemitraanControl.ListAkad" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<h2 class="page-header">Daftar Akad Kredit</h2>

<dx:ASPxGridView ID="gvListAkad" runat="server" AutoGenerateColumns="False" Width="100%" Theme="Youthful" 
    OnCustomButtonCallback="gvListAkad_CustomButtonCallback" SettingsBehavior-AllowFocusedRow="true" KeyFieldName="mitra_id"
     OnHtmlRowPrepared="gvListAkad_HtmlRowPrepared">
    <Columns>
        <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Nama" Name="requestor_name" FieldName="requestor_name" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="Alamat" Name="address_district" FieldName="address_district" VisibleIndex="2">
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataDateColumn Caption="Tanggal Perjanjian" Name="TglRealisasi" FieldName="TglRealisasi" VisibleIndex="3">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="JKR" Name="JenisKredit" FieldName="JenisKredit"  VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="JDB" Name="company_kind_id" FieldName="company_kind_id" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="JSU" Name="sector_id" FieldName="sector_id" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewCommandColumn Caption="Opr." VisibleIndex="7" ButtonType="Image">
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton ID="custom" Text="Tambah" Visibility="AllDataRows"> 
                    <Image Url="~/content/images/new.png"></Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="Cabang" Name="branch_code" FieldName="branch_code" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="User Log" Name="Modified_by" FieldName="Modified_by" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
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
