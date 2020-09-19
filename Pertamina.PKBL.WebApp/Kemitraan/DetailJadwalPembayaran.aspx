<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailJadwalPembayaran.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.DetailJadwalPembayaran" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <dx:ASPxLabel runat="server" ID="lblPinjam" Font-Bold="true" Text="" Font-Size="12px"></dx:ASPxLabel>           
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Nama
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNama" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Alamat
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtAlamat" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tgl.Realisasi
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTanggalRealisasi" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tgl.Mulai Bayar
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggalMulai" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" Theme="Youthful" ReadOnly="true"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                   Tgl.Jatuh tempo
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggalTempo" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy" Theme="Youthful" ReadOnly="true"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    Plafond
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtPlafond" Theme="Youthful" ReadOnly="true">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Jangka Waktu
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJangkaWaktu" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Bunga
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtBunga" Theme="Youthful" ReadOnly="true">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Grace Period
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtGrace" Theme="Youthful" ReadOnly="true">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>

    </div>

    <br />
    Parameter Tagihan
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Tagihan Setiap
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTagihan" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                    
                </td>
                <td>
                    <span style="font-size:x-small">bulan</span>
                </td>
            </tr>
            <tr>
                <td>
                    Tanggal
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTanggal" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>

        </table>

    </div>
    <br />
    Hasil Perhitungan
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Angsuran/1 Bulan
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtAngsur" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Hutang Pokok
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtHutang" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Bunga Pokok
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtBungaPokok" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
        <dx:ASPxButton ID="prosesButton" runat="server" Theme="Youthful" Text="PROSES" OnClick="prosesButton_Click"></dx:ASPxButton> 
    </div>
    <br />
    <dx:ASPxGridView runat="server" ID="gvDetailAngsur" AutoGenerateColumns="False" EnableTheming="True" Theme="Youthful" Width="100%" KeyFieldName="AngsuranKe" SettingsPager-Mode="ShowAllRecords">
        <Columns>            
            <dx:GridViewDataTextColumn Caption="Angsuran Ke" VisibleIndex="1" FieldName="AngsuranKe">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server" Text="Total"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal Tagihan" VisibleIndex="2" FieldName="TglJatuhTempo" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
            </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn Caption="Sisa Pokok" VisibleIndex="3" FieldName="SisaPokok">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Hutang Pokok (a)" FieldName="HutangPokok" VisibleIndex="4">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Jasa Adm.(b)" FieldName="Bunga" VisibleIndex="5">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Jumlah Angsuran (a+b)" FieldName="jumlah" VisibleIndex="6">
                 <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Status Bayar" VisibleIndex="7" FieldName="islunas"></dx:GridViewDataComboBoxColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="SisaPokok" SummaryType="Sum" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem FieldName="HutangPokok" SummaryType="Sum" DisplayFormat="##,#.00" />
             <dx:ASPxSummaryItem FieldName="Bunga" SummaryType="Sum" DisplayFormat="##,#.00"/>
             <dx:ASPxSummaryItem FieldName="jumlah" SummaryType="Sum" DisplayFormat="##,#.00"/>
        </TotalSummary>
        <Settings  ShowFooter="true"/>
         <SettingsCommandButton>
            <NewButton>
                <Image ToolTip="New" Url="../content/images/new.png"/>
            </NewButton>
            <EditButton>
                <Image ToolTip="Edit" Url="../content/images/edit.png" />
            </EditButton>
            <DeleteButton>
                <Image ToolTip="Delete" Url="../content/images/delete.png" />
            </DeleteButton>
             <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
        </SettingsCommandButton>

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

        <SettingsPager AlwaysShowPager="True"></SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
        </SettingsPopup>
        <Styles>
            
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
            <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
         </StylesPager>

        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <div>
        <dx:ASPxButton ID="SAVE" Text="SAVE" runat="server" OnClick="SAVE_Click" Theme="Youthful" Visible="false"></dx:ASPxButton>
         <dx:ASPxButton ID="BATAL" Text="BATAL" runat="server"  Theme="Youthful" OnClick="BATAL_Click" Visible="false"></dx:ASPxButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
