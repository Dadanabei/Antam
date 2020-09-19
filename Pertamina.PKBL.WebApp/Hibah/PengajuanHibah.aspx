<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PengajuanHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Hibah.PengajuanHibah" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJKR.ascx" TagPrefix="uc1" TagName="ListKemitraanJKR" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJDB.ascx" TagPrefix="uc2" TagName="ListKemitraanJDB" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJSU.ascx" TagPrefix="uc3" TagName="ListKemitraanJSU" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
         function onCLick(s, e) {
             if (e.buttonID == 'Print') {
                 var index = e.visibleIndex;
                 grid.GetRowValues(index, 'proposal_number;', OnGetRowValues);
             } if (e.buttonID == 'Checklist') {
                 e.processOnServer = true;
             }
         }
         function OnGetRowValues(values) {
             window.open("ProposalPrint.aspx?proposal=" + values[0], "_blank");
         }

         function onEndCallback(s, e) {
             var a = grid.cpMessage;
             delete grid.cpMessage;
             if (a == true) {
                 alert("sukses");
             } else if (a == false) {
                 alert("error");
             }
         }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">


    <dx:ASPxGridView ID="gvPermohonan" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" EnableTheming="True" Theme="Youthful"
        Width="100%" KeyFieldName="id" OnCustomButtonCallback="gvPermohonan_CustomButtonCallback" OnInitNewRow="gvPermohonan_InitNewRow" OnRowInserting="gvPermohonan_RowInserting" OnRowUpdating="gvPermohonan_RowUpdating"
        OnCommandButtonInitialize="gvPermohonan_CommandButtonInitialize" >
        <ClientSideEvents EndCallback="onEndCallback " CustomButtonClick="onCLick"/>
        <Settings ShowFilterRowMenu="true" ShowFilterRow="true" />
         <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
        </SettingsPopup>
         <Styles>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
        </Styles>
        
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
        <Columns>
            <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Caption="TAMBAH" ShowNewButtonInHeader="true">
                <HeaderCaptionTemplate>
                    <dx:ASPxButton runat="server" ID="buttonNew" Text="TAMBAH" AutoPostBack="false"> 
                        <ClientSideEvents Click="function (s,e){grid.AddNewRow();}" />
                        <Image ToolTip="New" Url="../content/images/new.png"/>
                    </dx:ASPxButton>
                </HeaderCaptionTemplate>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Width="15%" Caption="No. Form " FieldName="proposal_number" ReadOnly="true" Name="proposal_number" VisibleIndex="0">
                <EditFormSettings VisibleIndex="1"/>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataColumn Caption="Atas Nama" Width="20%" FieldName="requestor_name" ReadOnly="false" Name="requestor_name" VisibleIndex="1">
                <EditFormSettings VisibleIndex="3" Caption="Nama"/>
            </dx:GridViewDataColumn>

            <dx:GridViewDataColumn Caption="Alamat" Width="20%" FieldName="requestor_address" Name="requestor_address" VisibleIndex="2">
                <EditFormSettings VisibleIndex="8" ColumnSpan="2" Caption="Alamat Rumah" />
            </dx:GridViewDataColumn>

            <dx:GridViewDataComboBoxColumn Caption="JKR" PropertiesComboBox-IncrementalFilteringMode="Contains" Width="5%" FieldName="creditkind_id" Name="credit_kind_id" VisibleIndex="3"  Visible="false">
            <PropertiesComboBox ClientInstanceName="comboBox" ></PropertiesComboBox>
                <EditFormSettings VisibleIndex="19" Visible="True" Caption="Jenis Hibah" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn Caption="JDB" PropertiesComboBox-IncrementalFilteringMode="Contains" Width="5%" FieldName="company_kind_id" Name="company_kind_id" VisibleIndex="4" PropertiesComboBox-ClientInstanceName="comboBox" Visible="false">
            <PropertiesComboBox ClientInstanceName="comboBox"></PropertiesComboBox>
                <EditFormSettings VisibleIndex="21" Visible="True" Caption="Jenis Debitur" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn Caption="JSU" PropertiesComboBox-IncrementalFilteringMode="Contains" Width="5%" FieldName="sector_id" Name="sector_id" VisibleIndex="5" PropertiesComboBox-ClientInstanceName="comboBox" Visible="false">
            <PropertiesComboBox ClientInstanceName="comboBox"></PropertiesComboBox>
                <EditFormSettings VisibleIndex="23" Visible="True" Caption="Jenis Usaha" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataMemoColumn Caption="JKR" Width="5%" FieldName="creditkind_id" VisibleIndex="3">
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="JDB" Width="5%" FieldName="company_kind_id" VisibleIndex="4">
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="JSU" Width="5%" FieldName="sector_id"  VisibleIndex="5">
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="Status" Width="5%" FieldName="status" Name="status" VisibleIndex="7">
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataDateColumn PropertiesDateEdit-AllowUserInput="false" Visible="false" Caption="Tgl Pendaftaran" FieldName="registration_date" Name="registration_date" >
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true">
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="2" Visible="True" />
            </dx:GridViewDataDateColumn>
            
            <dx:GridViewDataComboBoxColumn Visible="false" FieldName="jenis_kelamin" Caption="Jenis Kelamin">
                <PropertiesComboBox ValueField="id" TextField="name" ValueType="System.Int32">
                    <Items >
                        <dx:ListEditItem Text="Laki-laki" Value="0"/>
                        <dx:ListEditItem Text="Perempuan" Value="1" />
                    </Items>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" VisibleIndex="3"/>
            </dx:GridViewDataComboBoxColumn>

             <dx:GridViewDataComboBoxColumn Caption="Jenis Identitas" FieldName="identification_type" Visible="false" >
                <EditFormSettings Visible="True" VisibleIndex="4" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Nomor Identitas" FieldName="identification_number" Visible="false">
                <PropertiesTextEdit DisplayFormatString="##" DisplayFormatInEditMode="true">
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RegularExpression ErrorText="* angka tanpa titik" ValidationExpression="^[0-9]*$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" VisibleIndex="5" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn Caption="Tempat Lahir" FieldName="birthplace" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="6" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataDateColumn PropertiesDateEdit-AllowUserInput="false" Caption="Tanggal Lahir" FieldName="birthdate" Visible="false" >
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true">
                    <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" >
                    <RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" VisibleIndex="7" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataColumn Caption="Kecamatan" FieldName="address_district" Name="address_district" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="9" />
            </dx:GridViewDataColumn>

            <dx:GridViewDataComboBoxColumn Caption="Kota" PropertiesComboBox-IncrementalFilteringMode="Contains" Visible="false" Width="8%" FieldName="requestor_city_id" Name="requestor_city_id" VisibleIndex="10" PropertiesComboBox-ClientInstanceName="comboBox">
            <PropertiesComboBox ClientInstanceName="comboBox"></PropertiesComboBox>
                <EditFormSettings VisibleIndex="10" Caption="Kota" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataTextColumn Caption="Kode Pos" Width="6%" Visible="false" FieldName="postal_code" Name="postal_code" VisibleIndex="5">
                <PropertiesTextEdit MaxLength="9" >
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="11" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Caption="Kepemilikan Rumah" Visible="false" PropertiesComboBox-IncrementalFilteringMode="Contains" Width="8%" FieldName="home_ownership_id" Name="home_ownership_id" VisibleIndex="10" PropertiesComboBox-ClientInstanceName="comboBox">
            <PropertiesComboBox ClientInstanceName="comboBox"></PropertiesComboBox>
                <EditFormSettings VisibleIndex="12" Caption="Kepemilikan Rumah" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataTextColumn Caption="Telepon" Width="7%" Visible="false" FieldName="requestor_phone1" Name="requestor_phone1" VisibleIndex="6">

                <PropertiesTextEdit >
                    
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="13" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Handphone" Width="8%" Visible="false" FieldName="requestor_phone2" Name="requestor_phone2" VisibleIndex="7">
                <PropertiesTextEdit >
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="14" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Email" Width="7%" Visible="false" FieldName="requestor_email" Name="requestor_email" VisibleIndex="8">
                <PropertiesTextEdit >
                    <ValidationSettings Display="Dynamic">
                        <RegularExpression ErrorText="" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            <EditFormSettings VisibleIndex="15" Visible="True" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Caption="Status Pernikahan" Visible="false" PropertiesComboBox-IncrementalFilteringMode="Contains" Width="8%" FieldName="marital_status_id" Name="marital_status_id" VisibleIndex="16" PropertiesComboBox-ClientInstanceName="comboBox">
            <PropertiesComboBox ClientInstanceName="comboBox"></PropertiesComboBox>
                <EditFormSettings VisibleIndex="16" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn Caption="Pendidikan Terakhir" Visible="false" PropertiesComboBox-IncrementalFilteringMode="Contains" Width="8%" FieldName="education_lv_id" Name="education_lv_id" VisibleIndex="17" PropertiesComboBox-ClientInstanceName="comboBox">
            <PropertiesComboBox ClientInstanceName="comboBox"></PropertiesComboBox>
                <EditFormSettings VisibleIndex="17" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataTextColumn Caption="Nama Ibu" FieldName="requestor_parent_name" Name="requestor_parent_name" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="18" />
                <PropertiesTextEdit>
                    <ValidationSettings Display="Dynamic">
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Nilai Pengajuan" FieldName="requested_amount" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true">
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RegularExpression ErrorText="* angka tanpa titik" ValidationExpression="^[0-9]*$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>             
                <EditFormSettings Visible="True" VisibleIndex="20" />                                
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Bidang Usaha" FieldName="company_sector_detail" Name="company_sector_detail" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="22" />
                <PropertiesTextEdit>
                    <ValidationSettings Display="Dynamic">
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewCommandColumn Caption="Opr" Width="10%" ShowClearFilterButton="true" ButtonType="Image" VisibleIndex="10" ShowEditButton="True">
                <CustomButtons>
                    <%--<dx:GridViewCommandColumnCustomButton ID="Edit" Text="Edit" Visibility="AllDataRows">
                        <Image Url="../content/images/edit.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>--%>
                    <dx:GridViewCommandColumnCustomButton  ID="Checklist" Text="Checklist" Visibility="AllDataRows">
                        <Image Url="../content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>

        </Columns>



    </dx:ASPxGridView>
    <br />
    <table>
        <tr>
            <td>
                <p><b>Keterangan</b></p>
            </td>
        </tr>
        <tr>
            <td class="peding">
                <uc1:ListKemitraanJKR runat="server" id="ListKemitraanJKR" />
            </td>
            <td class="peding">
                <uc2:ListKemitraanJDB runat="server" id="ListKemitraanJDB" />
            </td>
            <td>
                <uc3:ListKemitraanJSU runat="server" id="ListKemitraanJSU" />
            </td>
        </tr>
    </table>
    <br />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
