<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepAkumulasiRealisasiPenyaluranDana.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLainLain.RepAkumulasiRealisasipenyaluranDana" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <span style="font-size:x-large">Lap. Akumulasi Realisasi Penyaluran Dana PK</span>
    <br />
    
   
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Bulan
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtBulan" DisplayFormatString="MM" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    Tahun
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtThaun" DisplayFormatString="YYYY" Theme="Youthful"> </dx:ASPxDateEdit>
                </td>
                <td>
                    Cabang
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbCabang" Theme="Youthful"></dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxCheckBox runat="server" ID="checkdetail" Text="Detail" Theme="Youthful"></dx:ASPxCheckBox>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit" Theme="Youthful"></dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton runat="server" ID="btnreset" Text="Reset" Theme="Youthful"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:ImageButton runat="server" text="Print" ImageUrl="~/content/images/print.png" />&nbsp;<asp:ImageButton runat="server" ID="btnExcel" ImageUrl="~/content/images/new.png" />
    <br />
    <dx:ASPxGridView runat="server" ID="gvAkumulasi" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Wilayah">
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Industri">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="Perdagangan">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="Pertanian">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="IPerternakan">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="Perkebunan">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="Perikanan">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="Jasa">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="Lainnya">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
             <dx:GridViewBandColumn Caption="Jumlah">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="P1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="P2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="T">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="D">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            
        </Columns>
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
    <br />
    <dx:ASPxLabel runat="server" ID="lblKeterangan" Text="Keterangan"></dx:ASPxLabel>
    <dx:ASPxLabel runat="server" ID="lblDetail"></dx:ASPxLabel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
