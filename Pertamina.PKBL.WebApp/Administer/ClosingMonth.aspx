<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ClosingMonth.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Administer.ClosingMonth" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Closing Month</h2>
        <div class="borderdetail">
            
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Bulan" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbBulan" runat="server" ValueType="System.String" Theme="Youthful">
                            <Items>
                                <dx:ListEditItem Text="--pilih--" Value="0" Selected="true" />
                                <dx:ListEditItem Text="Januari" Value="1" />
                                <dx:ListEditItem Text="Februari" Value="2" />
                                <dx:ListEditItem Text="Maret" Value="3" />
                                <dx:ListEditItem Text="April" Value="4" />
                                <dx:ListEditItem Text="Mei" Value="5" />
                                <dx:ListEditItem Text="Juni" Value="6" />
                                <dx:ListEditItem Text="Juli" Value="7" />
                                <dx:ListEditItem Text="Agustus" Value="8" />
                                <dx:ListEditItem Text="September" Value="9" />
                                <dx:ListEditItem Text="Oktober" Value="10" />
                                <dx:ListEditItem Text="November" Value="11" />
                                <dx:ListEditItem Text="Desember" Value="12" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                    <td style="width:10px"></td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tahun" Theme="Youthful"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbTahun" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                    </td>
                    <td style="width:10px"></td>
                    <td>
                    <dx:ASPxButton ID="btnPopup" runat="server" Text="Simpan" AutoPostBack="false" UseSubmitBehavior="false">
                            <ClientSideEvents Click="function(s, e) { pcLogin.Show(); }" />
                    </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </div>
        
            <dx:ASPxPopupControl ID="pcLogin" runat="server" CloseOnEscape="true" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcLogin"
                HeaderText="WARNING !" HeaderStyle-HorizontalAlign="Center" AllowDragging="True" PopupAnimationType="Slide" EnableViewState="False" Theme="Youthful">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="310px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table style="margin-left:20%; margin-right:20%;width:60%">
                                        <tr>
                                            <td colspan="2" style="text-align:center">
                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Apakah Anda Yakin ?"></dx:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height:20px"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align:center">
                                                 <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Theme="Youthful">
                                                     <ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }" />
                                                 </dx:ASPxButton>
                                            </td>
                                            <td style="text-align:center">
                                                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Batal" Theme="Youthful" AutoPostBack="false" HorizontalAlign="Center" UseSubmitBehavior="false">
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
        <br />

        <dx:ASPxGridView ID="gvClosingMonth" runat="server" Theme="Youthful" Width="100%" KeyFieldName="tahun" AutoGenerateColumns="False" OnPageIndexChanged="gvClosingMonth_PageIndexChanged" OnCustomButtonCallback="gvClosingMonth_CustomButtonCallback" >
            <Columns>
                <dx:GridViewDataTextColumn Caption="No" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tahun" Name="tahun" FieldName="tahun" VisibleIndex="1" CellStyle-HorizontalAlign="Center">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bulan" Name="bulan" FieldName="bulan" VisibleIndex="2" CellStyle-HorizontalAlign="Center">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn Caption="Opr" VisibleIndex="3">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnHitungUlang" Text="Hitung Ulang">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
            </Columns>
            

            <SettingsPager AlwaysShowPager="true" Mode="ShowPager" PageSize="50"></SettingsPager>
            <Settings ShowFilterRow="false" ShowFilterRowMenu="false" ShowGroupFooter="VisibleIfExpanded" />
            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
            
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <CommandColumn Spacing="5px" />
                <EditingErrorRow HorizontalAlign="Right">
                </EditingErrorRow>
                <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
            </Styles>
            <StylesPager>
                 <CurrentPageNumber BackColor="#FB000C" >
                 </CurrentPageNumber>
             </StylesPager>
            <Settings ShowFilterRow="false" ShowGroupPanel="false" />
        </dx:ASPxGridView>
        <%= ViewState["script"] %>
</div>
</asp:Content>
