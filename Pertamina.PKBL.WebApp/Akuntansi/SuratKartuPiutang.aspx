<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuratKartuPiutang.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.SuratKartuPiutang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
         .center{
            text-align:center
        }
        .justify {
            text-align:justify;
            
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
    <title></title>
</head>
<body>
   
    <div>
       <%=ViewState["KotaRegion"] %>, <%=ViewState["TanggalSurat"] %>
        <hr />
        <table style="width:92%">
            <tr>
                <td style="width:35%">
                    <table>
                          <tr>
                <td style="width:10%">
                    Nomor
                </td>
                <td style="width:2%">
                    :
                </td>
                <td style="text-align:right;width:15%">
                   /N013<%= ViewState["branch_code"].ToString().Substring(1,2) %>/<%= DateTime.Today.Year.ToString() %>-­S0
                </td>
            </tr>
             <tr>
                <td style="text-align:left">
                    Perihal
                </td>
                <td>
                    :
                </td>
                <td style="text-align:right">
                    Konfirmasi Piutang
                </td>
            </tr>
                    </table>
                </td>
                <td style="text-align:right">
                    <asp:Image ImageUrl="~/content/images/logo.png" runat="server" Width="100px" Height="50px" />
                </td>
            </tr>
          
        </table>
    
    </div>
        <br />
        <br />
 Kepada Yth : <br />
­<%=ViewState["NoRequestor"] %><br />
Sdr/i <%=ViewState["NamaRequestor"] %><br />
<%=ViewState["AlamatRequestor"] %><br />
<%=ViewState["KabupatenRegion"] %>,<br />
<%=ViewState["ProvinsiRegion"] %><br />
    <br />
    <p class="justify">
           Memperhatikan Surat Perjanjian Pinjaman Uang Saudara/i <%=ViewState["NoProposal"] %> tanggal <%=ViewState["tglProposal"] %> dengan PKBL / CSR
           & SME Partnership Program PT. PERTAMINA (PERSERO) <%=ViewState["Region"] %>, bersama ini kami informasikan kepada Saudara/i
           sebagai berikut :
    </p>
    <br />
    <table style="width:100%">
        <tr>
            <td>

            </td>
            <td class="center">
                Pokok
            </td>
            <td class="center">
                Jasa
            </td>
            <td class="center">
               Jumlah
            </td>

        </tr>
         <tr>
            <td class="center">
                Jumlah Pinjaman
            </td>
            <td class="center">
                <%=ViewState["JumlahPinjaman"] %>
            </td>
            <td class="center">
                <%=ViewState["JumlahJasa"] %>
            </td>
            <td class="center">
                <%=ViewState["TotalPinjamJasa"] %>
            </td>

        </tr>
        <tr>
            <td class="center">
                Pinjaman Yang Telah Dibayarkan
            </td>
            <td class="center">
                <%=ViewState["JumlahBayar"] %>
            </td>
            <td class="center">
                <%=ViewState["JumlahBayarJasa"] %>
            </td>
            <td class="center">
                <%=ViewState["TotalBayarJasa"] %>
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td>
                <hr />
            </td>
            <td>
                <hr />
            </td>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td class="center">
                Sisa Pinjaman
            </td>
            <td class="center">
                <%=ViewState["SisaBayar"] %>
            </td>
            <td class="center">
                <%=ViewState["SisaJasa"] %>
            </td>
            <td class="center">
                <%=ViewState["TotalSisaPokokJasa"] %>
            </td>
        </tr>
    </table>
    <br />
    <p class="justify">
        Menurut catatan kami, sampai dengan tanggal <%=ViewState["Todaydate"] %>, Saudara/i telah melakukan pembayaran terakhir pada
        tanggal <%=ViewState["TglLastPaid"] %>, dan kewajiban yang harus Saudara/i bayarkan adalah :
    </p>
    <br />
    <table style="width:40%">
        <tr>
            <td style="width:30%">
                Tunggakan Pokok
               
            </td>
            <td style="width:5%">
                :<br />
               
            </td>
            <td>
                  <%=ViewState["tunggakanPokok"] %>
            </td>
              
        </tr>
         <tr>
            <td>
                Tunggakan Jasa
            </td>
            <td>
                :<br />
                
            </td>
            <td>

                  <%=ViewState["tunggakanBunga"] %>
                
            </td>
        </tr>
       
        <tr>
            <td>
                Total Tunggakan
            </td>
            <td>
                :<br />
                
            </td>
            <td>
                <%=ViewState["totalTunggakan"] %>
               
            </td>
        </tr>
    </table>
    <br />
    Diharap Saudara/i segera membayar tunggakan tersebut pada No. Rekening :<br/>
    <div>
        <p>
            <%= ViewState["rekening"] %>
        </p>
       
    </div>
    <p class="justify">
        dalam satu lembar bukti setorannya dikirimkan kepada <%=ViewState["regionname"] %> alamat <%=ViewState["AlamatRegion"] %> atau melalui facsimile <%=ViewState["fak"] %> selambat­-lambatnya
        tanggal <%= ViewState["tglSelambat"] %>.
    </p>
    <p class="justify">
        Sekiranya jumlah yang tertera di atas tidak sesuai dengan bukti setor yang ada pada Saudara/i agar segera memberikan
        informasi kepada kami disertai bukti­-bukti penyetoran.        
    </p>
    <p class="justify">
        Kami harapkan kerjasama Saudara/i untuk segera membayar tunggakan tersebut dan bilamana Saudara/i tidak
        melakukannya maka akan diselesaikan secara hukum.
        Demikianlah disampaikan, atas perhatiannya diucapkan terima kasih 
    </p>
    PKBL / CSR & SME Partnership Program PT. PERTAMINA (PERSERO) <%=ViewState["Region"] %><br />
    <%= ViewState["jabatann"] %><br /><br /><br />
    <%=ViewState["Pic"] %><br />
    <hr style="border-top: dotted 1px;" />
    <br />
    KONFIRMASI HUTANG <br />
    Kepada<br />
    PKBL / CSR & SME Partnership Program PT. PERTAMINA (PERSERO) <%=ViewState["Region"] %>
    <%=ViewState["AlamatRegion"] %><br />
    <%=ViewState["TelpRegion"] %><br /><br /><br />
    Menurut catatan <%=ViewState["regionname"] %>, saldo hutang Kami
    (Mitra Binaan) per <%=ViewState["Todaydate"] %> adalah sebesar <%=ViewState["TotalSisaPokokJasa"] %>,­<br />
    Menurut Kami saldo tersebut adalah : Sesuai / Tidak Sesuai (Coret yang tidak perlu)
    <br />Penjelasan : (Bila tidak sesuai) ...................................................................................................<br />
    ..........................................................................................................................................<br />
    Mitra Binaan<br /><br /><br />
    Ttd.<br />
    (<%=ViewState["NamaRequestor"] %>)
    <script type="text/javascript">
        window.print();
    </script>

    


</body>
</html>
