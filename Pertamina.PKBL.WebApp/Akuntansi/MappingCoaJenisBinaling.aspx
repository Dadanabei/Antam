<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MappingCoaJenisBinaling.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.MappingCoaJenis" %>

<%--<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>--%>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<script runat="server">

   
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
     <div id="mappingpanel">
        <table>
            <tr>
            <th colspan="3">
                <dx:ASPxLabel ID="lblHeader" Font-Bold="true" runat="server" Text="Tambah MAP COA Jenis BinaLing"></dx:ASPxLabel>
        
            </th>
            </tr>
    <%--<h3>Tambah MAP COA Jenis BinaLing</h3>--%>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblKodeAkun" runat="server" Text="Kode Akun"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblTitik0" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td><dx:ASPxComboBox ID="cbbKodeAkun" runat="server" ValueType="System.String" Theme="Youthful">
                    </dx:ASPxComboBox></td>
                <%--<td><dx:ASPxDropDownEdit ID="ddKodeAkun" runat="server"></dx:ASPxDropDownEdit></td>--%>
            </tr>
            <tr>
                <td><dx:ASPxLabel ID="lblJenisBinaLing" runat="server" Text="Jenis Binaling:"></dx:ASPxLabel></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=":"></dx:ASPxLabel>
                </td>
                <td><dx:ASPxComboBox ID="cbbBinaling" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox></td>
              <%--  <td><dx:ASPxDropDownEdit ID="ddKodeBinaling" runat="server"></dx:ASPxDropDownEdit></td>--%>
            </tr>
            <tr>
                <td><dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Theme="Youthful"></dx:ASPxButton></td>
                 <td><a href="#" name="cancel">Cancel</a></td>
            </tr>
        </table>
    </div>
    <br/><br/>
    <div>
        <dx:aspxgridview ID="gvCoaJenisBinaling" runat="server" AutoGenerateColumns="False" 
           Theme="Youthful" Width="100%" OnRowUpdating="gvCoaJenisBinaling_RowUpdating" KeyFieldName="id" OnHtmlRowPrepared="gvCoaJenisBinaling_HtmlRowPrepared">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="3" ButtonType="Image" ShowClearFilterButton="True" ShowEditButton="True" Name="Opr." Caption="Opr." Width="5%">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="NO" fieldname="id" Name="No" VisibleIndex="0" Width="5%">
                <CellStyle HorizontalAlign="Center"></CellStyle>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="COA" FieldName="coa" Name="coa" VisibleIndex="1" Width="45%">
                <EditFormSettings Visible="false" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Jenis Binaling" FieldName="bkind_id" Name="bkind_id" VisibleIndex="2" Width="45%">
            </dx:GridViewDataComboBoxColumn>
            
        </Columns>
            <SettingsCommandButton>
                <%--<NewButton>
                    <Image ToolTip="New" Url="../content/images/new.png"  />
                </NewButton>--%>
                <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
                </UpdateButton>
                 <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
                </CancelButton>
                <EditButton>
                    <Image ToolTip="Edit" Url="../content/images/edit.png" />
                </EditButton>
                <%--<DeleteButton>
                    <Image ToolTip="Delete" Url="../content/images/delete.png" />
                </DeleteButton>--%>
            </SettingsCommandButton>
            <SettingsPager AlwaysShowPager="True">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>

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
    </dx:aspxgridview>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
