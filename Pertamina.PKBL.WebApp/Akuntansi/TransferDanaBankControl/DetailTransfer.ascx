<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailTransfer.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.TransferDanaBankControl.DetailTransfer" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<div class="borderdetail">
    <table style="width:60%">
        <tr>
            <td style="width:20%">
                Jenis Droping <span style="color:red">*</span>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbDrop" Theme="Youthful" UseSubmitBehavior="false" AutoPostBack="true" OnSelectedIndexChanged="cbbDrop_SelectedIndexChanged" Width="60%"></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblRepost" Font-Bold="true" Text="" Font-Size="12px"></dx:ASPxLabel> 
            </td>
        </tr>
    </table>
    
</div>
    <br /><br />
<div id ="Panel" runat="server" UseSubmitBehavior="false">

    <dx:ASPxGridView runat="server" ID="gvDetailTransfer"  UseSubmitBehavior="false" Width="100%" Theme="Youthful">
        <Columns>
            <dx:GridViewDataTextColumn Caption="No Akun" Name="COA" FieldName="COA">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="account_name" FieldName="account_name" Width="50%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Saldo" Name="Saldo" FieldName="Saldo">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords"></SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowGroupFooter="VisibleIfExpanded" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        <Styles>
            <Header HorizontalAlign="Center"></Header>
            <CommandColumn Spacing="5px" />
            <EditingErrorRow HorizontalAlign="Right">
            </EditingErrorRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
         </StylesPager>
    </dx:ASPxGridView>
    <br />  
<div class="bodydetail">
    
<dx:ASPxLabel runat="server" ID="ASPxLabel39" Font-Bold="true" Text="Pengirim" Font-Size="12px"></dx:ASPxLabel> 
<div class="borderdetail">
    <table style="width:60%">
        <tr>
            <td style="width:20%">
                Pengirim
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbPengirim" Theme="Youthful" Width="100%" ></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                Jenis Pembayaran
            </td>
            <td>
                <dx:ASPxTextBox runat="server" ID="txtJnsPembayaran" Theme="Youthful" Width="60%" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Kode akun Pengirim
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbbKodeAkunPengirim" Theme="Youthful" Width="100%" ></dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                Kepada
            </td>
            <td>
                <dx:ASPxTextBox runat="server" ID="txtKepada" Theme="Youthful" Width="60%" ></dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Permintaan Bayar
            </td>
            <td>
                 <dx:ASPxTextBox runat="server" ID="txtPermintaan" Theme="Youthful" Width="60%" ></dx:ASPxTextBox>
            </td>
        </tr>
         <tr>
            <td>
                Verifikasi
            </td>
            <td>
                 <dx:ASPxTextBox runat="server" ID="txtVerifikasi" Theme="Youthful" Width="60%" ></dx:ASPxTextBox>
            </td>
        </tr>
         <tr>
            <td>
                Permintaan Bayar
            </td>
            <td>
                 <dx:ASPxTextBox runat="server" ID="txtPenyetuju" Theme="Youthful" Width="60%" ></dx:ASPxTextBox>
            </td>
        </tr>
    </table>
