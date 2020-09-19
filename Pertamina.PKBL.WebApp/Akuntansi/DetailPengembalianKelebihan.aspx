<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPengembalianKelebihan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.DetailPengembalianKelebihan" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <script type="text/javascript">
        Changed = function () {
            
            var pokok = parseInt(txtBayarPokok.GetValue());
            var jasa = parseInt(txtxBayarJasa.GetValue());
            var adv = parseInt(txtAdvPayment.GetValue());
            var hasil = parseInt(pokok + jasa + adv);

            txtTotal.SetText(hasil);
        }
    </script>


    <span style="font-size:large">Pengembalian Kelebihan</span>
    <br /><br />
    <dx:ASPxGridView runat="server" ID="gvDetailPengembalianKelebihan" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No Akun" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords"></SettingsPager>
        <Settings ShowFilterRow="false" />
    </dx:ASPxGridView>
    <br />
    <div class="borderdetail">
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                    Tanggal
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    No Bukti
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNoBukti" Theme="Youthful" Text="--Generate by system--" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    No Debitur
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNoDebitur" ReadOnly="True" EnableTheming="True" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Nama
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNama" ReadOnly="True" EnableTheming="True" Theme="Youthful" Width="100%"></dx:ASPxTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Bayar Pokok
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxTextBox runat="server" ID="txtBayarPokok" Theme="Youthful" ClientInstanceName="txtBayarPokok" ClientSideEvents-TextChanged="Changed">
                                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel runat="server" Text=" Angsuran Pokok Ke-"></dx:ASPxLabel><span></span><dx:ASPxLabel runat="server" ID="lblAngs"></dx:ASPxLabel><span></span><dx:ASPxLabel runat="server" ID="lblJumlahAng"></dx:ASPxLabel>
                            </td>
                        </tr>
                    </table>
                 </td>
            </tr>
            <tr>
                <td>
                    Bayar Jasa
                </td>
                <td>
                     <table>
                        <tr>
                            <td style="width:200px">
                                <dx:ASPxTextBox runat="server" ID="txtxBayarJasa" Theme="Youthful" ClientInstanceName="txtxBayarJasa" ClientSideEvents-TextChanged="Changed" >
                                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                                </dx:ASPxTextBox>
                            </td>
                             <td>
                                <dx:ASPxLabel runat="server" Text=" Angsuran Jasa Ke-"></dx:ASPxLabel><span></span><dx:ASPxLabel runat="server" ID="lblAngsJasa"></dx:ASPxLabel><span></span><dx:ASPxLabel runat="server" ID="lblJumlahAngJas"></dx:ASPxLabel>
                             </td>
                        </tr>
                    </table>
                 </td>
            </tr>
            <tr>
                <td>
                    Adv Payment
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtAdvPayment" Theme="Youthful" ClientInstanceName="txtAdvPayment" ClientSideEvents-TextChanged="Changed" >
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>                   
            </tr>
            <tr>
                <td>
                   Total
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTotal" ReadOnly="true" Theme="Youthful" ClientInstanceName="txtTotal" ClientIDMode="Static" DisplayFormatString="##,#.00">
                    </dx:ASPxTextBox>
                </td>
                
                    
            </tr>
            <tr>
                <td>
                   Catatan
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtCatatan" Theme="Youthful" Width="100%"></dx:ASPxTextBox>
                </td>
                
                    
            </tr>
            <tr>
                <td>
                   Akun Kas/Bank
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbKasBank" runat="server" ValueType="System.String" Theme="Youthful" Width="100%" IncrementalFilteringMode="StartsWith" ></dx:ASPxComboBox>
                    <dx:ASPxLabel ID="lblSektor" runat="server" Text="" Visible="false"></dx:ASPxLabel>
                </td>
                
                    
            </tr>
            <tr>
                <td>
                   Akun Angsuran
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbAngsuran" runat="server" ValueType="System.String" Theme="Youthful" Width="100%" IncrementalFilteringMode="StartsWith"></dx:ASPxComboBox>
                </td>
            </tr>
        </table>
        <dx:ASPxButton runat="server" ID="btnSimpan" Text="Simpan" Theme="Youthful" OnClick="btnSimpan_Click"></dx:ASPxButton><span></span>
        <dx:ASPxHyperLink runat="server" ID="btnKembali" Text="Kembali" NavigateUrl="PengembalianKelebihan.aspx" Theme="Youthful"></dx:ASPxHyperLink>

    </div>
    <br />
    <dx:ASPxLabel runat="server" Text="Kolektabilitas hingga tahun"></dx:ASPxLabel><dx:ASPxLabel runat="server" id="lblTahun"></dx:ASPxLabel>
    <br /><br />
     <dx:ASPxGridView ID="gvDetailKartuPiutang" runat="server" Theme="Youthful" Width="100%" SettingsPager-Mode="ShowAllRecords"
          OnCustomColumnDisplayText="gvDetailKartuPiutang_CustomColumnDisplayText" OnHtmlDataCellPrepared="gvDetailKartuPiutang_HtmlDataCellPrepared">
            <Columns >
                <dx:GridViewBandColumn Caption="Kewajiban" HeaderStyle-HorizontalAlign="Center">                    
                        <Columns>
                             <dx:GridViewDataTextColumn Caption="Ke"  Name="AngsuranKe" FieldName="AngsuranKe" VisibleIndex="0" Width="3%">
                                 <FooterTemplate>
                                     <dx:ASPxLabel ID="lblTotall" runat="server" Text="total"></dx:ASPxLabel>
                                 </FooterTemplate>                                
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Pokok"  Name="HutangPokok" FieldName="HutangPokok" VisibleIndex="0" Width="3%" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Jasa"  Name="Bunga" FieldName="Bunga" VisibleIndex="0" Width="3%" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Total"  Name="Total" FieldName="Total" VisibleIndex="0" Width="3%" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                                  </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="TglJatuhTempo"  Name="TglJatuhTempo" VisibleIndex="0" Width="3%" FieldName="TglJatuhTempo">  
                                 <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>                               
                                  <CellStyle HorizontalAlign="Left"></CellStyle>
                             </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Pembayaran" HeaderStyle-HorizontalAlign="Center">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="NO Bukti"  Name="NoRef" VisibleIndex="0" Width="15%" HeaderStyle-HorizontalAlign="Center" FieldName="NoRef">
                                
                                  <CellStyle HorizontalAlign="Left"></CellStyle>
                             </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Tgl Bayar"  Name="TglBayar" VisibleIndex="0" Width="3%" FieldName="TglBayar" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">                                 
                                  <CellStyle HorizontalAlign="Left"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Pokok"   Name="NilaiPokok" VisibleIndex="0" Width="3%" FieldName="NilaiPokok" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Jasa"  Name="NilaiBunga" VisibleIndex="0" Width="3%" FieldName="NilaiBunga" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Adv Pay"  Name="NilaiAdv"  VisibleIndex="0" Width="3%" FieldName="NilaiAdv" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                                  </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Total"  Name="Totalbayar" VisibleIndex="0" Width="3%" FieldName="Totalbayar" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                        </Columns>
                </dx:GridViewBandColumn>
                  <dx:GridViewBandColumn Caption="Sisa" HeaderStyle-HorizontalAlign="Center">
                      <Columns>
                           <dx:GridViewDataTextColumn Caption="Pokok"   Name="sisaPokok" VisibleIndex="0" Width="3%" FieldName="sisaPokok" PropertiesTextEdit-DisplayFormatString="##,#.00">
                                
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Jasa"  Name="sisaBunga"  VisibleIndex="0" Width="3%" FieldName="sisaBunga" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Total"  Name="totalSisa"  VisibleIndex="0" Width="3%" FieldName="totalSisa" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                      </Columns>
                  </dx:GridViewBandColumn>
            </Columns>
            <Settings ShowFooter="True" />
           
        <TotalSummary> 
            <%-- Sesuaikan dengan filedname yg akan dijumlah --%>
            <dx:ASPxSummaryItem FieldName="HutangPokok"  SummaryType="Sum" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem FieldName="Bunga" SummaryType="Sum" DisplayFormat="##,#.00"/>
            <dx:ASPxSummaryItem FieldName="Total" SummaryType="Sum" DisplayFormat="##,#.00"/>
           
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="NilaiPokok" ShowInColumn="NilaiPokok" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="NilaiBunga" ShowInColumn="NilaiBunga" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="NilaiAdv" ShowInColumn="NilaiAdv" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="Totalbayar" ShowInColumn="Totalbayar" DisplayFormat="##,#.00" />

        </TotalSummary>
            
        </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
