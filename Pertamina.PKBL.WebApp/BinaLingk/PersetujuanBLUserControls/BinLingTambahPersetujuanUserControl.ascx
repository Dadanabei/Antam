<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BinLingTambahPersetujuanUserControl.ascx.cs" Inherits="Pertamina.PKBL.WebApp.BinaLingk.PersetujuanBLUserControls.BinLingTambahPersetujuanUserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<dx:ASPxGridView ID="gvDaftarDisetujui" Styles-Header-HorizontalAlign="Center" runat="server" KeyFieldName="id" AutoGenerateColumns="False" Width="100%" 
         Theme="Youthful" >
        <SettingsBehavior ConfirmDelete="True"/>
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <Columns>
            <dx:GridViewCommandColumn Caption="Opr." ShowClearFilterButton="true" Width="5%" VisibleIndex="13" CellStyle-HorizontalAlign="Center" ShowNewButton="True" ShowInCustomizationForm="True">
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="#" FieldName="No" Name="No" VisibleIndex="0" Width="2%" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" >
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No.Form" VisibleIndex="1" Width="8%" CellStyle-HorizontalAlign="Center" ReadOnly="True" ShowInCustomizationForm="True" >
                <EditFormSettings VisibleIndex="3" />
                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" FieldName="Nama" Name="Nama" VisibleIndex="2" Width="7%" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True">
                <EditFormSettings Caption="Atas Nama" VisibleIndex="6" />
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Alamat" VisibleIndex="5" Width="9%" ShowInCustomizationForm="True">
                <PropertiesMemoEdit Height="50px"/>
                <EditFormSettings VisibleIndex="7" />
                <EditFormCaptionStyle VerticalAlign="Top" />
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn Caption="No Proposal" VisibleIndex="6" Width="7%" ReadOnly="True" ShowInCustomizationForm="True">
                <EditFormSettings VisibleIndex="2" />
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tgl. Proposal" VisibleIndex="8" Width="7%" ShowInCustomizationForm="True">
                <PropertiesDateEdit DisplayFormatString="">
                    <DropDownButton>
                        <Image Url="~/content/images/calendar.png">
                        </Image>
                    </DropDownButton>
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="1" />
                <CellStyle HorizontalAlign="Right">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Status" VisibleIndex="12" Width="7%" ShowInCustomizationForm="True">
                <EditFormSettings VisibleIndex="15" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Instansi" VisibleIndex="4" Width="15%" ShowInCustomizationForm="True">
                <EditFormSettings VisibleIndex="5" />
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="JBL" VisibleIndex="11" Width="5%" ShowInCustomizationForm="True">
                <EditFormSettings Caption="Jenis Bina Lingkungan" VisibleIndex="14" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="No. Pemohon" Visible="False" VisibleIndex="14" ReadOnly="True" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" VisibleIndex="4" />
                <CellStyle HorizontalAlign="Left"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kota" Visible="False" VisibleIndex="15" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" VisibleIndex="8" />
                <CellStyle HorizontalAlign="Center"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nilai Direkomendasi" Visible="False" VisibleIndex="16" ReadOnly="True" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" VisibleIndex="10" />
                <CellStyle HorizontalAlign="Right"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nilai Disetujui" Visible="False" VisibleIndex="17" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" VisibleIndex="11" />
                <CellStyle HorizontalAlign="Right"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Judul Proposal" Visible="False" VisibleIndex="18" ReadOnly="True" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" VisibleIndex="12" />
                <CellStyle HorizontalAlign="Center"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Bentuk Kegiatan" Visible="False" VisibleIndex="21" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Work Order" Visible="False" VisibleIndex="20" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" VisibleIndex="13" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataMemoColumn Caption="Syarat Pemberian Dana" Visible="False" VisibleIndex="22" ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" />
                <PropertiesMemoEdit Height="50px"/>
                <EditFormCaptionStyle VerticalAlign="Top" />
                <CellStyle HorizontalAlign="Left"/>
            </dx:GridViewDataMemoColumn>
        </Columns>
            <SettingsCommandButton>
                <NewButton>
                    <Image ToolTip="New" Url="../content/images/new.png"  />
                </NewButton>
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