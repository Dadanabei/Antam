<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MitraBinaanBermasalah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.MitraBinaanBermasalah" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="borderdetail">
        <table style="width:100%">
            <tr>
                <td>
                   <dx:ASPxTextBox runat="server" Theme="Youthful" ID="txtMitraid"></dx:ASPxTextBox>
                </td>
                 <td>
                   Closing
                </td>
                <td colspan="5">
                    <dx:ASPxComboBox runat="server" Theme="Youthful" ID="cbbTahun" ></dx:ASPxComboBox>
                </td>
                
                 <td colspan="5">
                    <dx:ASPxComboBox runat="server" Theme="Youthful" ID="cbbBulan" >
                        <Items>
                                <dx:ListEditItem Text="Januari" Value="1" Selected="true" />
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
                <td colspan="5">
                    Cabang
                </td>
                 <td colspan="5">
                    <dx:ASPxComboBox runat="server" Theme="Youthful" ID="cbbBranch" ></dx:ASPxComboBox>
                </td>
                 <td colspan="5">
                    <dx:ASPxComboBox runat="server" Theme="Youthful" ID="cbbJenis">
                        <Items>
                            <dx:ListEditItem Selected="true" Text="--Semua--" Value="all" />
                            <dx:ListEditItem Text="Belum Terupdate" Value="0" />
                            <dx:ListEditItem Text="Sudah Terupdate" Value="1" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                 <td colspan="10">
                    <dx:ASPxButton runat="server" Theme="Youthful" ID="btnFilter" Text="Filter" OnClick="btnFilter_Click"></dx:ASPxButton>
                     <span></span>
                    
                </td>
                <td colspan="5">
                     <dx:ASPxButton runat="server" Theme="Youthful" ID="btnClear" Text="Clear" OnClick="btnClear_Click"></dx:ASPxButton>
                </td>

            </tr>
        </table>

    </div>
    <br />
   <dx:ASPxLabel runat="server" Text="Closing Terakhir Perkembangan Tahun:" Visible="false"></dx:ASPxLabel> <dx:ASPxLabel runat="server" ID="lblTahun"></dx:ASPxLabel> <dx:ASPxLabel runat="server" ID="ASPxLabel1" Text="bulan:"> </dx:ASPxLabel> <dx:ASPxLabel runat="server" ID="lblBulan"></dx:ASPxLabel>
    <br /><br />
    <dx:ASPxGridView runat="server" ID="gvMitraBermasala" Width="100%" AutoGenerateColumns="False" EnableTheming="True" 
        Theme="Youthful" OnCustomButtonInitialize="gvMitraBermasala_CustomButtonInitialize" OnHtmlDataCellPrepared="gvMitraBermasala_HtmlDataCellPrepared"
         KeyFieldName="mitra_id" OnCustomButtonCallback="gvMitraBermasala_CustomButtonCallback">
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="true">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Kode" VisibleIndex="1" Width="10%" FieldName="mitra_id">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Nama" VisibleIndex="2" Width="20%">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="Kartu" Text=""></dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Nama" FieldName="requestor_name" VisibleIndex="2" Visible="false" Width="20%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Realisasi" VisibleIndex="3" Width="10%" FieldName="TglRealisasi">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>            
            <dx:GridViewDataTextColumn Caption="Plafond" VisibleIndex="5" FieldName="NilaiPencairan">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Jadwal" VisibleIndex="6" Width="10%" FieldName="Jadwal">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Terakhr Bayar" VisibleIndex="7" Width="10%" FieldName="tglTerakhir">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Bayar Pokok" VisibleIndex="8" FieldName="bayar">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sisa Pokok" VisibleIndex="9" FieldName="sisa">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal Bermasalah" VisibleIndex="10" Width="10%" FieldName="TglBermasalah">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Cabang" VisibleIndex="13" Width="8%" FieldName="branch_code">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="proposal" Visible="false" FieldName="proposal_number" VisibleIndex="13" Width="8%">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsCommandButton>
            <NewButton>
                <Image ToolTip="New" Url="../content/images/new.png"/>
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

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

        <SettingsPager AlwaysShowPager="True" PageSize="20"></SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
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

        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <br />
    <table>
        <tr>
            <td>
                <dx:ASPxButton runat="server" ID="btnUpdate" Text="Update" Theme="Youthful" OnClick="btnUpdate_Click"></dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnClearr" Text="Clear" Theme="Youthful" ></dx:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
