<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPengajuanHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Hibah.DetailPengajuanHibah" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <style>
       
    </style>

    <div class="bodydetail">

    <div class="borderdetail">
    <table style="width:70%" class="tbllayout">
        <tr >
            <td style="width:30%">
                <dx:ASPxLabel runat="server" ID="lblTanggal" Text="Kode"></dx:ASPxLabel>
                <span style="color:red"></span>

            </td>
            <td>
                 <dx:ASPxTextBox runat="server" ID="txtProposalNumber" Theme="Youthful"></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="ASPxLabel1" Text="Tanggal Pendaftaran"></dx:ASPxLabel>
                <span style="color:red"></span>

            </td>
            <td>
                 <dx:ASPxDateEdit runat="server" ID="txtTanggalPendaftaran" Theme="Youthful" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
    </div>
    <br />
    <dx:ASPxLabel runat="server" ID="ASPxLabel39" Font-Bold="true" Text="Data Pribadi Pemohon" Font-Size="12px"></dx:ASPxLabel>           
    <div class="borderdetail">
       
        <table style="width:70%" class="tbllayout">
            <tr>
                <td style="width:20%">
                     <dx:ASPxLabel runat="server" ID="lblTotalPlafond" Text="Nama"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNamaLengkap" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel2" Text="Jenis Kelamin"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbJK" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel3" Text="Jenis Identitas"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbjenisIdentitas" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel4" Text="Nomor Identitas"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNomorIdentitas" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel5" Text="Tempat Lahir"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTempatLahir" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel6" Text="Tanggal Lahir"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="deTglLahir" Width="40%" Theme="Youthful" EditFormatString="dd/MM/yyyy"  DisplayFormatString="dd/MM/yyyy">
                    </dx:ASPxDateEdit>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel7" Text="Alamat "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtAlamat" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel8" Text="Kecamatan "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKecamatan" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel9" Text="Kota "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbKota" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel10" Text="Kode Pos "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKodePos" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel11" Text="Kepemilikan Rumah "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbKepemilikanRumah" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel12" Text="Telepon "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTelpon" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel13" Text="Handphone "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtHandphone" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel14" Text="E-mail "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtEmail" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel15" Text="Status Pernikahan "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbStatusPernikahaan" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel16" Text="Pendidikan Terakhir "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbPendidikanTerakhir" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel17" Text="Nama Ibu "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNamaIbu" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>

            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel18" Text="Nilai Pengajuan "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNilaiPengajuan" Width="100%" Theme="Youthful">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <%--<MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />--%>

        </table>
        </div>
        <br />
        <br /> 
    <div class="borderdetail">
        <table style="width:70%" class="tbllayout">
            <tr>
                <td style="width:20%">
                     <dx:ASPxLabel runat="server" ID="ASPxLabel19" Text="Sektor Usaha "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbSektorUsaha" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel20" Text="Jenis Debitur "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbJenisDebitur" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="ASPxLabel21" Text="Jenis Hibah "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbJenisHibah" Width="40%" Theme="Youthful">
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </table>
    </div>
        <br />
        <dx:ASPxButton runat="server" ID="btnSimpan" Text="Simpan" Theme="Youthful"></dx:ASPxButton>&nbsp
        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Cancel" NavigateUrl="~/Akuntansi/PencairanPK.aspx"></dx:ASPxHyperLink>
        <br />
        <br />
        <dx:ASPxLabel runat="server" ID="lblRepost" Text=""></dx:ASPxLabel>



    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
