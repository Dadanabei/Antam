<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepAlokasiPenyisihanLaba.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLainLain.RepAlokasiPenyisihanLaba" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:x-large">Lap. Alokasi Penyisihan Laba</span>
    <br />
    <asp:ImageButton runat="server" ID="btnPrint" ImageUrl="~/content/images/print.png" />
    <br />
    <dx:ASPxGridView runat="server" ID="gvPenyisihan" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataDateColumn Caption="Tanggal Alokasi">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server" text="JUMLAH"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Program Kemitraan Rp" FieldName="a">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Program Bina Lingkungan Rp" FieldName="b">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Total" FieldName="c">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="a" SummaryType="Sum" />
             <dx:ASPxSummaryItem FieldName="b" SummaryType="Sum" />
             <dx:ASPxSummaryItem FieldName="c" SummaryType="Sum" />
        </TotalSummary>
        <Settings  ShowFooter="true"/>
          <SettingsPager AlwaysShowPager="True">
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
            <StylesPager>
                 <CurrentPageNumber BackColor="#FB000C">
                 </CurrentPageNumber>
             </StylesPager>
    </dx:ASPxGridView>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
