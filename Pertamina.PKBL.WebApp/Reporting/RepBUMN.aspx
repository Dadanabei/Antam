<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepBUMN.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepBUMN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
     <div id="page-wrapper">
        <h2 class="page-header">Laporan BUMN</h2>
        
        <div class="row">
            <div class="col-md-6">
                <ul style="list-style-type:none;">
                    <li>
                        <span>1.</span>
                        <a href="#">Variabel utama pelaksanaan PKBL</a>
                    </li>
                    <li>
                        <span>2.</span>
                        <a href="#">Realisasi Akumulasi Penyaluran Dana Bina Lingkungan - Berdasarkan Bantuan yg Disalurkan</a>
                    </li>
                    <li>
                        <span>3.</span>
                        <a href="#">Realisasi Akumulasi Penyaluran Dana Bina Lingkungan - Berdasarkan Propinsi</a>
                    </li>
                    <li>
                        <span>4.</span>
                        <a href="#">Realisasi Akumulasi Penyaluran Program Kemitraan - Berdasarkan Sektor Usaha Mitra Binaan</a>
                    </li>
                    <li>
                        <span>5.</span>
                        <a href="#">Realisasi Akumulasi Penyaluran Program Kemitraan - Berdasarkan Propinsi</a>
                    </li>
                     <li>
                        <span>6.</span>
                        <a href="#">Realisasi Penyaluran Dana Bina Lingkungan - Berdasarkan Bantuan yg Disalurkan</a>
                    </li>
                    <li>
                        <span>7.</span>
                        <a href="#">Realisasi Penyaluran Dana Bina Lingkungan - Berdasarkan Propinsi</a>
                    </li>
                    <li>
                        <span>8.</span>
                        <a href="#">Realisasi Penyaluran Program Kemitraan - Berdasarkan Sektor Usaha Mitra Binaan</a>
                    </li>
                    <li>
                        <span>9.</span>
                        <a href="#">Realisasi Penyaluran Program Kemitraan - Berdasarkan Propinsi</a>
                    </li>
                    <li>
                        <span>10.</span>
                        <a href="#">Posisi Piutang Program Kemitraan - Berdasarkan Propinsi</a>
                    </li>
                    <li>
                        <span>11A.</span>
                        <a href="#">Posisi Piutang Program Kemitraan - Berdasarkan Propinsi</a>
                    </li>
                    <li>
                        <span>11.</span>
                        <a href="#">Posisi Piutang Program Kemitraan - Berdasarkan Sektor &amp; Kualitas Piutang</a>
                    </li>
                    <li>
                        <span>12.</span>
                        <a href="#">Posisi Piutang Bermasalah Program Kemitraan - Berdasarkan Propinsi</a>
                    </li>
                    <li>
                        <span>13.</span>
                        <a href="#">Posisi Piutang Bermasalah Program Kemitraan - Berdasarkan Sektor</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <ul style="list-style-type:none;"">
                    <li>
                        <span>3.1</span>
                        <a href="#">Laporan Kas &amp; Setara Kas</a>
                    </li>
                    <li>
                        <span>3.2</span>
                        <a href="#">Laporan Piutang Penyisihan Laba Kepada BUMN Pembina</a>
                    </li>
                    <li>
                        <span>3.3</span>
                        <a href="#">Laporan Piutang Kepada BUMN Pembina/Lembaga Penyalur</a>
                    </li>
                    <li>
                        <span>3.8A</span>
                        <a href="#">Laporan Beban Penyisihan Piutang</a>
                    </li>
                    <li>
                        <span>3.8B</span>
                        <a href="#">Laporan Penyisihan Piutang Pinjaman Mitra Binaan</a>
                    </li>
                    <li>
                        <span>3.8C</span>
                        <a href="#">Laporan Penyisihan Piutang Sewa Beli Syariah</a>
                    </li>
                    <li>
                        <span>3.8D</span>
                        <a href="#">Laporan Penyisihan Piutang Pinjaman Khusus</a>
                    </li>
                    <li>
                        <span>3.9</span>
                        <a href="#">Laporan Piutang Lain-lain</a>
                    </li>
                    <li>
                        <span>3.10</span>
                        <a href="#">Laporan Investasi</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
         <div class="col-md-6">
            <ul style="list-style-type:none;"">
                <li>
                    <span>3.11</span>
                    <a href="#">Laporan Beban Dibayar di Muka</a>
                </li>
                <li>
                    <span>3.16</span>
                    <a href="#">Laporan Biaya yang Masih Harus Dibayar</a>
                </li>
                <li>
                    <span>3.15</span>
                    <a href="#">Laporan Hutang Jangka Pendek</a>
                </li>
                <li>
                    <span>3.17</span>
                    <a href="#">Laporan Hutang Pajak</a>
                </li>
                <li>
                    <span>3.18</span>
                    <a href="#">Laporan Bagian Lancar Hutang Jangka Panjang Kepada BUMN Pembina Lain</a>
                </li>
                <li>
                    <span>3.19</span>
                    <a href="#">Laporan Bagian Lancar Hutang Jangka Panjang</a>
                </li>
            </ul>
        </div>
        </div>
        <div class="row">
        <div class="col-md-6">
            <ul style="list-style-type:none;"">
                <li>
                    <span>3.20</span>
                    <a href="#">Laporan Kelebihan Pembayaran Angsuran</a>
                </li>
                <li>
                    <span>3.21</span>
                    <a href="#">Laporan Angsuran Belum Teridentifikasi</a>
                </li>
                <li>
                    <span>3.22</span>
                    <a href="#">Laporan Hutang Jangka Pendek Lainnya</a>
                </li>
                <li>
                    <span>3.23</span>
                    <a href="#">Laporan Hutang Sewa Guna Usaha</a>
                </li>
                <li>
                    <span>3.24</span>
                    <a href="#">Laporan Hutang Jangka Panjang Kepada BUMN Pembina Lain</a>
                </li>
                <li>
                    <span>3.25</span>
                    <a href="#">Laporan Hutang Jangka Panjang Lainnya</a>
                </li>
                <li>
                    <span>3.26A</span>
                    <a href="#">Laporan Aktiva Bersih</a>
                </li>
                <li>
                    <span>3.26B</span>
                    <a href="#">Laporan Mutasi Aktiva Bersih Terikat</a>
                </li>
                <li>
                    <span>3.27</span>
                    <a href="#">Laporan Penerimaan Pelimpahan Dana dari PKBL Lain</a>
                </li>
                <li>
                    <span>3.28</span>
                    <a href="#">Laporan Sumbangan</a>
                </li>
                <li>
                    <span>3.29</span>
                    <a href="#">Laporan Penggantian Beban Operasional</a>
                </li>
            </ul>
        </div>
        </div>
        <div class="row">
        <div class="col-md-6">
            <ul style="list-style-type:none;"">
                <li>
                    <span>3.30</span>
                    <a href="#">Laporan Rincian Pendapatan Unit PKBL</a>
                </li>
                <li>
                    <span>3.31A</span>
                    <a href="#">Laporan Pendapatan Bunga - Program Kemitraan</a>
                </li>
                <li>
                    <span>3.31B</span>
                    <a href="#">Laporan Pendapatan Bunga - Program Bina Lingkungan</a>
                </li>
                <li>
                    <span>3.32</span>
                    <a href="#">Laporan Pendapatan Lain-lain</a>
                </li>
                <li>
                    <span>3.33</span>
                    <a href="#">Laporan Dana Pembinaan Kemitraan</a>
                </li>
                <li>
                    <span>3.35</span>
                    <a href="#">Laporan Dana Penyaluran - Bina Lingkungan</a>
                </li>
                <li>
                    <span>3.36</span>
                    <a href="#">Laporan Pelimpahan Dana Kepada Unit PKBL Lain</a>
                </li>
                <li>
                    <span>3.37</span>
                    <a href="#">Laporan Beban Pemeliharaan</a>
                </li>
                <li>
                    <span>3.38</span>
                    <a href="#">Laporan Beban Sewa</a>
                </li>
                <li>
                    <span>3.39</span>
                    <a href="#">Laporan Beban Penyusutan Aktiva Tetap</a>
                </li>
            </ul>
        </div>
        </div>
        <div class="row">
        <div class="col-md-6">
            <ul style="list-style-type:none;"">
                <li>
                    <span>3.40</span>
                    <a href="#">Laporan Beban Pajak</a>
                </li>
                <li>
                    <span>3.41</span>
                    <a href="#">Laporan Keuntungan (Kerugian) Penjualan/Penghapusan Aktiva Tetap</a>
                </li>
                <li>
                    <span>3.42</span>
                    <a href="#">Laporan Beban &amp; Pengeluaran Lainnya</a>
                </li>
                <li>
                    <span>3.43</span>
                    <a href="#">Laporan Pendapatan Luar Biasa</a>
                </li>
                <li>
                    <span>3.44</span>
                    <a href="#">Laporan Beban Luar Biasa</a>
                </li>
            </ul>
        </div>
        </div>
        
        <p style="padding-top:16px; border-top: dotted 1px #ccc;">
            <a href="#">Daftar Aktiva Tetap &amp; Penyusutan Unit PKBL</a>
        </p>
    </div>
</asp:Content>
