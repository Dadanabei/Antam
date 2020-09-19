<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuratPerjanjianPinjaman.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.SuratPerjanjianPinjaman" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .center{
            text-align:center
        }
        .justify {
            text-align:justify;
            margin-left:50px
        }
        .justhei {
            height:40px;
            text-align:justify;
        }
        .witop {
            width:40px;
            vertical-align:top;
        }
        .borderdetail {
        border:solid 1px;
        border-color:#c3c3c3;
        border-radius:2px;
        padding:20px 10px 20px 10px;
        }
        

    </style>
</head>
<body>
    <dx:ASPxLabel runat="server" ID="lblDate"></dx:ASPxLabel>
    <br />
    <br />
    <br />
    <div>
        <hr />      
        <h3 class="center"><u>SURAT PERJANJIAN PINJAMAN UANG</u><br/>
            Nomor : <% = ViewState["NoRealisasi"] %>
        </h3>    
    </div>
    <div>
        <p>Pada hari ini …………… tanggal&nbsp; <% = ViewState["TglRealisasi"]%>&nbsp; bulan&nbsp; <% = ViewState["BulanRealisasi"] %>&nbsp; tahun &nbsp; <% = ViewState["ThnRealisasi"] %>&nbsp; ( <% = ViewState["DateRealisasi"] %>)&nbsp;, yang bertandatangan di bawah ini  :</p>
    </div>
    <div style="width:100%">
        I <br />
        <p class="justify">
             PT PERTAMINA (PERSERO), perseroan yang didirikan berdasarkan Akta No 20 tanggal&nbsp;  <% = ViewState["TglRealisasi"] %>
            , dibuat dihadapan &nbsp; Lenny Janis Ishak, SH,Notaris di Jakarta, yang telah mendapat pengesahan dari
            Menteri Kehakiman dan Hak Asasi Manusia Republik Indonesia No. C­24025 HT.01.01.TH.2003 tanggal 9 Oktober
            2003, yang Anggaran Dasarnya terakhir diubah dengan Akta Nomor 04 tanggal 11 Juli 2007, dibuat dihadapan
            Notaris yang sama, yang persetujuan terakhir atas perubahan Anggaran Dasarnya sesuai keputusan Menteri
            Hukum dan HAM Nomor W7­00189 HT.01.04­TH.2007 tanggal 8 Januari 2007 berkedudukan dan berkantor pusat di
            Jakarta, dalam hal ini diwakili oleh <b> <% = ViewState["NamaPic"] %></b> , selaku Coordinator PKBL / CSR & SME Partnership
            Program PT. PERTAMINA (PERSERO)<%=ViewState["Region"] %>, berdasarkan Surat Keputusan Director Finance Nomor
            Kpts.P­225/K10010/2010­S8 tanggal 31 December 2010, beralamat di <%= ViewState["alamatregion"] %> , dengan
            demikian bertindak untuk dan atas nama perseroan tersebut diatas, selanjutnya dalam Perjanjian ini disebut
            <b>PIHAK PERTAMA</b>.
        </p>
        <br />
        II<br />
        <p class="justify">
             <% = ViewState["NamaUsaha"] %> &nbsp; yang beralamat di  <% = ViewState["AlamatUsaha"] %>&nbsp; dalam hal ini diwakili oleh &nbsp; <% = ViewState["NamaRequestor"] %> &nbsp; Kartu Tanda Penduduk (KTP) No  <% = ViewState["NoRequestor"] %>. yang
            berlaku sampai dengan tanggal 03 Oktober 2016 dan beralamat di &nbsp;  <% = ViewState["AlamatRequestor"] %>,
            selanjutnya dalam Surat Perjanjian ini disebut <b>PIHAK KEDUA</b>.
        </p>
    
        <p class="justify">
            <b>PIHAK KEDUA</b> memperoleh persetujuan dari  <% = ViewState["NamaPenjamin"] %> , yaitu nama menandatangani Surat Perjanjian ini sebagai bukti persetujuan
            (bagi yang telah menikah).
        </p>
        <br />
      <p>Sebelumnya kedua belah pihak menerangkan sebagai berikut :</p> 
        <br />
         <table>
             <tr>
                 <td style="width:40px">
                     1.
                 </td>
                 <td style="height:40px">
                     <p>
                         Bahwa <b>PIHAK KEDUA</b> dalam kaitannya dengan pengembangan usahanya telah mengajukan permohonan pinjaman uang
                         kepada <b>PIHAK PERTAMA</b>.
                     </p>
                 </td>
             </tr>
             <tr>
                 
                <td style="vertical-align:top"> 
                     2.                           
                 </td>
                 <td style="height:40px">
                     <p>
                          Bahwa <b>PIHAK PERTAMA</b> selaku Badan Usaha Milik Negara, berdasarkan Peraturan Menteri Negara Badan Usaha Milik Negara
                         Nomor PER­05/MBU/2007 tanggal 27 April 2007, diwajibkan untuk melaksanakan Program Kemitraan untuk meningkatkan
                         kemampuan Usaha Kecil agar menjadi tangguh dan mandiri.
                     </p>
                 </td>
             </tr>
              <tr>
                 
                <td style="vertical-align:top"> 
                     3.                           
                 </td>
                 <td style="height:40px">
                     <p>
                          Bahwa <b>PIHAK PERTAMA</b> berdasar Surat Keputusan Direktur Keuangan No.A­001/H00600/2008­S0 tanggal 01 April 2008
                          tentang Pedoman Pengelolaan PKBL.
                     </p>
                 </td>
             </tr>
         </table>
        <p>
            Berdasarkan hal­hal tersebut di atas, kedua belah pihak sepakat dan setuju untuk saling mengikatkan diri ke dalam suatu Surat
            Perjanjian Pinjaman Uang ( Perjanjian Kredit ) dengan ketentuan dan syarat­syarat sebagaimana diuraikan dalam pasal-­pasal
            di bawah ini :

        </p>
    </div>
    <br />
    <div>
        <h3 class="center"><b>PASAL 1</b></h3>
        <h3 class="center"><b>MAKSUD DAN TUJUAN</b></h3>  
        <p>
             Pemberian pinjaman uang oleh <b>PIHAK PERTAMA</b> kepada <b><b>PIHAK KEDUA</b></b> semata­mata hanya dimaksud untuk pengembangan
             usaha  <% = ViewState["NamaUsaha"] %>.
        </p>
        <br />
        <br />
        <h3 class="center"><b>PASAL 2</b></h3>
        <h3 class="center"><b>JUMLAH PINJAMAN, JASA ADMINISTRASI, DAN TATACARA PENCAIRAN</b></h3>
        <table>
            <tr>
                <td style="width:40px">
                    1.
                </td>
                <td style="height:40px"  class="justify">
                    <b>PIHAK PERTAMA</b> menyerahkan pinjaman uang kepada <b>PIHAK KEDUA</b>  sebesar<b>  <% = ViewState["NilaiSetuju"] %> (<% = ViewState["TerbilangNilaiSetuju"] %> rupiah)</b>
                </td>
            </tr>
            <tr>
                <td style="width:40px;vertical-align:top">
                    2.
                </td>
                <td style="height:40px" class="justify">
                   <b>PIHAK PERTAMA</b>  akan menyerahkan kepada <b>PIHAK KEDUA</b> seluruh pinjaman uang sebagaimana tersebut dalam ayat (1)
                    pasal ini secara langsung melalui transfer ke rekening <b>PIHAK KEDUA</b> di Bank  <% = ViewState["NamaBank"] %> nomor  <% = ViewState["NomorRekening"] %> untuk dan atas nama<b>PIHAK KEDUA</b>
                    setelah Surat Perjanjian ini ditandatangani oleh Kedua belah pihak.
                </td>
            </tr>
             <tr>
                <td style="width:40px;vertical-align:top">
                    3.
                </td>
                <td style="height:40px"  class="justify">
                   <b>PIHAK KEDUA</b> diwajibkan membayar jasa administrasi atas pinjaman tersebut dalam ayat (1) pasal ini
                   kepada <b>PIHAK PERTAMA</b> sebesar <b> <% = ViewState["Bunga"] %> % (<%=ViewState["TerbilangBunga"]%> persen)</b>  pertahun dengan sistem perhitungan jasa adiminstrasi Flat,
                   yang diperhitungkan sejak tanggal pengiriman jumlah pinjaman uang yang ditransfer tersebut sampai dengan tanggal
                   pelunasan seluruh pinjaman uang dimaksud sesuai Lampiran I yang tidak terpisahkan dari surat perjanjian ini.
                </td>
            </tr>
        </table>
           <br />
         <h3 class="center"><b>PASAL 3</b></h3>
        <h3 class="center"><b>JANGKA WAKTU PINJAMAN</b></h3>
        <table>
            <tr>
                <td class="witop">
                    1.
                </td>
                <td class="justhei">
                    Jangka waktu pinjaman uang dimaksud adalah selama <b> <% = ViewState["Jangka"] %>  (<% = ViewState["TerbilangJangka"] %>)</b>  bulan terhitung mulai tanggal transfer
                    pinjaman uang dimaksud dari <b>PIHAK PERTAMA</b>  kepada <b>PIHAK KEDUA</b>  sampai dengan jatuh tempo termasuk masa tenggang
                    waktu pembayaran angsuran pokok pinjaman (grace period) selama <b><%=ViewState["Grace"] %> </b><% = ViewState["TerbilangGrace"] %> bulan.
                </td>
            </tr>
            <tr>
                <td class="witop">
                    2.
                </td>
                <td class="justhei">
                   Apabila <b>PIHAK KEDUA</b> melunasi pinjaman sebelum jatuh tempo, maka <b>PIHAK KEDUA</b> hanya membayar sisa pokok pinjaman
                   saja ditambah Jasa Administrasi sampai dengan saat pelunasan.
                </td>
            </tr>
        </table>
           <br />
         <h3 class="center"><b>PASAL 4</b></h3>
        <h3 class="center"><b>PEMBAYARAN ANGSURAN</b></h3>
        <table>
            <tr>
                <td class="witop">           
                </td>
                <td class="justify">
                    Pokok pinjaman yang diterima oleh <b>PIHAK KEDUA</b> dari <b>PIHAK PERTAMA</b>  akan dikembalikan oleh <b>PIHAK KEDUA</b>  berikut
                    jasa administrasinya secara mengangsur sebanyak <b><%=ViewState["Jangka"] %> (<%=ViewState["TerbilangJangka"] %> )</b>  kali termasuk masa tenggang waktu pembayaran
                    angsuran pokok pinjaman ( grace period ) sesuai dengan Jadwal Pengembalian Pinjaman Pokok dan Jasa Administrasi
                    sebagaimana diatur dalam Lampiran I yang merupakan bagian tidak terpisahkan dari Surat Perjanjian ini kepada Rekening
                    <b>PIHAK PERTAMA</b> pada Bank Mandiri – KK JKT PERTAMINA UPDN III Nomor Rekening : 123­00­9301586­7 atas nama PT
                    PERTAMINA (PERSERO) – UPMS III JKT – PELK atau BRI Cabang Jakarta Kramat Nomor Rekening : 0335­01­00108230­5 atas
                    nama PKBL PT PERTAMINA (PERSERO) REGION III.
                </td>
            </tr>
        </table>
           <br />
        <h3 class="center"><b>PASAL 5</b></h3>
        <h3 class="center"><b>HAK DAN KEWAJIBAN <b>PIHAK PERTAMA</b></b></h3>
        <table>
            <tr>
                <td class="witop">
                    1.
                </td>
                <td class="justhei">
                    <b>PIHAK PERTAMA</b> berhak untuk sewaktu­-waktu mengawasi dan memeriksa pembukuan dan kegiatan usaha <b>PIHAK KEDUA</b>
                    sehubungan dengan pemberian pinjaman uang sebagaimana dimaksud oleh Pasal 2 Surat Perjanjian ini.
                </td>

            </tr>
            <tr>
                <td class="witop">
                    2.
                </td>
                <td class="justhei">
                   <b>PIHAK PERTAMA</b> berhak untuk melakukan pembinaan kepada <b>PIHAK KEDUA</b> sesuai kebutuhan untuk pengembangan dan
                   peningkatan kegiatan usaha.
                </td>

            </tr>
        </table>
           <br />
         <h3 class="center"><b>PASAL 6</b></h3>
        <h3 class="center"><b>HAK DAN KEWAJIBAN PIHAK KEDUA</b></h3>
         <table>
            <tr>
                <td class="witop">
                    1.
                </td>
                <td class="justhei">
                   <b>PIHAK KEDUA</b> harus mempergunakan pinjaman uang dimaksud semata­mata sesuai dengan maksud dan tujuan
                    sebagaimana dimaksud Pasal 1 Surat Perjanjian ini.
                </td>

            </tr>
            <tr>
                <td class="witop">
                    2.
                </td>
                <td class="justhei">
                  <b>PIHAK KEDUA</b>  berkewajiban untuk membuat laporan berkala mengenai penggunaan pinjaman uang yang
                   diperoleh dari <b><b>PIHAK PERTAMA</b></b> dan kemajuan usaha yang telah dicapai atas pinjaman uang dimaksud.
                </td>

            </tr>
              <tr>
                <td class="witop">
                    3.
                </td>
                <td class="justhei">
                  <b>PIHAK KEDUA</b>wajib menyelenggarakan pembukuan atas usahanya berdasarkan prinsip­prinsip akuntansi yang lazim
                  berlaku.
                </td>

            </tr>
              <tr>
                <td class="witop">
                    4.
                </td>
                <td class="justhei">
                 <b>PIHAK KEDUA</b> tidak diperkenankan mengalihkan pinjaman uang dimaksud kepada Pihak Ketiga dan / atau mengalihkan
                 seluruh atau sebagian hak dan kewajiban yang timbul berdasarkan Surat Perjanjian ini kepada Pihak Ketiga, tanpa persetujuan
                 tertulis <b>PIHAK PERTAMA</b>.
                </td>

            </tr>
             <tr>
                <td class="witop">
                    5.
                </td>
                <td class="justhei" style="vertical-align:top">
                  <b>PIHAK KEDUA</b> wajib mengasuransikan dirinya senilai pinjaman awal dalam jangka waktu disesuaikan dengan jangka waktu
                  pinjaman.
                </td>

            </tr>
        </table>
           <br />
         <h3 class="center"><b>PASAL 7</b></h3>
        <h3 class="center"><b>PEMUTUSAN PERJANJIAN</b></h3>
        <p>Kedua belah pihak sepakat untuk mengesampingkan berlakunya ketentuan Pasal 1266 Kitab Undang­-Undang Hukum Perdata ( KUH
            Perdata ).
        </p>
        <table>
            <tr>
                <td class="witop">
                    1.
                </td>
                <td class="justhei">
                    <b>PIHAK PERTAMA</b> berhak secara sepihak memutuskan Perjanjian ini dengan pemberitahuan secara tertulis sebelumnya
                    selambat­lambatnya 7 (tujuh) hari kalender dalam hal <b>PIHAK KEDUA</b>tidak melaksanakan ketentuan­ketentuan yang
                    tercantum dalam pasal 6 Surat Perjanjian ini
                </td>
            </tr>
             <tr>
                <td class="witop">
                    2.
                </td>
                <td class="justhei">
                   Dalam hal terjadi pemutusan perjanjian secara sepihak oleh <b>PIHAK PERTAMA</b></b> sebagaimana dimaksud Pasal 7.1 di atas,
                   maka <b>PIHAK KEDUA</b> berkewajiban untuk mengembalikan seluruh uang pinjaman berikut bunga yang telah diterima dari
                   <b>PIHAK PERTAMA</b> selambat­lambatnya dalam jangka waktu 30 (tiga puluh) hari kalender terhitung mulai tanggal diterimanya
                   surat pemberitahuan pemutusan perjanjian dimaksud oleh <b>PIHAK KEDUA</b>.
                </td>
            </tr>
             <tr>
                <td class="witop">
                    3.
                </td>
                <td class="justhei">
                  Apabila <b>PIHAK KEDUA</b> tidak melakukan pengembalian seperti tersebut dalam pasal 7.2 , <b>PIHAK PERTAMA</b> berhak untuk
                  mencairkan agunan sebagai pengganti pelunasan hutang dan sisanya akan dikembalikan kepada <b>PIHAK KEDUA</b>.
                </td>
            </tr>
        </table>
           <br />
        <h3 class="center"><b>PASAL 8</b></h3>
        <h3 class="center"><b>JAMINAN</b></h3>
        <table>
            <tr>
                <td class="witop">
                    1.
                </td>
                <td class="justhei">
                   Jaminan yang diagunkan adalah merupakan harta kepemilikan yang syah dari <b>PIHAK KEDUA</b> , atau harta yang dikuasakan
                   kepada <b>PIHAK KEDUA</b>untuk diagunkan dan tidak dalam agunan kepada pihak manapun.
                </td>
            </tr>
            <tr>
                <td class="witop">
                    2.
                </td>
                <td class="justhei">
                    <b>PIHAK KEDUA</b> memberikan kewenangan penuh kepada <b><b>PIHAK PERTAMA</b></b>  untuk menjual dan atau memindah tangankan
                    kepada orang lain yang kemudian diperhitungkan guna pelunasan pinjaman uang / kredit kepada <b><b>PIHAK PERTAMA</b></b> apabila
                    <b><b><b>PIHAK KEDUA</b></b></b> tidak melaksanakan pelunasan pinjaman pada tanggal jatuh tempo.
                </td>
            </tr>
            <tr>
                <td class="witop">
                    3.
                </td>
                <td class="justhei">
                  <b> <b><b>PIHAK KEDUA</b></b></b> diwajibkan membuat Surat Pengakuan Hutang.
                </td>
            </tr>
            <tr>
                <td class="witop">
                    4.
                </td>
                <td class="justhei">
                   Atas pinjaman yang diberikan <b><b>PIHAK PERTAMA</b></b>, <b><b><b>PIHAK KEDUA</b></b></b> memberikan Jaminan berupa  <% = ViewState["Agunan"] %> atas nama  <% = ViewState["NamaPenjamin"] %>.
                </td>
            </tr>
            <tr>
                <td class="witop">
                    5.
                </td>
                <td class="justhei">
                   Jaminan tersebut akan dikembalikan oleh <b><b>PIHAK PERTAMA</b></b> kepada <b><b><b>PIHAK KEDUA</b></b></b> setelah <b>PIHAK KEDUA</b> memenuhi
                   seluruh kewajibannya sebagaimana diatur dalam Surat Perjanjian ini.
                </td>
            </tr>
            <tr>
                <td class="witop">
                    6.
                </td>
                <td class="justhei">
                   <b><b>PIHAK KEDUA</b></b> menerangkan dengan ini memberi kuasa dengan hak subsitusi kepada <b>PIHAK PERTAMA</b>, kuasa mana
                   merupakan bagian yang tidak dapat dipisahkan dari Perjanjian Pinjaman Uang yang dimaksud diatas yang tidak akan dibuat
                   tanpa adanya kuasa ini dan kuasa mana tidak akan berakhir karena sebab­sebab yang tercantum dalam pasal 1813 Kitab
                   Undang­Undang Hukum Perdata Indonesia :
                </td>
            </tr>          
        </table>
        <table style="width:90%;margin-left:50px">
            <tr>
                <td style="width:15%;vertical-align:top">
                    PERTAMA :
                </td>
                <td style="width:75%;text-align:justify" >
                    Untuk dan atas nama  <% = ViewState["NamaPenjamin"] %> guna menjamin lebih jauh dan pasti pembayaran sebagaimana
                    mestinya  menurut Perjanjian yang dimaksud diatas dan segala sesuatu yang atas kekuatan perjanjian
                    tersebut atau perubahannya di kemudian hari harus dibayar oleh <b>PIHAK KEDUA</b> kepada PIHAK
                    PERTAMA, baik karena Pokok Pinjaman yang dititipkan atau karena biaya penagihan dan
                    ongkos atau biaya lainnya yang karena apapun juga, maka <b>PIHAK KEDUA</b> menerangkan
                    dengan ini memberi kuasa kepada <b>PIHAK PERTAMA</b>, dengan hak untuk menyerahkan
                    kekuasaan ini kepada pihak lain dan menarik kembali pemindahan kekuasaan tersebut,
                    kekuasaan mana tidak dapat ditarik kembali dan tidak akan berakhir karena sebab­sebab/
                    dasar­dasar yang tercantum dalam undang­undang/hukum untuk mengakhiri suatu kuasa
                    selama Perjanjian Pinjaman Uang ini berlaku, karena kekuasaan ini merupakan bagian yang
                    tidak dapat dipisahkan dari Perjanjian Pinjaman Uang ini, yang tidak akan dibuat jika kekuasaan
                    ini dapat dihapuskan;
                   
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top">
                    KEDUA :
                </td>
                <td style="text-align:justify" >
                    Untuk menerima Kuasa Membebankan Hak Tanggungan itu dengan Perjanjian­perjanjian yang
                    diatas ini untuk dan atas nama <b>PIHAK PERTAMA</b>, dan untuk proses Kuasa Membebankan Hak
                    Tanggungan itu akan dilakukan dengan perjanjian tersendiri, guna memberi keterangan,
                    menanda tangani akta­akta dihadapan PPAT.
                </td>
            </tr>
        </table>
        <br />
         <h3 class="center"><b>PASAL 9</b></h3>
        <h3 class="center"><b>PENYELESAIAN PERSELISIHAN</b></h3>
             <p class="center">Apabila terjadi perselisihan dalam pelaksanaan perjanjian ini, pada dasarnya akan diselesaikan secara musyawarah</p>
        <br />
        <h3 class="center"><b>PASAL 10</b></h3>
        <h3 class="center"><b>TUNTUTAN / KLAIM</b></h3>   
         <p style="margin-left:50px;text-align:justify">
             <b>PIHAK KEDUA</b> membebaskan <b>PIHAK PERTAMA</b> dari segala macam tuntutan atau klaim berupa apapun juga, baik yang
            datang dari rekanan <b>PIHAK KEDUA</b> dan atau pihak manapun juga yang berhubungan dengan pelaksanaan perjanjian ini,
            termasuk tuntutan dan / atau klaim yang timbul dari para tenaga kerja <b>PIHAK KEDUA</b>.
         </p>
           <br />
        <h3 class="center"><b>PASAL 11</b></h3>
        <h3 class="center"><b>KEADAAN KAHAR ( FORCE MAJEURE )</b></h3> 
        <table>
             <tr>
                <td class="witop">
                   1 .
                </td>
                <td class="justhei" >
                    <b>PIHAK PERTAMA</b> dan <b>PIHAK KEDUA</b> masing­masing dibebaskan dari tanggung jawab atas suatu kelambatan atau kegagalan
                    dari pelaksanaan kewajiban berdasarkan Surat Perjanjian ini yang disebabkan oleh keadaan / kejadian atau hal­hal lain yang
                    berada di luar kekuasaan yang wajar Pihak yang bersangkutan, yang lazimnya disebut Kahar ( Force Majeure).
               </td>
            </tr>
             <tr>
                <td class="witop">
                    2 .
                </td>
                <td class="justhei" >
                    Yang dimaksud dengan keadaan Kahar (Force Majeure) menurut perjanjian ini antara lain adalah gempa bumi, banjir, epidemi,
                    pemogokan, perang, perang saudara, huru­hara, blokade, perselisihan perburuhan, penutupan pabrik, karantina dan peraturanperaturan
                    yang dikeluarkan oleh Instansi Pemerintah yang berwenang langsung serta bersangkutan dengan pelaksanaan
                    perjanjian ini.
                </td>
            </tr>
             <tr>
                <td class="witop">
                    3 .
                </td>
                <td class="justhei" >
                    Dalam hal terjadi Kahar (Force Majeure), <b>PIHAK KEDUA</b> Pihak yang terkena Kahar (Force Majeure) berkewajiban untuk
                    memberitahukan kepada <b>PIHAK PERTAMA</b> secara tertulis selambat­lambatnya dalam waktu 3 x 24 Jam dengan disertai
                    dokumen kejadian Kahar (Force Majeure) yang di Syahkan oleh Pejabat yang terkait
                </td>
            </tr>
             <tr>
                <td class="witop">
                    4 .
                </td>
                <td class="justhei" >
                   Atas pemberitahuan Pihak yang terkena Kahar (Force Majeure) tersebut Pihak lainnya akan menyetujui atau menolak secara
                   tertulis keadaan Kahar (Force Majeure) tersebut dalam jangka waktu selambat­lambatnya 7 x 24 jam sejak pemberitahuan
                   tersebut diterima oleh Pihak lainnya.
                </td>
            </tr>
             <tr>
                <td class="witop">
                    5 .
                </td>
                <td class="justhei" >
                    Bilamana keadaan Kahar (Force Majeure) tersebut ditolak oleh <b>PIHAK PERTAMA</b> Lainnya, maka <b>PIHAK KEDUA</b> yang terkena
                    Force Majeure tersebut berkewajiban untuk meneruskan pelaksanaan perjanjian sesuai dengan syarat­syarat dan ketentuan
                    Surat Perjanjian ini, dan atau dilakukan penjadwalan kembali ( Rescheduling ) sesuai dengan pertimbangan PIHAK
                    PERTAMA.
                </td>
            </tr>
        </table>
           <br />
         <h3 class="center"><b>PASAL 12</b></h3>
        <h3 class="center"><b>BIAYA PAJAK, PUNGUTAN DAN LAINNYA</b></h3> 
        <p style="margin-left:50px">
            Semua biaya Notaris, Asuransi Jiwa, Pajak­Pajak, Pungutan­Pungutan, Iuran, Retribusi yang timbul sehubungan dengan
            perjanjian peminjaman uang ini, sepenuhnya menjadi beban dan tanggung jawab <b>PIHAK KEDUA</b>.
        </p>
           <br />
        <h3 class="center"><b>PASAL 13</b></h3>
        <h3 class="center"><b>SURAT KETERANGAN PENDUKUNG</b></h3> 
        <p style="margin-left:50px">
            Hal­hal terlampir yang menerangkan adanya keterkaitan dengan Surat Perjanjian ini adalah merupakan satu kesatuan secara
            utuh yang tak terpisahkan dari surat perjanjian ini.
        </p>
           <br />
         <h3 class="center"><b>PASAL 14</b></h3>
        <h3 class="center"><b>MENINGGAL DUNIA ATAU DIBAWAH PEMGAMPUNAN <br/>ATAU TERJADI PENRGANTIAN KETUA</b></h3> 
        <p style="margin-left:50px">
            Jika <b>PIHAK KEDUA</b> meninggal dunia atau dibawah pengampuan, maka Perjanjian dianggap putus dan sisa pinjaman yang
        masih ada berikut bunganya ditanggung oleh Asuransi. Untuk itu Ahli Waris berkewajiban memberitahukan secara tertulis
        kepada <b>PIHAK PERTAMA</b> selambat ­ lambatnya 7 (tujuh) hari kalender.
        </p>
           <br />
       <h3 class="center"><b>PASAL 15</b></h3>
        <h3 class="center">DOMISILI</h3> 
        <p style="margin-left:50px">
            Kedua belah pihak sepakat untuk memilih tempat domisili yang tetap dan tidak berubah di kantor Panitera Pengadilan Negeri
            Jakarta Pusat.
        </p>
           <br />
        <h3 class="center"><b>PASAL 16</b></h3>
        <h3 class="center">LAIN-LAIN</h3> 
        <p style="margin-left:50px">
            Hal­hal lain yang belum cukup diatur dalam Surat Perjanjian ini, akan diatur kemudian dan dituangkan dalam Addendum atas
            Surat Perjanjian ini
        </p>
           <br />
        <h3 class="center"><b>DEMIKIANLAH PERJANJIAN INI</b></h3>
        <p style="margin-left:50px">
            Dibuat dalam rangkap 2 (dua), dan ditandatangani oleh Kedua Belah Pihak pada hari dan tanggal sebagaimana tersebut
            diawal Perjanjian ini, di atas meterai yang cukup untuk itu, dan mempunyai kekuatan hukum yang sama.
        </p>
    </div>
    <p style="margin-left:50px">Dilangsungkan dengan tanpa perubahan</p>
    <table style="margin-left:90px;width:74%" >
        <tr>
            <td style="height:80px;vertical-align:top;width:37%;text-align:center">
                <b>PIHAK PERTAMA</b>
            </td>
            <td style="vertical-align:top;width:37%;text-align:center">
                <b>PIHAK KEDUA</b>
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top;width:37%;text-align:center">
                 <% = ViewState["NamaPic"] %>
            </td>
            <td style="vertical-align:top;width:37%;text-align:center">
                 <% = ViewState["NamaRequestor"] %>
            </td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:center"> 
                Menyetujui:<br />
                Suami/Istri/Orangtua/Anak
                 <% = ViewState["NamaPenjamin"] %>
            </td>
            
        </tr>
    </table>
    <br />
    <div class="borderdetail">
        <hr />
        <h3 class="center">KWITANSI</h3>
        <table style="width:80%;margin-left:90px;align-self:center">
            <tr>
                <td style="width:25%">
                   <i> Telah terima dari</i>
                </td>
                <td>
                    :
                </td>

                <td>
                    SME & SR Partnership Program ­ PT PERTAMINA (PERSERO)
                </td>
            </tr>
            <tr>
                <td>
                   <i> Uang Sebanyak</i>
                </td>
                <td style="vertical-align:top">
                    :
                </td>

                <td>
                    <u style="border-bottom:1px outset double;"><%=ViewState["NilaiSetuju"] %> </u>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top">
                   <i> Guna Membayar</i>
                </td>
                <td style="vertical-align:top">
                    :
                </td>

                <td style="height:70px;vertical-align:top">
                    <u style="border-bottom:1px outset double;"> <% = ViewState["Kegunaan"] %></u>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top">
                    Terbilang
                </td>
                <td style="vertical-align:top">
                    :
                </td>
                <td style="height:100px;vertical-align:top">
                     <b><% = ViewState["TerbilangNilaiSetuju"] %> rupiah</b>
                    <td style="vertical-align:top">
                        <table>
                        <tr>
                            <td style="vertical-align:top;height:60px">
                                Jakarta,
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <% = ViewState["NamaRequestor"] %>
                            </td>
                        </tr>
                    </table>
                    </td>
                    
                </td>
                
            </tr>

        </table>
    </div>
    <br />
    <div>
        <h3 class="center"><u>SURAT PENGAKUAN HUTANG</u></h3>
        <br />
        <table style="width:100%">
            <tr>
                <td style="width:40%">
                    Yang bertandatangan di bawah ini
                </td>
                <td style="width:2%">
                    :
                </td>
                <td>
                     <% = ViewState["NamaRequestor"] %>
                </td>
            </tr>
            <tr>
                <td>
                    Alamat Pemilik
                </td>
                <td>
                    :
                </td>
                <td>
                     <% = ViewState["AlamatRequestor"] %>
                </td>
            </tr>
            <tr>
                <td>
                    No Ktp
                </td>
                <td>
                    :
                </td>
                <td>
                     <% = ViewState["NoRequestor"] %>
                </td>
            </tr>
            <tr>
                <td>
                    Bidang Jenis Usaha
                </td>
                <td>
                    :
                </td>
                <td>
                     <% = ViewState["JenisUsaha"] %>
                </td>
            </tr>
            <tr>
                <td>
                    Alamat Usaha
                </td>
                <td>
                    :
                </td>
                <td>
                    <% = ViewState["AlamatUsaha"] %>
                </td>
            </tr>
        </table>
        <br />
       Yang selanjutnya disebut Mitra Binaan / Debitur. 
        <p class="center">Menyatakan</p>
        <p style="text-align:justify">
            Bahwa Debitur benar­benar telah berhutang kepada PKBL / CSR & SME Partnership Program PT. PERTAMINA (PERSERO)&nbsp;  <% = ViewState["Region"] %>&nbsp yang berkedudukan di  <% = ViewState["AlamatCabang"] %> (untuk selanjutnya disebut PEMBINA / Kreditur ), yang terbit
            berdasarkan pinjaman yang Debitur terima dari PEMBINA sebesar :
        </p>
            <h4 class="center"><b> <% = ViewState["JumlahPinjaman"] %> ( <% = ViewState["TerbilangNilaiSetuju"] %> rupiah)</b></h4>

        Dengan syarat-­syarat sebagaimana tercantum dalam Surat Perjanjian Pinjaman Uang No. <% = ViewState["NoSPPU"] %>Tanggal  <% = ViewState["Tglreal"] %>.
        Debitur akan membayar lunas kembali sesuai jadwal angsuran dalam Lampiran­I.
        <br /><br /><br />
        Demikian Surat Pengakuan Hutang ini dibuat oleh Debitur dengan sadar dan sesungguhnya.
        <br />
        
        <table style="margin-left:90px;width:74%" >
        <tr>
            <td style="vertical-align:top;width:37%;text-align:center">
                Menyetujui
            </td>
            <td style="vertical-align:top;width:37%;text-align:center">
                
            </td>
        </tr>
        <tr>
            <td style="vertical-align:top;width:37%;text-align:center">
                 <% = ViewState["KotaRegion"] %> <% = ViewState["BulanRealisasi"] %> <% = ViewState["ThnRealisasi"] %>
            </td>
            <td style="vertical-align:top;width:37%;text-align:center">
               
            </td>
        </tr>
            <tr>
                <td style="vertical-align:top;width:37%;text-align:center">
                     Suami/Istri Debitur
                </td>
                <td style="vertical-align:top;width:37%;text-align:center">
                    Debitur
                </td>
            </tr>
         <tr>
             <td>
                 <% = ViewState["NamaSuamiIstriDebitur"] %>
             </td>
            <td style="height:80px;vertical-align:bottom;width:37%;text-align:center">
                  <% = ViewState["NamaDebitur"] %>
            </td>
        </tr>                  
    </table>
    </div>
    <br />
    <hr />
    <table>
        <tr>
            <td>
                Jakarta,
            </td>
            <td>
                Juni 2011
            </td>
        </tr>
        <tr>
            <td>
                Nomor   
            </td>
            <td>
                :
            </td>
            <td>
                 /H00010/2011­S0
            </td>
        </tr>
         <tr>
            <td>
                Lampiran   
            </td>
             <td>
                 :
             </td>
            <td>
                 <% = ViewState["lamp"] %>
            </td>
        </tr>
        <tr>
            <td>
                 Perihal
            </td>
           <td>
               :
           </td>
            <td>
                Persetujuan Pinjaman
            </td>
        </tr>
    </table>
    <br />
    Yang terhormat,<br />
    <%=ViewState["NamaRequestor"] %>

    Sehubungan dengan pengajuan permohonan kredit Saudara, dengan ini diberitahukan bahwa PKBL / CSR & SME Partnership Program
    PT. PERTAMINA (PERSERO) menyetujui permohonan Saudara, jika Saudara telah melengkapi seluruh
    persyaratan.<br /><br />

    Sesuai dengan syarat-syarat berikut:
    <br /><br />
    <table>
        <tr>
            <td>
                Jumlah Pinjaman
            </td>
            <td>
                :
            </td>
            <td>
                 <% = ViewState["JumlahPinjaman"] %>
            </td>
        </tr>
        <tr>
            <td>
                Jangka Waktu
            </td>
            <td>
                :
            </td>
            <td>
                <% = ViewState["Tahun"] %> (<% = ViewState["terbilangTahun"] %>) tahun atau  <% = ViewState["Bulan"] %> (<% = ViewState["TerbilangBulan"] %>) bulan
            </td>
        </tr>
        <tr>
            <td>
                Jasa Administrasi
            </td>
            <td>
                :
            </td>
            <td>
                 <% = ViewState["JasaAdm"] %>
            </td>
        </tr>
        <tr>
            <td>
                Masa tenggang
            </td>
            <td>
                :
            </td>
            <td>
                <% = ViewState["Grace"] %>
            </td>
        </tr>
        <tr>
            <td>
                Angsuran
            </td>
            <td>
                :
            </td>
            <td>
                 <% = ViewState["Jumlah Angsuran"] %>  <% = ViewState["TerbilangAngsuran"] %> per bulan setelah pinjaman disalurkan
            </td>
        </tr>
        <tr>
            <td>
                Jaminan
            </td>
            <td>
                :
            </td>
            <td>
               Sertifikat Hak Milik Nomor : 694
            </td>
        </tr>
    </table>
    <br />
    <p style="text-align:justify">Untuk penyelesaian administrasi pinjaman diharapkan kedatangan Saudara bersama Suami/Isteri di Kantor PKBL / CSR & SME
        Partnership Program PT. PERTAMINA (PERSERO)  <% = ViewState["Region"] %>  <% = ViewState["AlamatRegion"] %>, hari Selasa
        tanggal 21xxx pukul 10.00 WIB dengan membawa kelengkapan persyaratan sebagai berikut :
    </p>
    <table>
        <tr>
            <td class="witop">
                1.
            </td>
            <td>
                Surat Tanah (Asli)
            </td>
        </tr>
        <tr>
            <td class="witop">
                2.
            </td>
            <td>
                Fotokopi KTP (2 lembar) + fotokopi Kartu Keluarga (2 lembar)
            </td>
        </tr
        <tr>
            <td class="witop">
                3.
            </td>
            <td>
                Fotokopi SPPT PBB / NJOP tahun terakhir (1 lembar)
            </td>
        </tr>
        <tr>
            <td class="witop">
                4.
            </td>
            <td>
                Uang tunai sebesar untuk pembayaran Biaya Notaris.
            </td>
        </tr>
        <tr>
            <td class="witop">
                5.
            </td>
            <td>
                Fotokopi buku tabungan & buku tabungan asli atas nama : <% = ViewState["NamaRequestor"] %>
            </td>
        </tr>
        <tr>
            <td class="witop">
                6.
            </td>
            <td>
               Materai Rp. 6.000,­ sejumlah 5 (lima) lembar
            </td>
        </tr>
        <tr>
            <td class="witop">
                7.
            </td>
            <td>
                Menandatangani surat ini diatas meterai Rp. 6.000,­ dan dikembalikan kepada kami
            </td>
        </tr>
    </table>
     <br /><br />
    Atas perhatiannya diucapkan terima kasih
    <br /><br /><br />
    SME & SR Partnership Program<br /><br />
    Coordinator,<br /><br /><br /><br />
     <% = ViewState["NamaPIC"] %><br />
    <table style="width:100%">
        <tr>
            <td style="width:50%">

            </td>
            <td style="width:50%">
                Menyetujui
            </td>
            
        </tr>
         <tr>
            <td style="width:50%">

            </td>
            <td style="width:50%">
                Mitra Binaan,Suami Isteri
            </td>
            
        </tr>
        <tr>
            <td style="width:50%">

            </td>
            <td style="width:50%;height:80px;vertical-align:bottom">
                <% = ViewState["NamaRequestor"] %>
            </td>
            
        </tr>
       
    </table>
    <br /><br /><br />
     <tr>
            <td>
                Note :
                Apabila surat telah diterima harap<br />              
                Segera menghubungi   <% = ViewState["Region"] %>
                No. telp.  <br />
            </td>
            <td>

            </td>
        </tr>
 
    <script type="text/javascript">            
        window.print();
    </script>


</body>
</html>
