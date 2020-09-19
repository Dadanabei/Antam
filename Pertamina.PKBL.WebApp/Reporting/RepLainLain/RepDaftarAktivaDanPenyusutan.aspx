<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepDaftarAktivaDanPenyusutan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLainLain.RepDaftarAktivaDanPenyusutan" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Tahun
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTahun" DisplayFormatString="YYYY" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    Region
                </td>              
            </tr>
            <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clSumGut" Text="REGION SUMBAGUT" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
             <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clSumSel" Text="REGION SUMBAGSEL" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
             <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clJbb" Text="REGION JBB" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
             <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clJaYo" Text="REGION JATENG-YOGYAKARTA" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
             <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clJaNus" Text="REGION JATIM-BALINUS" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
             <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clKal" Text="REGION KALIMANTAN" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
             <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clSul" Text="REGION SULAWESI" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
             <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clMaPa" Text="REGION MALUKU-PAPUA" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clDev" Text="REGION DEVELOPER" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="clPusat" Text="REGION KANTOR PUSAT" CheckState="Unchecked" EnableTheming="True" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
            </tr>
        </table>
        <br />
        <dx:ASPxButton runat="server" ID="btnGo" Text="Go"></dx:ASPxButton>&nbsp;<dx:ASPxButton runat="server" ID="btnReset" Text="Reset" Theme="Youthful"></dx:ASPxButton>
    </div>
    <br />
    <asp:ImageButton runat="server" ID="btnPrint" ImageUrl="~/content/images/print.png" />&nbsp;<asp:ImageButton runat="server" ID="btnExcel" ImageUrl="~/content/images/new.png" Theme="Youthful" />
    <br />
    <dx:ASPxGridView runat="server" ID="gvAktiva" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cabang">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal Perolehan">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Harga Perolehan">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Penambahan">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pengurangan">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tarif %">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Akumulasi penyusutan Sampe 2015" Width="15%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="B Peny/bulan">
            </dx:GridViewDataTextColumn>
           <dx:GridViewBandColumn Caption="Beban Penyusutan">
               <Columns>
                   <dx:GridViewDataTextColumn Caption="Jan">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Feb">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Mar">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Apr">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Mei">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Jun">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Jul">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Agst">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Sep">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Okt">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Nov">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Desember">
                    </dx:GridViewDataTextColumn>
               </Columns>
           </dx:GridViewBandColumn>
             <dx:GridViewDataTextColumn Caption="Akumuasi Penyusutan Sampe 2016" Width="15%">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nilai Buku">
              </dx:GridViewDataTextColumn>

        </Columns>
         <Settings  ShowFooter="true"/>
          <SettingsPager AlwaysShowPager="True">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
              <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
            </SettingsPopup>
            <Settings ShowFilterRow="True" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <CommandColumn Spacing="5px" />
            </Styles>
            <StylesPager>
                 <CurrentPageNumber BackColor="#FB000C">
                 </CurrentPageNumber>
             </StylesPager>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
