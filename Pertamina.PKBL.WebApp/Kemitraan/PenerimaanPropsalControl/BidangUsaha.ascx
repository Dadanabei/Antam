<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BidangUsaha.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.BidangUsaha" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<div class="bodydetail">
    <dx:ASPxLabel runat="server" ID="lblPenjamins2" Font-Bold="true" Text="Kegiatan Usaha Saat Ini" Font-Size="14px"></dx:ASPxLabel>
    <div class="borderdetail">

        <table>
            <tr>
                <td style="width:170px">
                    <dx:ASPxLabel ID="lblBU" runat="server" Text="Jenis Produksi" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td style="width:170px">
                    <dx:ASPxLabel ID="lblBU2" runat="server" Text="Jumlah Produksi" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td style="width:170px">
                    <dx:ASPxLabel ID="lblBU3" runat="server" Text="Harga Satuan" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td style="width:170px">
                    <dx:ASPxLabel ID="lblBU4" runat="server" Text="Jumlah Penjualan" Theme="Youthful"></dx:ASPxLabel>
                </td>       
            </tr>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtJenisProduksi1" runat="server" Width="150px" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlProd1"  runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtHargaSatuan1" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlJualan1" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>       
            </tr>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtJenisProduksi2" runat="server" Width="150px" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlProd2" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtHargaSatuan2" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlJualan2" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>    
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtJenisProduksi3" runat="server" Width="150px" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlProd3" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtHargaSatuan3" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlJualan3" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>       
            </tr>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtJenisProduksi4" runat="server" Width="150px" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlProd4" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtHargaSatuan4" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJmlJualan4" runat="server" Width="150px" Theme="Youthful" DisplayFormatString="##,#.00"></dx:ASPxTextBox>
                </td>       
            </tr>
        </table>
    </div>
    <br />
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblBrgProd" runat="server" Text="Barang yang diproduksi" Theme="Youthful"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbBrgProd" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblBU5" runat="server" Text="Alat yang dimiliki" Theme="Youthful"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtAlat1" runat="server" Width="150px" Theme="Youthful"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtQtyAlat1" runat="server" Width="100px" Theme="Youthful">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblBU6" runat="server" Text="Alat yang dimiliki" Theme="Youthful"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtAlat2" runat="server" Width="150px" Theme="Youthful"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtQtyAlat2" runat="server" Width="100px" Theme="Youthful">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblBU7" runat="server" Text="Alat yang dimiliki" Theme="Youthful"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtAlat3" runat="server" Width="150px" Theme="Youthful"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtQtyAlat3" runat="server" Width="100px" Theme="Youthful">
                    <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                </dx:ASPxTextBox>
            </td>
        </tr>
    </table>
    <br />
    <dx:ASPxLabel ID="lblBU8" runat="server" Text="Bila Usaha Jasa, Bidang yang Dilaksanakan:" Theme="Youthful"></dx:ASPxLabel>
    <dx:ASPxMemo ID="mmJasa" runat="server" Height="71px" Width="700px" Theme="Youthful"></dx:ASPxMemo>
    <br />
    <dx:ASPxLabel ID="lblBU9" runat="server" Text="Pemasaran:" Theme="Youthful"></dx:ASPxLabel>
    <dx:ASPxMemo ID="mmPemasaran" runat="server" Height="71px" Width="700px" Theme="Youthful"></dx:ASPxMemo>
    <br />
    <dx:ASPxLabel ID="lblBU10" runat="server" Text="Daerah Pemasaran:" Theme="Youthful"></dx:ASPxLabel>
    <dx:ASPxComboBox ID="cbbDaerahPemasaran" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
    <br />
    <dx:ASPxButton ID="btnUpdate" runat="server" Text="Update" Theme="Youthful" OnClick="btnUpdate_Click"></dx:ASPxButton>
</div>