<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PerwabPanjar.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PerwabPanjar" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:x-large">Pertanggungjawaban Panjar Kerja</span>
    <br />
    <br />
        <dx:ASPxGridView runat="server" ID="gvPerwabPanjar" Width="100%" Theme="Youthful" OnHtmlRowPrepared="gvPerwabPanjar_HtmlRowPrepared"
             OnCustomButtonCallback="gvPerwabPanjar_CustomButtonCallback" KeyFieldName="Nopanjar" SettingsBehavior-AllowFocusedRow="true"
             OnCustomButtonInitialize="gvPerwabPanjar_CustomButtonInitialize">
            <Columns>
                <dx:GridViewDataTextColumn Caption="#">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="No. Ref" Name="NoRefPerwab" FieldName="NoRefPerwab">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Tanggal" Name="tglPerwab" FieldName="tglPerwab">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Nama" Name="Nama" FieldName="Nama">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Keterangan" Name="catatan_perwab" FieldName="catatan_perwab">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nilai Panjar" Name="NilaiPanjar" FieldName="NilaiPanjar">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pertangungjawaban" Name="NilaiPerwab" FieldName="NilaiPerwab">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Terpakai" Name="sisa" FieldName="sisa">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Prog" Name="jenisProgram" FieldName="jenisProgram">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn Caption="Opr" Name="Opr." ButtonType="Image">
                    <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton  ID="Persetujuan" Text="Persetujuan"  Visibility="AllDataRows">
                        <Image Url="../content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
                </dx:GridViewCommandColumn>
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
        </dx:ASPxGridView>
        
</asp:Content>
