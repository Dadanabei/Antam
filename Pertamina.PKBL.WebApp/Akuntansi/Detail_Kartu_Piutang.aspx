<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Detail_Kartu_Piutang.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.Detail_Kartu_Piutang" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <script type="text/javascript">
    function Change() {
        debugger;
        var values = lblProposal.GetText();
        window.open('../Reporting/PrintKartuPiutang.aspx?proposal=' + values);
    }

    

</script>
    <dx:ASPxLabel ID="lblKartuPiutang" runat="server" Text="Kartu Piutang :    " Font-Size="Large"></dx:ASPxLabel>
    <dx:ASPxLabel ID="lblProposal" ClientInstanceName="lblProposal" runat="server" Text="" Font-Size="Large" ></dx:ASPxLabel>
    <br /><br />
    <asp:ImageButton ID="btnDownload" ClientIDMode="Static" OnClientClick="Change()" BorderColor="Transparent" BorderStyle="None"  runat="server" BackColor="Transparent" ImageUrl="~/content/images/print.png">
    </asp:ImageButton>
    <br />

    <div>
        <table style="width:100%">
            <tr>
               <td>
                   <table>
                       <tr>
                           <td>
                               <dx:ASPxLabel ID="lblKodeMitra1" Text="Kode Mitra" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                                                        
                               <dx:ASPxLabel ID="lblKodeMitra2" runat="server"></dx:ASPxLabel>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <dx:ASPxLabel ID="lblNama" Text="Nama" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                               
                               <dx:ASPxLabel ID="lblNama2" runat="server"></dx:ASPxLabel>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <dx:ASPxLabel ID="lblAlamat" Text="Alamat" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                               
                               <dx:ASPxLabel ID="lblAlamat2" runat="server" ></dx:ASPxLabel>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <dx:ASPxLabel ID="lblJtuhTempo" Text="Detail Jatuh tempo" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>                          
                           <td>                                                       
                               <dx:ASPxLabel ID="lblJtuhTempo2" runat="server" ></dx:ASPxLabel>
                           </td>
                       </tr>
                   </table>
               </td>
                <td>
                     <table>
                         <tr>
                           <td>
                               <dx:ASPxLabel ID="lblPinjaman" Text="Pinjaman" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:ASPxLabel ID="lblPinjaman2" runat="server" ></dx:ASPxLabel>
                           </td>
                       </tr>
                         <tr>
                           <td>                               
                               <dx:ASPxLabel ID="lblTanggalRealisasi" Text="Tanggal Realisasi" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                               
                               <dx:ASPxLabel ID="lblTanggalRealisasi2" runat="server"></dx:ASPxLabel>
                           </td>
                       </tr>
                          <tr>
                           <td>
                               <dx:ASPxLabel ID="lblTglJatuhTempo" Text="Tanggal Jatuh Tempo" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                               
                               <dx:ASPxLabel ID="lblTglJatuhTempo2" runat="server"></dx:ASPxLabel>
                           </td>
                       </tr>
                          <tr>
                           <td></td>
                       </tr>
                         
                    
                    </table>
                </td>
                <td>
                    <table>
                         <tr>
                           <td>
                               <dx:ASPxLabel ID="lblJangkaWaktu" Text="Jangka Waktu" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:ASPxLabel ID="lblJangkaWaktu2" runat="server"></dx:ASPxLabel>
                           </td>
                       </tr>
                         <tr>
                           <td>
                               <dx:ASPxLabel ID="lblGracePeriod" Text="Grace Period" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:ASPxLabel ID="lblGracePeriod2" runat="server"></dx:ASPxLabel>
                           </td>
                       </tr>
                         <tr>
                           <td>
                               <dx:ASPxLabel ID="lblPersentaseJasa" Text="Persentase Jasa" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:ASPxLabel ID="lblPersentaseJasa2" runat="server"></dx:ASPxLabel>
                           </td>
                       </tr>
                        <tr>
                            <td></td>
                        </tr>

                        
                    </table>
                </td>
               
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxLabel ID="lblKolektibilitas" runat="server"></dx:ASPxLabel>
        <br />
        <dx:ASPxGridView ID="gvDetailKartuPiutang" runat="server" Theme="Youthful" Width="100%" OnLoad="gvDetailKartuPiutang_Load" 
            SettingsPager-Mode="ShowAllRecords" OnHtmlRowPrepared="gvDetailKartuPiutang_HtmlRowPrepared" 
            OnCustomColumnDisplayText="gvDetailKartuPiutang_CustomColumnDisplayText" OnHtmlDataCellPrepared="gvDetailKartuPiutang_HtmlDataCellPrepared" >
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
                                  <FooterCellStyle HorizontalAlign="Right"></FooterCellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Jasa"  Name="Bunga" FieldName="Bunga" VisibleIndex="0" Width="3%" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                                  <FooterCellStyle HorizontalAlign="Right"></FooterCellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Total"  Name="Total" FieldName="Total" VisibleIndex="0" Width="3%" PropertiesTextEdit-DisplayFormatString="##,#.00">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                                  <FooterCellStyle HorizontalAlign="Right"></FooterCellStyle>
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
    </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
