<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TambahPembayaranPK.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.Tambah_Pembayaran_PK" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView runat="server" ID="gvTambahPembayarannPK" AutoGenerateColumns="False" Theme="Youthful" Width="100%" j>
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                <CellStyle HorizontalAlign="Left"></CellStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="No Akun" Name="account_id" FieldName="account_id" VisibleIndex="1">
                <CellStyle HorizontalAlign="left"></CellStyle>
            </dx:GridViewDataTextColumn>
                
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name" VisibleIndex="2">
                 <CellStyle HorizontalAlign="left"></CellStyle>
            </dx:GridViewDataTextColumn>            
            <dx:GridViewDataTextColumn Caption="Saldo" Name="SaldoAkhir" FieldName="SaldoAkhir" VisibleIndex="3"></dx:GridViewDataTextColumn>

        </Columns>

        <Settings ShowFilterRow="True" />
        <SettingsPager AlwaysShowPager="true" PageSize="50"></SettingsPager>
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
    <div class="bodydetail">
    <dx:ASPxLabel runat="server" ID="ASPxLabel1" Font-Bold="true" Text="Input Tgl." Font-Size="12px"></dx:ASPxLabel> 
    <div class="borderdetail">
    <table style="width:60%">
        <tr>
            <td style="width:20%">
                <dx:ASPxLabel runat="server" ID="lblTanggal" Text="Tanggal Pencairan"></dx:ASPxLabel>
                <span style="color:red">*</span>

            </td>
            <td>
                 <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful"></dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
    </div>
    <br />
    <dx:ASPxLabel runat="server" ID="ASPxLabel39" Font-Bold="true" Text="Input Data" Font-Size="12px"></dx:ASPxLabel>           
    <div class="borderdetail">
       
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                     <dx:ASPxLabel runat="server" ID="lblTotalPlafond" Text="Total Plafond"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTotalPlafond" Width="60%" Theme="Youthful">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblNoMitra" Text="No Mitra"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNoMitra" Width="40%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblNama" Text="Nama"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNama" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblKepada" Text="Kepada" ></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKepada" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblPermintaanBayar" Text="Permintaan Bayar"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtPermintaanBayar" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblVerfikasi" Text="Verifikasi"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtVerifikasi" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblPenyetuju" Text="Penyetuju"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtPenyetuju" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblDeskripsi" Text="Deskripsi"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtDeskripsi" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblJumlahPencarian" Text="Jumlah Pencarian"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJumlahPencairan" Width="60%" Theme="Youthful">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblNamaAkun" Text="Nama Akun"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                   <dx:ASPxComboBox runat="server" ID="cbbNamaAkun" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblKoreksi" Text="Koreksi"></dx:ASPxLabel>
                </td>
                <td>
                   <dx:ASPxCheckBox runat="server" ID="chbKoreksi" Theme="Youthful" ></dx:ASPxCheckBox>
                </td>
            </tr>
                                
            
        </table>
        </div>
        <br />
        <dx:ASPxButton runat="server" ID="btnSimpan"  Text="Simpan" Theme="Youthful"></dx:ASPxButton>&nbsp
        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Cancel" onclick="cancel()">
          </dx:ASPxHyperLink>


    </div>
    <br />
    Kolektabilitas hingga Tahun {Tahun},bulan{bulan},untuk mitra{mitra}:{user} adalah lunas
    <div style="border:thin">

      <dx:ASPxGridView ID="gvDetailKartuPiutang" runat="server" Theme="Youthful" Width="100%"  SettingsPager-PageSize="12">
            <Columns >
                <dx:GridViewBandColumn Caption="Kewajiban" HeaderStyle-HorizontalAlign="Center">                    
                        <Columns>
                             <dx:GridViewDataTextColumn Caption="Ke"  Name="#" FieldName="AngsuranKe" VisibleIndex="0" Width="3%">
                                 <FooterTemplate>
                                     <dx:ASPxLabel ID="lblTotall" runat="server" Text="Total"></dx:ASPxLabel>
                                 </FooterTemplate>                                
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Pokok"  Name="#" FieldName="HutangPokok" VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Jasa"  Name="#" FieldName="Bunga" VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Total"  Name="#" FieldName="Total" VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                                  </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="TglJatuhTempo"  Name="#" VisibleIndex="0" Width="3%" FieldName="TglJatuhTempo">                                 
                                  <CellStyle HorizontalAlign="Right"></CellStyle>
                             </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Pembayaran" HeaderStyle-HorizontalAlign="Center">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="NO Bukti"  Name="#" VisibleIndex="0" Width="15%" HeaderStyle-HorizontalAlign="Center">
                                
                                  <CellStyle HorizontalAlign="Center"></CellStyle>
                             </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Tgl Bayar"  Name="#" VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Center"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Pokok" fieldname="Pokok2"   Name="#" VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Center"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Jasa"  Name="#" fieldname="Jasa2" VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Center"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Adv Pay"  Name="#"  VisibleIndex="0" fieldname="Pemb2" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Center"></CellStyle>
                                  </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Total"  Name="#" VisibleIndex="0" fieldname="Total2" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Center"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Jatuh Tempo"  Name="#" VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="Center"></CellStyle>
                             </dx:GridViewDataTextColumn>
                        </Columns>
                </dx:GridViewBandColumn>
                  <dx:GridViewBandColumn Caption="Sisa" HeaderStyle-HorizontalAlign="Center">
                      <Columns>
                           <dx:GridViewDataTextColumn Caption="Pokok"   Name="#" VisibleIndex="0" Width="3%">
                                
                                  <CellStyle HorizontalAlign="left"></CellStyle>
                             </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Jasa"  Name="#"  VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="left"></CellStyle>
                             </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn Caption="Total"  Name="#"  VisibleIndex="0" Width="3%">                                 
                                  <CellStyle HorizontalAlign="left"></CellStyle>
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
            <dx:ASPxSummaryItem FieldName="Pokok2"  SummaryType="Sum" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem FieldName="Jasa2" SummaryType="Sum" DisplayFormat="##,#.00"/>
            <dx:ASPxSummaryItem FieldName="Pemb2" SummaryType="Sum" DisplayFormat="##,#.00"/>
            <dx:ASPxSummaryItem FieldName="Total2" SummaryType="Sum" DisplayFormat="##,#.00"/>
           
<%--            <dx:ASPxSummaryItem FieldName="Jasaa" SummaryType="Sum" />
            <dx:ASPxSummaryItem FieldName="Adv_Payy" SummaryType="Sum" />--%>
        </TotalSummary>
            

        </dx:ASPxGridView>
            

    </div>
    <div>
        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Keterangan" Font-Bold="true"></dx:ASPxLabel>
        <table style="width:60%">
            <tr>
                <td style="width:33%">
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Jenis Kredit (JKR)" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td style="width:34%">
                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Jenis Debitur (JDB)" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td style="width:33%">
                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Jenis Sektor Usaha (JSU)" Font-Bold="true"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblJKR" runat="server" Text=""></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblJDB" runat="server" Text=""></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblJSU" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
