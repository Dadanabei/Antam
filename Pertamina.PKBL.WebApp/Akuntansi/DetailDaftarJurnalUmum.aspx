<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailDaftarJurnalUmum.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.DetailDaftarJurnalUmum" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="borderdetail">
        <table>
            <tr>
                <td>
                    Region:
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtRegion" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                    No Bukti:
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtNobukti" ReadOnly="true" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                    Tanggal:
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtTanggal" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                
            </tr>
            <tr>
                <td>
                   Keterangan Bayar:
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtKeterangan" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                   Jenis pembayaran:
                </td>
                <td>
            
                    <dx:ASPxTextBox runat="server" ID="txtPembayaran" ReadOnly="True" EnableTheming="True" Theme="Youthful"></dx:ASPxTextBox>
                </td>
                
            </tr>
            <tr>
                 <td>
                   Nilai Jumlah:
                </td>
                <td>
                    <dx:ASPxTextBox runat="server" ID="txtJumlah" Theme="Youthful"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
        <dx:ASPxButton runat="server" ID="btnSimpan" Text="Simpan" OnClick="btnSimpan_Click" EnableTheming="True" Theme="Youthful"></dx:ASPxButton>

    </div>
    <br />
    <dx:ASPxGridView runat="server" ID="gvDetailJurnalUmum"  EnableTheming="True" Theme="Youthful" Width="100%">
        <Columns>
           
            <dx:GridViewDataTextColumn Caption="No" FieldName="no" VisibleIndex="1" width="5%">
                <FooterTemplate>
                    <dx:ASPxLabel runat="server" ID="lblTotal" Text="Total"></dx:ASPxLabel>
                </FooterTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kode" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Akun" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Debet" FieldName="db" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kredit" FieldName="kr" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Keterangan" VisibleIndex="6">
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

                <SettingsPager AlwaysShowPager="True"></SettingsPager>
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
                 <TotalSummary> 
                    <%-- Sesuaikan dengan filedname yg akan dijumlah --%>
                    <dx:ASPxSummaryItem FieldName="db"  SummaryType="Sum" DisplayFormat="##,#.00" />
                    <dx:ASPxSummaryItem FieldName="kr" SummaryType="Sum" DisplayFormat="##,#.00"/>
           
        <%--            <dx:ASPxSummaryItem FieldName="Jasaa" SummaryType="Sum" />
                    <dx:ASPxSummaryItem FieldName="Adv_Payy" SummaryType="Sum" />--%>
                </TotalSummary>
                 <Settings ShowFooter="True" />
                <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
