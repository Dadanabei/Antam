<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepPerkembanganPinjamanMitraBinaan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepKemitraan.RepPerkembanganPinjamanMitraBinaan" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
    <style type="text/css">
        .space {
            height:30px;
        }
        .width {
            width:50px;
        }
        
        .auto-style1 {
            width: 50%;
            height: 16px;
        }
        .auto-style2 {
            height: 16px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
     <asp:ScriptManager ID="smPerkembangan" EnablePartialRendering="true" runat="server"></asp:ScriptManager>
    <span style="font-size:x-large"> Laporan Perkembangan Pinjaman Mitra Binaan</span>
    <br />
   
        <asp:UpdateProgress ID="UpdateProgressPerkembangan"  runat="server">
    <ProgressTemplate>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="updatePanelPerkembangan" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="chregion1" />
        <asp:AsyncPostBackTrigger ControlID="chregion2" />
        <asp:AsyncPostBackTrigger ControlID="chregion3" />
        <asp:AsyncPostBackTrigger ControlID="chregion4" />
        <asp:AsyncPostBackTrigger ControlID="chregion5" />
        <asp:AsyncPostBackTrigger ControlID="chregion6" />
        <asp:AsyncPostBackTrigger ControlID="chregion7" />
        <asp:AsyncPostBackTrigger ControlID="chregion8" />
        <asp:AsyncPostBackTrigger ControlID="chregion9" />
    </Triggers>
    <ContentTemplate>
    <div class="borderdetail">
        <table style="width:100%">
            <tr>
                <td class="space">
                    Periode Salur
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtPeriode" DisplayFormatString="dd/MM/yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    Sampai
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtSampaii" DisplayFormatString="dd/MM/yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    Periode kualitas Per
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbBulan" runat="server" ValueType="System.String" Theme="Youthful">
                        <Items>
                                <dx:ListEditItem Text="--pilih--" Value="0" Selected="true" />
                                <dx:ListEditItem Text="Januari" Value="1" />
                                <dx:ListEditItem Text="Februari" Value="2" />
                                <dx:ListEditItem Text="Maret" Value="3" />
                                <dx:ListEditItem Text="April" Value="4" />
                                <dx:ListEditItem Text="Mei" Value="5" />
                                <dx:ListEditItem Text="Juni" Value="6" />
                                <dx:ListEditItem Text="Juli" Value="7" />
                                <dx:ListEditItem Text="Agustus" Value="8" />
                                <dx:ListEditItem Text="September" Value="9" />
                                <dx:ListEditItem Text="Oktober" Value="10" />
                                <dx:ListEditItem Text="November" Value="11" />
                                <dx:ListEditItem Text="Desember" Value="12" />
                            </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbTahun" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
        </table>

        
        <table style="width:100%;vertical-align:top">
            <tr>
                <td class="auto-style1">
                    Kualitas Pinjaman
                </td>
                <td class="auto-style2">
                   
                     Area:
                </td>
            </tr>
            <tr>
                 <td style="vertical-align:top">
                    <table style="vertical-align:text-top">
                         <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chLancar" Text="Lancar" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chKurang" Text="Kurang Lancar" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chRagu" Text="Diragukan" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chMacet" Text="Macet" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                       
                        </table>
                </td>
                <td>
                             
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion1" OnCheckedChanged="chkregionChange"   AutoPostBack ="true" data-branch="1100" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion2" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="1200" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion3" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="1300" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion4" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="1400" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion5" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2500" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion6" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2600" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion7" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2700" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion8" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2800" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion9" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="9900" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            
            <tr>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td class="auto-style2">
                                 Bermasalah
                            </td>
                           
                            <td class="space">
                                <dx:ASPxComboBox runat="server" ID="cbbBermasalah" Theme="Youthful">
                                    <Items>
                                        <dx:ListEditItem Selected="true" Value="all" Text="--Semua--" />
                                        <dx:ListEditItem Value="1" Text="Tidak Bermasalah" />
                                        <dx:ListEditItem Value="2" Text="Bermasalah" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Sektor
                            </td>
                            <td class="space">
                                <dx:ASPxComboBox runat="server" ID="cbbSektor" Theme="Youthful"></dx:ASPxComboBox>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                Lunas
                            </td>
                            <td class="space">
                                <dx:ASPxComboBox runat="server" ID="cbbLunas" Theme="Youthful">
                                    <Items>
                                        <dx:ListEditItem Selected="true" Value="all" Text="--Semua--" />
                                        <dx:ListEditItem Value="1" Text="Lunas" />
                                        <dx:ListEditItem Value="2" Text="Belum Lunas" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                   
                </td>
                <td>
                    <table>
                        <tr>
                            <td class="width">
                                Propinsi
                            </td>
                            <td class="space">
                                <dx:ASPxComboBox runat="server" ID="cbbPropnsi" Theme="Youthful"></dx:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
    </div>
        </ContentTemplate>
</asp:UpdatePanel>
            
        <br />
        <dx:ASPxButton runat="server" ID="btnGo" Text="Go" UseSubmitBehavior="false" Theme="Youthful" OnClick="btnGo_Click"></dx:ASPxButton>&nbsp;
        <dx:ASPxButton runat="server" ID="btnreset" Text="Reset" Theme="Youthful" UseSubmitBehavior="false" OnClick="btnreset_Click"></dx:ASPxButton>
        <br />
        <dx:ASPxLabel ID="lblReport" runat="server" Text=""></dx:ASPxLabel>
    <br />
    <dx:ASPxButton ID="btnExport" runat="server" Text="Export XLS" OnClick="btnExport_Click"></dx:ASPxButton>
    <div class="bodydetail" style="overflow:auto;overflow-y:hidden;overflow-x:scroll">
    <dx:ASPxGridView runat="server" ID="gvPerPinjBinLingk" Theme="Youthful" Visible="false" KeyFieldName="proposal_number" 
        OnHtmlRowPrepared="gvPerPinjBinLingk_HtmlRowPrepared" OnCustomButtonInitialize="gvPerPinjBinLingk_CustomButtonInitialize" OnCustomButtonCallback="gvPerPinjBinLingk_CustomButtonCallback">
        
        <Columns>
            <dx:GridViewDataTextColumn Caption="No">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="" ButtonType="Image">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="buttonNama" Text="" >
                        <Image Url="~/content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn Caption="Kode" Name="mitraid" FieldName="mitraid">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nama" Name="requestor_name" FieldName="requestor_name" Visible="true" Width="300px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="proposal" Name="proposal_number" FieldName="proposal_number" Visible="false" Width="300px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nama Usaha" Name="company_name" FieldName="company_name" Width="300px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataColumn Caption="Alamat" Name="requestor_address" FieldName="requestor_address">
            </dx:GridViewDataColumn>
             <dx:GridViewDataTextColumn Caption="Propinsi" Name="province_name" FieldName="province_name" Width="200px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kota/Kabupaten" Name="city_name" FieldName="city_name" Width="200px">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="No Telp/Hp" Name="requestor_phone1" FieldName="requestor_phone1">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Agunan" Name="jaminan" FieldName="jaminan">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Jumlah Pinjaman" Name="JumlahPinjaman" FieldName="JumlahPinjaman">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nilai Jasa" Name="Jasa" FieldName="Jasa">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn Caption="Nilai Realisasi" Name="NilaiSetuju" FieldName="NilaiSetuju">
               <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Jangka Waktu" Name="JangkaWaktu" FieldName="JangkaWaktu">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tanggal Penyaluran" Name="TglPenyaluran" FieldName="TglPenyaluran">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Tanggal Jatuh Tempo" Name="tglJatuhTempo" FieldName="tglJatuhTempo">
                 <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Jumlah Jasa Jatuh Tempo" Name="JumlahJasaJatuhTempo" FieldName="JumlahJasaJatuhTempo">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Pengembalian Pinjaman">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Pokok" Name="PengembalianPokok" FieldName="PengembalianPokok">
                        <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Jasa Adm" Name="PengembalianBunga" FieldName="PengembalianBunga">
                         <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn Caption="Jumlah" Name="PengembalianPokokJasa" FieldName="PengembalianPokokJasa">
                          <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Tunggakan">
                  <Columns>
                       <dx:GridViewDataTextColumn Caption="Pokok" Name="tunggakanPokok" FieldName="tunggakanPokok">
                           <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Jasa Adm" Name="tunggakanBunga" FieldName="tunggakanBunga">
                         <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn Caption="Jumlah" Name="jumlahTunggakan" FieldName="jumlahTunggakan">
                          <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn Caption="Hari" Name="hari" FieldName="hari">
                          
                      </dx:GridViewDataTextColumn>

                  </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="Sisa Pinjaman" Name="sisaPinjaman" FieldName="sisaPinjaman">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Penyisihan" FieldName ="penyisihan" Name="penyisihan" >
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kelebihan" Name="kelebihan" FieldName="kelebihan">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="STS" Name="sts" FieldName="sts">
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sektor" Name="sector" FieldName="sector">
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Region" Name="branch_code" FieldName="branch_code">
             </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn Caption="Sinergi" Name ="sinergi" FieldName="sinergi" >
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kriteria" Name="kriteria" FieldName="kriteria">
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Catatan" Name="catatan" FieldName="catatan">
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Alamat Baru" Name="alamatbaru" FieldName="alamatbaru">
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Grace Periode" Name="grace_period" FieldName="grace_period">
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="TglTerakhir Bayar" Name="tglTerakhirBayar" FieldName="tglTerakhirBayar">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pembayaran Terakhir Ke" Name="angsurankeTerakhirBayar" FieldName="angsurankeTerakhirBayar">
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Nominal Terakhir Bayar" Visible="false">
                <Columns>
                      <dx:GridViewDataTextColumn Caption="Pokok" Name="terakhirBayarPokok" FieldName="terakhirBayarPokok">
                          <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                     </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="Jasa Adm" Name="terakhirBayarBunga" FieldName="terakhirBayarBunga">
                         <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lebih Bayar" Name="terakhirBayarAdv" FieldName="terakhirBayarAdv" >
                            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn Caption="Jumlah" Name="terakhirBayarTotal" FieldName="terakhirBayarTotal">
                          <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn> 
              <dx:GridViewDataTextColumn Caption="Cabang Propinsi" Name="region" FieldName="region">
                      </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Detail Jatuh Tempo" Name="jatuhtempo_bulan" FieldName="jatuhtempo_bulan">
                      </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="NilaiSetuju" ShowInColumn="NilaiSetuju" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="JumlahPinjaman" ShowInColumn="JumlahPinjaman" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="Jasa" ShowInColumn="Jasa" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="JumlahJasaJatuhTempo" ShowInColumn="JumlahJasaJatuhTempo" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="PengembalianPokok" ShowInColumn="PengembalianPokok" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="PengembalianBunga" ShowInColumn="PengembalianBunga" />

            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="PengembalianPokokJasa" ShowInColumn="PengembalianPokokJasa" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="tunggakanPokok" ShowInColumn="tunggakanPokok" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="tunggakanBunga" ShowInColumn="tunggakanBunga" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="jumlahTunggakan" ShowInColumn="jumlahTunggakan" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="sisaPinjaman" ShowInColumn="sisaPinjaman" />
            
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="penyisihan" ShowInColumn="penyisihan" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="kelebihan" ShowInColumn="kelebihan" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="terakhirBayarPokok" ShowInColumn="terakhirBayarPokok" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="terakhirBayarBunga" ShowInColumn="terakhirBayarBunga" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="terakhirBayarAdv" ShowInColumn="terakhirBayarAdv" />
            <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="terakhirBayarTotal" ShowInColumn="terakhirBayarTotal" />
        </TotalSummary>

        <Settings ShowFooter="true" />
        <SettingsPager AlwaysShowPager="True" mode="ShowPager" PageSize ="200">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
              <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
            </SettingsPopup>
            <Settings ShowFilterRow="True" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <CommandColumn Spacing="5px" />
            </Styles>
            <StylesPager>
                 <CurrentPageNumber BackColor="#FB000C">
                 </CurrentPageNumber>
             </StylesPager>
    </dx:ASPxGridView>
    </div>
    <div class="borderdetail">
        <table style="width:100%">
            <tr>
                <td style="width:70%">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="TOTAL PENYALURAN"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                        <dx:ASPxLabel ID="lblTotalPenyaluran" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="JASA ADM."></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblJasaAdm" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="TOTAL PINJAMAN" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblTotalPinjaman" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="PENGEMBALIAN POKOK"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel29" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblPengembalianPokok" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="PENDAPATAN JASA ADM."></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel32" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblPEndapatanJasaAdm" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel34" runat="server" Text="TOTAL PENGEMBALIAN" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel35" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblTotalPengembalian" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="SISA PINJAMAN POKOK"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblSisaPinjamanPokok" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="SISA JASA ADM."></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblSisaJasaAdm" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="TOTAL SISA PINJAMAN" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblTotalSisaPinjaman" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="TUNGGAKAN POKOK"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblTunggakanPokok" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="TUNGGAKAN BUNGA"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblTunggakanBunga" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="TOTAL TUNGGAKAN" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblTotalTunggakan" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <table style="width:100%">
            <tr>
                <td style="width:70%">
                    <dx:ASPxLabel ID="ASPxLabel37" runat="server" Text="KLASIFIKASI SALDO PINJAMAN" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel38" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="ASPxLabel39" runat="server" Text=""></dx:ASPxLabel>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel40" runat="server" Text="LUNAS"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel41" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblLunas" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblSaldoLunas" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>

            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel43" runat="server" Text="LANCAR"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel44" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblLancar" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblSaldoLancar" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>

            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel46" runat="server" Text="KURANG LANCAR"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel47" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblKurangLancar" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblSaldoKurangLancar" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>

            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel49" runat="server" Text="DIRAGUKAN"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel50" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblDiragukan" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblSaldoDiragukan" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>

            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel52" runat="server" Text="MACET"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel53" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblMacet" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>
                <td>
                    <div style="text-align:right">
                    <dx:ASPxLabel ID="lblSaldoMacet" runat="server" Text=""></dx:ASPxLabel> 
                    </div>
                </td>

            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
    <dx:ASPxGridViewExporter ID="gvExporter" GridViewID="gvPerPinjBinLingk" Landscape="false" runat="server"></dx:ASPxGridViewExporter>
</asp:Content>
