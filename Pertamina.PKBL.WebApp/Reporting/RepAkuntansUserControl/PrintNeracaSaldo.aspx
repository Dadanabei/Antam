<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintNeracaSaldo.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepAkuntansUserControl.PrintNeracaSaldo" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding-left:20px;">
        <div style="vertical-align:central;margin-bottom:20px;">
            <asp:Image ImageUrl="~/content/images/logo.png" runat="server" Width="300px" />
            <h2 style="text-align:center">PT Pertamina (Persero)</h2>
            <h3 style="text-align:center">Neraca Saldo</h3>
        </div>
        <dx:ASPxLabel ID="txtArea" runat="server"></dx:ASPxLabel>
        <dx:ASPxGridView ID="gvPrint" runat="server" >
            <Columns>
            <dx:GridViewDataTextColumn Caption="COA" Name="account_id" FieldName="account_id">
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" Name="debt_cred" FieldName="debt_cred">
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="Saldo Awal (A)" Name="SaldoAwal" FieldName="SaldoAwal">
                   <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="Debet(B)" Name="Debet" FieldName="Debet">
                   <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="Kredit(C)" Name="Kredit" FieldName="Kredit">
                   <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="Mutasi(D=B-C)" Name="mutasi" FieldName="mutasi">
                   <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="Saldo Akhir (E=A+B-C)" Name="SaldoAkhir" FieldName="SaldoAkhir">
                   <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn Caption="JP" Width="3%" Name="program_id" FieldName="program_id">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="Debet" ShowInColumn="Debet" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="Kredit" ShowInColumn="Kredit" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="SaldoAwal" ShowInColumn="SaldoAwal" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="mutasi" ShowInColumn="mutasi" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="SaldoAkhir" ShowInColumn="SaldoAkhir" /> 
        </TotalSummary>
            <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords">
            </SettingsPager>
        </dx:ASPxGridView>
    </div>
        

        <div style="visibility:hidden">
            <table style="width:100%">
                <tr>
                    <td>
                        Kode
                    </td>
                    <td>
                        <dx:ASPxTextBox runat="server" ID="txtKode" Theme="Youthful"></dx:ASPxTextBox>
                    </td>
                    <td style="width:10px">

                    </td>
                    <td>
                        Periode
                    </td>
                    <td>
                        <dx:ASPxDateEdit runat="server" ID="deTanggalMulai" DisplayFormatString="dd/MM/yyyy" Theme="Youthful" Width="100px"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        <dx:ASPxDateEdit runat="server" ID="deTanggalSampai" DisplayFormatString="dd/MM/yyyy" Theme="Youthful" Width="100px"></dx:ASPxDateEdit>
                    </td>
                    <td style="width:10px">

                    </td>
                    <td>
                        Region
                    </td>
                    <td>
                        <dx:ASPxComboBox runat="server" ID="cbbBranch" Theme="Youthful" Width="300px" SelectedIndex="0"></dx:ASPxComboBox>
                    </td>
                    <td>
                        <dx:ASPxComboBox runat="server" ID="cbbJenis" Theme="Youthful" Width="100px" SelectedIndex="0"></dx:ASPxComboBox>
                    </td>
                     <td>
                        <dx:ASPxComboBox runat="server" ID="cbbAudit" Theme="Youthful" Width="100px" Visible="false" SelectedIndex="0"></dx:ASPxComboBox>
                    </td>
                    <td style="width:10px">

                    </td>
                </tr>
            </table>
        </div>
        <script>
            window.print();
        </script>
    </form>
</body>
</html>
