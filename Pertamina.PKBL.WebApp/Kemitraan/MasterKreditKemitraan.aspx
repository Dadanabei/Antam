<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MasterKreditKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.MasterKreditKemitraan" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView ID="gvJenisKreditKemitraan" runat="server" Styles-Header-HorizontalAlign="Center" AutoGenerateColumns="False" Width="100%" Theme="Youthful" KeyFieldName="id"
         OnRowDeleting="gvJenisKreditKemitraan_RowDeleting" OnRowInserting="gvJenisKreditKemitraan_RowInserting" OnRowUpdating="gvJenisKreditKemitraan_RowUpdating">
        <SettingsBehavior ConfirmDelete="True" />
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsText ConfirmDelete="Hapus Data Ini ?" />
        <Columns>
            <dx:GridViewCommandColumn Width="5%" Name="opr" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="4" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Width="80%" Caption="Deskripsi" FieldName="descr" Name="descr" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Width="10%" Caption="Status" Name="is_active" VisibleIndex="3" FieldName="is_active">
                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Byte" ValueUnchecked="0" DisplayTextGrayed="Checked" DisplayTextUndefined="Checked" NullDisplayText="0" AllowGrayed="True" ValueGrayed="1">
                </PropertiesCheckEdit>
                <EditFormSettings Caption="Aktif / Tidak Aktif" />
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Width="5%" Caption="ID" FieldName="id" Name="id" VisibleIndex="1">
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Left">
                </CellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsCommandButton>
                <NewButton>
                    <Image ToolTip="New" Url="../content/images/new.png"  />
                </NewButton>
                <EditButton>
                    <Image ToolTip="Edit" Url="../content/images/edit.png" />
                </EditButton>
                <DeleteButton>
                    <Image ToolTip="Delete" Url="../content/images/delete.png" />
                </DeleteButton>
            <UpdateButton>
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
            </SettingsCommandButton>
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







<%--    <div id="page-wrapper">
        <h2 class="page-header">Jenis Kredit Kemitraan</h2>

        <div class="row">
            <table class="table table-striped">
                <colgroup>
                    <col width="38" />
                    <col width="200"/>
                    <col width="50"/>
                    <col width="56"/>
                </colgroup>
                <thead>
                    <tr>
                        <td colspan="4">
                            <a href="<%=ResolveUrl("~/Kemitraan/AddJenisKreditKemitraan.aspx?id=0") %>" class="btn btn-default">
                                <i class="fa fa-plus"></i><span> ADD</span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <th>ID</th>
                        <th>Deskripsi</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Pinjaman modal kerja</td>
                        <td>Aktif</td>
                        <td>
                            <a href="<%=ResolveUrl("~/Kemitraan/AddJenisKreditKemitraan.aspx?id=1") %>"><i class="fa fa-pencil"></i> <span> edit</span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Pinjaman investasi</td>
                        <td>Aktif</td>
                        <td>
                            <a href="<%=ResolveUrl("~/Kemitraan/AddJenisKreditKemitraan.aspx?id=2") %>"><i class="fa fa-pencil"></i> <span> edit</span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Pinjaman khusus</td>
                        <td>Aktif</td>
                        <td>
                            <a href="<%=ResolveUrl("~/Kemitraan/AddJenisKreditKemitraan.aspx?id=3") %>"><i class="fa fa-pencil"></i> <span> edit</span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Pemasaran &amp; promosi</td>
                        <td>Aktif</td>
                        <td>
                            <a href="<%=ResolveUrl("~/Kemitraan/AddJenisKreditKemitraan.aspx?id=4") %>"><i class="fa fa-pencil"></i> <span> edit</span></a>
                        </td>
                    </tr>
                </tbody>
            </table>

            <nav>
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>--%>