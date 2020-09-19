<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PenerimaanProposal.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PenerimaanProposal" %>

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
            } if (e.buttonID == 'Detail') {
                e.processOnServer = true;
            }
        }
        function OnGetRowValues(values) {
            window.open("ProposalPrint.aspx?proposal="+values[0],"_blank");           
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
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:ScriptManager id="scriptManager1" runat="server"></asp:ScriptManager>
    <dx:ASPxGridView ID="gvPenerimaanProposal" OnRowInserting="gvPenerimaanProposal_RowInserting" Theme="Youthful" Width="100%"  OnCustomButtonInitialize="gvPenerimaanProposal_CustomButtonInitialize"  OnCustomErrorText="gvPenerimaanProposal_CustomErrorText"
        runat="server" OnCustomButtonCallback="gvPenerimaanProposal_CustomButtonCallback" KeyFieldName="id" ClientInstanceName="grid" AutoGenerateColumns="False" OnRowUpdating="gvPenerimaanProposal_RowUpdating" OnInitNewRow="gvPenerimaanProposal_InitNewRow" OnCommandButtonInitialize="gvPenerimaanProposal_CommandButtonInitialize">
        <%--<ClientSideEvents CustomButtonClick="onCLick"/>--%>
        <ClientSideEvents EndCallback="onEndCallback " CustomButtonClick="onCLick"/>
        <Settings ShowFilterRowMenu="true" ShowFilterRow="true" />
        <SettingsPager AlwaysShowPager="true"></SettingsPager>
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
            <dx:GridViewDataColumn Caption="No. Ref" FieldName="proposal_number"  ReadOnly="true">
                <EditFormSettings VisibleIndex="1" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Nama" FieldName="requestor_name">
                <EditFormSettings VisibleIndex="4" Caption="Nama Lengkap" ColumnSpan="3" />
            </dx:GridViewDataColumn>                        
            <dx:GridViewDataColumn Caption="Nama Usaha" FieldName="company_name">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataDateColumn PropertiesDateEdit-AllowUserInput="false" Caption="Tgl Daftar" FieldName="registration_date" >
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true">
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="2" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="status" >
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn Caption="Cabang" FieldName="branch_name">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="User Log" FieldName="user_log">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Judul Proposal" FieldName="proposal_title" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="3" ColumnSpan="2" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataComboBoxColumn Caption="Jenis Identitas" FieldName="identification_type" Visible="false" >
                <EditFormSettings Visible="True" VisibleIndex="5" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Nomor Identitas" FieldName="identification_number" Visible="false">
                <PropertiesTextEdit DisplayFormatString="##" DisplayFormatInEditMode="true">
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RegularExpression ErrorText="* angka tanpa titik" ValidationExpression="^[0-9]*$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" VisibleIndex="6" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn Caption="Tempat Lahir" FieldName="birthplace" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="7" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataDateColumn PropertiesDateEdit-AllowUserInput="false" Caption="Tanggal Lahir" FieldName="birthdate" Visible="false" >
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true">
                    <ValidationSettings RequiredField-IsRequired="true" >
<RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" VisibleIndex="8" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Nama Ayah / Ibu" FieldName="requestor_parent_name" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="9" ColumnSpan="2" />
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="true" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Penyalur" FieldName="supplier_id" Visible="false">
                <EditFormSettings Visible="True" VisibleIndex="10" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Sektor Usaha" FieldName="sector_id" Visible="false">
                <PropertiesComboBox>
                    <ValidationSettings RequiredField-IsRequired="true" ErrorText="please select first..">
<RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" VisibleIndex="11" />                
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Jenis Debitur" FieldName="company_kind_id" Visible="false">
                <PropertiesComboBox>
                    <ValidationSettings RequiredField-IsRequired="true" ErrorText="please select first..">
<RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="true" VisibleIndex="12"/>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Nilai Pengajuan" FieldName="requested_amount" Visible="false">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true">
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RegularExpression ErrorText="* angka tanpa titik" ValidationExpression="^[0-9]*$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>             
                <EditFormSettings Visible="True" VisibleIndex="14" ColumnSpan="2" />                                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Kota" FieldName="requestor_city_id" Visible="false" PropertiesComboBox-IncrementalFilteringMode="Contains">
                <PropertiesComboBox>
                    <ValidationSettings RequiredField-IsRequired="true" ErrorText="please select first..">
<RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" VisibleIndex="13" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewCommandColumn Caption="Opr." Name="opr" ShowClearFilterButton="true" ButtonType="Image" VisibleIndex="10" ShowEditButton="True">
                <CustomButtons>                   
                    <dx:GridViewCommandColumnCustomButton ID="Detail" Text="Detail" Visibility="AllDataRows">                        
                        <Image Url="../content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                    <dx:GridViewCommandColumnCustomButton ID="Print" Text="Print" Visibility="AllDataRows">
                        <Image Url="../content/images/print.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>                
            </dx:GridViewCommandColumn>
            
            <dx:GridViewDataColumn Visible ="false" FieldName="mitra_id"></dx:GridViewDataColumn>
        </Columns>
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
