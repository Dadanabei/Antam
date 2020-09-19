<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProposalPrint.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.ProposalPrint" %>

<!DOCTYPE html>
<link type="text/css" rel="stylesheet" media="all" href="../content/print.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <hr class="print-hr" />
        <div class="print-submitted"></div>
        <div class="print-created"></div>
        <div class="print-content">
            <table style="width: 100%">
                <tr>
                    <td>
                        <img src="../content/images/logo.png" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div align="center"><b>PT Pertamina (Persero)<br />
                            Data Mitra Program Kemitraan</b></div>
                    </td>
                </tr>
            </table>
            <br />
            <table style="width: 100%" border="1">
                <tr>
                    <td colspan="2"><strong>Data Pemohon</strong> </td>
                </tr>
                <tr>
                    <td style="width:50%">Nama Lengkap </td>
                    <td><%=requestor_name %></td>
                </tr>
                <tr>
                    <td>Jenis Identitas </td>
                    <td><%=jenisIdentitas %></td>
                </tr>
                <tr>
                    <td>Nomor Identitas </td>
                    <td><%=identification_number %></td>
                </tr>
                <tr>
                    <td>Tempat Lahir </td>
                    <td><%=birthplace %></td>
                </tr>
                <tr>
                    <td>Tanggal Lahir </td>
                    <td><%=birthdate %></td>
                </tr>
                <tr>
                    <td>Nama Ibu </td>
                    <td><%=requestor_parent_name %></td>
                </tr>
                <tr>
                    <td>Sektor Usaha </td>
                    <td><%=sector_id%></td>
                </tr>
                <tr>
                    <td>Badan Usaha </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Nilai Pengajuan </td>
                    <td><%=requested_amount %></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Data Pribadi</strong> </td>

                </tr>
                <tr>
                    <td>Alamat Rumah </td>
                    <td><%=requestor_address %></td>
                </tr>
                <tr>
                    <td>Kecamatan</td>
                    <td><%=kecamatan %></td>
                </tr>
                <tr>
                    <td>Kota</td>
                    <td><%=city_name %></td>
                </tr>
                <tr>
                    <td>Kode Pos </td>
                    <td><%=postal_code %></td>
                </tr>
                <tr>
                    <td>Kepemilikan Rumah </td>
                    <td><%=homeStatus %></td>
                </tr>
                <tr>
                    <td>Telepon</td>
                    <td><%=telepon %></td>
                </tr>
                <tr>
                    <td>Handphone</td>
                    <td><%=requestor_phone2 %></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><%=requestor_email %></td>
                </tr>
                <tr>
                    <td>Status Pernikahan </td>
                    <td><%=maritalStatus %></td>
                </tr>
                <tr>
                    <td>Pendidikan Terakhir </td>
                    <td><%=edulvl %></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Data Usaha</strong> </td>

                </tr>
                <tr>
                    <td>Bidang Usaha </td>
                    <td><%=company_sector_detail %></td>
                </tr>
                <tr>
                    <td>Nama Perusahaan </td>
                    <td><%=company_name %></td>
                </tr>
                <tr>
                    <td>Nama Pimpinan </td>
                    <td><%=company_ceo %></td>
                </tr>
                <tr>
                    <td>Alamat Usaha </td>
                    <td><%=company_address %></td>
                </tr>
                <tr>
                    <td>Kota</td>
                    <td><%=usahakota%></td>
                </tr>
                <tr>
                    <td>Kode Pos </td>
                    <td><%=company_postal %></td>
                </tr>
                <tr>
                    <td>No Telp </td>
                    <td><%=company_phone1 %></td>
                </tr>
                <tr>
                    <td>No HP </td>
                    <td><%=company_phone2 %></td>
                </tr>
                <tr>
                    <td>No Fax </td>
                    <td><%=company_fax %></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=company_email%></td>
                </tr>
                <tr>
                    <td>Lahan Tempat Usaha </td>
                    <td><%=lahanUsaha %></td>
                </tr>
                <tr>
                    <td>Tanggal Akhir Sewa </td>
                    <td><%=company_workplace_end_rent %></td>
                </tr>
                <tr>
                    <td>Aktif Mulai Usaha </td>
                    <td><%=company_active_since %></td>
                </tr>
                <tr>
                    <td>Jml. Tenaga Kerja </td>
                    <td><%=company_workforce %></td>
                </tr>
                <tr>
                    <td>Permohonan Modal Kerja </td>
                    <td><%=working_capital %></td>
                </tr>
                <tr>
                    <td>Investasi</td>
                    <td><%=company_investment %></td>
                </tr>
                <tr>
                    <td>Omset per Bulan </td>
                    <td><%=monthly_revenue %></td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td><%=company_unit %></td>
                </tr>
                <tr>
                    <td>Adm. Pembukuan </td>
                    <td><%=pembukuan %></td>
                </tr>
                <tr>
                    <td>Berupa</td>
                    <td><%=journal_administration %></td>
                </tr>
                <tr>
                    <td>Kewajiban di Pihak Lain </td>
                    <td><%=hutang_lain %></td>
                </tr>
                <tr>
                    <td>Bank / BUMN </td>
                    <td><%=other_loan_at %></td>
                </tr>
                <tr>
                    <td>Besarnya</td>
                    <td><%=other_loan_amount %></td>
                </tr>
            </table>
        </div>

        <div class="print-taxonomy"></div>
        <div class="print-footer"></div>
        <hr class="print-hr" />
    </form>
    <script type="text/javascript">
        window.print();
    </script>
</body>

</html>
