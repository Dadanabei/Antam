<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ProvinceIndex.aspx.cs" Inherits="Pertamina.PKBL.WebApp.ProvinceIndex" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">

    <dx:ASPxGridView ID="gvPropinsi" runat="server" Width="100%" AutoGenerateColumns="False" Theme="Youthful" KeyFieldName="province_code"
         OnRowDeleting="gvPropinsi_RowDeleting" OnRowUpdating="gvPropinsi_RowUpdating" OnRowInserting="gvPropinsi_RowInserting">
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <Columns>
            <dx:GridViewCommandColumn Width="5%" Name="opr" ShowEditButton="True" ShowNewButtonInHeader="True" ButtonType="Image" VisibleIndex="5" ShowClearFilterButton="True" ShowDeleteButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Width="5%" Caption="Kode Provinsi" VisibleIndex="1" FieldName="province_code" Name="KodeProvinsi">
                <EditFormSettings Visible="true" />
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Width="40%" Caption="Provinsi" VisibleIndex="2" FieldName="province_name" Name="Provinsi">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Width="30%" Caption="Ibukota" VisibleIndex="3" FieldName="capital_name" Name="Ibukota">
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataComboBoxColumn Width="20%" Caption="Cabang" FieldName="branch_code" Name="branch_code" VisibleIndex="4">
                <EditFormSettings Visible="false" />
            </dx:GridViewDataComboBoxColumn>--%>
        </Columns>
        <SettingsBehavior ConfirmDelete="true" />
        <SettingsPager AlwaysShowPager="True">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
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

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="FooterContent">

</asp:Content>
