<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PersetujuanSurvey.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PersetujuanSurvey" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanAll.ascx" TagPrefix="uc1" TagName="ListKemitraanAll" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView ID="gvPersetujuanSurvey" Theme="Youthful" KeyFieldName="id" Width="100%" OnCustomButtonCallback="gvPersetujuanSurvey_CustomButtonCallback" 
        OnRowUpdating="gvPersetujuanSurvey_RowUpdating" runat="server" OnCustomButtonInitialize="gvPersetujuanSurvey_CustomButtonInitialize1">
        <Settings ShowFilterRowMenu="true" ShowFilterRow="true"  />
        <SettingsPager AlwaysShowPager="true"></SettingsPager>

        <SettingsCommandButton>
        </SettingsCommandButton>
        <Columns>
            
            <dx:GridViewDataTextColumn Caption="No. Persetujuan" VisibleIndex="1" FieldName="NomorPersetujuan"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" Name="requestor_name" FieldName="requestor_name" VisibleIndex="1"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Usaha" Name="company_name" FieldName="company_name" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Alamat Usaha"  VisibleIndex="3" FieldName="company_address"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nilai Pengajuan" Name="nope" FieldName="nope" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Maks Kredit" Name="requested_amount" FieldName="requested_amount" VisibleIndex="5">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="JKR" VisibleIndex="6" FieldName="JKR"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="JDB" VisibleIndex="7" FieldName="JDB"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="JSU" VisibleIndex="8" FieldName="JSU"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Jangka Waktu" Name="jangkawaktu" FieldName="jangkawaktu" VisibleIndex="9"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Bunga" Name="sukubunga" FieldName="sukubunga" VisibleIndex="10"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Status" Name="status" FieldName="status" VisibleIndex="11"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewCommandColumn Caption="Opr." Name="opr" VisibleIndex="12" ButtonType="Image">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton  ID="detail" Text="" Visibility="AllDataRows">
                        <Image Url="~/content/images/new.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Cabang" VisibleIndex="13" FieldName="branch_code"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="User Log" VisibleIndex="14" FieldName="created_by"></dx:GridViewDataTextColumn>
        </Columns>
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
    <br />
    <uc1:ListKemitraanAll runat="server" ID="ListKemitraanAll" />
</asp:Content>
