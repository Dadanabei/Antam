<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepNeracaSaldo.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepAkuntansi.RepNeracaSaldo" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="asdasdasdasdasadasdasd" ContentPlaceHolderID="BodyContent" runat="server">
    
    <div class="borderdetail">
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
            <td>
                <dx:ASPxButton runat="server" ID="btnFilter" Text="Filter" Theme="Youthful" OnClick="btnFilter_Click"></dx:ASPxButton>
            </td>
           
            <td>
                <dx:ASPxButton runat="server" ID="btnReset" Text="Reset" Theme="Youthful" OnClick="btnReset_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    </div>
    <br />
    <dx:ASPxButton ID="bntExport" runat="server" Text="Export to XLS" OnClick="bntExport_Click"></dx:ASPxButton>&nbsp;<dx:ASPxButton ID="btnPrint" runat="server" Text="Print" OnClick="ASPxButton1_Click"></dx:ASPxButton>
    <br />
    <dx:ASPxGridView runat="server" ID="gvNeraca" Width="100%" Theme="Youthful" OnCustomButtonInitialize="gvNeraca_CustomButtonInitialize"
        OnCustomButtonCallback="gvNeraca_CustomButtonCallback">
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
               <dx:GridViewDataTextColumn Caption="Cabang" Width="5%" Name="cabang" FieldName="cabang">
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
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="Debet" ShowInColumn="Debet" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="Kredit" ShowInColumn="Kredit" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="SaldoAwal" ShowInColumn="SaldoAwal" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="mutasi" ShowInColumn="mutasi" /> 
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" SummaryType="Sum" FieldName="SaldoAkhir" ShowInColumn="SaldoAkhir" /> 
        </TotalSummary>
             <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
              <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
            </SettingsPopup>
            <Settings ShowFilterRow="True" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <CommandColumn Spacing="5px" />
            </Styles>
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
        <Settings ShowFooter="true" />
    </dx:ASPxGridView>
    <%=ViewState["msg"] %>
</asp:Content>
<asp:Content ID="asdadasda" ContentPlaceHolderID="FooterContent" runat="server">
    <dx:ASPxGridViewExporter ID="gvExport" runat="server" GridViewID="gvNeraca" Landscape="false"></dx:ASPxGridViewExporter>
</asp:Content>
