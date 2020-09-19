<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PermohonanBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PermohonanBL" %>--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PermohonanBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PermohonanBL" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxClasses" Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Src="~/BinaLingk/ListBInalingkungan.ascx" TagPrefix="uc1" TagName="ListBInalingkungan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">

        <dx:ASPxButton ID="btnAdd" Text="Tambah" AutoPostBack="false" runat="server">
        <ClientSideEvents Click="function(s, e) {
	grid.AddNewRow();
}">

        </ClientSideEvents>
    </dx:ASPxButton>
    
    <dx:ASPxGridView ID="gvPermohonan" SettingsBehavior-AllowFocusedRow="true" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" EnableTheming="True" Theme="Youthful" 
         OnRowUpdating="gvPermohonan_RowUpdating" OnRowInserting="gvPermohonan_RowInserting" OnCustomButtonCallback="gvPermohonan_CustomButtonCallback"
        Width="100%" KeyFieldName="id" OnInitNewRow="gvPermohonan_InitNewRow"  >
        <Columns>
            <dx:GridViewDataTextColumn Width="5%" Caption="No. Form " FieldName="form_number" ReadOnly="true" Name="form_number" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn Caption="Atas Nama" Width="8%" FieldName="requestor_name" Name="requestor_name" VisibleIndex="1">
                <PropertiesTextEdit MaxLength="200" >
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="5" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn Caption="Instansi" Width="10%" FieldName="requestor_company" Name="requestor_company" VisibleIndex="3">
                <PropertiesTextEdit MaxLength="200" >
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings VisibleIndex="4" Caption="Instansi Pemohon" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Alamat" Width="6%" FieldName="requestor_address" Name="requestor_address" VisibleIndex="9">
                <PropertiesMemoEdit Height="100px" MaxLength="512">
                </PropertiesMemoEdit>
                 <EditFormSettings VisibleIndex="6" Caption="Alamat Pemohon" ColumnSpan="2" />
                <EditFormCaptionStyle VerticalAlign="Top">
                </EditFormCaptionStyle>
            </dx:GridViewDataMemoColumn>
            
            <dx:GridViewDataTextColumn Caption="Kecamatan" Width="8%" Visible="false" FieldName="requestor_district" Name="requestor_district" VisibleIndex="4">
                <PropertiesTextEdit>
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="7" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Caption="Kota" PropertiesComboBox-IncrementalFilteringMode="Contains" Width="8%" FieldName="requestor_city_id" Name="requestor_city_id" VisibleIndex="10" PropertiesComboBox-ClientInstanceName="comboBox">
            <PropertiesComboBox ClientInstanceName="comboBox"></PropertiesComboBox>
                <EditFormSettings VisibleIndex="8" Caption="Kota" Visible="True" />

            </dx:GridViewDataComboBoxColumn>
           
            <dx:GridViewDataTextColumn Caption="Kode Pos" Width="6%" Visible="false" FieldName="requestor_postal" Name="requestor_postal" VisibleIndex="5">
                <PropertiesTextEdit MaxLength="9" >
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="9" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Telepon" Width="7%" Visible="false" FieldName="requestor_phone1" Name="requestor_phone1" VisibleIndex="6">
                <PropertiesTextEdit >
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="10" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Handphone" Width="8%" Visible="false" FieldName="requestor_phone2" Name="requestor_phone2" VisibleIndex="7">
                <PropertiesTextEdit >
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="11" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Email" Width="7%" Visible="false" FieldName="requestor_email" Name="requestor_email" VisibleIndex="8">
                <PropertiesTextEdit >
                    <ValidationSettings>
                        <RegularExpression ErrorText="" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="12" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="No. Proposal" Width="8%" FieldName="proposal_number" Name="proposal_number" VisibleIndex="11">
                <PropertiesTextEdit MaxLength="99">
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="1" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn PropertiesDateEdit-AllowUserInput="false" Caption="Tgl. Proposal" Width="8%" FieldName="proposal_accept_date" Name="proposal_accept_date" VisibleIndex="13">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true">
                </PropertiesDateEdit>
               <EditFormSettings VisibleIndex="2" Caption="Tanggal Diterima" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn PropertiesDateEdit-AllowUserInput="false" Caption="Tgl. Daftar" Width="8%" Visible="false" FieldName="registration_date" Name="registration_date" VisibleIndex="14">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true" >
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="3" Visible="True" Caption="Tanggal Daftar"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Judul Proposal" Width="10%" Visible="false" FieldName="proposal_title" Name="proposal_title" VisibleIndex="12">
                <PropertiesTextEdit >
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            <EditFormSettings ColumnSpan="2" VisibleIndex="13" Visible="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Bentuk Kegiatan" Width="10%" FieldName="activity_descr" Name="activity_descr" VisibleIndex="15">
                <PropertiesMemoEdit Height="100px" MaxLength="512" >
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesMemoEdit>
                <EditFormCaptionStyle VerticalAlign="Top">
                </EditFormCaptionStyle>
                <EditFormSettings VisibleIndex="15" ColumnSpan="2" />
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataComboBoxColumn Caption="JBL" Width="8%" FieldName="binaling_kind_id" Name="binaling_kind_id" VisibleIndex="17">
                <EditFormSettings VisibleIndex="16" Caption="Jenis Binaling"/>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Nilai Pengajuan" Width="8%" FieldName="requested_amount" Name="requested_amount" VisibleIndex="18">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true">
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RegularExpression ErrorText="* angka tanpa titik" ValidationExpression="^[0-9]*$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings VisibleIndex="17" Caption="Nilai Pengajuan" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Status" Width="8%" FieldName="status" Name="status" VisibleIndex="19">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewCommandColumn Width="25%" Name="opr" Caption="Opr." ShowClearFilterButton="True" ButtonType="Image" ShowEditButton="True" ShowNewButtonInHeader="false" VisibleIndex="20">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton  ID="Checklist" Text="Checklist" Visibility="AllDataRows">
                        <Image Url="../content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataColumn Caption="File" Width="3%"  VisibleIndex="21" CellStyle-HorizontalAlign="Center">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="btnDownload" ToolTip='<%# Bind("FileName")%>' BorderColor="Transparent" BorderStyle="None" AlternateText='<%# Bind("id")%>' CommandArgument='<%# Bind("id")%>' runat="server" Visible='<%# (Eval("original_filename").ToString() == "-")?false:true%>' OnClick="btnDownload_Click" BackColor="Transparent" ImageUrl="~/content/images/download-icon.gif">
                    </asp:ImageButton>
                </DataItemTemplate>

                <CellStyle HorizontalAlign="Center"></CellStyle>
            </dx:GridViewDataColumn>
           
            <dx:GridViewDataComboBoxColumn Caption="Cabang" FieldName="branch_code" Name="branch_code"  VisibleIndex="22">
                 <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
          
            <dx:GridViewDataTextColumn Caption="User Log" FieldName="userLog"  VisibleIndex="23">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="User Log" FieldName="branch_code" Name="branch_code"  VisibleIndex="24" Visible="false">
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
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
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
    <br />
    <br />
    <uc1:ListBInalingkungan runat="server" ID="ListBInalingkungan" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
