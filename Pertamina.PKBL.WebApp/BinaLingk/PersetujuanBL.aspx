<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PersetujuanBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PersetujuanBL" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Src="~/BinaLingk/ListBInalingkungan.ascx" TagPrefix="uc1" TagName="ListBInalingkungan" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView ID="gvPersetujuan" runat="server" AutoGenerateColumns="False" Theme="Youthful"
         OnRowUpdating="gvPersetujuan_RowUpdating" Width="100%" KeyFieldName="id" OnInitNewRow="gvPersetujuan_InitNewRow">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No. Persetujuan" VisibleIndex="1" FieldName="form_number" Name="form_number">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        
            <dx:GridViewDataTextColumn Caption="Nama" FieldName="requestor_name" Name="requestor_name" VisibleIndex="2" ReadOnly="true">
                <EditFormSettings Caption="Atas Nama" VisibleIndex="4" ColumnSpan="2" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Instansi" FieldName="requestor_company" Name="requestor_company" VisibleIndex="3" ReadOnly="true">
                <EditFormSettings VisibleIndex="3" ColumnSpan="2" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataMemoColumn Caption="Alamat" FieldName="requestor_address" Name="requestor_address" VisibleIndex="4" ReadOnly="true">
                <PropertiesMemoEdit Height="100px">
                </PropertiesMemoEdit>
                <EditFormSettings VisibleIndex="5" ColumnSpan="2" />
                <EditFormCaptionStyle VerticalAlign="Top">
                </EditFormCaptionStyle>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataComboBoxColumn Caption=" Kota" FieldName="requestor_city_id" Name="requestor_city_id" VisibleIndex="5" ReadOnly="true">
                <EditFormSettings VisibleIndex="6" ColumnSpan="2" />
            </dx:GridViewDataComboBoxColumn>
            
            <dx:GridViewDataTextColumn Caption="Nilai Rekomendasi" FieldName="recomended_amount"  Name="recomended_amount" VisibleIndex="10" Visible="false" ReadOnly="True">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="True"></PropertiesTextEdit>
                <EditFormSettings VisibleIndex="10" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Nilai Yang Disetujui (RP)" FieldName="granted_amount" Name="granted_amount" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="True"></PropertiesTextEdit>
                <EditFormSettings VisibleIndex="11" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Caption="JBL" FieldName="binaling_kind_id" Name="binaling_kind_id" VisibleIndex="13" ReadOnly="true">
                <EditFormSettings VisibleIndex="8" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="approval_result" Name="approval_result" VisibleIndex="14">
                <EditFormSettings VisibleIndex="12" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewCommandColumn Caption="Opr." Name="opr" ShowEditButton="True" VisibleIndex="15" ButtonType="Image" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>

            <dx:GridViewDataTextColumn Caption="No.Proposal" FieldName="proposal_number" Name="proposal_number" VisibleIndex="7" Visible="false" ReadOnly="True">
                <EditFormSettings VisibleIndex="1" Visible="True" />
            </dx:GridViewDataTextColumn>

             <dx:GridViewDataTextColumn Caption="No.Pemohon" VisibleIndex="8" FieldName="noPemohon" Name="noPemohon" Visible="false" ReadOnly="True">
                <EditFormSettings VisibleIndex="2" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataDateColumn Caption="Tgl. Proposal" FieldName="proposal_accept_date" Name="proposal_accept_date" VisibleIndex="9" Visible="false" ReadOnly="True">
                <EditFormSettings VisibleIndex="2" Visible="True" />
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="True"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>

             <dx:GridViewDataTextColumn Caption="Nilai Pengajuan" FieldName="requested_amount" Name="requested_amount" VisibleIndex="11" Visible="false" ReadOnly="True">            
                 <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="##,#.00">
                 </PropertiesTextEdit>
                 <EditFormSettings VisibleIndex="7" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataMemoColumn Caption="Bentuk Kegiatan" FieldName="activity_descr" Name="activity_descr" VisibleIndex="12" Visible="false" ReadOnly="True">
                <PropertiesMemoEdit Height="100px">
                </PropertiesMemoEdit>
                <EditFormSettings VisibleIndex="9" Visible="True" ColumnSpan="2" />
                <EditFormCaptionStyle VerticalAlign="Top">
                </EditFormCaptionStyle>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataDateColumn Caption="Tgl. Persetujuan" FieldName="approval_result_date" Name="approval_result_date" Visible="False" VisibleIndex="0">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="True">
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" VisibleIndex="0" />
            </dx:GridViewDataDateColumn>
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
        <SettingsDataSecurity AllowDelete="False" />
        <SettingsPager AlwaysShowPager="True">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <Settings ShowFilterRow="True" />
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <Styles>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C">
             </CurrentPageNumber>
         </StylesPager>
    </dx:ASPxGridView>
    <br />
    <uc1:ListBInalingkungan runat="server" ID="ListBInalingkungan" />
</asp:Content>
