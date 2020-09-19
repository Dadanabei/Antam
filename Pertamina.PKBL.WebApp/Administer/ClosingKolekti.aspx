<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ClosingKolekti.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Administer.Closingkolekti" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div>
        <h2 class="page-header">Closing Kolektibilitas</h2>


        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Bulan : " Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbBulan" runat="server" Theme="Youthful"></dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tahun : " Theme="Youthful"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbTahun" runat="server" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxButton ID="btnClosing" runat="server" Text="Save" Theme="Youthful" OnClick="btnClosing_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
                <dx:ASPxGridView ID="gvClosing" runat="server" Theme="Youthful" Width="100%" KeyFieldName="tahun" AutoGenerateColumns="False" OnCustomButtonCallback="gvClosing_CustomButtonCallback" OnPageIndexChanged="gvClosing_PageIndexChanged">
            <Columns>
                <dx:GridViewDataTextColumn Caption="No" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tahun" FieldName="tahun" VisibleIndex="1" CellStyle-HorizontalAlign="Center">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bulan" FieldName="bulan" VisibleIndex="2" CellStyle-HorizontalAlign="Center">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn Caption="Opr" VisibleIndex="3">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnHitungUlang" Text="Hitung Ulang">

                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="false"></SettingsBehavior>

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
