<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="LihatDetailJurnalAdjustment.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.JurnalAdjustmentControl.LihatDetailJurnalAdjustment" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:large">Jurnal Lihat detail</span>
    <br />
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Region
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtRegion" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    No Bukti
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNoBukti" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Tanggal <span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggal"></dx:ASPxDateEdit>
                </td>
            </tr>
             <tr>
                <td>
                    Keterangan Bayar<span style="color:red">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKeterangan" ></dx:ASPxTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Jenis Pembayaran
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJenis" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Region
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNilai" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
        <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit"></dx:ASPxButton>

    </div>
    <br />
    <dx:ASPxGridView runat="server" ID="gvDetailKas" Width="100%" Theme="Youthful">
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
