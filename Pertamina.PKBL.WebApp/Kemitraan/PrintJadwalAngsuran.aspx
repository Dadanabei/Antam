<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintJadwalAngsuran.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PrintJadwalAngsuran" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="vertical-align:central">
            <asp:Image ImageUrl="~/content/images/logo.png" runat="server" Width="100px" />
            <h2 style="text-align:center">JADWAL ANGSURAN</h2>
        </div>
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
            <div style="margin-top:30px">
                <dx:ASPxGridView ID="gvDetailKartuPiutang" runat="server" Width="100%" SettingsPager-Mode="ShowAllRecords" OnCustomColumnDisplayText="gvDetailKartuPiutang_CustomColumnDisplayText">
            <Columns >
                <dx:GridViewDataTextColumn Caption="Ke"  Name="AngsuranKe" FieldName="AngsuranKe" VisibleIndex="0" Width="3%">
                    <FooterTemplate>
                        <dx:ASPxLabel ID="lblTotall" runat="server" Text="total"></dx:ASPxLabel>
                    </FooterTemplate>                                
                    <CellStyle HorizontalAlign="Right"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="TglJatuhTempo"  Name="TglJatuhTempo" VisibleIndex="0" Width="3%" FieldName="TglJatuhTempo">  
                    <PropertiesTextEdit DisplayFormatString="dd MMM yyyy"></PropertiesTextEdit>                               
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Kewajiban" HeaderStyle-HorizontalAlign="Center">                    
                        <Columns>
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

            <table style="margin-top:30px;">
                <tr>
                    <td style="width:50%;">
                        1. Angsuran Pokok + Jasa administrasi pinjaman setiap bulan harap ditransfer ke rekening program kemitraan / PKBL <%= ViewState["branch_name"] %>
                        <br />
                        <br />
                        2. mengirimkan bukti transfer ke PKBL <%= ViewState["branch_name"] %> <%= ViewState["alamat"] %>
                        <br />
                        <br />
                        3. angsuran pertama harus disetor bulan <%= ViewState["awal"] %> dan seterusnya sampai bulan <%= ViewState["akhir"] %> (Lunas)
                    </td>
                    <td style="text-align:center;width:50%;">
                        <%= ViewState["kota"] %>, <%= ViewState["now"] %>
                        <br />
                        Area Manager <%= ViewState["branch_name"] %>

                        <br />
                        <br />
                        <br />
                        <br />
                        <b><%= ViewState["manager"] %></b>
                    </td>
                </tr>
            </table>

        </div>
        <script>
            window.print();
        </script>
    </div>
    </form>
</body>
</html>
