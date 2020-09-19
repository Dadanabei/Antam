<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataUsaha.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.PenerimaanPropsalControl.DataUsaha" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<div class="bodydetail">
<div class="borderdetail">
<table>
    <tr>
        <td style="width:10%">
            <dx:ASPxLabel ID="lblBidangUsaha" runat="server" Text="Bidang Usaha" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtBidangUsaha" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel ID="lblNamaPerusahaan" runat="server" Text="Nama Perusahaan *" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNamaPerusahaan" runat="server" Width="45%" Theme="Youthful" ValidationSettings-RequiredField-IsRequired="true"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblNamaPimpinan" runat="server" Text="Nama Pimpinan" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNamaPimpinan" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblAlamatUsaha" runat="server" Text="Alamat Usaha *" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtalamatUsaha" runat="server" Width="45%" Theme="Youthful" ValidationSettings-RequiredField-IsRequired="true"></dx:ASPxTextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="alamat perusahaan tidak boleh kosong.." ForeColor="Red" ControlToValidate="txtalamatUsaha" Display="Dynamic" ValidationGroup="dataUsaha"></asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblKota" runat="server" Text="Kota *" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxComboBox ID="cbbKota" runat="server" ValueField="company_city_id"  Theme="Youthful">  
                <ValidationSettings RequiredField-IsRequired="true" ValidationGroup="dataUsaha"></ValidationSettings>
            </dx:ASPxComboBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblKodePos" runat="server" Text="Kode Pos" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtKodePos" runat="server" Width="20%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblNoHp" runat="server" Text="No. Hp" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNoHp" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblNoTelp" runat="server" Text="No. Telp" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNoTelp" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblNoFax" runat="server" Text="No. Fax" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtNoFax" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblEmail" runat="server" Text="Email" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtEmail" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ValidationGroup="dataUsaha"></asp:RegularExpressionValidator>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblLahanUsaha" runat="server" Text="Lahan Tempat Usaha *" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxComboBox ID="cbbLahanUsaha" ValueField="company_owns_workplace" runat="server" Theme="Youthful">
                <ValidationSettings RequiredField-IsRequired="true" ValidationGroup="dataUsaha"></ValidationSettings>                
            </dx:ASPxComboBox>

        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblTglAkhirSewa" runat="server" Text="Tanggal Akhir Sewa" Theme="Youthful" ></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxDateEdit ID="deTglAkhirSewa" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblAktifMulaiUSaha" runat="server" Text="Aktif Mulai Usaha" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtAktifMulaiUsaha" runat="server" Width="30%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblJumlahTenagaKerja" runat="server" Text="Jumlah Tenaga Kerja" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="txtJumlahTenagaKerja" runat="server" Theme="Youthful" DisplayFormatString="##,#.00">
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="orang" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                </tr>
            </table>
        </td>
        
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblPermohonanJumlahGaji" runat="server" Text="Permohonan Modal Gaji" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtPermohonanJumlahGaji" runat="server" Width="45%" Theme="Youthful">
                <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
            </dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblInvestasi" runat="server" Text="Investasi" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtInvestasi" runat="server" Width="45%" Theme="Youthful">
                <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
            </dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblOmzet" runat="server" Text="Omzet Per Bulan" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtOmzet" runat="server" Width="45%" Theme="Youthful">
                <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
            </dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblUnit" runat="server" Text="Unit" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtUnit" runat="server" Width="45%" Theme="Youthful">
                <MaskSettings Mask="&lt;0..9999g&gt;" IncludeLiterals="None" ShowHints="false" />
            </dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblAdmPembukuan" runat="server" Text="Adm. Pembukuan" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxComboBox ID="cbbAdmPembukuan" ClientIDMode="Static" ValueField="has_journal_administration" runat="server" Theme="Youthful" ClientSideEvents-SelectedIndexChanged="function() {
        var v = $('#cbbAdmPembukuan').val();
        if (v == 'true') {
            $('#lblBerupa').hide();
        }
        else {
            $('#lblBerupa').show();
        }
    }" onchange="changeAdm()"></dx:ASPxComboBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblBerupa" runat="server" Text="Berupa" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtBerupa" ClientIDMode="Static" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblPinjamanPihakLain" runat="server" Text="Kewajiban Pinjaman di Pihak Lain" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxComboBox ID="cbbPinjaman" ValueField="has_other_loan" runat="server" Theme="Youthful"></dx:ASPxComboBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblBankBUMN" runat="server" Text="Bank / BUMN" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtBankBUMN" runat="server" Width="45%" Theme="Youthful"></dx:ASPxTextBox>
        </td>
    </tr>

    <tr>
        <td>
            <dx:ASPxLabel ID="lblBesarnya" runat="server" Text="Besarnya" Theme="Youthful"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxTextBox ID="txtBesarnya" runat="server" Width="45%" Theme="Youthful">
                <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
            </dx:ASPxTextBox>
        </td>
    </tr>
</table>
</div>
    <br />
<dx:ASPxButton ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  Theme="Youthful" ValidationGroup="dataUsaha"></dx:ASPxButton>
</div>