<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPenilaianSurvey.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.DetailPenilaianSurvey" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Src="~/Kemitraan/profile.ascx" TagName="profileUserControl" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <style>
        td {
            /*padding: 0px 40px 10px 0px;*/
            width: 400px;
        }
        table {
            width: 80%;
        }
    </style>
    <script type="text/javascript">
      
        function OnTextChanged(s, e) {
            a = parseInt(hUang.GetText(), 10);
            b = parseInt(hPersediaan.GetText(), 10);
            c = parseInt(hPiutang.GetText(), 10);
            d = parseInt(hPeralatan.GetText(), 10);
            e = parseInt(hKendaraan.GetText(), 10);
            total = a + b + c + d + e;
            hTotalAktiva.SetText(total);


            f = parseInt(hHutangDagang.GetText(), 10);
            g = parseInt(hModal.GetText(), 10);
            totalPasiva = f + g;
            hTotalPasiva.SetText(totalPasiva);

            jTotalAgunan.SetText(parseInt(jHargaTanah.GetText(), 10) + parseInt(jNilaiTanah.GetText(), 10) + parseInt(jNilaiBangunan.GetText(), 10));
        }


        function showProfile() {
            popup.Show();            
        }
    </script>
    <div class="bodydetail">
        <dx:ASPxNavBar ID="ASPxNavBar1" runat="server" Width="100%" Theme="Youthful" EnableAnimation="true"  AutoCollapse="false" AutoPostBack="false" AllowExpanding="true">
            <Groups>
                <dx:NavBarGroup  Text="A. Identitas Calon Mitra Binaan   *" HeaderStyle-Font-Bold="true" Expanded="true">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="No Form Penilaian "></dx:ASPxLabel>
                                            <span><font color="red">*</font></span>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxTextBox Width="100%" ID="aNoForm" Theme="Youthful" runat="server" Enabled="false" Text="--Generate by system--"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tanggal "></dx:ASPxLabel>
                                            <span><font color="red">*</font></span>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxDateEdit ID="aTanggal" Theme="Youthful" runat="server" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Nama"></dx:ASPxLabel>
                                        </td>
                                        <td>     
                                           
                                            <dx:ASPxTextBox Width="100%" ID="aNama" runat="server" Theme="Youthful"></dx:ASPxTextBox>
                                        </td>
                                        <td style="width:7%;text-align:center">   
                                            <asp:LinkButton ID="linkProfile" runat="server" OnClientClick="showProfile();return false;" CssClass="linkOff" ForeColor="Blue" CausesValidation="false">Profile</asp:LinkButton>                                           
                                                    
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Alamat Usaha"></dx:ASPxLabel>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxTextBox Width="100%" ID="aAlamatUsaha" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Bidang Usaha"></dx:ASPxLabel>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxTextBox Width="100%" ID="aBidangUSaha" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="No Telp"></dx:ASPxLabel>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxTextBox Width="100%" ID="aNoTelp" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Pengalaman Usaha"></dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxMemo ID="aPengalaman" Theme="Youthful" runat="server" Width="600px" Height="100px"></dx:ASPxMemo>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="B. Permohonan yang Diajukan Calon Mitra Binaan   *" HeaderStyle-Font-Bold="true" Expanded="true">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Surat Permohonan"></dx:ASPxLabel>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxTextBox Width="100%" ID="bSuratPermohonan" Theme="Youthful" runat="server" Enabled="false"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Permohonan Kredit "></dx:ASPxLabel>
                                            <span><font color="red">*</font></span>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxTextBox Width="100%" ID="bPermohonanKredit" Theme="Youthful" runat="server" Enabled="false">
                                                <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Nilai Yang Disetujui "></dx:ASPxLabel>
                                            <span><font color="red">*</font></span>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxTextBox Width="100%" ID="bNilaiSetuju" Theme="Youthful" runat="server">
                                                <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Jangka Waktu "></dx:ASPxLabel>
                                            <span><font color="red">*</font></span>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox Width="100%" ID="bJangkaWaktu" Theme="Youthful" runat="server">
                                                <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:13%;text-align:center">
                                            <font color="grey">Maksimal 60 bulan</font>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ErrorMessage="Jangka waktu tidak boleh 0.." ForeColor="Red" ControlToValidate="bJangkaWaktu" Display="Dynamic"></asp:RequiredFieldValidator>

                                        </td>
                                    </tr>
                                    <table>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Motivasi Dan Pertimbangan Calon Mitra Binaan dalam Mengajukan Permohonan"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxMemo ID="bMemoMotivasi" runat="server" Theme="Youthful" Width="600px" Height="100px"></dx:ASPxMemo>
                                            </td>
                                        </tr>
                                    </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="C. Hubungan Calon Mitra Binaan" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Hubungan dengan Pertamina"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cHubunganPertamina" runat="server" Theme="Youthful"></dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Hubungan dengan BUMN Lain"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cHubunganBUMN" runat="server" Theme="Youthful"></dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Fasilitas bantuan yang pernah dan/atau sedang dinikmati dari BUMN Lain"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="bFasilitas" runat="server" Theme="Youthful"></dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="D. Legalitas Calon Mitra" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Akte Pendirian"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox Width="100%" ID="dAkte" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="a. KTP"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox Width="100%" ID="dKTP" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="b. Kartu Keluarga"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox Width="100%" ID="dKK" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Perijinan"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox Width="100%" ID="dPerijinan" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="E. Aspek Manajemen" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Performance calon mitra binaan dan kondisi pengelolaan usaha"></dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxMemo ID="ePerformance" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="F.Aspek Teknis" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxMemo ID="fTeknis" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="G. Aspek Pemasaran" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxMemo ID="gPemasaran" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="H. Aspek Keuangan" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="1. Data Keuangan" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                <div class="borderdetail">
                                    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Aktiva Lancar" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                    <div class="borderdetail">

                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Uang Tunai dan Simpanan di Bank"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hUang" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hUang">
                                                        <ClientSideEvents TextChanged="OnTextChanged" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Persediaan Barang Berupa Stok Obat"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hPersediaan" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hPersediaan">
                                                        <ClientSideEvents TextChanged="OnTextChanged" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Piutang Usaha"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hPiutang" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hPiutang">
                                                        <ClientSideEvents TextChanged="OnTextChanged" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Peralatan Usaha"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hPeralatan" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hPeralatan">
                                                        <ClientSideEvents TextChanged="OnTextChanged" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel27" runat="server" Text="Kendaraan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hKendaraan" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hKendaraan">
                                                        <ClientSideEvents TextChanged="OnTextChanged" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Total"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hTotalAktiva" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hTotalAktiva" ClientEnabled="false"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabel79" runat="server" Text="Pasiva" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                    <div class="borderdetail">
                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel29" runat="server" Text="Hutang Dagang"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hHutangDagang" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hHutangDagang">
                                                        <ClientSideEvents TextChanged="OnTextChanged" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel30" runat="server" Text="Modal"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hModal" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hModal">
                                                        <ClientSideEvents TextChanged="OnTextChanged" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="Total"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="hTotalPasiva" Theme="Youthful" runat="server" Text="0" ClientInstanceName="hTotalPasiva" ClientEnabled="false"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel80" runat="server" Text="2. Perkembangan Hasil Usaha" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                <div class="borderdetail">
                                    <table>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel32" runat="server" Text="Berdasarkan catatan pembukuan dan wawancara, diperoleh sbb"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxMemo ID="hPembukuan" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="I. Aspek Manfaat" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxMemo ID="iManfaat" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="J. Aspek Agunan" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <div class="borderdetail">
                                    <table>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel34" runat="server" Text="a. Agunan Pokok"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="jAgunanPokok" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel35" runat="server" Text="b. Agunan Tambahan"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="jAgunanTambahan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel80" runat="server" Text="c. Nilai Agunan" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                <div class="borderdetail">
                                    <table>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel36" runat="server" Text="Harga Tanah"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="jHargaTanah" Theme="Youthful" runat="server" Text="0" ClientInstanceName="jHargaTanah">
                                                    <ClientSideEvents TextChanged="OnTextChanged" />
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel37" runat="server" Text="Luas Tanah"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="jLuasTanah" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel38" runat="server" Text="Nilai Tanah">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="jNilaiTanah" Theme="Youthful" runat="server" Text="0" ClientInstanceName="jNilaiTanah">
                                                    <ClientSideEvents TextChanged="OnTextChanged" />
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel39" runat="server" Text="Nilai Bangunan"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="jNilaiBangunan" Theme="Youthful" runat="server" Text="0" ClientInstanceName="jNilaiBangunan">
                                                    <ClientSideEvents TextChanged="OnTextChanged" />
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel40" runat="server" Text="Total"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="jTotalAgunan" Theme="Youthful" runat="server" Text="0" ClientInstanceName="jTotalAgunan" ClientEnabled="false"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="K. Perhitungan Penghasilan Usaha setiap Bulan" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel80" runat="server" Text="K.1." Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                <div class="borderdetail">
                                    <div class="borderdetail">
                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel33" runat="server" Text="Total Penjualan/bulan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kTotalPenjualan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel41" runat="server" Text="Pembelian Bahan Baku/Bulan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kPembelian" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel42" runat="server" Text="Laba Kotor"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kLabaKotor" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabel81" runat="server" Text="Biaya Operasional" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                    <div class="borderdetail">
                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel43" runat="server" Text="Karyawan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kKaryawan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel44" runat="server" Text="Listrik"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kListrik" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel45" runat="server" Text="Transportasi dll"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kTransportasi" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel82" runat="server" Text="K.2." Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                <div class="borderdetail">
                                    <div class="borderdetail">
                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel52" runat="server" Text="Perkiraan Daerah"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kPerkiraanDaerah" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel46" runat="server" Text="Total Penjualan/bulan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kTotalPenjualan2" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel47" runat="server" Text="Pembelian Bahan Baku/bulan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kTotalPembelian2" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel48" runat="server" Text="Laba Kotor"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kLabaKotor2" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabel83" runat="server" Text="Biaya Operasional" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                    <div class="borderdetail">
                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel49" runat="server" Text="Karyawan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kKaryawan2" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel50" runat="server" Text="Listrik"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kListrik2" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel51" runat="server" Text="Transportasi dll"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="kTransportasi2" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="L. Kebutuhan Modal Kerja" HeaderStyle-Font-Bold="true" Expanded="false">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <div class="borderdetail">
                                    <table>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel53" runat="server" Text="Besaran Kredit yang Diajukan"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="lKreditAjukan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <div class="borderdetail">
                                    <table>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel54" runat="server" Text="Total Penjualan kotor/bulan"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="lPenjualanKotor" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel55" runat="server" Text="Total Pengeluaran Harga Pokok/bulan"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="lPengeluaran" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel56" runat="server" Text="Kebutuhan dana untuk pembelian bahan obat-obatan"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="lKebutuhan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel57" runat="server" Text="Total Kebutuhan Dana"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="lTotalKebutuhan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel58" runat="server" Text="Perkiraan 75%"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="lPerkiraan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdlabel">
                                                <dx:ASPxLabel ID="ASPxLabel59" runat="server" Text="Pembulatan (maksimal kredit)"></dx:ASPxLabel>
                                            </td>
                                            <td>
                                                <dx:ASPxTextBox Width="100%" ID="lPembulatan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="M. Kesimpulan, Usul, dan Saran   *" HeaderStyle-Font-Bold="true" Expanded="true">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel80" runat="server" Text="Kesimpulan mengenai kelayakan pemberian kredit" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                <div class="borderdetail">
                                    <table>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel60" runat="server" Text="Aspek Legalitas Usaha"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="mAspekLegal" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel61" runat="server" Text="Aspek Manajemen"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="mAspekManajemen" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel62" runat="server" Text="Aspek Teknik"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="mAspekTeknik" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel63" runat="server" Text="Aspek Pemasaran"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="mAspekPemasaran" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel64" runat="server" Text="Aspek Keuangan"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="mAspekKeuangan" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel65" runat="server" Text="Aspek Manfaat"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="mAspekManfaat" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxLabel ID="ASPxLabel66" runat="server" Text="Aspek Agunan"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="mAspekAgunan" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <dx:ASPxLabel ID="ASPxLabel84" runat="server" Text="Usul dan Saran" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                <div class="borderdetail">
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabel85" runat="server" Text="1. Persyaratan Kredit memenuhi dan dapat dipertimbangkan sbb:" Font-Bold="true" Font-Size="11px"></dx:ASPxLabel>
                                    <div class="borderdetail">
                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel67" runat="server" Text="1.1. Kegunaan"></dx:ASPxLabel>
                                                    <span><font color="red">*</font></span>
                                                </td>
                                                <td colspan="2">
                                                    <dx:ASPxTextBox Width="100%" ID="mKegunaan" Theme="Youthful" runat="server"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel68" runat="server" Text="1.2. Jenis Kredit"></dx:ASPxLabel>
                                                    <span><font color="red">*</font></span>
                                                </td>
                                                <td colspan="2">
                                                    <dx:ASPxComboBox ID="mJenisKredit" Theme="Youthful" runat="server"></dx:ASPxComboBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel69" runat="server" Text="1.3. Suku Jasa"></dx:ASPxLabel>
                                                    <span><font color="red">*</font></span>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="mSukuJasa" Theme="Youthful" runat="server">
                                                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width:17%;text-align:center">
                                                    <font color="grey">6% Sesuai PerMen terbaru</font>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ErrorMessage="Suku Jasa tidak boleh 0.." ForeColor="Red" ControlToValidate="mSukuJasa" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel70" runat="server" Text="1.4. Jenis Jasa"></dx:ASPxLabel>
                                                    <span><font color="red">*</font></span>
                                                </td>
                                                <td colspan="2">
                                                    <dx:ASPxComboBox ID="mJenisJasa" Theme="Youthful" runat="server"></dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel71" runat="server" Text="1.5. Denda"></dx:ASPxLabel>
                                                </td>
                                                <td colspan="2">
                                                    <dx:ASPxTextBox Width="100%" ID="mDenda" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel72" runat="server" Text="1.6. Provisi"></dx:ASPxLabel>
                                                </td>
                                                <td colspan="2">
                                                    <dx:ASPxTextBox Width="100%" ID="mProvinsi" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br />
                                    <div class="borderdetail">
                                        <table>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel73" runat="server" Text="2. Biaya Administrasi"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="mBiayaAdm" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel74" runat="server" Text="3. Pembayaran Jasa"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="mPembayaranBunga" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel75" runat="server" Text="4. Jaminan Pokok"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="mJaminanPokok" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdlabel">
                                                    <dx:ASPxLabel ID="ASPxLabel76" runat="server" Text="5. Jaminan Tambahan"></dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox Width="100%" ID="mJaminanTambahan" Theme="Youthful" runat="server" Text="0"></dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
                <dx:NavBarGroup Text="Keputusan Kredit   *" HeaderStyle-Font-Bold="true" Expanded="true">
                    <Items>
                        <dx:NavBarItem>
                            <Template>
                                <br />
                                <table>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel77" runat="server" Text="Diterima/Ditolak"></dx:ASPxLabel>
                                            <span><font color="red">*</font></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList ID="Keputusan" runat="server">
                                                <asp:ListItem Text="Please select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Ditolak" Value="R"></asp:ListItem>
                                                <asp:ListItem Text="Diterima" Value="P"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Keputusan" ErrorMessage="Please select Keputusan.." Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdlabel">
                                            <dx:ASPxLabel ID="ASPxLabel78" runat="server" Text="Alasan"></dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxMemo ID="Alasan" Theme="Youthful" runat="server" Height="100px" Width="600px"></dx:ASPxMemo>
                                        </td>
                                    </tr>
                                </table>
                            </Template>
                        </dx:NavBarItem>
                    </Items>
                </dx:NavBarGroup>
            </Groups>
        </dx:ASPxNavBar>
        <br />
        <dx:ASPxButton ID="btnSimpan" runat="server" Theme="Youthful" Text="Simpan" OnClick="btnSimpan_Click" Width="149px"></dx:ASPxButton>
    </div>

    <dx:ASPxPopupControl ID="ASPxPopupControl1" HeaderText="Profile" runat="server"
        ClientInstanceName="popup" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto"
        Height="600px" Width="700px"
        EnableViewState="False">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel1" runat="server">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <uc1:profileUserControl runat="server" ID="profileUserControl" />
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
