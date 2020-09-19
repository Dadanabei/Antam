<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DiskonJasa.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.DiskonJasa" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxLabel runat="server" Text="Diskon Jasa" Font-Size="Large"></dx:ASPxLabel>
    <br /><br />
    <dx:ASPxGridView runat="server" ID="gvDiskonJasa" AutoGenerateColumns="False" EnableTheming="True" Theme="Youthful" Width="100%" 
        OnCustomButtonCallback="gvDiskonJasa_CustomButtonCallback" OnCustomButtonInitialize="gvDiskonJasa_CustomButtonInitialize" 
         OnHtmlRowPrepared="gvDiskonJasa_HtmlRowPrepared" KeyFieldName="mitra_id">
        <Columns>
            <dx:GridViewDataTextColumn Caption="#" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="debitur" VisibleIndex="1" Visible="false" FieldName="mitra_id">
            </dx:GridViewDataTextColumn>
             <dx:GridViewCommandColumn Caption="Kode" VisibleIndex="2">
                 <CustomButtons>
                     <dx:GridViewCommandColumnCustomButton ID="debitur" Text=""></dx:GridViewCommandColumnCustomButton>
                 </CustomButtons>
            </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn Caption="Nama" VisibleIndex="3" FieldName="requestor_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="proposal" VisibleIndex="3" Visible="false" FieldName="proposal_number">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn Caption="Tanggal" VisibleIndex="4" FieldName="tglRealisasi">
                 <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn Caption="Pinjaman" VisibleIndex="5" FieldName="NilaiPencairan">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Sisa Pokok" VisibleIndex="6" FieldName="SisaPokok">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Sisa Jasa" VisibleIndex="7" FieldName="sisabunga">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Opr." name="Opr." VisibleIndex="8" ButtonType="Image" ShowClearFilterButton="true">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton  ID="btnTambah" Text="Tambah" Visibility="AllDataRows">
                        <Image Url="../content/images/new.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
             <dx:GridViewDataComboBoxColumn Caption="Region" VisibleIndex="9" FieldName="branch_code">
             </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataTextColumn Caption="User Log" VisibleIndex="10" FieldName="created_by">
            </dx:GridViewDataTextColumn>

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

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

        <SettingsPager AlwaysShowPager="True"></SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
        </SettingsPopup>
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
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
