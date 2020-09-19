<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MasterBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.MasterBL" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Src="~/BinaLingk/ListBInalingkungan.ascx" TagPrefix="uc1" TagName="ListBInalingkungan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView ID="gvJenisBinaLingkungan" Styles-Header-HorizontalAlign="Center" runat="server" KeyFieldName="id" AutoGenerateColumns="False" Width="100%" 
        OnRowDeleting="gvJenisBinaLingkungan_RowDeleting" OnHtmlRowPrepared="gvJenisBinaLingkungan_HtmlRowPrepared" OnCustomUnboundColumnData="gvJenisBinaLingkungan_CustomUnboundColumnData" OnRowInserting="gvJenisBinaLingkungan_RowInserting" OnRowUpdating="gvJenisBinaLingkungan_RowUpdating" Theme="Youthful" >
        <SettingsBehavior ConfirmDelete="True"/>
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="true" Name="opr" Width="15%" ButtonType="Image" ShowEditButton="True" ShowDeleteButton="true" ShowNewButtonInHeader="True" VisibleIndex="6" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True">
<CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="ID" FieldName="id" Name="ID" VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" >
                <EditFormSettings Visible="False" />

<CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi" FieldName="bl_kind" Name="bl_kind" VisibleIndex="2" Width="25%" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True">
<CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Keterangan" FieldName="remarks" Name="remarks" VisibleIndex="3" Width="45%" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True">
                <PropertiesMemoEdit Height="100px">
                </PropertiesMemoEdit>
                <EditFormCaptionStyle VerticalAlign="Top">
                </EditFormCaptionStyle>
<CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataMemoColumn>    
            <dx:GridViewDataCheckColumn Caption="Status" FieldName="is_active" Name="is_active" VisibleIndex="5" Width="7%" ShowInCustomizationForm="True">
                <PropertiesCheckEdit AllowGrayed="True" AllowGrayedByClick="False" DisplayTextGrayed="Unchecked" DisplayTextUndefined="Unchecked" ValueChecked="1" ValueGrayed="0" ValueType="System.Byte" ValueUnchecked="0">
                </PropertiesCheckEdit>
                <EditFormSettings Caption="Aktif / Tidak Aktif" />
            </dx:GridViewDataCheckColumn>
        </Columns>
            <SettingsCommandButton>
                <NewButton>
                    <Image ToolTip="New" Url="../content/images/new.png"  />
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
        <SettingsPager AlwaysShowPager="True">
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
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
