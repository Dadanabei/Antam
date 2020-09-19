<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepUsulanPenyaluran.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepLainLain.RepUsulanPenyaluran" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
<span style="font-size:x-large">Lap. Usulan Penyaluran</span>
    <br />
    <div class="borderdetail">
        <table>
                <tr>
                    <td>
                        Mulai Tanggal
                    </td>
                    <td>
                       <dx:ASPxDateEdit runat="server" ID="txtTgl1" Theme="Youthful"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        Sampai Tanggal
                    </td>
                    <td>
                        <dx:ASPxDateEdit runat="server" ID="txtTgl2" Theme="Youthful"></dx:ASPxDateEdit>
                    </td>
                    <td>
                        Pilih Cabang
                    </td>
                    <td>
                        <dx:ASPxComboBox runat="server" ID="cbbCabang" Theme="Youthful"></dx:ASPxComboBox>
                    </td>
                    <td>
                        <dx:ASPxButton runat="server" ID="btnSubmit" Text="Submit" Theme="Youthful"></dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton runat="server" ID="btnClear" Text="Clear" Theme="Youthful"></dx:ASPxButton>
                    </td>
                </tr>
            </table>
    </div>
    <br />
    <table style="width:7%">
        <tr>
            <td>
                 <asp:ImageButton ID="btnPrintt" BorderColor="Transparent" BorderStyle="None"  runat="server"  BackColor="Transparent" ImageUrl="~/content/images/print.png">
                 </asp:ImageButton>
              
               
    
            </td>
            <td>
                  <asp:ImageButton ID="btnExcell" BorderColor="Transparent" BorderStyle="None"  runat="server"  BackColor="Transparent" ImageUrl="~/content/images/new.png">
                 </asp:ImageButton>
                
            </td>
        </tr>
    </table>
    <br />

    <dx:ASPxGridView runat="server" ID="gvUsulan" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="No Debitur">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nama Mitra">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Alamat" Width="50%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal Akad">
            </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn Caption="Plafond">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="JKR">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="JDB">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="JSU">
            </dx:GridViewDataTextColumn>
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
            
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