</div>
<br />
<dx:ASPxLabel runat="server" ID="ASPxLabel1" Font-Bold="true" Text="Penerima" Font-Size="12px"></dx:ASPxLabel>   
<br />
<div class="borderdetail">
    <table style="width:60%">
        <tr>
            <td style="width:20%">
                Tanggal kirim <span style="color:red">*</span>
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="deTanggal" Theme="Youthful"></dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td>
                Kode Akun Penerima
            </td>
            <td>
                
                <dx:ASPxGridLookup ID="glAkunPenerima" runat="server" UseSubmitBehavior="false" Theme="Youthful" SelectionMode="Single"  
                                   TextFormatString="{0} - {1}" Width="100%" KeyFieldName="COA" IncrementalFilteringMode="Contains" GridViewProperties-Settings-ShowFilterRow="false" >
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Kode Akun" FieldName="COA" Name="COA" Width="100px" /> 
                        <dx:GridViewDataTextColumn Caption="Nama Akun" FieldName="account_name" Name="account_name" Width="300px" />
                        <dx:GridViewDataTextColumn Caption="Nama Cabang" FieldName="branch_name" Name="branch_name" Width="150px" />
                        <dx:GridViewDataTextColumn Caption="Kode Cabang" FieldName="branch_code" Name="branch_code"  Visible="false" />
                    </Columns>
                    <GridViewProperties>
                        <Settings ShowColumnHeaders="true" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="Virtual" />
                        <SettingsBehavior AllowDragDrop="False" EnableRowHotTrack="True" />
                        <SettingsPager Mode="ShowAllRecords" />
                    </GridViewProperties>
                </dx:ASPxGridLookup>
            </td>
        </tr>
        <tr>
            <td>
                Jumlah <span style="color:red">*</span>
            </td>
            <td>
              <dx:ASPxTextBox runat="server" ID="txtJumlah" DisplayFormatString="##,#.00" Width="60%" Theme="Youthful" >
                  <%--<MaskSettings Mask="&lt;0..999999999999999g&gt;" IncludeLiterals="None" ShowHints="false" />--%>
              </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Keperluan <span style="color:red">*</span>
            </td>
            <td>
                 <dx:ASPxTextBox runat="server"  ID="txtKeperluan" Width="60%" Theme="Youthful"></dx:ASPxTextBox>
            </td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

</div>
<br />
<dx:ASPxButton runat="server" ID="btnProses" Text="Proses" OnClick="btnProses_Click" Theme="Youthful" UseSubmitBehavior="false" ></dx:ASPxButton>
</div>
        <dx:aspxpopupcontrol ID="puPreview" ClientIDMode="Static" runat="server" Modal="True" 
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="puPreview" Width="900px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" Width="800px">
                <table>
                    <tr>
                        <dx:ASPxGridView ID="gvPopup" runat="server" Theme="Youthful" Width="100%" OnHtmlRowPrepared="gvPopup_HtmlRowPrepared">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="No" Name="no" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Kode" Name="NoBukti" FieldName="NoBukti" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Akun" Name="coa" FieldName="coa_display" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Debet" Name="debet" FieldName="debet" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Kredit" Name="kredit" FieldName="kredit" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Keterangan" Name="deskripsi" FieldName="deskripsi" VisibleIndex="5"></dx:GridViewDataTextColumn>
                            </Columns>
                            <TotalSummary>
                                <dx:ASPxSummaryItem FieldName="debet" DisplayFormat="Total Debet : ##,#.00" ShowInGroupFooterColumn="debet" SummaryType="Sum" />
                                <dx:ASPxSummaryItem FieldName="kredit" DisplayFormat="Total Kredit : ##,#.00" ShowInGroupFooterColumn="kredit" SummaryType="Sum" />
                            </TotalSummary>
                            <SettingsPager AlwaysShowPager="false" PageSize="150" Mode="ShowAllRecords"> </SettingsPager>
                            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowGroupFooter="VisibleIfExpanded" />
                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
                            <Styles>
                                <Header HorizontalAlign="Center"></Header>
                                <CommandColumn Spacing="5px" />
                                <EditingErrorRow HorizontalAlign="Right">
                                </EditingErrorRow>
                            </Styles>
                            <StylesPager>
                                    <CurrentPageNumber BackColor="#FB000C" >
                                    </CurrentPageNumber>
                            </StylesPager>
                            <Settings ShowFilterRow="false" ShowFooter="true" />
                        </dx:ASPxGridView>
                    </tr>
                    <tr style="text-align:center">
                        <td>
                            <dx:ASPxButton ID="btnApprove" runat="server" OnClick="btnApprove_Click" Text="Simpan" Theme="Youthful"></dx:ASPxButton>
                        </td>
                        <td>
                            <dx:ASPxButton ID="btnCacel" runat="server" OnClick="btnCacel_Click" Text="Cancel" Theme="Youthful"></dx:ASPxButton>
                        </td>
                        
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
        
    </dx:aspxpopupcontrol>

    <script type="text/javascript">
        function cancel(s,e)
        {
            debugger;
            puPreview.Hide();
            return false;
        }
    </script>

</div>