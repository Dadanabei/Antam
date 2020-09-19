<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AccIndex.aspx.cs" Inherits="Pertamina.PKBL.WebApp.AccIndex" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView ID="gvNomorAkun" runat="server" Theme="Youthful" AutoGenerateColumns="False"  
        Styles-Header-HorizontalAlign="Center" KeyFieldName="account_id" Width="100%"
         OnRowDeleting="gvNomorAkun_RowDeleting" OnRowUpdating="gvNomorAkun_RowUpdating" OnRowInserting="gvNomorAkun_RowInserting">
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <Columns>
            <dx:GridViewCommandColumn Name="opr" ShowClearFilterButton="true" VisibleIndex="7" ButtonType="Image"  ShowNewButtonInHeader="true" 
                ShowDeleteButton="true" ShowEditButton="true" Width="5%">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="No Akun" FieldName="account_id" Name="account_id" VisibleIndex="0" Width="5%" >
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi Akun" FieldName="account_name" Name="account_name" VisibleIndex="1" Width="30%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Grup Akun" FieldName="group_id" Name="group_id" VisibleIndex="2" Width="15%">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Asset" Value="1" />
                        <dx:ListEditItem Text="Akumulasi Penyusutan" Value="2" />
                        <dx:ListEditItem Text="Modal" Value="3" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Ket" FieldName="debt_cred" Name="debt_cred" VisibleIndex="3" Width="5%">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Program" FieldName="program_id" Name="program_id" VisibleIndex="4" Width="10%">
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Header" FieldName="header_info" Name="header_info" VisibleIndex="5" Width="10%">
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Parent" FieldName="parent_account_id" Name="parent_account_id" VisibleIndex="6" Width="20%">
            <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataComboBoxColumn>
            
        </Columns>
        <SettingsCommandButton>
                <NewButton>    
                  <Image  ToolTip="New" Url="../content/images/new.png"  /> 
                </NewButton>
                <EditButton >
                    <Image  ToolTip="Edit" Url="../content/images/edit.png" />
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
           
        <SettingsPager AlwaysShowPager="True" PageSize="100">
        </SettingsPager>
           
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
        </styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C">
             </CurrentPageNumber>
         </StylesPager>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
