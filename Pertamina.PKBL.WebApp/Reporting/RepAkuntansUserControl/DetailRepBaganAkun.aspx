<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailRepBaganAkun.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepAkuntansUserControl.DetailRepBaganAkun" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <div class="bodydetail">
        <div class="borderdetail">
            <table style="width:60%">
                <tr>
                    <td style="width:20%">
                        Coa ID
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtCoa" runat="server" Width="80%" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Deskripsi
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtDesc" runat="server" Width="80%" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Periode
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="TxtPeriode" runat="server" Width="80%" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />

        <div class="borderdetail">
            <table style="width:60%">
                <tr>
                    <td style="width:20%">
                        Saldo Awal
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtSaldoAwal" runat="server" Width="80%" Theme="Youthful" DisplayFormatString="##,#.00">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Debit
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtDebit" runat="server" Width="80%" Theme="Youthful" DisplayFormatString="##,#.00">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Kredit
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtKredit" runat="server" Width="80%" Theme="Youthful" DisplayFormatString="##,#.00">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Saldo Akhir
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtSaldoAkhir" runat="server" Width="80%" Theme="Youthful" DisplayFormatString="##,#.00">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>

    </div>
    <br />
    <dx:ASPxButton ID="btnExport" runat="server" Text="Export XLS" Theme="Youthful" OnClick="btnExport_Click"></dx:ASPxButton>
    <br />
    <div>
        <dx:ASPxGridView ID="gvBagan" runat="server" SettingsPager-PageSize="25" AutoGenerateColumns="False" Width="100%" Theme="Youthful" OnCustomButtonCallback="gvBagan_CustomButtonCallback"    >
            <Columns>
                <dx:GridViewDataDateColumn Caption="Tanggal Bukti" VisibleIndex="0" FieldName="TglBayar">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Nomor Bukti" VisibleIndex="1" FieldName="NoBukti">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Deskripsi" VisibleIndex="2" FieldName="Deskripsi">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Debet" VisibleIndex="3" FieldName="Debet">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Kredit" VisibleIndex="4" FieldName="Kredit">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Saldo" VisibleIndex="5" FieldName="Saldo">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Region" VisibleIndex="6" FieldName="KodeCabang">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ButtonType="Image" Caption="Opr" Name="opr">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="detail">
                            <Image Url="~/content/images/checklist.png"></Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>

            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem ShowInColumn="Deskripsi" FieldName="Deskripsi" SummaryType="Sum" DisplayFormat="{0:##,#}TOTAL" /> 
                <dx:ASPxSummaryItem ShowInColumn="Debet" FieldName="Debet" SummaryType="Sum" DisplayFormat="##,#.00" /> 
                <dx:ASPxSummaryItem ShowInColumn="Kredit" FieldName="Kredit" SummaryType="Sum" DisplayFormat="##,#.00" /> 
            </TotalSummary>
            <Settings ShowFooter="true" />
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
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
    <dx:ASPxGridViewExporter ID="gridExporter" runat="server" GridViewID="gvBagan" Landscape="false"></dx:ASPxGridViewExporter>
</asp:Content>
