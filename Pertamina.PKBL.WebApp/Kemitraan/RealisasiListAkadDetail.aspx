<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RealisasiListAkadDetail.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.RealisasiListAkadDetail" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanAll.ascx" TagPrefix="uc1" TagName="ListKemitraanAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <script type="text/javascript">
        function Change(s, e) {
            if (e.buttonID == 'Opr2') {
                debugger;
                gvRealisasiAkadDetail.GetRowValues(e.visibleIndex, 'proposal_number', fc);
            }
            else {
                e.processOnServer = true;
            }

        }

        function fc(values) {
            window.open('../Kemitraan/SuratPerjanjianPinjaman.aspx?proposal=' + values);
        }

</script>

    <h1 class="page-header">Detail Akad Kredit</h1>
    <br />
    <dx:ASPxLabel runat="server" ID="ASPxLabel38" Font-Bold="true" Text="Yang bertanda tangan di bawah ini :" Font-Size="12px"></dx:ASPxLabel>
    <div class="borderdetail">
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="No. Debitur" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNoDebitur" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Nama" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNama" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Alamat Usaha" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtAlamatUsaha" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Kode Pos" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtKodePos1" runat="server" Width="40%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Alamat Rumah" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtAlamatRumah" runat="server" Width="80%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Kota" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbKota" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Kode Pos" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtKodePos2" runat="server" Width="40%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="No. KTP" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNoKtp" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Penyalur" Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbPenyalur" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Nama Perusahaan" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNamaPerusahaan" runat="server" Width="80%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Sektor Usaha" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbSektorUsaha" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Jenis Usaha" Theme="Youthful"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtJenisUsaha" runat="server" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>

        <br />
        <dx:ASPxButton ID="btnSubmit" runat="server" Text="Simpan" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
        <dx:ASPxHyperLink ID="linkCancel" runat="server" Text="Cancel" Theme="Youthful" NavigateUrl="RealisasiKemitraan.aspx">
        </dx:ASPxHyperLink>
    </div>

    <br />
    <div>
        <dx:ASPxGridView ID="gvRealisasiAkadDetail" ClientInstanceName="gvRealisasiAkadDetail" ClientSideEvents-CustomButtonClick="Change" runat="server" AutoGenerateColumns="False" 
            Theme="Youthful" Width="100%" OnCustomButtonCallback="gvRealisasiAkadDetail_CustomButtonCallback" KeyFieldName="proposal_number" SettingsBehavior-AllowFocusedRow="true">
            <Columns>
                <dx:GridViewDataTextColumn Caption="No. Mitra" FieldName="proposal_number" Visible="false" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="No. Mitra" FieldName="mitraid" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="JKR" FieldName="JenisKredit" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Jml. Deb." FieldName="jml_debitur" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="JDB" FieldName="company_kind_id" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="JSU" FieldName="sector_id" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tgl Realisasi" FieldName="TglRealisasi" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tgl Jatuh Tempo" FieldName="JatuhTempo" VisibleIndex="6">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pinj. ke" FieldName="pinjamanke" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bunga Pinj." FieldName="JenisBunga" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Plafond" FieldName="NilaiSetuju" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Jangka Waktu" FieldName="JangkaWaktu" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bunga" FieldName="SukuBUnga" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn Caption="Opr." VisibleIndex="12" ButtonType="Image">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="Opr1" Text="edit" Visibility="AllDataRows"> 
                            <Image Url="~/content/images/edit.png"></Image>
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="Opr2" Text="print" Visibility="AllDataRows"> 
                            <Image Url="~/content/images/print.png"></Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Cabang" FieldName="branch_code" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <CommandColumn Spacing="5px" />
                <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
            </Styles>
            <SettingsPager AlwaysShowPager="true" PageSize="50"></SettingsPager>
            <StylesPager>
                <CurrentPageNumber BackColor="#FB000C">
                </CurrentPageNumber>
            </StylesPager>
        </dx:ASPxGridView>
    </div>

    <br />
   
    <uc1:ListKemitraanAll runat="server" ID="ListKemitraanAll" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
