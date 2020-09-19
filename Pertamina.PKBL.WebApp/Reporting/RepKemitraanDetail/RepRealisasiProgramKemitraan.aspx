<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepRealisasiProgramKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepKemitraan.RepRealisasiProgramKemitraan" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:ScriptManager ID="smRealisasi" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <span style="font-size:x-large">Laporan Realisasi Program Kemitraan</span>
    <div class="borderdetail">
<asp:UpdateProgress ID="UpdateProgressRealisasi" runat="server">
    <ProgressTemplate>
        Processing...
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="updatePanelRealisasi" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="chregion1" />
        <asp:AsyncPostBackTrigger ControlID="chregion2" />
        <asp:AsyncPostBackTrigger ControlID="chregion3" />
        <asp:AsyncPostBackTrigger ControlID="chregion4" />
        <asp:AsyncPostBackTrigger ControlID="chregion5" />
        <asp:AsyncPostBackTrigger ControlID="chregion6" />
        <asp:AsyncPostBackTrigger ControlID="chregion7" />
        <asp:AsyncPostBackTrigger ControlID="chregion8" />
        <asp:AsyncPostBackTrigger ControlID="chregion9" />
    </Triggers>
    <ContentTemplate>
        <table>
            <tr>
                <td>
                    Periode
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtPeriode" DisplayFormatString="dd/MM/yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="txtPeriode2" DisplayFormatString="dd/MM/yyyy" Theme="Youthful"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr><td style="height:10px"></td></tr>
            <tr>
                <td style="vertical-align:top">
                    Area
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion1" OnCheckedChanged="chkregionChange"   AutoPostBack ="true" data-branch="1100" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion2" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="1200" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion3" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="1300" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion4" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="1400" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion5" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2500" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion6" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2600" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion7" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2700" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion8" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="2800" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxCheckBox runat="server" ID="chregion9" OnCheckedChanged="chkregionChange"   AutoPostBack="true" data-branch="9900" Text="" Theme="Youthful"></dx:ASPxCheckBox>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td>
                    Propinsi
                </td>
                <td>
                    <dx:ASPxComboBox runat="server" ID="cbbPropnsi" Theme="Youthful"></dx:ASPxComboBox>
                </td>              
            </tr>
        </table>
        </ContentTemplate>
</asp:UpdatePanel>
        <br />
        <dx:ASPxButton runat="server" ID="btnSbmit" Text="Submit" UseSubmitBehavior="false" OnClick="btnSbmit_Click" Theme="Youthful"></dx:ASPxButton>&nbsp;<dx:ASPxButton runat="server" ID="btnClear" UseSubmitBehavior="false" Text="Clear" Theme="Youthful"></dx:ASPxButton>
    </div>
    <br />
    <dx:ASPxButton ID="btnReport" runat="server" Text="Export XLS" OnClick="btnReport_Click"></dx:ASPxButton>



<div class="bodydetail" style="overflow:auto;overflow-y:hidden;overflow-x:scroll">
    <dx:ASPxGridView ID="gv" runat="server" Width="100%" Theme="Youthful" AutoGenerateColumns="False" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared">
        <Columns>

            <dx:GridViewDataTextColumn Caption="No." VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Deb" VisibleIndex="1" FieldName="mitraid">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" VisibleIndex="2" FieldName="requestor_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Usaha" VisibleIndex="3" FieldName="company_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Alamat" VisibleIndex="4" FieldName="requestor_address">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="JKR" VisibleIndex="5" FieldName="JenisKredit">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="JDB" VisibleIndex="6" FieldName="company_kind_id">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="JSU" VisibleIndex="7" FieldName="sector_id">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Produk" VisibleIndex="8" FieldName="BidangUsaha">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Plafond" VisibleIndex="9" FieldName="requested_amount">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Akad Kredit" HeaderStyle-HorizontalAlign="Center" >
                <Columns>
                    <dx:GridViewDataDateColumn Caption="Tanggal" VisibleIndex="10" FieldName="TglRealisasi">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Jatuh Tempo" VisibleIndex="11" FieldName="TglJatuhTempo">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Pencairan Kredit" HeaderStyle-HorizontalAlign="Center">
                <Columns>
                    <dx:GridViewDataDateColumn Caption="Tanggal" VisibleIndex="12" FieldName="TglPencairan">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Jumlah" VisibleIndex="13" FieldName="NilaiPencairan">
                        <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="Kota" VisibleIndex="14" FieldName="city_name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Region" VisibleIndex="15" FieldName="branch_code">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" ShowInColumn="requested_amount" FieldName="requested_amount" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" ShowInColumn="NilaiPencairan" FieldName="NilaiPencairan" SummaryType="Sum" />
        </TotalSummary>
        <SettingsPager AlwaysShowPager="True" PageSize="100"></SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowFooter="true" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" VerticalAlign="Middle" Modal="True" ></EditForm>
        </SettingsPopup>
        <Styles>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
            <Header HorizontalAlign="Center">
            </Header>
            <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
        </StylesPager>
    </dx:ASPxGridView>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
    <dx:ASPxGridViewExporter ID="gvExporter" runat="server" GridViewID="gv" Landscape="false"></dx:ASPxGridViewExporter>
</asp:Content>
