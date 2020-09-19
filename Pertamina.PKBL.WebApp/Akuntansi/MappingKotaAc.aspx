<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MappingKotaAc.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.MappingKotaAc" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <div>
        <div id="mappingpanel">
            <table>
                <tr>
                    <th colspan="3">
                        <dx:ASPxLabel ID="lblJudul" runat="server" Text="Tambah Map Kota" Font-Bold="true"></dx:ASPxLabel>
                    </th>
                </tr>
                <tr>
                    <td class="label">
                        <dx:ASPxLabel ID="lblWilayah" runat="server" Text="Wilayah"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblTitik1" runat="server" Text=":"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbWilayah" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <dx:ASPxLabel ID="lblKota" runat="server" Text="Kota"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblTitik2" runat="server" Text=":"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbKota" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="label">
                        <dx:ASPxLabel ID="lblProvinsi" runat="server" Text="Provinsi"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblTitik3" runat="server" Text=":"></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cbbProvinsi" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Theme="Youthful"></dx:ASPxButton>
                        <dx:ASPxHyperLink ID="linkCancel" runat="server" Text="Cancel" NavigateUrl="#"></dx:ASPxHyperLink>
                    </td>
                </tr>
            </table>
            
        </div>
        <br />
        <div>
            <dx:ASPxGridView ID="gvMappingKotaAC" runat="server" KeyFieldName="city_id" AutoGenerateColumns="False" Width="100%" 
                Theme="Youthful"  Styles-Cell-HorizontalAlign="Center" Styles-Header-HorizontalAlign="Center" OnRowUpdating="gvMappingKotaAC_RowUpdating" OnHtmlRowPrepared="gvMappingKotaAC_HtmlRowPrepared" >

                <Columns>
                    
           
                    <dx:GridViewDataTextColumn Caption="No"  Name="No"  VisibleIndex="0" Width="50px" >
                        <CellStyle HorizontalAlign="Center"></CellStyle>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Wilayah" FieldName="branch_code" Name="branch_code" VisibleIndex="1" Width="100px">
                        <EditFormSettings Visible="False" />
                        <CellStyle HorizontalAlign="Left"></CellStyle>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Kota" FieldName="city_id" Name="city_id" VisibleIndex="2" Width="300px">
                        <CellStyle HorizontalAlign="Left"></CellStyle>
                    </dx:GridViewDataComboBoxColumn>
                      <dx:GridViewDataComboBoxColumn Caption="Kota_old" FieldName="city_id" Name="Kota_old" VisibleIndex="2" Width="300px" Visible="false">
                            <%--<EditFormSettings Visible="False" />--%>
                      </dx:GridViewDataComboBoxColumn>
                     <dx:GridViewDataComboBoxColumn Caption="Provinsi_old" FieldName="province_code" Name="Provinsi_old" VisibleIndex="2" Width="300px" Visible="false">
                            <%--<EditFormSettings Visible="False" />--%>
                     </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Provinsi" FieldName="province_code" Name="province_code" VisibleIndex="3" Width="300px">
                        <CellStyle HorizontalAlign="Left"></CellStyle>
                    </dx:GridViewDataComboBoxColumn>                    
                    <dx:GridViewCommandColumn VisibleIndex="4" ButtonType="Image" ShowEditButton="true" Caption="Opr." Width="50px">
                        <CellStyle HorizontalAlign="Left"></CellStyle>
                    </dx:GridViewCommandColumn>
                </Columns>
                <SettingsCommandButton>
                 <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
                </UpdateButton>
                <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
                <NewButton>
                    <Image ToolTip="New" Url="../content/images/new.png"  />
                </NewButton>
                <EditButton>
                    <Image ToolTip="Edit" Url="../content/images/edit.png" />
                </EditButton>
                <DeleteButton>
                    <Image ToolTip="Delete" Url="../content/images/delete.png" />
                </DeleteButton>
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
            <Header HorizontalAlign="Center"></Header>

            <Cell HorizontalAlign="Center"></Cell>
            <CommandColumn Spacing="5px" /> 
         </Styles>
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
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
