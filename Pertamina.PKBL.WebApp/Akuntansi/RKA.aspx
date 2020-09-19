<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RKA.aspx.cs" Inherits="Pertamina.PKBL.WebApp.RKA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Rencana Kerja Anggaran</h2>
        
        <div id="tabsDiv" class="row">
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#tabRKA" aria-controls="rka" role="tab" data-toggle="tab">RKA</a></li>
                <li role="presentation"><a href="#tabProgn" aria-controls="akuntansi" role="tab" data-toggle="tab">Report Prognosa</a></li>
                <li role="presentation"><a href="#tabChart" aria-controls="bumn" role="tab" data-toggle="tab">Chart RKA</a></li>
                <li role="presentation"><a href="#tabAlok" aria-controls="piutang" role="tab" data-toggle="tab">Alokasi RKA</a></li>
            </ul>

            <div class="tab-content tab-content-shaded">
                <div role="tabpanel" class="tab-pane active" id="tabRKA">
                    <strong>Realisasi Sumber Dana RKA</strong>
                    <ol>
                        <li>
                            <a href="#" onclick="$('#tabsDiv').hide();setImg('<%=ResolveUrl("~/content/images/ss/akuntansi-rencanakerjaanggaran(aruskas).jpg") %>'); $('#imgDiv').show();">Arus Kas</a>
                        </li>
                        <li>
                            <a href="#" onclick="$('#tabsDiv').hide();setImg('<%=ResolveUrl("~/content/images/ss/akuntansi-rencanakerjaanggaran(aktifitas).jpg") %>'); $('#imgDiv').show();">Aktifitas</a>
                        </li>
                        <li>
                            <a href="#" onclick="$('#tabsDiv').hide();setImg('<%=ResolveUrl("~/content/images/ss/akuntansi-rencanakerjaanggaran(prognosaposisikeuangan).jpg") %>'); $('#imgDiv').show();">Posisi Keuangan</a>
                        </li>
                    </ol>
                    <br />
                    <strong>Prognosa Realisasi Dana Program Kemitraan &amp; Bina Lingkungan</strong>
                    <ol>
                        <li>
                            <a href="#">Prognosa Program Kemitraan</a>
                        </li>
                        <li>
                            <a href="#">Prognosa Bina Lingkungan</a>
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane" id="tabProgn">
                    <ol>
                        <li>
                            <a href="#" onclick="$('#tabsDiv').hide();setImg('<%=ResolveUrl("~/content/images/ss/akuntansi-rencanakerjaanggaran(rencanapenyaluransektorprogramkemitraanper3wulan).jpg") %>'); $('#imgDiv').show();">Rencana Penyaluran Sektor Program Kemitraan per-Triwulan</a>
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane" id="tabChart">
                    <ol>
                        <li>
                            <a href="#" onclick="$('#tabsDiv').hide();setImg('<%=ResolveUrl("~/content/images/ss/akuntansi-rencanakerjaanggaran(penyalurandanaprogramkemitraanperregion).jpg") %>'); $('#imgDiv').show();">Penyaluran Dana Program Kemitraan per-Region</a>
                        </li>
                    </ol>
                </div>
                <div role="tabpanel" class="tab-pane" id="tabAlok">
                    <div class="row">
                        <div class="col-md-4 form-group">
                            <label>Jenis Program</label>
                            <select id="cboProg" class="form-control">
                                <option value="1">Kemitraan</option>
                                <option value="2">Bina Lingkungan</option>
                                <%--<option value="4">Kemitraan &amp; Bina Lingkungan</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 form-group">
                            <label>Wilayah</label>
                            <select class="form-control">
                                <option>Banten</option>
                                <option>Jakarta Utara</option>
                                <option>DI Yogyakarta</option>
                            </select>
                        </div>
                    </div>
                    <button type="button" class="btn btn-info"
                        onclick="$('#tabsDiv').hide();if ($('#cboProg').val() == 1) { setImg('<%=ResolveUrl("~/content/images/ss/akuntansi-rencanakerjaanggaran(alokasiRKA-programkemintraan-banten).jpg") %>'); } else { setImg('<%=ResolveUrl("~/content/images/ss/akuntansi-rencanakerjaanggaran(alokasiRKA-binalin-banten).jpg") %>'); } $('#imgDiv').show();">
                        <i class="fa fa-play"></i> <span> Go</span>
                    </button>
                </div>
            </div>
        </div>

        <div id="imgDiv" class="row" hidden="hidden">
            <div class="col-md-10" style="overflow-x:scroll;">
                <img id="img01" src="<%=ResolveUrl("~/content/images/ss/.jpg") %>" />
            </div>
        </div>
        <hr />
        <div style="margin-top:30px;opacity:0.35;">
            <a href="#" onclick="$('#imgDiv').hide();$('#tabsDiv').show();">(list)</a>
        </div>
    </div>

    
    <script type="text/javascript">
        function initTab() {
            $('#tabRKA').tab();
            $('#tabProgn').tab();
            $('#tabChart').tab();
            $('#tabAlok').tab();
        }

        function setImg(src_) {
            document.getElementById('img01').src = src_;
        }
    </script>
</asp:Content>
