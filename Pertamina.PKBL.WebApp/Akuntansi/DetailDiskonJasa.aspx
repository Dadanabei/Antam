<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailDiskonJasa.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.DetailDiskonJasa" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">


    <span>Catatan:Untuk melakukan diskon disarankan untuk mendiskon di angsuran paling bawah dahulu. 
        Jangan di yang paling atas atau tengah-tengah</span>
    <div class="borderdetail">
         <table style="width:100%">
            <tr>
               <td>
                   <table>
                       <tr>
                           <td>
                               <dx:aspxlabel ID="lblKodeMitra1" Text="Kode Mitra" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                                                        
                               <dx:aspxlabel ID="lblKodeMitra2" runat="server"></dx:aspxlabel>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <dx:aspxlabel ID="lblNama" Text="Nama" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                               
                               <dx:aspxlabel ID="lblNama2" runat="server"></dx:aspxlabel>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <dx:aspxlabel ID="lblAlamat" Text="Alamat" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>                               
                               <dx:aspxlabel ID="lblAlamat2" runat="server" ></dx:aspxlabel>
                           </td>
                       </tr>
                       <tr>
                           <td>
                               <dx:aspxlabel ID="lblJtuhTempo" Text="Detail Jatuh tempo" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>                          
                           <td>                                                       
                               <dx:aspxlabel ID="lblJtuhTempo2" runat="server" ></dx:aspxlabel>
                           </td>
                       </tr>
                   </table>
               </td>
                <td>
                     <table>
                         <tr>
                           <td>
                               <dx:aspxlabel ID="lblPinjaman" Text="Pinjaman" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:aspxlabel ID="lblPinjaman2" runat="server" ></dx:aspxlabel>
                           </td>
                       </tr>
                         <tr>
                           <td>                               
                               <dx:aspxlabel ID="lblTanggalRealisasi" Text="Tanggal Realisasi" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                            
                               <dx:aspxlabel ID="lblTanggalRealisasi2" runat="server"></dx:aspxlabel>
                           </td>
                       </tr>
                          <tr>
                           <td>
                               <dx:aspxlabel ID="lblTglJatuhTempo" Text="Tanggal Jatuh Tempo" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               
                               <dx:aspxlabel ID="lblTglJatuhTempo2" runat="server" ></dx:aspxlabel>
                           </td>
                       </tr>
                          <tr>
                           <td></td>
                       </tr>
                         
                    
                    </table>
                </td>
                <td>
                    <table>
                         <tr>
                           <td>
                               <dx:aspxlabel ID="lblJangkaWaktu" Text="Jangka Waktu" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:aspxlabel ID="lblJangkaWaktu2" runat="server"></dx:aspxlabel>
                           </td>
                       </tr>
                         <tr>
                           <td>
                               <dx:aspxlabel ID="lblGracePeriod" Text="Grace Period" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:aspxlabel ID="lblGracePeriod2" runat="server"></dx:aspxlabel>
                           </td>
                       </tr>
                         <tr>
                           <td>
                               <dx:aspxlabel ID="lblPersentaseJasa" Text="Persentase Jasa" runat="server"></dx:aspxlabel>
                           </td>
                           <td>
                               :
                           </td>
                           <td>
                               <dx:aspxlabel ID="lblPersentaseJasa2" runat="server"></dx:aspxlabel>
                           </td>
                       </tr>
                        <tr>
                            <td></td>
                        </tr>

                        
                    </table>
                </td>
               
            </tr>
        </table>
    </div>
    <br />
    
    <dx:ASPxGridView runat="server" ID="gvDetailDiskonJasa" Width="100%" Theme="Youthful" OnCommandButtonInitialize="gvDetailDiskonJasa_CommandButtonInitialize" 
         OnRowUpdating="gvDetailDiskonJasa_RowUpdating" KeyFieldName="AngsuranKe" EnableCallBacks="true" OnRowUpdated="gvDetailDiskonJasa_RowUpdated" >
        <ClientSideEvents EndCallback="function(s,e){if(s.cpIsUpdated){gvDetailDiskonJasa2.PerformCallback();}}" />
        <Columns>
            <dx:GridViewBandColumn Caption="Kewajiban">
               <Columns>
                   <dx:GridViewDataTextColumn Caption="Ke" VisibleIndex="0" FieldName="AngsuranKe" ReadOnly="true" Name="AngsuranKe">
                       <EditFormSettings Visible="true" VisibleIndex="0" Caption="Angsuran ke" />
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn Caption="Pokok" FieldName="HutangPokok" VisibleIndex="1">
                       <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                       <EditFormSettings Visible="False" />
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn Caption="Jasa" FieldName="Bunga" Name="Bunga" VisibleIndex="2">
                       <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true"></PropertiesTextEdit>
                       <EditFormSettings Caption ="Nilai Discount" VisibleIndex="3" />
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn Caption="Total" FieldName="Total" Name="Total" VisibleIndex="3">
                       <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                       <EditFormSettings Visible="False" />
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataDateColumn Caption="Jatuh Tempo" VisibleIndex="4" FieldName="TglJatuhTempo">
                       <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                       <EditFormSettings Visible="False" />
                   </dx:GridViewDataDateColumn>
                   <dx:GridViewDataDateColumn Caption="Tanggal" VisibleIndex="4" PropertiesDateEdit-AllowUserInput="false" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy" Visible="false" Name="Tanggal" FieldName="Tanggal">
                       <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" DisplayFormatInEditMode="true"></PropertiesDateEdit>
                       <EditFormSettings Visible="True" VisibleIndex="2" />
                   </dx:GridViewDataDateColumn>
                   <dx:GridViewDataTextColumn Caption="No. Debitur" VisibleIndex="4" Visible="false" FieldName="mitra_id">
                       <EditFormSettings Visible="true" VisibleIndex="1" />
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn Caption="flag" VisibleIndex="4" Visible="false" FieldName="flag">
                   </dx:GridViewDataTextColumn>
               </Columns>
            </dx:GridViewBandColumn>
            
            <dx:GridViewBandColumn Caption=" ">
                <Columns>
                     <dx:GridViewDataTextColumn Caption="Bayar Jasa" FieldName="BayarBunga">
                         <PropertiesTextEdit DisplayFormatString="##,#.00" DisplayFormatInEditMode="true"></PropertiesTextEdit>
                         <EditFormSettings Visible="False" />
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn Caption="Opr." Name="Opr." ButtonType="Link" ShowEditButton="true" >
                    </dx:GridViewCommandColumn>

                </Columns>
            </dx:GridViewBandColumn>
           
        </Columns>

        <TotalSummary>
            <dx:ASPxSummaryItem  FieldName="Pokok" SummaryType="Sum"/>
            <dx:ASPxSummaryItem  FieldName="Jasa" SummaryType="Sum"/>
            <dx:ASPxSummaryItem  FieldName="Total" SummaryType="Sum"/>
            <dx:ASPxSummaryItem  FieldName="BayarJasa" SummaryType="Sum"/>
        </TotalSummary>
        <Settings ShowFooter="true"/>
        <SettingsCommandButton>
            <NewButton>
                <Image ToolTip="New" Url="../content/images/new.png"/>
            </NewButton>
            <EditButton Text="disc">
                <Image ToolTip="Edit" Url="../content/images/edit.png" />
            </EditButton>
            <DeleteButton>
                <Image ToolTip="Delete" Url="../content/images/delete.png" />
            </DeleteButton>
             <UpdateButton Text="Simpan">
                 <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
             </UpdateButton>
             <CancelButton Text="Batal">
                 <Image ToolTip="cancel" Url="../content/images/delete-rect.png"></Image>
             </CancelButton>
        </SettingsCommandButton>

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

        <SettingsPager AlwaysShowPager="false" Mode="ShowAllRecords"></SettingsPager>
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
            <FocusedRow BackColor="#ffffff" ForeColor="#000000"></FocusedRow>
        </Styles>
        <StylesPager>
             <CurrentPageNumber BackColor="#FB000C" >
             </CurrentPageNumber>
         </StylesPager>
    </dx:ASPxGridView>
    <br />
    <dx:ASPxGridView runat="server" ID="gvDetailDiskonJasa2" ClientInstanceName="gvDetailDiskonJasa2" Width="100%" Theme="Youthful" OnHtmlRowPrepared="gvDetailDiskonJasa2_HtmlRowPrepared" 
        EnableCallBacks="true" OnCustomCallback="gvDetailDiskonJasa2_CustomCallback">
        <Columns>
            <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No Bukti" VisibleIndex="1"  FieldName="NoRef">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Tanggal" VisibleIndex="2" FieldName="TglBayar">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Nilai Diskon" VisibleIndex="3" FieldName="DiskonJasa">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Angs Ke" VisibleIndex="4" FieldName="AngsuranKe">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="##,#.00" FieldName="DiskonJasa" ShowInColumn="DiskonJasa" SummaryType="Sum" />
        </TotalSummary>
        <Settings ShowFooter="true" />
        <SettingsPager AlwaysShowPager ="false" Mode="ShowAllRecords"></SettingsPager>
    </dx:ASPxGridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
