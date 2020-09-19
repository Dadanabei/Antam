<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPembayaranPK.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.DetailPembayaranPK" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <h2 style="color:<%=ViewState["color"]%>"><%= ViewState["msg"]%></h2>
    <br />
    <script type="text/javascript">
        function CloseConf(s, e) {
            debugger;
            puConfirm.Hide();
            e.processOnServer = false;
            return false;
        }
    </script>
    <dx:ASPxPopupControl ID="puConfirm" runat="server" Modal="True" ClientIDMode="Static" Theme="Youthful" Width="800px" ShowOnPageLoad="false" ClientInstanceName="puConfirm"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" >
        <ContentCollection>
            <dx:PopupControlContentControl Width="50%">
                <dx:ASPxLabel runat="server" Font-Bold="true" Font-Size="Larger" Text="Yakinkah anda memasukan uang sebesar "></dx:ASPxLabel><dx:ASPxLabel ID="txtUangSebesar" Font-Size="Larger" Font-Bold="true" runat="server" Text=""></dx:ASPxLabel>
                <br />
                <br />
                <table>
                    <tr style="vertical-align: top;height:20px;">
                        <td style="width:100px">
                            <dx:ASPxLabel runat="server" Text="Tanggal"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel runat="server" Text=":"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel ID="lblConfTgl" runat="server" Text=""></dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr style="vertical-align: top;height:35px;">
                        <td>
                            <dx:ASPxLabel runat="server" Text="No Mitra"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel runat="server" Text=":"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel ID="lblConfNoMitra" runat="server" Text=""></dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr style="vertical-align: top;height:35px;">
                        <td>
                            <dx:ASPxLabel runat="server" Text="Nama Mitra"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel runat="server" Text=":"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel ID="lblConfNama" runat="server" Text=""></dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr style="vertical-align: top;height:35px;">
                        <td>
                            <dx:ASPxLabel runat="server" Text="Jumlah Bayar"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel runat="server" Text=":"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel ID="lblConfJumlahBayar" runat="server" Text=""></dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr style="vertical-align: top;height:35px;">
                        <td>
                            <dx:ASPxLabel runat="server" Text="Nama Akun"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel runat="server" Text=":"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel ID="lblConfNamaAkun" runat="server" Text=""></dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr style="vertical-align: top;height:35px;">
                        <td>
                            <dx:ASPxLabel runat="server" Text="Lawan Akun"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel runat="server" Text=":"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxLabel ID="lblConfLawanAkun" runat="server" Text=""></dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:center">
                            <dx:ASPxButton ID="btnConfirmYes" runat="server" UseSubmitBehavior="false" OnClick="btnConfirmYes_Click" Text="Save"></dx:ASPxButton>
                            <dx:ASPxButton ID="btnCancelConfirm" runat="server" ClientSideEvents-Click="CloseConf" Text="Cancel"></dx:ASPxButton>
                        </td>
                    </tr>
                </table>
                

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <dx:ASPxGridView ID="gvDetailPembayaran" runat="server" Theme="Youthful" Width="100%" AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No. Akun" Name="COA" FieldName="COA" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo" Name="SaldoAkhir" FieldName="SaldoAkhir" VisibleIndex="2">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
        </Styles>
        <SettingsPager AlwaysShowPager="false" PageSize="50"></SettingsPager>
        <StylesPager>
            <CurrentPageNumber BackColor="#FB000C">
            </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>

    <br />
    <div class="bodydetail">
        <div class="borderdetail" id="Panel" runat="server">
            <table style="width:60%">
                <tr>
                    <td style="width:20%">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tanggal Aktif"></dx:ASPxLabel>
                    </td>
                    <td>
                        <table style="width:60%">
                            <tr>
                                <td style="width:80%">
                                    <dx:ASPxDateEdit ID="deTglAktif" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Theme="Youthful"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>


        <br />
        <div class="borderdetail">
            <table style="width:60%">
                <tr>
                    <td style="width:20%">
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="No. Ref"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNoRef" runat="server" Width="60%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Tanggal Bayar"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="deTglBayar" runat="server" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
                    </td>
                </tr>
            </table>
        </div>
        <asp:ScriptManager runat="server" />

        <br />
        <div class="borderdetail">
            <table style="width:60%">
                <tr>
                    <td style="width:20%">
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="No. Debitur"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNoDebitur" runat="server" Width="60%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Nama"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtNama" runat="server" Width="60%" Theme="Youthful" ReadOnly="true"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Jumlah Pembayaran"></dx:ASPxLabel>
                        <span style="color:red">*</span>
                    </td>
                    <td>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <dx:ASPxTextBox ID="txtJmlPembayaran" DisplayFormatString="##,#.00" runat="server" Width="60%" Theme="Youthful">
                                </dx:ASPxTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ErrorMessage="Jumlah pembayaran tidak boleh 0.." ForeColor="Red" ControlToValidate="txtJmlPembayaran" Display="Dynamic"></asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <dx:ASPxCheckBox ID="checkPelunasan" AutoPostBack="true" OnCheckedChanged="checkPelunasan_CheckedChanged" Text="Pelunasan" runat="server" Theme="Youthful"></dx:ASPxCheckBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Nama Akun"></dx:ASPxLabel>
                        <span style="color:red">*</span>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbNamaAkun" runat="server" ValueType="System.String" Theme="Youthful" Width="100%" IncrementalFilteringMode="StartsWith">
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" EnableCustomValidation="true" >
                                <RequiredField IsRequired="true" ErrorText=" " />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Lawan Akun"></dx:ASPxLabel>
                        <span style="color:red">*</span>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbLawanAkun" runat="server" ValueType="System.String" Theme="Youthful" Width="100%" IncrementalFilteringMode="StartsWith">
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" EnableCustomValidation="true" >
                                <RequiredField IsRequired="true" ErrorText=" " />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Catatan"></dx:ASPxLabel>
                        <span style="color:red">*</span>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtCatatan" runat="server" Width="100%" Theme="Youthful">
                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" EnableCustomValidation="true" >
                                <RequiredField IsRequired="true" ErrorText=" " />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="color:red">*) Wajib diisi</span>
                    </td>
                </tr>
            </table>
            <dx:ASPxCheckBox ID="chkKoreksi" Text="Koreksi" runat="server" Theme="Youthful"></dx:ASPxCheckBox>
        </div>
        
        <br />
        <dx:ASPxButton ID="btnSubmit" runat="server" Text="Simpan" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
        <dx:ASPxHyperLink ID="linkCancel" runat="server" Text="Cancel" Theme="Youthful" NavigateUrl="PembayaranPK.aspx">
        </dx:ASPxHyperLink>
     </div>

    <br />
    <dx:ASPxLabel runat="server" ID="ASPxLabel38" Font-Bold="true" Text="" Font-Size="12px"></dx:ASPxLabel>
    <dx:ASPxGridView ID="gvReport" runat="server" AutoGenerateColumns="False" Theme="Youthful" Width="100%"
         OnCustomColumnDisplayText="gvReport_CustomColumnDisplayText" OnHtmlDataCellPrepared="gvReport_HtmlDataCellPrepared">
        <TotalSummary>
            
            <dx:ASPxSummaryItem SummaryType="Custom" FieldName="AngsuranKe" DisplayFormat="Total : {0:##,#}" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="HutangPokok" ShowInColumn="HutangPokok" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="Bunga" ShowInColumn="Bunga" DisplayFormat="##,#.00" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="Total" ShowInColumn="Total" DisplayFormat="##,#.00" />

            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="BayarPokok" ShowInColumn="BayarPokok" DisplayFormat="{0:##,#}" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="BayarBunga" ShowInColumn="BayarBunga" DisplayFormat="{0:##,#}" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="NilaiAdv" ShowInColumn="NilaiAdv" DisplayFormat="{0:##,#}" />
            <dx:ASPxSummaryItem SummaryType="Sum" FieldName="Totalbayar" ShowInColumn="Totalbayar" DisplayFormat="{0:##,#}" />


        </TotalSummary>
        <Columns>
            <dx:GridViewBandColumn Caption="KEWAJIBAN" Visible="true" VisibleIndex="0">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Ke." Name="AngsuranKe" FieldName="AngsuranKe" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pokok" Name="HutangPokok" FieldName="HutangPokok" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                        <CellStyle HorizontalAlign="Right"></CellStyle>
                        <FooterCellStyle HorizontalAlign="Right"></FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Jasa" Name="Bunga" FieldName="Bunga" VisibleIndex="2">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                        <CellStyle HorizontalAlign="Right"></CellStyle>
                        <FooterCellStyle HorizontalAlign="Right"></FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Total" Name="Total" FieldName="Total" VisibleIndex="3">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                        <CellStyle HorizontalAlign="Right"></CellStyle>
                        <FooterCellStyle HorizontalAlign="Right"></FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Jth. Tempo" Name="TglJatuhTempo" FieldName="TglJatuhTempo" VisibleIndex="4">
                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="PEMBAYARAN" Visible="true" VisibleIndex="1">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="No. Bukti " Name="NoRef" FieldName="NoRef" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Tgl. Bayar" Name="TglBayar" FieldName="TglBayar" VisibleIndex="6">
                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pokok" Name="BayarPokok" FieldName="BayarPokok" VisibleIndex="7">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Jasa" Name="BayarBunga" FieldName="BayarBunga" VisibleIndex="8">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Adv Pay" Name="NilaiAdv" FieldName="NilaiAdv" VisibleIndex="9">
                        
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Total" Name="Totalbayar" FieldName="Totalbayar" VisibleIndex="10">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="SISA" Visible="true" VisibleIndex="2">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Pokok" Name="sisaPokok" FieldName="sisaPokok" VisibleIndex="11">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="sJasa" Name="sisaBunga" FieldName="sisaBunga" VisibleIndex="12">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="sTotal" Name="totalSisa" FieldName="totalSisa" VisibleIndex="13">
                        <PropertiesTextEdit DisplayFormatString="{0:##,#}"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>
       
        <Settings ShowFooter="True" ShowFilterRow="true" />
       
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
        </Styles>
        <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords" ></SettingsPager>
        <StylesPager>
            <CurrentPageNumber BackColor="#FB000C">
            </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
