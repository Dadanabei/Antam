﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintDaftarAngsuran.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.PrintDaftarAngsuran" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div >
            <asp:Image ImageUrl="~/content/images/logo.png" runat="server" />
            <br />
            <br />
            <dx:ASPxLabel ID="lblHeader" runat="server" Text="KARTU PIUTANG" Font-Bold="true" Font-Size="22px"></dx:ASPxLabel>
        </div>

        <div>
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
                        <tr>
                           <td>
                               <dx:ASPxLabel ID="ASPxLabel1" Text="Kantor Area" runat="server"></dx:ASPxLabel>
                           </td>
                           <td>
                               :
                           </td>                          
                           <td>                                                       
                               <dx:ASPxLabel ID="lblRegion" runat="server" ></dx:ASPxLabel>
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
        <dx:ASPxGridView ID="gvDetailKartuPiutang" runat="server" Width="100%" 
            SettingsPager-Mode="ShowAllRecords">
            <Columns >
                <dx:GridViewDataTextColumn Caption="#" Width="3%">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Tanggal Transaksi" Name="tgl" FieldName="tgl" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Keterangan" Name="keterangan" FieldName="keterangan">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="No Bukti" Name="noBukti" FieldName="noBukti">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pokok" PropertiesTextEdit-DisplayFormatString="##,#.00" Name="pokok" FieldName="pokok">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Jasa" PropertiesTextEdit-DisplayFormatString="##,#.00" Name="jasa" FieldName="jasa">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Kelebihan" PropertiesTextEdit-DisplayFormatString="##,#.00" Name="kelebihan" FieldName="kelebihan">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Jumlah" PropertiesTextEdit-DisplayFormatString="##,#.00" Name="jumlah" FieldName="jumlah">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sisa" PropertiesTextEdit-DisplayFormatString="##,#.00" Name="sisa" FieldName="sisa">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFooter="True" />
           
      
            <TotalSummary> 
                <%-- Sesuaikan dengan filedname yg akan dijumlah --%>
                <dx:ASPxSummaryItem FieldName="pokok"  SummaryType="Sum" DisplayFormat="##,#.00" />
                <dx:ASPxSummaryItem FieldName="jasa" SummaryType="Sum" DisplayFormat="##,#.00"/>
                <dx:ASPxSummaryItem FieldName="kelebihan" SummaryType="Sum" DisplayFormat="##,#.00"/>
                <dx:ASPxSummaryItem SummaryType="Sum" FieldName="jumlah" ShowInColumn="jumlah" DisplayFormat="##,#.00" />
                <dx:ASPxSummaryItem SummaryType="Sum" FieldName="sisa" ShowInColumn="sisa" DisplayFormat="##,#.00" />

            </TotalSummary>
     
            
        </dx:ASPxGridView>
        </div>


        </div>

            <script type="text/javascript">
                window.print();
    </script>

        </div>
    </form>
</body>
</html>
