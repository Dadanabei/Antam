<%@ Page Title="" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%=ResolveUrl("~/content/login.css") %>" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login-wrapper">
         <h2 class="text-center text-primary">
            <span class="header-cap-up">P</span>ROGRAM <span class="header-cap-up">K</span>EMITRAAN &amp; <span class="header-cap-up">B</span>INA <span class="header-cap-up">L</span>INGKUNGAN
        </h2>
        <div class="row">
            <img src="<%=ResolveUrl("~/content/images/bg01.jpg") %>" height="130" style="width:100%;" />
        </div>
        <div class="row">
            <p style="padding:5px 10px;text-align:justify;">Sebagai salah satu perusahaan BUMN terbesar di Indonesia, Pertamina memiliki dua tanggung jawab besar. Pertama untuk meningkatkan profit dalam rangka meningkatkan kesejahteraan negara, sedangkan yang kedua adalah melaksanakan tanggung jawab sosial dan lingkungan. Peran dan tanggung jawab sosial Pertamina dilaksanakan salah satunya melalui SME & SR (Small Medium Enterprise & Social Responsibility) Partnership Program atau lebih dikenal dengan sebutan PKBL (Program Kemitraan dan Bina Lingkungan), sebagaimana yang diatur dalam Permen-05/MBU/2007 tentang Program Kemitraan Badan Usaha Milik Negara dengan Usaha Kecil dan Program Bina Lingkungan.</p>
        </div>
        <div class="row"><strong class="text-info" style="padding:2px 10px;">Anda sudah terdaftar? Silahkan <a href="<%=ResolveUrl("~/Account/Login.aspx") %>" >LOGIN disini <i class="glyphicon glyphicon-arrow-left"></i></a></strong></div>
        <hr />
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-info"><div class="panel-body infodetails-container">
                    <p>Program Kemitraan ditujukan untuk meningkatkan kemampuan usaha kecil mitra binaan Pertamina agar menjadi tangguh dan mandiri sekaligus memberikan multiplier effect bagi peningkatan kesejahteraan masyarakat sekitar wilayah operasi Pertamina. Hal tersebut diharapkan akan dapat mendukung kegiatan usaha Pertamina maupun mitra bisnis. Sedangkan Program Bina Lingkungan adalah program pemberdayaan kondisi sosial masyarakat di sekitar wilayah operasi Pertamina melalui pemanfaatan dana dari bagian laba BUMN dan bersifat hibah.</p>
                    <p>Semangat Pertamina dalam melaksanakan PKBL merupakan bentuk komitmen tanggung jawab sosial perusahaan kepada masyarakat. PKBL telah dilaksanakan Pertamina sejak tahun 1993, dimana setiap tahunnya terjadi peningkatan jumlah penyaluran dana untuk program ini. Terdapat banyak mitra binaan PKBL Pertamina yang telah mandiri dan tangguh, dimana hal tersebut dapat dibuktikan dengan pesatnya perkembangan usaha mereka. Saat ini mereka telah melakukan aktivitas pemasaran tidak hanya menjangkau pasar dalam negeri tetapi juga hingga merambah ke luar negeri</p>
                    <p>Keberhasilan PKBL dalam mengelola para mitra binaan juga terlihat dengan berbagai penghargaan yang diperoleh. Penghargaan yang didapat untuk Program Kemitraan antara lain adalah Gelar Karya PKBL BUMN Award 2011, sebagai The Best Executive Citra Awards dalam kegiatan tingkat Asean Programme Consultant Indonesia Consortium.</p>
                    <p>Hal ini menunjukkan bahwa keseriusan dan eksistensi PKBL telah diakui secara luas. Dengan memanfaatkan seluruh sektor, PKBL menghasilkan mitra binaan yang unggul dan sukses sehingga mampu memberikan hasil maksimal dan membuat masyarakat menjadi lebih kreatif dalam memenuhi kebutuhannya. Lebih dari itu mereka juga mampu untuk menghasilkan produk atau jasa yang bermanfaat bagi masyarakat luas.</p>
                </div></div>
            </div>
            <div class="col-md-4">
                <div>
                    <div class="panel panel-info">
                        <div class="panel-heading" style="font-size:120%">
                            <i class="fa fa-chain"></i> <span> Program Kemitraan</span>
                        </div>
                        <div class="panel-body">
                            <span>Sejak melaksanakan Program Kemitraan dari tahun 1993 hingga tahun 2011, Pertamina telah melakukan...</span> 
                            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#dlgKemitraan">(baca lebih lanjut) <i class="fa fa-eye"></i></button>
                        </div>
                    </div>

                    <div class="panel panel-info">
                        <div class="panel-heading" style="font-size:120%">
                            <i class="fa fa-graduation-cap"></i> <span> Program Bina Lingkungan</span>
                        </div>
                        <div class="panel-body">
                            <span>Program Bina Lingkungan Pertamina dilaksanakan sejak tahun 2004. Program ini ditujukan untuk...</span>
                            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#dlgBinaLi">(baca lebih lanjut) <i class="fa fa-eye"></i></button>
                        </div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading" style="font-size:120%"><i class="fa fa-bullhorn"></i> <span> Press Release</span></div>
                        <ul class="list-group">
                            <li class="list-group-item text-right">
                                <p class="smalldate">23 Feb 2016</p>
                                <span>Tahun 2015, Realisasi Investasi Pertamina Capai US$3,62 miliar</span>
                                <a target="_blank" href="http://www.pertamina.com/news-room/siaran-pers/tahun-2015,-realisasi-investasi-pertamina-capai-us$3,62-miliar/">(selengkapnya) <i class="fa fa-external-link"></i></a>
                            </li>
                            <li class="list-group-item">
                                <p class="smalldate">22 feb 2016</p>
                                <span>Uji Pasar Pertalite Gorontalo Penjualan Mencapai 2500 Liter per hari</span>
                                <a target="_blank" href="http://www.pertamina.com/news-room/siaran-pers/uji-pasar-pertalite-gorontalo-penjualan-mencapai-2500-liter-per-hari/">(selengkapnya) <i class="fa fa-external-link"></i></a>
                            </li>
                            <li class="list-group-item">
                                <p class="smalldate">17 feb 2016</p>
                                <span>Pertamina Pastikan Takaran BBM di SPBU Akurat</span>
                                <a target="_blank" href="http://www.pertamina.com/news-room/siaran-pers/pertamina-pastikan-takaran-bbm-di-spbu-akurat/">(selengkapnya) <i class="fa fa-external-link"></i></a>
                            </li>
                            <li class="list-group-item text-center">
                                <a target="_blank" href="http://www.pertamina.com/news-room/siaran-pers/" class="btn btn-default">Lihat Semua...</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="dlgBinaLi" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">PROGRAM BINA LINGKUNGAN</h4>
          </div>
          <div class="modal-body">
            <p>Program Bina Lingkungan Pertamina dilaksanakan sejak tahun 2004. Program ini ditujukan untuk memberikan bantuan kepada masyarakat di sekitar wilayah operasi Perusahaan. Cakupan kegiatan Program Bina Lingkungan meliputi pemberian bantuan untuk bencana alam, bantuan pendidikan dan pelatihan, bantuan prasarana umum, bantuan kesehatan masyarakat, bantuan sarana ibadah serta bantuan pelestarian alam.</p>
            <p>Dalam menjalankan program Bina Lingkungan ini, PKBL Pertamina juga melakukan kerja sama dengan lembaga-lembaga lain seperti KPDT (Kementerian Pembangunan Daerah Tertinggal), Perguruan Tinggi, Organisasi-organisasi, Anak Perusahaan dan Konsultan. Program-program yang dilaksanakan melalui kerja sama diantaranya adalah Pelatihan Guru dengan TEQIP (Teacher Quality Improvement Program), Bedah Desa Mandiri Pertamina yang dibuka di Desa Klamono dan Salawati Sorong, Program Deteksi Dini Kanker Serviks, Bhakti Sosial dan MP3D (Mitra Pertamina Penggerak Pembangunan Desa), Program Beasiswa Khusus dan sebagainya.</p>
            <p>Di samping program-program tersebut terdapat program bantuan, yang pelaksanaannya didasarkan pada instruksi Kementerian BUMN, yang dinamakan dengan Bantuan BUMN Peduli. Bantuan Bina Lingkungan telah memberikan kontribusi besar bagi peningkatan kehidupan masyarakat serta kemajuan dalam bidang pendidikan. Selain itu program Bina Lingkungan juga telah menunjukkan keberadaannya dalam bidang kesehatan, keagamaan, prasarana umum dan pelestarian alam, serta bantuan bencana alam.</p>
            <p>Realisasi penyaluran dana program Bina Lingkungan selama tahun 2011 mencapai lebih kurang Rp 125 miliar atau mencapai 43% dari anggaran yang disediakan sebesar Rp 294 miliar. Penyaluran tersebut terdiri dari:</p>
            <ul>
                <li>Penyaluran Bina Lingkungan Sendiri sebesar Rp 110,3 miliar atau sebesar 53,5% dari anggaran yang seharusnya disalurkan sebesar Rp 206 miliar.</li>
                <li>Penyaluran Bina Lingkungan BUMN Peduli mencapai sebesar Rp 14,7 miliar, atau 16,7% dari anggaran yang seharusnya disalurkan sebesar Rp 88 miliar.</li>
            </ul>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div id="dlgKemitraan" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">PROGRAM KEMITRAAN</h4>
          </div>
          <div class="modal-body">
            <p>Sejak melaksanakan Program Kemitraan dari tahun 1993 hingga tahun 2011, Pertamina telah melakukan pembinaan kepada lebih kurang 96.000 mitra binaan usaha kecil dengan total nilai pinjaman mencapai kurang lebih Rp 2,046 triliun. Berdasarkan RUPS PKBL 2011, dari anggaran PKBL untuk dana Program Kemitraan tahun 2011 sebesar Rp 326 miliar, telah terealisasi sebesar Rp 348 miliar atau mencapai 106,76%. Selama periode 1 Januari hingga 31 Desember 2011 PKBL Pertamina berhasil menambah sebanyak lebih kurang 23.000 mitra binaan. Dana pinjaman yang disalurkan selama tahun 2011 tersebut tersebar ke beberapa daerah di Indonesia dan mencakup beberapa sektor.</p>
            <p>Program penyaluran Program Kemitraan tidak hanya meliputi penyaluran sendiri kepada perorangan (sistem kluster atau pun dalam bentuk kelompok), tetapi juga melalui kerja sama (sinergi) dengan beberapa BUMN diantaranya, PT Sang Hyang Sri (SHS), PT Perkebunan Nusantara X (Persero), PT Perkebunan Nusantara XIII (Persero), PT Pertani (Persero) dan PT Garam (Persero). Hal ini dilakukan dalam rangka membantu meningkatkan kesejahteraan masyarakat khususnya para petani yang memiliki potensi cukup bagus untuk dapat dikembangkan.</p>
            <p>Selain penyaluran dana untuk Program Kemitraan, Pertamina juga menyalurkan dana untuk Pembinaan. Realisasi penyaluran dana hibah (Pembinaan) dalam tahun 2011 adalah sebesar Rp 21,042 miliar, atau mencapai 80,93% dari anggaran untuk program tersebut sebesar Rp 26 miliar. Beberapa program pembinaan yang dilakukan diantaranya turut serta dalam berbagai kegiatan, seperti pameran tingkat nasional maupun internasional untuk memperkenalkan produk-produk mitra binaan, pelatihan seperti seminar kewirausahaan, workshop mengenai ekspor impor dan kegiatan-kegiatan lainnya.</p>
            <br />
            <strong>KINERJA PROGRAM KEMITRAAN 2011</strong>
            <p>Tingkat Kinerja Program Kemitraan Pertamina tahun 2011 berdasarkan SK.Meneg BUMN No. KEP-100/MBU/2002 tanggal 4 Juni 2002 adalah berdasarkan:</p>
            <ol>
                <li>Efektivitas penyaluran; dan</li>
                <li>Perhitungan tingkat pengembalian pinjaman (kolektibilitas).</li>
            </ol>
            <p>Efektivitas penyaluran tahun 2011 adalah sebesar 91,67%, dimana angka tersebut mengalami peningkatan dibandingkan tahun 2010 sebesar 90,05%. Adapun peningkatan ini terjadi karena jumlah dana yang disalurkan tepat sasaran dan sesuai dengan perencanaan. Untuk perhitungan tingkat pengembalian pinjaman tahun 2011 mencapai sebesar 76,61%, meningkat dibanding tahun 2010 sebesar 73,52%. Sesuai SK Meneg BUMN No. KEP-100/MBU/2002 tanggal 4 Juni 2002, kedua kinerja di atas mendapatkan skor 3 (tiga), yang merupakan kategori skor tertinggi.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</asp:Content>
