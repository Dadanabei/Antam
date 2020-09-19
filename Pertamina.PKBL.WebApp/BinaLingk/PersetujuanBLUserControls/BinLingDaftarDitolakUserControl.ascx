<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BinLingDaftarDitolakUserControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.BinaLingk.PersetujuanBLUserControls.BinLingDaftarDitolakUserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<dx:ASPxGridView ID="gvDaftarDisetujui" Styles-Header-HorizontalAlign="Center" runat="server" KeyFieldName="id" AutoGenerateColumns="False" Width="100%" 
         Theme="Youthful" >
        <SettingsBehavior ConfirmDelete="True"/>
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <Columns>
            <dx:GridViewCommandColumn Caption="Opr." ShowClearFilterButton="true" Width="5%" ShowEditButton="True" VisibleIndex="11" CellStyle-HorizontalAlign="Center">
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="#" FieldName="No" Name="No" VisibleIndex="0" Width="5%" CellStyle-HorizontalAlign="Center" >
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No.Disetujui" VisibleIndex="1" Width="5%" CellStyle-HorizontalAlign="Center" >
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" FieldName="Nama" Name="Nama" VisibleIndex="2" Width="10%" CellStyle-HorizontalAlign="Center">
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Alamat" VisibleIndex="5" Width="15%">
                <PropertiesMemoEdit Height="50px"/>
                <EditFormCaptionStyle VerticalAlign="Top" />
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn Caption="Nilai Yang Disetujui" VisibleIndex="8" Width="15%">
                <CellStyle HorizontalAlign="Right"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Instansi" VisibleIndex="4" Width="20%">
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Kota" VisibleIndex="7" Width="10%">
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="JBL" VisibleIndex="10" Width="5%">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
            <SettingsCommandButton>
                <EditButton>
                    <Image ToolTip="Edit" Url="../content/images/edit.png" />
                </EditButton>
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