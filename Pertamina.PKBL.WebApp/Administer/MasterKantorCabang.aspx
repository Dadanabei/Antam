<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MasterKantorCabang.aspx.cs" Inherits="Pertamina.PKBL.WebApp.MasterKantorCabang" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView ID="gvKantorCabang" runat="server" AutoGenerateColumns="False" Theme="Youthful" Width ="100%" KeyFieldName="branch_code"
         OnRowDeleting="gvKantorCabang_RowDeleting" OnRowInserted="gvKantorCabang_RowInserted" OnRowUpdating="gvKantorCabang_RowUpdating" OnRowInserting="gvKantorCabang_RowInserting">
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
         <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
        <Columns>
            <dx:GridViewCommandColumn Width="5%" Name="opr" ShowClearFilterButton="True" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="8">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Width="3%" VisibleIndex="0" Caption="Kode Area" FieldName="branch_code" Name="branch_code">
            <EditFormSettings Visible ="true" />
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  VisibleIndex="1" Caption="Nama Area" FieldName="branch_name" Name="branch_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn  Caption="Kepala Area" FieldName="head_of_branch" Name="head_of_branch" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
<%--            <dx:GridViewDataComboBoxColumn Caption="Provinsi" FieldName="province_code" Name="province_code" VisibleIndex="4">
            </dx:GridViewDataComboBoxColumn>--%>
            <dx:GridViewDataMemoColumn Width="20%" Visible="false" VisibleIndex="5" Caption="Detail Area" FieldName="branch_details" Name="branch_details">
                <PropertiesMemoEdit Height="100px">
                    <Style VerticalAlign="Top">
                    </Style>
                </PropertiesMemoEdit>
            <EditFormSettings Visible="True" />
                <EditFormCaptionStyle VerticalAlign="Top">
                </EditFormCaptionStyle>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn Visible="false" Caption="Head Title" VisibleIndex="6" FieldName="head_title" Name="head_title">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Visible="false" Caption="Alamat" VisibleIndex="7" FieldName="branch_addr" Name="branch_addr">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>

        </Columns>
        <SettingsBehavior ConfirmDelete="true" />
        <SettingsPager AlwaysShowPager="True">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <SettingsPopup  EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="TopSides" >
        </SettingsPopup>
         <SettingsCommandButton>
                <NewButton>
                    <Image ToolTip="new" Url="../content/images/new.png"></Image>
                </NewButton>
                <DeleteButton>
                    <Image ToolTip="delete" Url="../content/images/delete.png"></Image>
                </DeleteButton>
                <EditButton>
                     <Image ToolTip="edit" Url="../content/images/edit.png"></Image>
                </EditButton>
             <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
            </SettingsCommandButton>
        <Styles>
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