<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostingKasBank.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.JurnalTransaksiKasbank.PostingKasBank" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<div id="tabs">
        <div id="tabs-1">
            <div class="panel panel-default">
                <div class="panel-body">
                    <dx:ASPxLabel ID="lblHeader" runat="server" Text="" Font-Bold="true" Font-Size="16px"></dx:ASPxLabel>
                </div>
            </div>
        </div>
        <div id="tabs-2">
            <br />
            <dx:ASPxLabel ID="lblSukses" runat="server" Text=""></dx:ASPxLabel>
            <div id="Header" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Jenis Program : "></asp:Label>
                            <font color='red'>*</font>
                        </td>
                        <td>
                            <dx:ASPxComboBox ID="cbbJenisProgram" Theme="Youthful" runat="server" ValueType="System.String"
                                ClientSideEvents-Init="Init" OnSelectedIndexChanged="cbbJenisProgram_SelectedIndexChanged" 
                                AutoPostBack="true">
                                <Items>
                                    <dx:ListEditItem Text="Pilih" Value="0" Selected="true" />
                                    <dx:ListEditItem Text="Kemitraan" Value="1"/>
                                    <dx:ListEditItem Text="Bina Lingkungan" Value="2" />
                                    <dx:ListEditItem Text="Kemitraan dan Bina Lingkungan" Value="3"/>
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span class="label label-warning">Data hanya bisa di posting jika debet dan kredit balance.</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="Panel" runat="server">
                <div class="bodydetail">
                    <div class="borderdetail">
                        <table style="width: 60%;">
                            <tr>
                                <td style="width: 20%;">Tanggal:<font color='red'>*</font></td>
                                <td>
                                    <dx:ASPxDateEdit ID="deTglBukti" runat="server" AllowUserInput="false" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" Theme="Youthful" >
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td>Kepada:<font color='red'>*</font> </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtKepada" runat="server" Width="60%" Theme="Youthful" class="form-control" ClientIDMode="Static"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Keterangan Bayar :<font color='red'>*</font> </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtKetBayar" runat="server" Width="100%" class="form-control" ClientIDMode="Static"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Jenis Pembayaran: <font color='red'>*</font></td>
                                <td>
                                    <dx:ASPxComboBox ID="cbbJenisPembayaran" runat="server" Width="60%" Theme="Youthful" ValueType="System.String"></dx:ASPxComboBox>
                                    <dx:ASPxTextBox ID="txtJnsPembayaran" runat="server" Width="60%" Visible="false" ReadOnly="true" class="form-control" ClientIDMode="Static"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Permintaan Bayar:<font color='red'>*</font>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtMintaBayar" runat="server" Theme="Youthful" Width="60%" class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Verifikasi:<font color='red'>*</font></td>
                                <td>
                                    <dx:ASPxTextBox ID="txtVerifikasi" runat="server" Theme="Youthful" Width="60%"  class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Penyetuju:<font color='red'>*</font></td>
                                <td>
                                    <dx:ASPxTextBox ID="txtPenyetuju" runat="server" Theme="Youthful" Width="60%"  class="form-control"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div class="borderdetail">
                        <table style="width: 60%;">
                            <tr>
                                <td style="width: 20%;">Nama Akun:<font color='red'>*</font> </td>
                                <td colspan="2">
                                    <dx:ASPxComboBox ID="cbbNamaAkun" runat="server" Width="100%" IncrementalFilteringMode="Contains" Theme="Youthful" ValueType="System.String"></dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Nilai:<font color='red'>*</font> </td>
                                <td colspan="2">
                                    <dx:ASPxTextBox ID="txtNilai" DisplayFormatString="##,#.00" runat="server" Theme="Youthful" Width="60%" class="form-control" ClientIDMode="Static">
                                        <%--<MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />--%>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxRadioButton ID="radioDebet" runat="server" Theme="Youthful" Text="Debet" GroupName="keterangan" Checked="true"></dx:ASPxRadioButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxRadioButton ID="radioKredit" runat="server" Theme="Youthful" Text="Kredit" GroupName="keterangan"></dx:ASPxRadioButton>
                            </tr>
                            <tr>
                                <td>Keterangan:<font color='red'>*</font> </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtKeterangan" runat="server" Theme="Youthful" Width="100%"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <font color='red'>*) Wajib diisi</font>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <dx:ASPxButton ID="btnTambah" runat="server" Text="Tambah" Theme="Youthful" OnClick="btnTambah_Click1"></dx:ASPxButton>
                        <dx:ASPxHyperLink ID="linkCancel" runat="server" Text="Cancel"></dx:ASPxHyperLink>
                        <br />
                        <br />
                        <dx:ASPxLabel ID="lblKet" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                    <br />
                    <br />
                    <dx:ASPxButton ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click"></dx:ASPxButton>
                </div>
    <dx:ASPxGridView runat="server" ID="gvDetailKas" Width="100%" Theme="Youthful" KeyFieldName="id" OnRowUpdating="gvDetailKas_RowUpdating"
         OnRowDeleting="gvDetailKas_RowDeleting" AutoGenerateColumns="False" OnHtmlRowPrepared="gvDetailKas_HtmlRowPrepared">
        <Columns>
            <dx:GridViewCommandColumn Caption="Opr." ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="7">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="No" VisibleIndex="1" ReadOnly="true">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server" ID="lblTotal" Text="Total"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kode" Name="COA" FieldName="COA" VisibleIndex="2" ReadOnly="true">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nama Akun" Name="NamaCoa" FieldName="NamaCoa" VisibleIndex="3" ReadOnly="true">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Debet" Name="Debet" FieldName="Debet" VisibleIndex="4">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kredit" Name="Kredit" FieldName="Kredit" VisibleIndex="5">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Keterangan" Name="Deskripsi" FieldName="Deskripsi" Width="30%" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="Debet" SummaryType="Sum" DisplayFormat="##,#.00" />
              <dx:ASPxSummaryItem FieldName="Kredit" SummaryType="Sum" DisplayFormat="##,#.00" />

        </TotalSummary>
        <Settings ShowFooter="true" />
        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True"/>
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />

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
          
        </Styles>
        <StylesPager>
             
         </StylesPager>
    </dx:ASPxGridView>
    <dx:ASPxButton ID="btnSimpan" runat="server" Text="Simpan" OnClick="btnSimpan_Click" Theme="Youthful"></dx:ASPxButton>
    
                
        </div>
</div>
    <%= ViewState["script"] %>
    </div>