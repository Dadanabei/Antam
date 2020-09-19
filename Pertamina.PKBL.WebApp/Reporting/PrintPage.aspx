<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintPage.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.PrintPage" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:30px 20px" >
        <div >
            <asp:Image ImageUrl="~/content/images/logo.png" runat="server" />
            <br />
            <br />
            <dx:ASPxLabel ID="lblHeader" runat="server" Text="" Font-Bold="true" Font-Size="22px"></dx:ASPxLabel>
        </div>
        
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        No Bukti
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <asp:Label ID="lblNoBukti" Text="" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Tanggal
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <asp:Label ID="lblTgl" Text="" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Kepada
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <asp:Label ID="lblKepada" Text="" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td>
                        Keterangan
                    </td>
                    <td>
                        :
                    </td>
                    <td>
                        <asp:Label ID="lblKeterangan" Text="" runat="server" />
                    </td>
                </tr>
            </table>
            <div style="margin-top:30px">
                <dx:ASPxGridView ID="gvJurnal" runat="server" Width="100%" AutoGenerateColumns="False" Settings-ShowFooter="true" OnHtmlRowPrepared="gvJurnal_HtmlRowPrepared">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="No" Name="no" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Kode Akun" FieldName="coa" Name="coa" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nama Akun" FieldName="account_name" Name="account_name" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Debet" FieldName="debet" Name="debet" VisibleIndex="3">
                            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Kredit" FieldName="kredit" Name="kredit" VisibleIndex="4">
                            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Catatan" FieldName="deskripsi" Name="deskripsi" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <TotalSummary>
                        <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="debet" ShowInColumn="debet" />
                        <dx:ASPxSummaryItem SummaryType="Sum" DisplayFormat="##,#.00" FieldName="kredit" ShowInColumn="kredit" />
                    </TotalSummary>
                    <SettingsPager Visible="False">
                    </SettingsPager>
                    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                    
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                </dx:ASPxGridView>
            </div>
            <br />
            <br />
            <table style="width:100%">
                <tr>
                    <td style="width:25%">
                        Permintaan Bayar
                    </td>
                    <td style="width:5px"></td>
                    <td style="width:25%">
                        Verifikasi
                    </td>
                    <td style="width:5px"></td>
                    <td style="width:25%">
                        Penyetuju
                    </td>
                    <td style="width:5px"></td>
                    <td style="width:25%">
                        Diterima Oleh
                    </td>
                </tr>
                <tr style="height:70px">
                    <td>

                    </td>
                    <td>

                    </td>
                    <td>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPermintaanBayar" Text="" runat="server" />
                    </td>
                    <td style="width:5px"></td>
                    <td>
                        <asp:Label ID="lblVerifikator" Text="" runat="server" />
                    </td>
                    <td style="width:5px"></td>
                    <td>
                        <asp:Label ID="lblPenyetuju" Text="" runat="server" />
                    </td>
                    <td style="width:5px"></td>
                    <td>
                        <asp:Label ID="lblDiterimaOleh" Text="" runat="server" />
                    </td>
                </tr>
            </table>
        </div>

    </div>
    </form>
    <script type="text/javascript">
        window.print();
    </script>
</body>
</html>
