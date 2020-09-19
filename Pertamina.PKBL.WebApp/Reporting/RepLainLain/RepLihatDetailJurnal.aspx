<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepLihatDetailJurnal.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLainLain.RepLihatDetailJurnal" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

                <div id="Header" runat="server">
               
            </div>
            <div id="Panel" runat="server">
                <div class="bodydetail">
                    <div class="borderdetail">
                        <table style="width: 60%;">
                            <tr>
                                <td>Region:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtRegion"  runat="server" Theme="Youthful" Width="60%" ReadOnly="true" class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>No Bukti:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtNoRef"  runat="server" Theme="Youthful" Width="60%" ReadOnly="true" class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%;">Tanggal:</td>
                                <td>
                                    <dx:ASPxDateEdit ID="deTglBukti" runat="server" Theme="Youthful" >
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td>Kepada:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtKepada" runat="server" Width="60%" Theme="Youthful" class="form-control" ClientIDMode="Static"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Keterangan Bayar :</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtKetBayar" runat="server" Width="100%" class="form-control" ClientIDMode="Static"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Jenis Pembayaran: </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtJnsPembayaran" ReadOnly="true" runat="server" Width="100%" Visible="true"  class="form-control" ClientIDMode="Static"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Nilai Jumlah: </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtNilaiJumlah" ReadOnly="true" runat="server" Width="100%" Visible="false" DisplayFormatString="##,#.00"  class="form-control" ClientIDMode="Static"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Permintaan Bayar:
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtMintaBayar" runat="server" Theme="Youthful" Width="60%"  class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Verifikasi:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtVerifikasi" runat="server" Theme="Youthful" Width="60%"  class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Penyetuju:</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtPenyetuju" runat="server" Theme="Youthful" Width="60%"  class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <dx:ASPxButton ID="btnTambah" OnClick="btnTambah_Click" runat="server" Text="Tambah" Theme="Youthful" ></dx:ASPxButton>
                        <br />
                        <%= ViewState["msg"] %>
                    </div>
                    <br />

                </div>
    <dx:ASPxGridView runat="server" ID="gvDetailKas" Width="100%" Theme="Youthful" KeyFieldName="coa" OnHtmlRowPrepared="gvDetailKas_HtmlRowPrepared"   
        AutoGenerateColumns="False" OnRowUpdating="gvDetailKas_RowUpdating" >
        <Columns>
            
            <dx:GridViewDataTextColumn Caption="No" VisibleIndex="1" ReadOnly="true">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server" ID="lblTotal" Text="Total"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kode" Name="coa" FieldName="coa" VisibleIndex="2" ReadOnly="true">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nama Akun" Name="account_name" FieldName="account_name" VisibleIndex="3" ReadOnly="true">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Debet" Name="debet" FieldName="debet" VisibleIndex="4" ReadOnly="true">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kredit" Name="kredit" FieldName="kredit" VisibleIndex="5" ReadOnly="true">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Keterangan" Name="deskripsi" FieldName="deskripsi" Width="30%" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowEditButton="true" ButtonType="Image" VisibleIndex="6" Name="opr">
                <EditButton>
                    <Image Url="~/content/images/edit.png"></Image>
                </EditButton>
            </dx:GridViewCommandColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="debet" SummaryType="Sum" DisplayFormat="{0:##,#}.00" />
              <dx:ASPxSummaryItem FieldName="kredit" SummaryType="Sum" DisplayFormat="{0:##,#}.00" />

        </TotalSummary>
        <SettingsCommandButton>
           
             <UpdateButton>
                 <Image ToolTip="update" Url="~/content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="~/content/images/delete-rect.png"></Image>
             </CancelButton>
        </SettingsCommandButton>
        <SettingsEditing Mode="Inline"></SettingsEditing>
        <Settings ShowFooter="true" />
        <SettingsBehavior ConfirmDelete="True"/>
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />

        
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
        </SettingsPopup>
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
          
        </Styles>
        <StylesPager>
             
         </StylesPager>
    </dx:ASPxGridView>
    
                
        </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
