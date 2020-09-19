<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AktivaTetap.aspx.cs" Inherits="Pertamina.PKBL.WebApp.AktivaTetap" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../content/jquery-ui.css" />
    <link rel="stylesheet" href="../content/bootstrap.min.css" />
    <link rel="stylesheet" href="../content/datepicker3.css" />
    <script src="../scripts/jquery-1.12.4.js"></script>
    <script src="../scripts/jquery-ui.js"></script>
    <script src="../scripts/bootstrap-datepicker.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#tbTglOleh').datepicker({ format: "dd/mm/yyyy", autoclose: true, todayHighlight: true, todayBtn: "linked" });
            $('#tbTglBeli').datepicker({ format: "dd/mm/yyyy", autoclose: true, todayHighlight: true, todayBtn: "linked" });
        });
        $(function () {
            $("#tabs").tabs({
                event: "mouseover"
            });
        });
    </script>
    <style type="text/css">        
        td {
            padding: 4px;
        }

        table {
            border-spacing: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Aktiva Tetap</h2>
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">List</a></li>
                <li><a href="#tabs-2">Tambah</a></li>
            </ul>
            <div id="tabs-1">
                <asp:Panel ID="PanelList" runat="server">
                    <dx:ASPxGridView ID="gvPenyaluran" runat="server" AutoGenerateColumns="False" Theme="Youthful"
                        Width="100%" KeyFieldName="id" OnRowCommand="gvPenyaluran_RowCommand">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Kode" VisibleIndex="1" FieldName="form_number" Name="form_number"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Nama" FieldName="requestor_name" Name="requestor_name" VisibleIndex="2" ReadOnly="true"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Nama Instansi" FieldName="requestor_company" Name="requestor_company" VisibleIndex="3" ReadOnly="true"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Alamat" FieldName="requestor_address" Name="requestor_address" VisibleIndex="4" ReadOnly="true"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataDateColumn Caption="Tanggal" FieldName="approval_result_date" Name="approval_result_date" VisibleIndex="5" ReadOnly="true"></dx:GridViewDataDateColumn>

                            <dx:GridViewDataTextColumn Caption="Nilai Disetujui (RP)" FieldName="granted_amount" Name="granted_amount" VisibleIndex="6" CellStyle-HorizontalAlign="Right"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Nilai Realisasi" FieldName="nilaiRealisasi" VisibleIndex="12" ReadOnly="true" CellStyle-HorizontalAlign="Right"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Cabang" Name="branch_name" FieldName="branch_name" VisibleIndex="14"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="User Log" FieldName="userLog" VisibleIndex="15"></dx:GridViewDataTextColumn>

                            <dx:GridViewDataColumn Caption="Detail" VisibleIndex="13" CellStyle-HorizontalAlign="Center">
                                <DataItemTemplate>
                                    <asp:ImageButton ID="lnkEditTransaction" runat="server" ImageUrl='<%# (Eval("nilaiRealisasi").ToString() == "0") ? "../content/images/new.png" : "../content/images/edit.png"  %>'
                                        CommandArgument='<%#Eval("form_number") %>' CommandName="Detail" />
                                </DataItemTemplate>
                            </dx:GridViewDataColumn>
                        </Columns>
                        <SettingsDataSecurity AllowDelete="False" />
                        <SettingsPager AlwaysShowPager="True">
                        </SettingsPager>
                        <Styles>
                            <CommandColumn Spacing="5px" />
                            <EditingErrorRow HorizontalAlign="Right">
                            </EditingErrorRow>
                        </Styles>
                        <StylesPager>
                            <CurrentPageNumber BackColor="#FB000C">
                            </CurrentPageNumber>
                        </StylesPager>
                    </dx:ASPxGridView>
                </asp:Panel>
                <asp:Panel ID="PanelEditList" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Jenis Aktiva : " CssClass="label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                    <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Inventaris dan Peralatan" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Pilih Cabang : "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddKantorCabang" runat="server" class="form-control">
                                    <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="KANTOR PUSAT" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btPilih2" runat="server" Text="Pilih" class="btn btn-info" OnClick="btPilih2_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel><br/>
                <asp:Panel ID="PanelEditDetail" runat="server" Visible="false" >
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 15%;">Kode Aset: <font color='red'>*</font></td>
                                    <td>
                                        <asp:TextBox ID="tkKodeAset" runat="server" Width="25%" ReadOnly="true" class="form-control" ClientIDMode="Static"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Nama Aset: <font color='red'>*</font></td>
                                    <td>
                                        <asp:TextBox ID="tbNamaAset" runat="server" Width="25%" class="form-control"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Metode Penyusutan: <font color='red'>*</font></td>
                                    <td>
                                        <asp:DropDownList ID="ddMethodSusut" runat="server" class="form-control" Width="35%">
                                            <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Metode Garis Lurus (Straight Line Method)" Value="1"></asp:ListItem>
                                        </asp:DropDownList><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Tarif Penyusutan: <font color='red'>*</font></td>
                                    <td>
                                        <asp:TextBox ID="tbTarifSusut" runat="server" Width="10%" class="form-control"></asp:TextBox> %
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Masa Manfaat: <font color='red'>*</font></td>
                                    <td>
                                        <asp:TextBox ID="tbMasaManfaat" runat="server" Width="10%" class="form-control" ReadOnly="true"></asp:TextBox> Tahun<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Penyusutan Awal: <font color='red'>*</font></td>
                                    <td>
                                        <asp:DropDownList ID="ddSusutAwal" runat="server" class="form-control" Width="20%">
                                            <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Bulan Sekarang" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                        Disusutkan di bulan pertama atau di bulan berikutnya?<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Harga Perolehan: <font color='red'>*</font></td>
                                    <td>
                                        <asp:TextBox ID="tbHargaOleh" runat="server" Width="25%" class="form-control"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Tgl. Perolehan: </td>
                                    <td>
                                        <asp:TextBox ID="tbTglOleh" runat="server" Width="20%" class="form-control" ClientIDMode="Static"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">Tgl. Pembelian: </td>
                                    <td>
                                        <asp:TextBox ID="tbTglBeli" runat="server" Width="20%" class="form-control" ClientIDMode="Static"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">No Akun Kas/Bank: <font color='red'>*</font></td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" Width="20%">
                                            <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                        </asp:DropDownList><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">No COA Aset: <font color='red'>*</font></td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList4" runat="server" class="form-control" Width="20%">
                                            <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                        </asp:DropDownList><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">No COA Akumulasi: <font color='red'>*</font></td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList5" runat="server" class="form-control" Width="20%">
                                            <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                        </asp:DropDownList><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">No COA Beban: <font color='red'>*</font></td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList6" runat="server" class="form-control" Width="20%">
                                            <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                        </asp:DropDownList><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%;">
                                        <asp:CheckBox ID="cbJurnal" runat="server" Text="Akan Dijurnal" /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btSimpan" runat="server" Text="Simpan" class="btn btn-info" ClientIDMode="Static" />
                                        <asp:Button ID="btBatal" runat="server" Text="Batal" class="btn btn-link" OnClick="btBatal_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div id="tabs-2">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="tbCari" runat="server" Text="Jenis Aktiva : "></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddJenisAktiva" runat="server" class="form-control">
                                <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Inventaris dan Peralatan" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Pilih Cabang : "></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddCabang" runat="server" class="form-control">
                                <asp:ListItem Enabled="true" Text="- Semua Kategori -" Value="0"></asp:ListItem>
                                <asp:ListItem Text="KANTOR PUSAT" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btPilih" runat="server" Text="Pilih" class="btn btn-info" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-10" style="overflow-x: scroll;">
                <img id="img01" src="<%=ResolveUrl("~/content/images/ss/akuntansi-aktivatetap.jpg") %>" />
            </div>
        </div>
        <hr />
        <div style="margin-top: 30px; opacity: 0.35;">
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/akuntansi-aktivatetap-tambah.jpg") %>'">(add)</a>
            <span>| </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/akuntansi-aktivatetap-tambah(pilih).jpg") %>'">(add &rArr; pilih)</a>
            <span>| </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/akuntansi-aktivatetap(edit).jpg") %>'">(list &rArr; edit)</a>
            <span>| </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/akuntansi-aktivatetap(edit-pilih).jpg") %>'">(list &rArr; edit &rArr; pilih)</a>
            <span>| </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/akuntansi-aktivatetap.jpg") %>'">(list)</a>
        </div>
    </div>
</asp:Content>
