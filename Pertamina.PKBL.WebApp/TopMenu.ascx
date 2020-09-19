<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenu.ascx.cs" Inherits="Pertamina.PKBL.WebApp.TopMenu" %>

<div class="navbar-header">
    <a class="navbar-brand" href="<%=ResolveUrl("~/Default.aspx") %>">
        <img src="<%=this.ResolveUrl("~/content/images/logo.png")%>" height="42" style="margin-top:-16px;margin-bottom:0px;"/>
    </a>
</div>


<ul class="nav navbar-nav" >
    <!--li class="sidebar-search">
        <div class="input-group custom-search-form">
            <input type="text" class="form-control" placeholder="Search..." />
            <span class="input-group-btn">
                <button class="btn btn-default" type="button">
                    <i class="fa fa-search"></i>
                </button>
            </span>
        </div>
    </li-->
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <span>Admin</span><i class="caret"></i>
        </a>
        <ul class="dropdown-menu">
            <!--<li>
                <a href="<%=ResolveUrl("~/Administer/AnalisisData.aspx") %>">Analisis Data</a>
            </li>-->
            <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">PKBL</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=ResolveUrl("~/Administer/ProvinceIndex.aspx") %>">Propinsi</a>
                    </li>
                    <li>
                        <a href="<%=ResolveUrl("~/Administer/CityIndex.aspx") %>">Kota / Kabupaten</a>
                    </li>
                    <li>
                        <a href="<%=ResolveUrl("~/Administer/MasterKantorCabang.aspx") %>">Kantor Cabang</a>
                    </li>
                        <li>
                        <a href="<%=ResolveUrl("~/Kemitraan/MasterKreditKemitraan.aspx") %>">Jenis Kredit Kemitraan</a>
                    </li>
                        <li>
                        <a href="<%=ResolveUrl("~/Kemitraan/MasterSektorKemitraan.aspx") %>">Sektor Kemitraan</a>
                    </li>
                        <li>
                        <a href="<%=ResolveUrl("~/BinaLingk/MasterBL.aspx") %>">Jenis Bina Lingkungan</a>
                    </li>
                        <li>
                        <a href="<%=ResolveUrl("~/Administer/Verifikator.aspx") %>">Verifikator</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">Akuntansi</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=ResolveUrl("~/Akuntansi/AccIndex.aspx") %>">Nomer Akun | Perkiraan</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Administer/ClosingKolekti.aspx") %>">Closing Kolektibilitas</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Administer/ClosingMonth.aspx") %>">Closing Month</a>
            </li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <span>Program Kemitraan</span><i class="caret"></i>
        </a>
        <ul class="dropdown-menu">
            <li>
                <a href="<%=ResolveUrl("~/Kemitraan/PenerimaanProposal.aspx") %>">Penerimaan Proposal</a>
            </li>
            <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">Survey</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=ResolveUrl("~/Kemitraan/PenilaianSurvey.aspx") %>">Penilaian</a>
                    </li>
                        <li>
                        <a href="<%=ResolveUrl("~/Kemitraan/PersetujuanSurvey.aspx") %>">Persetujuan</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Kemitraan/RealisasiKemitraan.aspx") %>">Realisasi</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Kemitraan/JadwalPembayaran.aspx") %>">Jadwal Pembayaran</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Kemitraan/ReschedulePiutangKemitraan.aspx") %>">Reschedule Piutang</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Kemitraan/PerhitunganBungaPinjaman.aspx") %>">Perhitungan Bunga Pinjaman</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Kemitraan/SinergiBUMN.aspx") %>">Sinergi BUMN</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Kemitraan/MonitoringMitra.aspx") %>">Monitoring Mitra</a>
            </li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <span>Bina Lingkungan</span><i class="caret"></i>
        </a>
        <ul class="dropdown-menu">
            <li>
                <a href="<%=ResolveUrl("~/BinaLingk/PermohonanBL.aspx") %>">Permohonan</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/BinaLingk/PenilaianBL.aspx") %>">Penilaian</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/BinaLingk/PersetujuanBL.aspx") %>">Persetujuan</a>
            </li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Akuntansi<i class="caret"></i></a>
        <ul class="dropdown-menu">
            <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">Program Kemitraan</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=ResolveUrl("~/Akuntansi/PencairanProgramKemitraan.aspx") %>">Pencairan</a>
                    </li>
                    <li>
                        <a href="#">Pembayaran</a>
                    </li>
                    <li>
                        <a href="#">Kartu Piutang</a>
                    </li>
                    <li>
                        <a href="#">Diskon Jasa</a>
                    </li>
                    <li>
                        <a href="#">Pengembalian Kelebihan</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">Bina Lingkungan</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=ResolveUrl("~/Akuntansi/PenyaluranBL.aspx") %>">Penyaluran BL</a>
                    </li>
                    <li>
                        <a href="#">Penyaluran Hibah</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">Jurnal</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">Jurnal Transaksi Kas Bank</a>
                    </li>
                    <li>
                        <a href="#">Jurnal Umum</a>
                    </li>
                    <li>
                        <a href="#">Jurnal Adjusment</a>
                    </li>
                    <li>
                        <a href="#">Posting Jurnal</a>
                    </li>
                </ul>
            <li>
                <a href="<%=ResolveUrl("~/Akuntansi/TransferDanaBank.aspx") %>">Transfer Dana Bank</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Akuntansi/AktivaTetap.aspx") %>">Aktiva Tetap</a>
            </li>
           <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">Daftar Pengakuan</a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">Mitra Binaan Bermasalah</a>
                    </li>
                    <li>
                        <a href="#">Mitra Binaan Lunas</a>
                    </li>
                </ul>
            </li>
           <li class="dropdown-submenu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu" role="button" aria-haspopup="true" aria-expanded="false">Panjar<span class="fa arrow"></span></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<%=ResolveUrl("~/Akuntansi/TambahPanjar.aspx") %>">Tambah Panjar</a>
                    </li>
                    <li>
                        <a href="<%=ResolveUrl("~/Akuntansi/PanjarIndex.aspx") %>">Lihat Daftar Panjar</a>
                    </li>
                    <li>
                        <a href="<%=ResolveUrl("~/Akuntansi/PerwabPanjar.aspx") %>">Perwab Panjar</a>
                    </li>
                </ul>
            </li>
            <%--<li>
                <a href="<%=ResolveUrl("~/Akuntansi/RKA.aspx") %>">Rencana Kerja Anggaran</a>
            </li>--%>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <span>Reporting</span><i class="caret"></i>
        </a>
        <ul class="dropdown-menu">
            <li>
                <a href="<%=ResolveUrl("~/Reporting/RepKemitraan.aspx") %>"><i class="fa fa-bar-chart fa-fw"></i> Kemitraan</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Reporting/RepBinaLingk.aspx") %>"><i class="fa fa-bar-chart fa-fw"></i> Bina Lingkungan</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Reporting/RepAkuntansi.aspx") %>"><i class="fa fa-bar-chart fa-fw"></i> Akuntansi</a>
            </li>
            <%--<li>
                <a href="<%=ResolveUrl("~/Reporting/RepBUMN.aspx") %>"><i class="fa fa-bar-chart fa-fw"></i> BUMN</a>
            </li>
            <li>
                <a href="<%=ResolveUrl("~/Reporting/RepPenyisihanPiu.aspx") %>"><i class="fa fa-bar-chart fa-fw"></i> Penyisihan Piutang</a>
            </li>--%>
            <li>
                <a href="<%=ResolveUrl("~/Reporting/RepLain2.aspx") %>"><i class="fa fa-bar-chart fa-fw"></i> Lain-lain</a>
            </li>
        </ul>
    </li>
</ul>
<ul class="nav navbar-right">
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <strong>(USER NAME) </strong>
            <span class="badge"><i class="fa fa-user fa-fw"></i>1 / <i class="fa fa-question-circle fa-fw"></i>3</span>
        </a>
        <ul class="dropdown-menu ">
            <li>
                <a href="<%=ResolveUrl("~/Account/MyProfile.aspx") %>"><i class="fa fa-gear fa-fw"></i> Ubah Profil</a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="<%=ResolveUrl("~/Account/Login.aspx") %>"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </li>
        </ul>
    </li>
</ul>