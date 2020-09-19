<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Lihatpanjar.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.Lihatpanjar" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:x-large">Panjar Kerja</span>
    <br />
    <br />
    <dx:ASPxButton ID="btnAdd" Text="Tambah" AutoPostBack="false" runat="server">
        <ClientSideEvents Click="function(s, e) {
	gvLihatPanjar.AddNewRow();
}">

        </ClientSideEvents>
    </dx:ASPxButton>

    <dx:ASPxGridView runat="server" ID="gvLihatPanjar" Width="100%" Theme="Youthful" AutoGenerateColumns="False" OnRowInserting="gvLihatPanjar_RowInserting"
         OnRowUpdating="gvLihatPanjar_RowUpdating" OnCustomButtonCallback="gvLihatPanjar_CustomButtonCallback" ClientInstanceName="gvLihatPanjar" 
        KeyFieldName="Nopanjar" OnInitNewRow="gvLihatPanjar_InitNewRow" OnCommandButtonInitialize="gvLihatPanjar_CommandButtonInitialize" OnCustomButtonInitialize="gvLihatPanjar_CustomButtonInitialize">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No Ref" Name="Nopanjar" ReadOnly="true" FieldName="Nopanjar">
                <EditFormSettings VisibleIndex="1" CaptionLocation="Near" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal" Name="TglPanjar" FieldName="TglPanjar">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true"></PropertiesDateEdit>
                <EditFormSettings VisibleIndex="0" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Nama" Name="Nama" FieldName="Nama">
                <EditFormSettings VisibleIndex="2" ColumnSpan="2" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tujuan" Name="deskripsi" FieldName="deskripsi">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nilai panjar" Name="NilaiPanjar" FieldName="NilaiPanjar">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true" ></PropertiesTextEdit>
                <EditFormSettings VisibleIndex="7" Caption="Panjar" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Prog" Name="jenisProgram" FieldName="jenisProgram">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Opr" Name="Opr." ShowEditButton="True" ButtonType="Image">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton  ID="Persetujuan" Text="Persetujuan" Visibility="AllDataRows">
                        <Image Url="../content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>



            
            <dx:GridViewDataTextColumn Caption="NIP" Name="nip" FieldName="nip" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="3" CaptionLocation="Near" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Jabatan" Name="jabatan" FieldName="jabatan" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="4" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataMemoColumn Caption="Tujuan" Name="Tujuan" FieldName="Tujuan" Visible="false" Width="100%" PropertiesMemoEdit-Height="50px">
                <EditFormSettings Visible="True" ColumnSpan="2" VisibleIndex="5" />
                <EditFormCaptionStyle VerticalAlign="Top"></EditFormCaptionStyle>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="Keperluan" Name="Keperluan" FieldName="Keperluan" Visible="false" Width="100%" PropertiesMemoEdit-Height="50px">
                <EditFormSettings Visible="True" ColumnSpan="2" VisibleIndex="6"/>
                <EditFormCaptionStyle VerticalAlign="Top"></EditFormCaptionStyle>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataComboBoxColumn Caption="Program" Name="program_id" FieldName="program_id" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="8" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataDateColumn Caption="Tanggal Berangkat" Name="TglBerangkat" FieldName="TglBerangkat" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true"></PropertiesDateEdit>
                <EditFormSettings Visible="True" VisibleIndex="9" />
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataDateColumn Caption="Tanggal Kembali" Name="TglKembali" FieldName="TglKembali" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true"></PropertiesDateEdit>
                <EditFormSettings Visible="True" VisibleIndex="10" />
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataTextColumn Caption="Transport Berangkat" Name="TransportBerangkat" FieldName="TransportBerangkat" Visible="false">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true"></PropertiesTextEdit>
                <EditFormSettings Visible="True" VisibleIndex="11" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Transport Kembali" Name="TransportKembali" FieldName="TransportKembali" Visible="false">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true"></PropertiesTextEdit>
                <EditFormSettings Visible="True" VisibleIndex="12" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Dibuat Oleh" Name="DibuatOleh" FieldName="DibuatOleh" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="13" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="isPosting" Name="isApproved" FieldName="isApproved" Visible="false">
                <EditFormSettings Visible="False" />
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
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2" ></SettingsEditing>
                <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
                </SettingsPopup>
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


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
