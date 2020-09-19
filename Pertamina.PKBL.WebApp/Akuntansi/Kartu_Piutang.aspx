
<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Kartu_Piutang.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.Kartu_Piutang" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanAll.ascx" TagPrefix="uc1" TagName="ListKemitraanAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">

    <script type="text/javascript">
        function Change(s, e) {
            if (e.buttonID == 'btnPrint') {
                debugger;
                gridKartuPiutang.GetRowValues(e.visibleIndex, 'proposal_number', fc);
                e.processOnServer = false;
            }
            if(e.buttonID == 'btnDetail')
            {
                debugger;
                gridKartuPiutang.GetRowValues(e.visibleIndex, 'proposal_number', detail);
                e.processOnServer = false;
            }
            else {
                e.processOnServer = true;
            }

        }

        function detail(values) {
            window.open('Detail_Kartu_Piutang.aspx?prop=' + values);
        }

        function fc(values) {
            window.open('SuratKartuPiutang.aspx?prop=' + values);
        }

    </script>

    <dx:ASPxLabel ID="lbl_kartu_piutang" runat="server" Text="Kartu Piutang" Font-Size="Large"></dx:ASPxLabel>
    <br /><br />
    <div>
        <dx:ASPxGridView ID="gridKartuPiutang" ClientIDMode="Static" ClientInstanceName="gridKartuPiutang" runat="server" AutoGenerateColumns="False" ClientSideEvents-CustomButtonClick="Change" Styles-Header-HorizontalAlign="center" Width="100%" Theme="Youthful"
         OnRowUpdating="gridKartuPiutang_RowUpdating" OnHtmlRowPrepared="gridKartuPiutang_HtmlRowPrepared"  KeyFieldName="noDebitur" OnCustomButtonCallback="gridKartuPiutang_CustomButtonCallback">
            <Columns>
                <dx:GridViewDataTextColumn Caption="#"  Name="#" VisibleIndex="0" Width="3%">
                    <EditFormSettings Visible="False" />
                     <CellStyle HorizontalAlign="Center"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="No Debitur" Settings-FilterMode="DisplayText" Name="No Debitur" VisibleIndex="1" Width="10%" FieldName="noDebitur">
                    <EditFormSettings Visible="False" />
                     <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nama"  Name="Nama" VisibleIndex="2" Width="30%" FieldName="nama">
                    <EditFormSettings Visible="False" />
                    <Settings AutoFilterCondition="Contains" />
                     <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Alamat"  Name="Alamat" VisibleIndex="3" Width="40%" FieldName="alamat">
                    <EditFormSettings Visible="False" />
                    <Settings AutoFilterCondition="Contains" />
                     <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataComboBoxColumn Caption="Kota" Name="Kota"  VisibleIndex="4" Width="10%" FieldName="kota">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Tgl.Realisasi" Width="6%"  Name="tgl_realisasi" VisibleIndex="5" FieldName="TglRealisasi">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true">
                    </PropertiesDateEdit>
                    <EditFormSettings VisibleIndex="2" Caption="Tanggal Realisasi" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Realisasi"  Name="Realisasi" VisibleIndex="6" Width="15%" FieldName="nilaiRealisasi">
                    <EditFormSettings Visible="False" />
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="JKR" Name="JKR"  VisibleIndex="7" Width="5%" FieldName="JKR">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="JDB" Name="JDB"  VisibleIndex="8" Width="5%" FieldName="JDB">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="JSU" Name="JSU"  VisibleIndex="9" Width="5%" FieldName="JSU">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataColumn FieldName="proposal_number" Visible="false">
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataColumn>
                 <dx:GridViewCommandColumn Caption="Operations" Name="Operations" ShowUpdateButton="true" VisibleIndex="9" ButtonType="Image">
                    <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnDetail" Text="DETAIL" Visibility="AllDataRows" Image-ToolTip="tambah">
                        <Image Url="~/content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="btnPrint" Text="Print" Visibility="AllDataRows" Image-ToolTip="print">
                        <Image Url="~/content/images/print.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>                  
                </dx:GridViewCommandColumn>
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
            <CommandColumn Spacing="10px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
<Header HorizontalAlign="Center"></Header>

            <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
         </StylesPager>



        </dx:ASPxGridView>
    </div>
    <div>
        <uc1:ListKemitraanAll runat="server" ID="ListKemitraanAll" />
       

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
