<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MappingCabangProvinsi.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.MappingCabangProvinsi" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    
    <div id="mappingpanel">
        <table>
            <tr>
                <th colspan="3">
                  <dx:ASPxLabel ID="lblHeader" Font-Bold="true" runat="server" Text="Tambah Map Cabang Provinsi"></dx:ASPxLabel>
                </th>
            </tr>
            <tr>
                <td class="label">
                    <dx:ASPxLabel ID="lblProvinsi" runat="server" Text="Provinsi "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblTitik" runat="server" Text=" : "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbProvinsi" runat="server" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <dx:ASPxLabel ID="lblCabang" runat="server" Text="Area "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblTitik2" runat="server" Text=" : "></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbbCabang" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" Theme="Youthful" OnClick="btnSubmit_Click"></dx:ASPxButton>
                    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Cancel" onclick="cancel()">
                    </dx:ASPxHyperLink>
                </td>
            </tr>
        
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="gvMapCabangProvinsi" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Youthful" Width="100%"
            OnRowUpdating="gvMapCabangProvinsi_RowUpdating"  ItemStyle-HorizontalAlign="Right" KeyFieldName="id" OnHtmlRowPrepared="gvMapCabangProvinsi_HtmlRowPrepared">
            <Columns>
               
                <dx:GridViewCommandColumn ShowEditButton="True" ButtonType="Image" VisibleIndex="3" Caption="Opr." Name="Opr.">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="No."  Name="No" VisibleIndex="0" Width="5%">
                    
                    <CellStyle HorizontalAlign="Center"></CellStyle>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                    
                <dx:GridViewDataComboBoxColumn Caption="Area" VisibleIndex="1" Width="48%" FieldName="cabang" Name="cabang">
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Provinsi" VisibleIndex="2" Width="48%" FieldName="propinsi" Name="propinsi">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>

            </Columns>
            <SettingsCommandButton>
                <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
                </UpdateButton>
                <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
                </CancelButton>
                <EditButton>
                    <Image ToolTip="Edit" Url="../content/images/edit.png" />
                </EditButton>
            </SettingsCommandButton>
            <SettingsEditing Mode="PopupEditForm">

            </SettingsEditing>
            <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
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
    </div>
    
    <script>
        function cancel() {
            alert('Sukses Cancel');
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
