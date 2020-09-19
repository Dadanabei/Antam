<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MitraBinaanLunas.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.MitraBinaanLunas" %>
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
                   <dx:ASPxTextBox runat="server" Theme="Youthful" ID="txtEntah"></dx:ASPxTextBox>
                </td>
                 <td>
                   Closing
                </td>
                <td colspan="5">
                    <dx:ASPxDateEdit runat="server" Theme="Youthful" CalendarProperties-EnableYearNavigation="true"></dx:ASPxDateEdit>
                </td>
                
                 <td colspan="5">
                    <dx:ASPxDateEdit runat="server" Theme="Youthful" CalendarProperties-EnableMonthNavigation="true"></dx:ASPxDateEdit>
                </td>
                <td colspan="5">
                    Cabang
                </td>
                 <td colspan="5">
                    <dx:ASPxComboBox runat="server" Theme="Youthful" ID="cbbEntah2" Width="50px"></dx:ASPxComboBox>
                </td>
                 <td colspan="5">
                    <dx:ASPxComboBox runat="server" Theme="Youthful" ID="cbbEntah3"></dx:ASPxComboBox>
                </td>
                 <td colspan="10">
                    <dx:ASPxButton runat="server" Theme="Youthful" ID="btnFilter" Text="Filter"></dx:ASPxButton>
                     <span></span>
                    
                </td>
                <td colspan="5">
                     <dx:ASPxButton runat="server" Theme="Youthful" ID="btnClear" Text="Clear"></dx:ASPxButton>
                </td>

            </tr>
        </table>

    </div>
    <span style="font-size:inherit;color:blue">Report Mitra Lunas</span>
    <br />
   <dx:ASPxLabel runat="server" Text="Closing Terakhir Perkembangan Tahun:"></dx:ASPxLabel> <dx:ASPxLabel runat="server" ID="lblTahun"></dx:ASPxLabel> <dx:ASPxLabel runat="server" ID="ASPxLabel1" Text="bulan:"> </dx:ASPxLabel> <dx:ASPxLabel runat="server" ID="lblBulan"></dx:ASPxLabel>
    <br /><br />
    <dx:ASPxGridView runat="server" ID="gvMitraLunas" Width="100%" AutoGenerateColumns="False" EnableTheming="True" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kode" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Realisasi" VisibleIndex="3">
            </dx:GridViewDataDateColumn>            
            <dx:GridViewDataTextColumn Caption="Plafond" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Jadwal" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Terakhr Bayar" VisibleIndex="7">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Bayar Pokok" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sisa Pokok" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal Lunas" VisibleIndex="10">
            </dx:GridViewDataDateColumn>
            <dx:GridViewCommandColumn Caption="Opr" VisibleIndex="11" ButtonType="link" ShowClearFilterButton="True">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton Text="Update" ID="btnUpdate">

                    </dx:GridViewCommandColumnCustomButton>

                </CustomButtons>

            </dx:GridViewCommandColumn>
             <dx:GridViewCommandColumn Caption=" " VisibleIndex="12" ButtonType="link">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton Text="Print" ID="btnPrint">

                    </dx:GridViewCommandColumnCustomButton>

                </CustomButtons>

            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Region" VisibleIndex="13">
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
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
           
        </Styles>
        <StylesPager>
             
         </StylesPager>

        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
