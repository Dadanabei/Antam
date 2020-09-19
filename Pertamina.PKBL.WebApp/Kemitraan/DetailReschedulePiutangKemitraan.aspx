<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailReschedulePiutangKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.DetailReschedulePiutangKemitraan" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 148px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <div style="border:thick">
        <dx:ASPxLabel runat="server" ID="lblDetailReschedule" Text="Detail Keterangan Mitra"></dx:ASPxLabel>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblNoMitra" Text="No. Mitra:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNoMitra" Enabled="false" DisabledStyle-BackColor="DarkGray">
                       
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblDebitur" Text="Nama debitur:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="AtxtDebitur" Enabled="false" DisabledStyle-BackColor="DarkGray"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblPlafond" Text="Plafond:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtPlafond" Enabled="false" DisabledStyle-BackColor="DarkGray" DisplayFormatString="##,#.00">                        
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblJangkaWaktu" Text="Jangka Waktu:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJangkaWaktu" Enabled="false" DisabledStyle-BackColor="DarkGray"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblBunga" Text="Bunga:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtBunga" Enabled="false" DisabledStyle-BackColor="DarkGray"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblJatuhTempoTg" Text="Jatuh Tempo per Tanggal:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJatuhTempoTg" Enabled="false" DisabledStyle-BackColor="DarkGray"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblJatuhTempoBl" Text="Jatuh Tempo per Bulan:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJatuhTempoBl" Enabled="false" DisabledStyle-BackColor="DarkGray"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblBungaa" Text="Bunga Pinjaman:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtBungaa" Enabled="false" DisabledStyle-BackColor="DarkGray"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblSisaPokok" Text="Sisa Pokok:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtSisaPokok" Enabled="false" DisabledStyle-BackColor="DarkGray" DisplayFormatString="##,#.00">
                        
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblSisaBunga" Text="Sisa Bunga:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtSisaBunga" Enabled="false" DisabledStyle-BackColor="DarkGray" DisplayFormatString="##,#.00">                        
                    </dx:ASPxTextBox>
                </td>
            </tr>

        </table>

    </div>
    <br />
    <div style="border:thin;width:100%">
         <dx:ASPxLabel runat="server" ID="lblDataRe" Text="Inputan Data Reschedule"></dx:ASPxLabel>
    <br />
  
        <table>
            <tr>
                <td class="auto-style1">
                     <dx:ASPxLabel runat="server" id="lblrescheduleAng" Text="Reschedule Anggsuran:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbRescheduleAng" EnableTheming="True" Theme="Youthful" Enabled="false"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                     <dx:ASPxLabel runat="server" id="lblTanggal" Text="Tanggal Tagihan:"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggal" EnableTheming="True" Theme="Youthful" DisplayFormatString="dd-MMM-yyyy"></dx:ASPxDateEdit>
                </td>
            </tr>
            </table>
        <table>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" id="lblMetode" Text="Metode Reschedule:"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxRadioButton runat="server" Text="Rescheduling(Jangka Waktu Berubah)" ID="rdbReschedule" GroupName="rdb" Checked="true"></dx:ASPxRadioButton>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxRadioButton runat="server" Text="Reconditioning(Angsuran Berubah)" ID="rdbReschedule2" GroupName="rdb"></dx:ASPxRadioButton>
                </td>
            </tr>

        </table>
        <br />
        <dx:ASPxButton runat="server" ID="btnReschedule" OnClick="btnReschedule_Click" Theme="Youthful" Text="Reschedule"></dx:ASPxButton> 
        <dx:ASPxButton runat="server" ID="btnReset" OnClick="btnReset_Click" Theme="Youthful" Text="Reset"></dx:ASPxButton> 
        
    </div>
    <br />
    <div style="border:thin;width:100%">
        <dx:ASPxButton ID="btnSimpan" runat="server" Text="Simpan" Theme="Youthful" Visible="false" OnClick="btnSimpan_Click"></dx:ASPxButton>
        <br />
        <br />
        <dx:ASPxLabel ID="labelKolek" runat="server" Theme="Youthful" Width="100%"></dx:ASPxLabel>
        <br />
        <dx:ASPxGridView ID="gvAngsuran" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Youthful" Width="100%" SettingsPager-Mode="ShowAllRecords" OnHtmlDataCellPrepared="gvAngsuran_HtmlDataCellPrepared">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Angsuran Ke" VisibleIndex="1" FieldName="AngsuranKe">
                    <FooterTemplate>
                        <dx:ASPxLabel runat="server" ID="lblTotal" Text="Total"></dx:ASPxLabel>
                    </FooterTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Tanggal Tagihan" VisibleIndex="2" FieldName="TglJatuhTempo" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
                </dx:GridViewDataDateColumn>
                 <dx:GridViewDataTextColumn Caption="Sisa Pokok" VisibleIndex="3" FieldName="SisaPokok">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Hitung Pokok(a)" FieldName="HutangPokok" VisibleIndex="4" >
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Bunga(b)" FieldName="Bunga" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Angsuran(a+b)" FieldName="JmlBayar" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Is Bayar" VisibleIndex="7" FieldName="IsLunas"></dx:GridViewDataComboBoxColumn>
            </Columns>
             <Settings ShowFooter="True" />
           
             <TotalSummary>
            <%-- Sesuaikan dengan filedname yg akan dijumlah --%>
            <dx:ASPxSummaryItem FieldName="HutangPokok"  SummaryType="Sum" DisplayFormat="##,#.00"  />
            <dx:ASPxSummaryItem FieldName="Bunga" SummaryType="Sum" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem FieldName="JmlBayar" SummaryType="Sum" DisplayFormat="##,#.00" />
                </TotalSummary>
            <Settings ShowFilterRow="false" />
        </dx:ASPxGridView>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
