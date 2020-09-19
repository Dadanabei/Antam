<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PengembalianKelebihan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.PengembalianKelebihan" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <span style="font-size:large">Pengembalian Kelebihan</span>
    <br />

    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtNoBukti" runat="server" Width="170px"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btnSubmit" runat="server" Text="Cari" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
                    <dx:ASPxButton ID="btnClear" runat="server" Text="Kosongkan" Theme="Youthful" OnClick="btnClear_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <dx:ASPxGridView runat="server" ID="gvPengembalianKelebihan" Width="100%" Theme="Youthful" AutoGenerateColumns="False" OnCustomButtonCallback="gvPengembalianKelebihan_CustomButtonCallback"
         OnCustomButtonInitialize="gvPengembalianKelebihan_CustomButtonInitialize" OnHtmlDataCellPrepared="gvPengembalianKelebihan_HtmlDataCellPrepared"
         OnHtmlRowPrepared="gvPengembalianKelebihan_HtmlRowPrepared">
        <Columns>
            <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="mitra" VisibleIndex="1" Visible="false" FieldName="mitra_id" Name="mitra_id">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="proposal" VisibleIndex="1" Visible="false" FieldName="proposal_number" Name="proposal_number">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Kode" ButtonType="Link" Name="Kode" VisibleIndex="1">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="Kartu" Text=""></dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
              <dx:GridViewDataTextColumn Caption="Nama" VisibleIndex="2" FieldName="requestor_name" Name="requestor_name">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Pinjaman" VisibleIndex="3" FieldName="NilaiPencairan" Name="NilaiPencairan">
                  <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Jasa" VisibleIndex="4" FieldName="TotalBunga" Name="TotalBunga">
                  <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Bayar Pokok" VisibleIndex="5" FieldName="BayarPokok" Name="BayarPokok">
                  <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Bayar Jasa" VisibleIndex="6" FieldName="BayarBunga" Name="BayarBunga">
                  <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Sisa Pokok" VisibleIndex="7" FieldName="SisaPokok" Name="SisaPokok">
                  <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Sisa Jasa" VisibleIndex="8" FieldName="sisabunga" Name="sisabunga">
                  <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Adv Payment" VisibleIndex="9" FieldName="nilaiAdv" Name="nilaiAdv">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Opr." Name="Opr." ButtonType="Image" VisibleIndex="10" ShowClearFilterButton="True">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnTambah" Text="Tambah">
                        <Image Url="../content/images/new.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn Caption="Region" VisibleIndex="11" FieldName="branch_code" Name="branch_code">
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Userlog" VisibleIndex="12" FieldName="Created_by" Name="Created_by">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsPager AlwaysShowPager="true" PageSize="100"></SettingsPager>
        <StylesPager>
            <CurrentPageNumber BackColor="#FB000C">
            </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
