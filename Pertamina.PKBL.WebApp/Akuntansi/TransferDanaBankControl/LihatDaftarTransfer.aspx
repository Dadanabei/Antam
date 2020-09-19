<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="LihatDaftarTransfer.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.TransferDanaBankControl.LihatDaftarTransfer" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:large">Tansfer Dana Bank-Lihat Detail</span>
        <div class="borderdetail">
            <table>
                <tr>
                    <td>
                        Region
                    </td>
                    <td>
                       <dx:ASPxTextBox runat="server" ID="txtRegion" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        No Bukti
                    </td>
                    <td>
                       <dx:ASPxTextBox runat="server" ID="txtNoBukti" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                       Tanggal
                    </td>
                    <td>
                       <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful"></dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        Keterangan Bayar <span style="color:red">*</span>
                    </td>
                    <td>
                       <dx:ASPxTextBox runat="server" ID="txtKeterangan" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Jenis Pembayaran 
                    </td>
                    <td>
                       <dx:ASPxTextBox runat="server" ID="txtPembayaran" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nilai Jumlah <span style="color:red">*</span>
                    </td>
                    <td>
                       <dx:ASPxTextBox runat="server" ID="txtJumlah" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>

            </table>
            <dx:ASPxButton runat="server" ID="btnSimpan" Text="Simpan"></dx:ASPxButton><dx:ASPxHyperLink runat="server" ID="btnCancel" Text="Batal"></dx:ASPxHyperLink>
        </div>
    <br />
    <dx:ASPxGridView runat="server" ID="gvDaftarTransfer" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server" Text="TOTAL"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kode">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nama Akun">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kredit" FieldName="a">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Debet" FieldName="b">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Keterangan">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="a" SummaryType="Sum" />
            <dx:ASPxSummaryItem FieldName="b" SummaryType="Sum" />
        </TotalSummary>
        <Settings ShowFooter="true"/>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
