<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PostingJurnal.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.PostingJurnal" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            function ApplyFilter(dateFrom, dateTo) {
                var d1 = dateFrom.GetText();
                var d2 = dateTo.GetText();
                if (d1 == "" || d2 == "")
                    return;
                gvJurnal.AutoFilterByColumn("TglBukti", d1 + "|" + d2);
            }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

        <script type="text/javascript">
            function Change(s, e) {
                if (e.buttonID == 'print') {
                    debugger;
                    gvJurnal.GetRowValues(e.visibleIndex, 'NoBukti', fc);
                }
                else {
                    e.processOnServer = true;
                }

            }

            function fc(values) {
                debugger;
                window.open('../Reporting/PrintPage.aspx?noref=' + values);
            }

        </script>
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cari : " Theme="Youthful"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txtCari" runat="server" Width="170px" Theme="Youthful"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tanggal : " Theme="Youthful"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="deStart" Theme="Youthful" runat="server" AllowNull="true" AllowMouseWheel="false" AllowUserInput="false" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
            <td>
                s/d
            </td>
            <td>
                <dx:ASPxDateEdit ID="deEnd" Theme="Youthful" runat="server" AllowNull="true" AllowMouseWheel="false" AllowUserInput="false" DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="ASPxButton1" Theme="Youthful" runat="server" Text="Cari" OnClick="ASPxButton1_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    
    <dx:ASPxGridView ID="gvJurnal" runat="server" ClientSideEvents-CustomButtonClick="Change" ClientInstanceName="gvJurnal" OnDetailRowExpandedChanged="gvJurnal_DetailRowExpandedChanged" 
        AutoGenerateColumns="False" Width="100%" Theme="Youthful" OnPageIndexChanged="gvJurnal_PageIndexChanged" KeyFieldName="NoBukti" OnCustomButtonCallback="gvJurnal_CustomButtonCallback" SettingsPager-PageSize="20">
        <Settings ShowFilterRow="true" ShowFilterRowMenu="true" />
        <Columns>

            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" >
            </dx:GridViewCommandColumn>

            <dx:GridViewDataTextColumn Caption="No Bukti" FieldName="NoBukti" Name="NoBukti" VisibleIndex="1">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataDateColumn Caption="Tanggal" FieldName="TglBukti" Name="TglBukti" VisibleIndex="2">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataTextColumn Settings-FilterMode="DisplayText" Caption="Cabang" FieldName="KodeCabang" Name="KodeCabang" VisibleIndex="3">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="User Log" FieldName="UserLog" Name="UserLog" VisibleIndex="4">
            </dx:GridViewDataTextColumn>

            <dx:GridViewCommandColumn ButtonType="Image" Caption="Opr." >
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="print" >
                        <Image Url="~/content/images/print.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                    
                    <dx:GridViewCommandColumnCustomButton ID="edit">
                        <Image Url="~/content/images/edit.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons> 
            </dx:GridViewCommandColumn>

        </Columns>

        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gvDetail" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="coaDisplay" Name="coaDisplay" Caption="Akun" VisibleIndex="0"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Debet" Name="Debet" Caption="Debet" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Kredit" Name="Kredit" Caption="Kredit" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Deskripsi" Name="Deskripsi" Caption="Desc" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager Visible="False"></SettingsPager>
                    <Settings ShowFooter="false" ShowFilterRow="false" />
                    <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
        <SettingsDetail ShowDetailRow="true" />
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
    <asp:Button ID="btnPost" runat="server" Text="Posting" OnClick="btnPost_Click"   />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
