<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PersetujuanHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Hibah.PersetujuanHibah" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJKR.ascx" TagPrefix="uc1" TagName="ListKemitraanJKR" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJDB.ascx" TagPrefix="uc2" TagName="ListKemitraanJDB" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJSU.ascx" TagPrefix="uc3" TagName="ListKemitraanJSU" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function onCLick(s, e) {
            if (e.buttonID == 'Approval') {
                var index = e.visibleIndex;
                
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    
    <dx:ASPxGridView ID="gvPersetujuan" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" EnableTheming="True" Theme="Youthful"
    Width="100%" KeyFieldName="id" OnCommandButtonInitialize="gvPersetujuan_CommandButtonInitialize" OnRowUpdating="gvPersetujuan_RowUpdating" >
        <ClientSideEvents EndCallback="onEndCallback " CustomButtonClick="onCLick" />
        <Settings ShowFilterRowMenu="true" ShowFilterRow="true" />
         <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2" ></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
        </SettingsPopup>
         <Styles>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
        </Styles>
        
        <SettingsCommandButton>
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
            
            <dx:GridViewDataDateColumn PropertiesDateEdit-AllowUserInput="false" ReadOnly="true" Visible="false" Caption="Tgl Pendaftaran" FieldName="registration_date" Name="registration_date" >
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true">
                </PropertiesDateEdit>
                <EditFormSettings VisibleIndex="1" Visible="True" />
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataTextColumn Width="15%" Caption="No. Surat " FieldName="proposal_number" ReadOnly="true" Name="proposal_number" VisibleIndex="0">
                <EditFormSettings Caption="No. Srt. Permohonan" VisibleIndex="4"/>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Width="15%" Caption="Perihal" FieldName="creditkind_id" Name="creditkind_id" Visible="false" >
                <EditFormSettings VisibleIndex="3" ColumnSpan="2" Caption="Perihal" Visible="True" />
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataTextColumn Width="15%" Caption="No. Persetujuan " FieldName="NomorPersetujuan" ReadOnly="true" Name="NomorPersetujuan" VisibleIndex="0" Visible="false">
                <EditFormSettings VisibleIndex="2" Visible="True"/>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Atas Nama" Width="20%" FieldName="requestor_name" Name="requestor_name" VisibleIndex="1">
                <EditFormSettings VisibleIndex="5" Caption="Nama" Visible="True"/>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataMemoColumn Caption="Alamat" Width="20%" FieldName="requestor_address" Name="requestor_address" VisibleIndex="2">
                <EditFormSettings Visible="True" VisibleIndex="6" ColumnSpan="2"/>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="JKR" Width="5%" FieldName="JKR" Name="JKR" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="JDB" Width="5%" FieldName="JDB" Name="JDB" VisibleIndex="5">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="JSU" Width="5%" FieldName="JSU" Name="JSU" VisibleIndex="6">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataTextColumn Caption="Maks Dana" Width="20%" FieldName="NilaiSetuju" Name="NilaiSetuju" VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true">
                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                        <RegularExpression ErrorText="* angka tanpa titik" ValidationExpression="^[0-9]*$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>             
                <EditFormSettings VisibleIndex="7" Caption="Maksimal Dana(dalam Rupiah)" Visible="True"/>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Width="15%" Caption="Status" FieldName="status" Name="status" VisibleIndex="7">
                <EditFormSettings VisibleIndex="9" Caption="Status"/>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataTextColumn Caption="Kegunaan" Width="20%" FieldName="Kegunaan" Name="Kegunaan" VisibleIndex="3" Visible="false">
                <EditFormSettings VisibleIndex="10" Caption="Kegunaan" Visible="True" ColumnSpan="2"/>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataMemoColumn Caption="Syarat-syarat sebelum akad hibah" Width="20%" FieldName="syaratAkad" Name="syaratAkad" VisibleIndex="3" Visible="false">
                <EditFormSettings VisibleIndex="11" Caption="Syarat-syarat sebelum akad hibah" RowSpan="1" ColumnSpan="2" Visible="True"/>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewDataMemoColumn Caption="Syarat Penarikan" Width="20%" FieldName="syaratPenarikan" Name="syaratPenarikan" VisibleIndex="3" Visible="false">
                <EditFormSettings VisibleIndex="12" Caption="Syarat Penarikan" Visible="True" RowSpan="1" ColumnSpan="2"/>
            </dx:GridViewDataMemoColumn>

            <dx:GridViewCommandColumn   Caption="Opr" Width="10%" VisibleIndex="8" ShowEditButton="true" ButtonType="Image">
                <CustomButtons >
                    <%--<dx:GridViewCommandColumnCustomButton  ID="Approval" Text="Approval" Visibility="AllDataRows">
                        <Image Url="../content/images/edit.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                    <dx:GridViewCommandColumnCustomButton  ID="Checklist" Text="Checklist" Visibility="AllDataRows">
                        <Image Url="../content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>--%>
                </CustomButtons>
            </dx:GridViewCommandColumn>

            <dx:GridViewDataTextColumn Caption="Cabang" Width="20%" FieldName="branch_code" Name="branch_code" VisibleIndex="9" ReadOnly="true">
                <EditFormSettings Visible="False"/>
            </dx:GridViewDataTextColumn>

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
