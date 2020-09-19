<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MasterSektorKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.MasterSektorKemitraan" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Sektor Kemitraan</h2>
        
        <div class="row">
            <div class="col-md-10" style="overflow-x:scroll;">
                 <dx:aspxgridview ID="gvSektorkemitraan" runat="server" AutoGenerateColumns="False" KeyFieldName="id"
                 OnRowDeleting="gvSektorkemitraan_RowDeleting" OnRowUpdating="gvSektorkemitraan_RowUpdating" 
                 OnRowInserting="gvSektorkemitraan_RowInserting"
                 Theme="Youthful" Width="100%">
        <Settings ShowFilterRow="True" />
        <Columns>
            <dx:GridViewCommandColumn Name="opr" ShowEditButton="True" Width="5%" ShowNewButtonInHeader="True" VisibleIndex="4" ShowClearFilterButton="True" ShowDeleteButton="True" ButtonType="Image">
            </dx:GridViewCommandColumn>
           
           
            <dx:GridViewDataTextColumn Caption="ID" FieldName="id" Name="ID" VisibleIndex="0" Width="5%">
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sektor" FieldName="sector_name" Name="Sektor" VisibleIndex="1" Width="20%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Keterangan" FieldName="remarks" Name="Keterangan" VisibleIndex="2" Width="55%">
                <PropertiesMemoEdit Height="100px" Columns="256" MaxLength="1024" Rows="4">
                </PropertiesMemoEdit>
                <EditFormCaptionStyle VerticalAlign="Top">
                </EditFormCaptionStyle>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataCheckColumn Width="10%" Caption="Status" Name="Status" FieldName="is_active" VisibleIndex="3">
                 <PropertiesCheckEdit NullDisplayText="0"  ValueChecked="1" ValueType="System.Byte" ValueUnchecked="0" ValueGrayed="0" AllowGrayed="True" AllowGrayedByClick="False" DisplayTextGrayed="Unchecked" DisplayTextUndefined="Unchecked">
                </PropertiesCheckEdit>
                <EditFormSettings Caption="Aktif / Tidak Aktif" />
            </dx:GridViewDataCheckColumn>
           
           
           
            
        </Columns>
                <SettingsBehavior ConfirmDelete="True" />
                     <SettingsPager AlwaysShowPager="True">
                     </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1">
        </SettingsEditing>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <SettingsPopup EditForm-Modal="true" EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="Middle">
<EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True"></EditForm>
        </SettingsPopup>
            <SettingsCommandButton>
                <NewButton>
                    <Image ToolTip="new" Url="../content/images/new.png"></Image>
                </NewButton>
                <DeleteButton>
                    <Image ToolTip="delete" Url="../content/images/delete.png"></Image>
                </DeleteButton>
                <EditButton>
                     <Image ToolTip="delete" Url="../content/images/edit.png"></Image>
                </EditButton>
                <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
            </SettingsCommandButton>
         <Styles>
             <Header HorizontalAlign="Center">
             </Header>
             <CommandColumn Spacing="5px" />
         </Styles>
                     <StylesPager>
             <CurrentPageNumber BackColor="#FB000C">
             </CurrentPageNumber>
         </StylesPager>
    </dx:aspxgridview>
                <%--<img id="img01" src="<%=ResolveUrl("~/content/images/ss/admin-pkbl-sektorkmitraan.jpg") %>" />--%>
            </div>
        </div>
        <hr />
        <div style="margin-top:30px;opacity:0.35;">
            <%--<a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/admin-pkbl-sektorkmitraan(edit).jpg") %>'">(edit)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/admin-pkbl-sektorkmitraan.jpg") %>'">(list)</a>--%>
        </div>
    </div>
</asp:Content>
