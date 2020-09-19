<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Detail_PencairanPK.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.Detail_PencairanPK" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanAll.ascx" TagPrefix="uc1" TagName="ListKemitraanAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <script type="text/javascript">
function Change(s, e) {
        if (e.buttonID == 'btnPrint')
        {
            debugger;
            gvSisaPencairan.GetRowValues(e.visibleIndex, 'NoRef', fc);
        }
        else {
            e.processOnServer = true;
        }
        
    }

    function fc(values) {
        window.open('../Reporting/PrintPage.aspx?noref=' + values);
    }
    </script>


    <dx:ASPxGridView runat="server" ID="gvDetailPencairanPK" AutoGenerateColumns="False" Theme="Youthful" Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No Akun" Name="account_id" FieldName="account_id" VisibleIndex="1">
                <CellStyle HorizontalAlign="left"></CellStyle>
            </dx:GridViewDataTextColumn>
                
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name" VisibleIndex="2">
                 <CellStyle HorizontalAlign="left"></CellStyle>
            </dx:GridViewDataTextColumn>            
            <dx:GridViewDataTextColumn Caption="Saldo" Name="SaldoAkhir" FieldName="SaldoAkhir" VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

        </Columns>

        <Settings ShowFilterRow="True" />
        <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords"></SettingsPager>
        <StylesPager>
            <CurrentPageNumber BackColor="#FB000C">
            </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>
    
    <br />
    <div class="bodydetail">
    <dx:ASPxLabel runat="server" ID="ASPxLabel1" Font-Bold="true" Text="Input Tgl." Font-Size="12px"></dx:ASPxLabel> 
    <div class="borderdetail">
    <table style="width:60%">
        <tr>
            <td style="width:20%">
                <dx:ASPxLabel runat="server" ID="lblTanggal" Text="Tanggal Pencairan"></dx:ASPxLabel>
                <span style="color:red">*</span>

            </td>
            <td>
                 <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
    </div>
    <br />
    <dx:ASPxLabel runat="server" ID="ASPxLabel39" Font-Bold="true" Text="Input Data" Font-Size="12px"></dx:ASPxLabel>           
    <div class="borderdetail">
       
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                     <dx:ASPxLabel runat="server" ID="lblTotalPlafond" Text="Total Plafond"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtTotalPlafond" ReadOnly="true" Width="60%" Theme="Youthful">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblNoMitra" Text="No Mitra"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNoMitra" Width="40%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblNama" Text="Nama"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNama" Width="60%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblKepada" Text="Kepada"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKepada" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblPermintaanBayar" Text="Permintaan Bayar"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtPermintaanBayar" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblVerfikasi" Text="Verifikasi"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtVerifikasi" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel runat="server" ID="lblPenyetuju" Text="Penyetuju"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtPenyetuju" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblDeskripsi" Text="Deskripsi"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtDeskripsi" Width="60%" Theme="Youthful">
                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="true" ErrorText=" " />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblJumlahPencairan" Text="Jumlah Pencairan"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJumlahPencairan" Width="60%" Theme="Youthful" ReadOnly="true">
                        <MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblNamaAkun" Text="Nama Akun"></dx:ASPxLabel>
                    <span style="color:red">*</span>
                </td>
                <td>
                   <dx:ASPxComboBox runat="server" ID="cbbNamaAkun" Theme="Youthful" Width="100%" IncrementalFilteringMode="StartsWith" >
                       <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" >
                            <RequiredField IsRequired="true" ErrorText=" " />
                        </ValidationSettings>
                   </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="color:red">*) Wajib diisi</span>
                </td>
            </tr>
                                
            
        </table>
        </div>
        <br />
        <dx:ASPxButton runat="server" ID="btnSimpan" OnClick="btnSimpan_Click" Text="Simpan" Theme="Youthful"></dx:ASPxButton>&nbsp
        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Cancel" NavigateUrl="~/Akuntansi/PencairanPK.aspx"></dx:ASPxHyperLink>
        <br />
        <br />
        <dx:ASPxLabel runat="server" ID="lblRepost" Text=""></dx:ASPxLabel>



    </div>
        <dx:ASPxGridView ID="gvSisaPencairan" ClientInstanceName="gvSisaPencairan" runat="server" Theme="Youthful" Width="100%" 
            OnCustomColumnDisplayText="gvSisaPencairan_CustomColumnDisplayText" ClientSideEvents-CustomButtonClick="Change" >
            <Columns>
                <dx:GridViewDataTextColumn Caption="No" VisibleIndex="0">
                 <CellStyle HorizontalAlign="left"></CellStyle>
                 </dx:GridViewDataTextColumn> 
                <dx:GridViewDataTextColumn Caption="No-Ref" Name="NoRef" FieldName="NoRef" VisibleIndex="1">
                 <CellStyle HorizontalAlign="left"></CellStyle>
                 </dx:GridViewDataTextColumn> 
                <dx:GridViewDataDateColumn Caption="Tanggal" Name="Tanggal" FieldName="Tanggal" VisibleIndex="2">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn> 
                <dx:GridViewDataTextColumn Caption="Deskripsi" Name="Deskripsi" FieldName="Deskripsi" VisibleIndex="3">
                 <CellStyle HorizontalAlign="left"></CellStyle>
                 </dx:GridViewDataTextColumn> 
                <dx:GridViewDataComboBoxColumn caption="JKR" Name="JKR" FieldName="JKR" VisibleIndex="4">
                </dx:GridViewDataComboBoxColumn>
                 <dx:GridViewDataComboBoxColumn caption="JSU" Name="JSU" FieldName="JSU" VisibleIndex="5">
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Pinj Ke" Name="pinjamanke" FieldName="pinjamanke" VisibleIndex="6">
                 <CellStyle HorizontalAlign="left"></CellStyle>
                 </dx:GridViewDataTextColumn> 
                 <dx:GridViewDataTextColumn Caption="Rp" Name="NilaiPencairan" FieldName="NilaiPencairan" VisibleIndex="7">
                 <CellStyle HorizontalAlign="right"></CellStyle>
                     <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                 </dx:GridViewDataTextColumn> 
                <dx:GridViewCommandColumn Caption="Operation" VisibleIndex="8" ButtonType="Image">
                    <CustomButtons>
                     <dx:GridViewCommandColumnCustomButton ID="btnPrint" Text="Print" Visibility="AllDataRows" >
                         <Image Url="~/content/images/print.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>              
                </CustomButtons>
                 </dx:GridViewCommandColumn> 


            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem SummaryType="Sum" FieldName="NilaiPencairan" DisplayFormat="Total : ##,#.00" />
            </TotalSummary>
             
            <Settings ShowFooter="True" />
            <Styles>
                <CommandColumn Spacing="5px" />
                <EditingErrorRow HorizontalAlign="Right">
                </EditingErrorRow>
                <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
            </Styles>
            <StylesPager>
                 <CurrentPageNumber BackColor="#FB000C" >
                 </CurrentPageNumber>
            </StylesPager>
        </dx:ASPxGridView>
    <br />
        <table style="width:60%">
            <tr>
                <td style="width:20%">
                    <dx:ASPxLabel runat="server" ID="ASPxLabel3" Font-Bold="true" Text="Sisa Pencairan : " Font-Size="12px"></dx:ASPxLabel> 
                </td>
                <td>
                    <dx:ASPxLabel runat="server" ID="lblSisa" Font-Bold="true" Text="" Font-Size="12px"></dx:ASPxLabel> 
                </td>
            </tr>
        </table>
            

    </div>
    <uc1:ListKemitraanAll runat="server" ID="ListKemitraanAll" />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
