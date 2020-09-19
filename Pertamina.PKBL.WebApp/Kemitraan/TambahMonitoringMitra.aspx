<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TambahMonitoringMitra.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.TambahMonitoringMitra" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
    <style type="text/css">
        .td{
            width:200px;
 
    }
        .full {
            width:100%;
        }

    </style>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
   <span style="font-size:large">Input Monitoring Evaluasi</span>
    <br />
    <div class="borderdetail">
        <table>
            <tr>
                <td class="td">
                    Kode Mitra
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKode" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tanggal Monitoring
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTangal" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    Nama usaha
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNamaUs" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Nama Pimpinan
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNamaPim" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Jenis Usaha
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJenis" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Alamat Lokasi Usaha
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtAlamat" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    No Telepon/Hp
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTelepon" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Kapan Mulai Usaha
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKapan" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Status Kepemilikan Usaha
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbKepemilikan" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    Jumlah Tenaga kerja
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJumlahTenaga" Theme="Youthful" Text="0"></dx:ASPxTextBox><span style="font-size:x-small">orang</span>
                </td>
            </tr>
             <tr>
                <td>
                    Omzet Penjualan
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtOmzet" Theme="Youthful" Text="0"></dx:ASPxTextBox><span style="font-size:x-small">/bulan (rata-rata)</span>
                </td>
            </tr>
             <tr>
                <td>
                    Keuntungan Penjualan (Rp)
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtPenjualan" Theme="Youthful" Text="0"></dx:ASPxTextBox><span style="font-size:x-small">/bulan</span>
                </td>
            </tr>           
        </table>
    </div>
    <br />
    Jangkauan Pasar
    <div class="borderdetail">
        <table>
            <tr>
                <td class="td">
                    Jumlah Pelanggan
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJumlahPeng" Theme="Youthful" Text="0"></dx:ASPxTextBox><span style="font-size:x-small">/bulan</span>
                </td>
            </tr>
            <tr>
                <td>
                    Wilayah Pemasaran dalam Propinsi
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtDalam" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Dalam Propinsi Luar Propinsi
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtLuar" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>

        </table>
    </div>
    <br />
    Aset Utama
    <div class="borderdetail">
        <table>
            <tr>
                <td class="td">
                    Bangunan
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtBangunan" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
             </table>
        <table class="full">
               <tr>
                <td>
                    Peralatan
                </td>
                </tr>
            <tr>
                <td class="full">
                    <dx:ASPxMemo runat="server" ID="txtPeralatan" Width="100%" Theme="Youthful" Height="50px"></dx:ASPxMemo>
                </td>
            </tr>
        </table>

             <tr>
                <td>
                    Nilai Aset
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtAset" Theme="Youthful" Text="0"></dx:ASPxTextBox>
                </td>
            </tr>
            
    
        <table class="full">
            <tr>
                <td>
                     Kendala Yang Dihadapi
                </td>
               
            </tr>
            <tr>
                 <td>
                   <dx:ASPxMemo runat="server" ID="txtKendala" Height="50px" width="100%" Theme="Youthful"></dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td>
                     Saran Dan Harapan
                </td>              
            </tr>
            <tr>
                <td>
                   <dx:ASPxMemo runat="server" ID="txtSaran" Width="100%" Height="50px" Theme="Youthful"></dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td>
                     Kesimpulan Evaluasi Dan Monitoring
                </td>               
            </tr>
            <tr>
                <td>
                   <dx:ASPxMemo runat="server" ID="txtKesim" Width="100%" Height="50px" Theme="Youthful"></dx:ASPxMemo>
                </td>
            </tr>
        </table>
            
       
    </div>
    <dx:ASPxButton runat="server" ID="btnSimpan" Text="Simpan" Theme="Youthful" OnClick="btnSimpan_Click"></dx:ASPxButton>&nbsp;<dx:ASPxHyperLink runat="server" ID="btnKembali" Text="Kembali" NavigateUrl="MonitoringMitra.aspx"></dx:ASPxHyperLink>
    
   
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
