<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="KoreksiJurnalAdjustment.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.JurnalAdjustmentControl.KoreksiJurnalAdjustment" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
     <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Tanggal Posting
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
        <dx:ASPxButton runat="server" ID="btnYa" Text="Ya" EnableTheming="True" Theme="Youthful"></dx:ASPxButton><span></span><dx:ASPxHyperLink runat="server" ID="btnTidak" Text="tidak"></dx:ASPxHyperLink>
    </div>
    <br />
    <dx:ASPxGridView runat="server" ID="gvKoreksiKas" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server" ID="lblTotal" Text="Total"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kode">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nama Akun">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Debet" FieldName="debet">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Kredit" FieldName="kredit">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Keterangan" Width="30%">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="debet" SummaryType="Sum" />
              <dx:ASPxSummaryItem FieldName="kredit" SummaryType="Sum" />

        </TotalSummary>
        <Settings ShowFooter="true" />
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
          
        </Styles>
        <StylesPager>
             
         </StylesPager>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
