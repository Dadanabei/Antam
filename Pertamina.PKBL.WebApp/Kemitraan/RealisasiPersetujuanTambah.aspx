<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RealisasiPersetujuanTambah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.RealisasiPersetujuanTambah" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <script type="text/javascript">
        TextChanged = function()
        {
            var grace = parseInt(txtGracePeriod.GetValue());
            var waktu = parseInt(txtJangkaWaktu.GetValue());
            var pokok = parseInt(txtJmlPokokPinjaman.GetValue());
            var hasil = parseInt(pokok/(waktu-grace));



            txtAngsuran.SetText(hasil);
        }
    </script>

    <dx:ASPxLabel runat="server" ID="lblHeader" Font-Bold="true" Text="" Font-Size="18px"></dx:ASPxLabel>

<div class="bodydetail">
    <div class="borderdetail">
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tgl Perjanjian" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="deTglPerjanjian" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="No. Mitra" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNoMitra" runat="server" Width="60%" Theme="Youthful" ReadOnly="true">
                        <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Pinjaman ke" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtPinjamanKe" runat="server" Width="60%" Theme="Youthful">
                        <MaskSettings Mask="&lt;1..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="No. SPPU" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNoSppu" runat="server" Width="60%" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>

    <br />
    <dx:ASPxLabel runat="server" ID="ASPxLabel38" Font-Bold="true" Text="Yang bertanda tangan di bawah ini :" Font-Size="12px"></dx:ASPxLabel>
    <div class="borderdetail">
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Nama" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNama" runat="server" Width="60%" Theme="Youthful" ReadOnly="true">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="No. KTP / SIM" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtKTP" runat="server" Width="60%" Theme="Youthful" ReadOnly="true">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Alamat Rumah" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtAlamatRumah" runat="server" Width="80%" Theme="Youthful" ReadOnly="true">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Kode Pos" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtKodePos" runat="server" Width="40%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Kota" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbKota" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Penyalur" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbPenyalur" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Nama Perusahaan" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                     <dx:ASPxTextBox ID="txtNamaUSaha" runat="server" Width="80%" Theme="Youthful" ReadOnly="true">
                          <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                     </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Jenis Usaha" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                     <dx:ASPxTextBox ID="txtJenisUsaha" runat="server" Width="60%" Theme="Youthful">
                          <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                     </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Sektor Usaha" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbSektorUSaha" runat="server" ValueType="System.String" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Alamat Usaha" Theme="Youthful" ReadOnly="true"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                     <dx:ASPxTextBox ID="txtAlamatUSaha" runat="server" Width="80%" Theme="Youthful" ReadOnly="true">
                          <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                     </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Kode Pos Usaha" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                     <dx:ASPxTextBox ID="txtKodePosUsaha" runat="server" Width="40%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>

    <br />    
    <asp:ScriptManager ID="smRealisasi" runat="server" EnablePartialRendering="true"></asp:ScriptManager>

    <dx:ASPxLabel runat="server" ID="ASPxLabel39" Font-Bold="true" Text="Ketentuan Pokok Pemberian Pinjaman" Font-Size="12px"></dx:ASPxLabel>           
    <asp:UpdateProgress ID="UpdateProgressRealisasi" runat="server">
    <ProgressTemplate>
        Processing...
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="updatePanelRealisasi" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="chYarnen" />
    </Triggers>
    <ContentTemplate>
    <div class="borderdetail">
        <table style="width:60%">
            <tr>
                <td colspan="2">
                    <dx:ASPxCheckBox ID="chYarnen" runat="server" Checked="false" Text="Bayar Panen (Yarnen)" AutoPostBack="true" OnCheckedChanged="chYarnen_CheckedChanged"></dx:ASPxCheckBox>
                    <dx:ASPxLabel ID="lblYarnen" runat="server" Text="Silahkan isi 'Jangka Waktu' dan 'Jatuh Tempo/ Bulan' sesuai Yarnen" ForeColor="red" Visible="false"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td style="width:20%">
                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Jumlah Pokok Pinjaman" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlPokokPinjaman" ClientInstanceName="txtJmlPokokPinjaman" runat="server" Width="40%" Theme="Youthful" ReadOnly="true">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblJangkaWaktu" runat="server" Text="Jangka Waktu" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td style="width:60%">
                                <dx:ASPxTextBox ID="txtJangkaWaktu" ClientInstanceName="txtJangkaWaktu" runat="server" Width="100%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                                <dx:ASPxLabel ID="lblTempJangkaWaktu" runat="server" Text="" Visible="false"></dx:ASPxLabel>
                            </td>
                            <td>
                                <span>dalam bulan</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Suku Bunga" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td style="width:60%">
                                <dx:ASPxTextBox ID="txtSukuBunga" runat="server" Width="100%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                            </td>
                            <td>
                                <span>dalam %</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Sistem Bunga" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbSistemBunga" runat="server" ValueType="System.String" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Perkiraan angsuran" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td style="width:60%">
                                <dx:ASPxTextBox ID="txtAngsuran" runat="server" Width="100%" ReadOnly="true" Theme="Youthful" ClientInstanceName="txtAngsuran" DisplayFormatString="##,#.00" ></dx:ASPxTextBox>
                            </td>
                            <td>
                                <span>per bulan</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Tanggal Mulai Bayar" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="deTglMulaiBayar" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Jatuh Tempo per Tgl" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJatuhTempoPerTgl" runat="server" Width="40%" Theme="Youthful">
                        <MaskSettings Mask="&lt;1..31g&gt;" IncludeLiterals="None" ShowHints="false" />
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblJatuhTempoBulan" runat="server" Text="Jatuh Tempo/ Bulan" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJatuhTempoPerBulan" runat="server" Width="40%" Theme="Youthful" ReadOnly="true">
                        <MaskSettings Mask="&lt;1..100g&gt;" IncludeLiterals="None" ShowHints="false" />
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Jenis Pinjaman" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbJenisPinjaman" runat="server" ValueType="System.String" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Model Pembayaran" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbModelPembayaran" runat="server" ValueType="System.String" Theme="Youthful">
                        <Items>
                            <dx:ListEditItem Selected="true" Value="1" Text="Pokok + Bunga" />
                        </Items>
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Jml Debitur" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td style="width:35%">
                                <dx:ASPxTextBox ID="txtJmlDebitur" runat="server" Width="100%" Theme="Youthful">
                                    <MaskSettings Mask="&lt;1..999g&gt;" IncludeLiterals="None" ShowHints="false" />
                                     <ValidationSettings ErrorText="" Display="Dynamic" >
                                        <RequiredField IsRequired="true" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <span>orang</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel27" runat="server" Text="Grace Period" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtGracePeriod" runat="server" Width="40%" Theme="Youthful" ClientInstanceName="txtGracePeriod" ClientSideEvents-TextChanged="TextChanged">
                        <MaskSettings Mask="&lt;0..99g&gt;" IncludeLiterals="None" ShowHints="false" />
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Denda Tunggakan" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <table style="width:100%">
                        <tr>
                            <td style="width:60%">
                                <dx:ASPxTextBox ID="txtDendaTunggakan" runat="server" Width="100%" Theme="Youthful">
                                    <MaskSettings Mask="&lt;0..99g&gt;" IncludeLiterals="None" ShowHints="false" />
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <span>dalam %</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel29" runat="server" Text="Jenis Agunan" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJenisAgunan" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel30" runat="server" Text="Letak Agunan" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtLetakAgunan" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="Kode Pos" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtKodePosKetentuan" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel32" runat="server" Text="Bukti Kepemilikan Agunan" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                   <dx:ASPxTextBox ID="txtBuktiKepemilikanAgunan" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    </ContentTemplate>
</asp:UpdatePanel>
    <br />
    <div class="borderdetail">
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                    <dx:ASPxLabel ID="ASPxLabel33" runat="server" Text="Produk Unggulan" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbProdukUnggulan" runat="server" ValueType="System.String" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel34" runat="server" Text="Mitra Terpilih" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbMitraTerpilih" runat="server" ValueType="System.String" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel35" runat="server" Text="Jaminan" Theme="Youthful"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <dx:ASPxMemo ID="memoJaminan" runat="server" Height="100px" Width="80%" Theme="Youthful">
                    </dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel36" runat="server" Text="No. Rekening" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNoRekening" runat="server" Width="40%" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel37" runat="server" Text="Nama Bank" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNamaBank" runat="server" Width="60%" Theme="Youthful">
                         <ValidationSettings ErrorText="" Display="Dynamic" >
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color:red">*) Wajib diisi</span>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <dx:ASPxButton runat="server" ID="btnSubmit" Text="Simpan" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
    <dx:ASPxHyperLink ID="linkCancel" runat="server" Text="Cancel" NavigateUrl="~/Kemitraan/RealisasiKemitraan.aspx" Theme="Youthful">
    </dx:ASPxHyperLink>
    <br />
    <br />
    <dx:ASPxLabel ID="lblInfo" runat="server" Text=""></dx:ASPxLabel>
</div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
