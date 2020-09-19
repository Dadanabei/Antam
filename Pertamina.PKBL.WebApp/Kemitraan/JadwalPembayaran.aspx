<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="JadwalPembayaran.aspx.cs" Inherits="Pertamina.PKBL.WebApp.JadwalPembayaran" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanAll.ascx" TagPrefix="uc1" TagName="ListKemitraanAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
   
    <script type="text/javascript">
        function Change(s, e) {
            if (e.buttonID == 'print') {
                debugger;
                gridKartuPiutang.GetRowValues(e.visibleIndex, 'proposal_number', fc);
                e.processOnServer = false;
            }
            else {
                e.processOnServer = true;
            }

        }

        function fc(values) {
            window.open('PrintJadwalAngsuran.aspx?proposal=' + values);
        }

    </script>

        <dx:ASPxLabel runat="server" ID="label" Text="Pencarian Data"></dx:ASPxLabel >
          <div class="borderdetail" runat="server" id="panel">
             <table>
                 <tr>
                     <td>
                         <dx:ASPxTextBox runat="server" ID="txtCari" Theme="Youthful"></dx:ASPxTextBox>
                     </td>
                     <td>
                         <dx:ASPxComboBox runat="server" ID="cbbEntah" Theme="Youthful"></dx:ASPxComboBox>
                     </td>
                     <td>
                         <dx:ASPxComboBox runat="server" ID="cbbTahun" Theme="Youthful"></dx:ASPxComboBox>
                     </td>
                     <td>
                         <dx:ASPxComboBox runat="server" ID="cbbEntah2" Theme="Youthful"></dx:ASPxComboBox>
                     </td>
                     <td>
                         <dx:ASPxButton runat="server" ID="btnCari" OnClick="btnCari_Click" Theme="Youthful" Text="Cari"></dx:ASPxButton>
                     </td>
                     <td>
                         <dx:ASPxButton runat="server" ID="btnKosong" OnClick="btnKosong_Click" Theme="Youthful" Text="Kosongkan"></dx:ASPxButton>
                     </td>
                 </tr>
             </table>
          </div>
        <div>
                    <dx:ASPxGridView runat="server" ClientIDMode="Static" ClientInstanceName="gridKartuPiutang" ID="gvJadwalPembayaran" AutoGenerateColumns="False" EnableTheming="True" Theme="Youthful" Width="100%" KeyFieldName="proposal_number"
                         OnCustomButtonCallback="gvJadwalPembayaran_CustomButtonCallback" ClientSideEvents-CustomButtonClick="Change" OnCustomButtonInitialize="gvJadwalPembayaran_CustomButtonInitialize"
                         OnHtmlRowPrepared="gvJadwalPembayaran_HtmlRowPrepared">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="No.Mitra" FieldName="noDebitur" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn Caption="Tanggal" VisibleIndex="2" FieldName="TglRealisasi" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                                </dx:GridViewDataDateColumn>
                                 <dx:GridViewDataTextColumn Caption="Nama" VisibleIndex="3" FieldName="nama">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="Nama Usaha" VisibleIndex="4" FieldName="company_name">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="JDB" VisibleIndex="5" FieldName="JDB">
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="JKR" VisibleIndex="6" FieldName="JKR">
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="JSU" VisibleIndex="7" FieldName="JSU">
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn Caption="Plafond" VisibleIndex="8" FieldName="nilaiRealisasi">
                                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                               </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="Bunga %" VisibleIndex="9" FieldName="SukuBunga">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption=" " VisibleIndex="10">
                                </dx:GridViewDataComboBoxColumn>
                                 <dx:GridViewDataTextColumn Caption="Jangka Waktu" VisibleIndex="11" FieldName="JangkaWaktu">
                                </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="Grace period" VisibleIndex="12" FieldName="grace_period">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataColumn FieldName="proposal_number" Visible="false">
                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn FieldName="existPiutang" Visible="false">
                                </dx:GridViewDataColumn>
                                <dx:GridViewCommandColumn Caption="Opr" Name="Opr" ButtonType="Image" VisibleIndex="13" ShowClearFilterButton="True">
                                    <CustomButtons>
                                                <dx:GridViewCommandColumnCustomButton  ID="Detail" Text="Detail" Visibility="AllDataRows">
                                                    <Image Url="../content/images/new.png"></Image>
                                                </dx:GridViewCommandColumnCustomButton>
                                                <dx:GridViewCommandColumnCustomButton  ID="print" Text="Print" Visibility="AllDataRows">
                                                    <Image Url="../content/images/print.png"></Image>
                                                </dx:GridViewCommandColumnCustomButton>
                                    </CustomButtons>      
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Cabang" VisibleIndex="14" FieldName="branch_code"></dx:GridViewDataComboBoxColumn>

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
                    <CommandColumn  Spacing="10px" />
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
                  
        </div>
    <uc1:ListKemitraanAll runat="server" ID="ListKemitraanAll" />
        
        
   
</asp:Content>
