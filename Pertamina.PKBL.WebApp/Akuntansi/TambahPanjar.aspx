<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TambahPanjar.aspx.cs" Inherits="Pertamina.PKBL.WebApp.TambahPanjar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../content/bootstrap.min.css" />
    <link rel="stylesheet" href="../content/datepicker3.css" />
    <script src="../scripts/jquery-1.10.1.min.js"></script>
    <script src="../scripts/bootstrap-datepicker.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#tbTgl').datepicker({ format: "dd/mm/yyyy", autoclose: true, todayHighlight: true, todayBtn: "linked" });
            $('#tbTglBerangkat').datepicker({ format: "dd/mm/yyyy", autoclose: true, todayHighlight: true, todayBtn: "linked" });
            $('#tbTglKembali').datepicker({ format: "dd/mm/yyyy", autoclose: true, todayHighlight: true, todayBtn: "linked" });

            $('#btSimpan').click(function () {
                if ($('#tbNoRef').val() == "") {
                    alert('Nomor Referensi Mohon Diisi');
                    return false;
                }
                else if ($('#tbNama').val() == "") {
                    alert('Nama Mohon Diisi.');
                    return false;
                }
            });
        });
    </script>
    <style type="text/css">
        td {
            padding: 4px;
        }

        table {
            border-spacing: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="panel panel-default">
        <div class="panel-body">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 15%;">Tanggal:</td>
                    <td>
                        <asp:TextBox ID="tbTgl" runat="server" Width="25%" ClientIDMode="Static" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">No. Referensi: <font color='red'>*</font></td>
                    <td>
                        <asp:TextBox ID="tbNoRef" runat="server" Width="25%" class="form-control" ClientIDMode="Static"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Nama : <font color='red'>*</font></td>
                    <td>
                        <asp:TextBox ID="tbNama" runat="server" Width="40%" class="form-control" ClientIDMode="Static"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">NIP : </td>
                    <td>
                        <asp:TextBox ID="tbNip" runat="server" Width="40%" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Jabatan :
                    </td>
                    <td>
                        <asp:TextBox ID="tbJabatan" runat="server" Width="25%" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Tujuan:</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="tbTujuan" runat="server" TextMode="multiline" Rows="5" Width="80%" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Keperluan:</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="tbKeperluan" runat="server" TextMode="multiline" Rows="5" Width="80%" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Nilai Panjar :
                    </td>
                    <td>
                        <asp:TextBox ID="tbNilPanjar" runat="server" Width="25%" class="form-control">0</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Untuk Program :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddProgram" runat="server" Width="50%" class="form-control"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Tanggal Berangkat :
                    </td>
                    <td>
                        <asp:TextBox ID="tbTglBerangkat" runat="server" Width="25%" ClientIDMode="Static" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Tanggal Kembali :
                    </td>
                    <td>
                        <asp:TextBox ID="tbTglKembali" runat="server" Width="25%" ClientIDMode="Static" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Transport Berangkat :
                    </td>
                    <td>
                        <asp:TextBox ID="tbTransBerangkat" runat="server" Width="25%" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Transport Kembali :
                    </td>
                    <td>
                        <asp:TextBox ID="tbTransKembali" runat="server" Width="25%" class="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">Dibuat Oleh :
                    </td>
                    <td>
                        <asp:TextBox ID="tbBuatan" runat="server" Width="25%" class="form-control"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <asp:Button ID="btSimpan" runat="server" Text="Simpan" CssClass="btn btn-info" ClientIDMode="Static" />
        <asp:Button ID="btBatal" runat="server" Text="Batal" CssClass="btn" />
    </div>
</asp:Content>
