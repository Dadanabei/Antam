<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Koreksi.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.Koreksi" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="bodydetail">
        <div class="borderdetail">
            <table style="width:60%">
                <tr>
                    <td colspan="2">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Apakah Anda yakin mengkoreksi jurnal ini ?" Font-Bold="true" Font-Size="14px"></dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="width:20%">
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tanggal Posting"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="deTanggal" runat="server" Theme="Youthful"></dx:ASPxDateEdit>
                    </td>
                </tr>
            </table>
            
            <br />
            <br />
            <dx:ASPxButton ID="btnPopup" runat="server" Text="Simpan" AutoPostBack="false" UseSubmitBehavior="false">
                    <ClientSideEvents Click="function(s, e) { pcLogin.Show(); }" />
            </dx:ASPxButton>
            &nbsp
            <dx:ASPxButton ID="btnCancel" runat="server" Text="Tidak" OnClick="btnCancel_Click"></dx:ASPxButton>
        </div>
    </div>

    <dx:ASPxGridView ID="gvJurnal" runat="server" Theme="Youthful" Width="100%" OnHtmlRowPrepared="gvJurnal_HtmlRowPrepared">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No" VisibleIndex="0"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kode" Name="NoBukti" FieldName="NoBukti" VisibleIndex="1">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Akun" Name="coa" FieldName="coa" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Debet" Name="debet" FieldName="debet" VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kredit" Name="kredit" FieldName="kredit" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" Name="deskripsi" FieldName="deskripsi" VisibleIndex="5"></dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="debet" DisplayFormat="Total Debet : ##,#.00" ShowInGroupFooterColumn="debet" SummaryType="Sum" />
            <dx:ASPxSummaryItem FieldName="kredit" DisplayFormat="Total Kredit : ##,#.00" ShowInGroupFooterColumn="kredit" SummaryType="Sum" />
        </TotalSummary>
        <SettingsPager AlwaysShowPager="false" PageSize="150" Mode="ShowAllRecords"> </SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowGroupFooter="VisibleIfExpanded" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
         </StylesPager>
        <Settings ShowFilterRow="false" ShowFooter="true" />
    </dx:ASPxGridView>
            <dx:ASPxPopupControl ID="pcLogin" runat="server" CloseOnEscape="true" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcLogin"
                HeaderText="Verifikasi" HeaderStyle-HorizontalAlign="Center" AllowDragging="True" PopupAnimationType="Slide" EnableViewState="False" Theme="Youthful">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" >
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="1000px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table style="width:90%;margin-left:5%;margin-right:5%">
                                        <tr>
                                            <td colspan="2">
                                                 <dx:ASPxGridView ID="gvPopup" runat="server" Theme="Youthful" Width="100%" OnHtmlRowPrepared="gvJurnal_HtmlRowPrepared">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="No" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Kode" Name="NoBukti" FieldName="NoBukti" VisibleIndex="1">
                                                            <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Akun" Name="coa" FieldName="coa" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Debet" Name="debet" FieldName="debet" VisibleIndex="3">
                                                            <PropertiesTextEdit DisplayFormatString="{0:##,#}.00"></PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Kredit" Name="kredit" FieldName="kredit" VisibleIndex="4">
                                                            <PropertiesTextEdit DisplayFormatString="{0:##,#}.00"></PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Keterangan" Name="deskripsi" FieldName="deskripsi" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem FieldName="debet" DisplayFormat="Total Debet : {0:##,#}.00" ShowInGroupFooterColumn="debet" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem FieldName="kredit" DisplayFormat="Total Kredit : {0:##,#}.00" ShowInGroupFooterColumn="kredit" SummaryType="Sum" />
                                                    </TotalSummary>
                                                    <SettingsPager AlwaysShowPager="false" PageSize="150" Mode="ShowAllRecords"> </SettingsPager>
                                                    <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowGroupFooter="VisibleIfExpanded" />
                                                    <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
                                                    <Styles>
                                                        <Header HorizontalAlign="Center"></Header>
                                                        <CommandColumn Spacing="5px" />
                                                        <EditingErrorRow HorizontalAlign="Right">
                                                        </EditingErrorRow>
                                                    </Styles>
                                                    <StylesPager>
                                                         <CurrentPageNumber BackColor="#FB000C" >
                                                         </CurrentPageNumber>
                                                     </StylesPager>
                                                    <Settings ShowFilterRow="false" ShowFooter="true" />
                                                </dx:ASPxGridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:50%">
                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Apakah Anda yakin mengkoreksi jurnal ini ?"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:center">
                                                <dx:ASPxButton ID="btnKoreksi" runat="server" Text="Ya" Theme="Youthful" OnClick="btnKoreksi_Click">
                                                     <ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }" />
                                                </dx:ASPxButton>
                                                &nbsp
                                                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Batal" Theme="Youthful" AutoPostBack="false" HorizontalAlign="Center" UseSubmitBehavior="false">
                                                    <ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }" />
                                                </dx:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
