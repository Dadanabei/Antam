<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CityIndex.aspx.cs" Inherits="Pertamina.PKBL.WebApp.CityIndex" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
     <dx:ASPxGridView ID="gvKota" runat="server" AutoGenerateColumns="False" Width="100%" Theme="Youthful"
          OnRowInserting="gvKota_RowInserting" OnRowUpdating="gvKota_RowUpdating" OnRowDeleting="gvKota_RowDeleting" KeyFieldName="city_appcode">
        <SettingsBehavior ConfirmDelete="True"/>
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
          <Columns>
            <dx:GridViewCommandColumn Width="5%" Name="opr" ShowNewButtonInHeader="True" ButtonType="Image" VisibleIndex="5" ShowEditButton="True" ShowClearFilterButton="True" ShowDeleteButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Kode 1" VisibleIndex="1" FieldName="city_id" Name="city_id" Width="5%">
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kode 2" VisibleIndex="2" FieldName="city_appcode" Name="city_appcode" Width="5%">
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kota / Kabupaten" VisibleIndex="3" FieldName="city_name" Name="city_name" Width="45%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Provinsi" FieldName="province_code" Name="province_code" VisibleIndex="4" Width="40%">
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
         <SettingsCommandButton>
            <NewButton>
                <Image ToolTip="New" Url="../content/images/new.png"/>
            </NewButton>
            <EditButton>
                <Image ToolTip="Edit" Url="../content/images/edit.png" />
            </EditButton>
            <DeleteButton>
                <Image ToolTip="Delete" Url="../content/images/delete.png" />
            </DeleteButton>
             <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
        </SettingsCommandButton>
         <SettingsPager AlwaysShowPager="True" PageSize="20">
         </SettingsPager>
         <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
         <Styles>
             <Header HorizontalAlign="Center">
             </Header>
             <CommandColumn Spacing="5px" />
         </Styles>
         <StylesPager>
             <CurrentPageNumber BackColor="#FB000C">
             </CurrentPageNumber>
         </StylesPager>
    </dx:ASPxGridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
