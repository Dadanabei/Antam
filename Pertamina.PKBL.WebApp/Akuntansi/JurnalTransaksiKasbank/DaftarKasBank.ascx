<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DaftarKasBank.ascx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.JurnalTransaksiKasbank.DetailKasBank" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<script type="text/javascript">
    function Change(s, e) {
        if (e.buttonID == 'btnPrint')
        {
            
            gvDaftarJrnal.GetRowValues(e.visibleIndex, 'NoBukti', fc);
        }
        else {
            debugger;
            e.processOnServer = true;
        }
        
    }

    function fc(values) {
        window.open('../Reporting/PrintPage.aspx?noref=' + values);
    }

</script>
<div class="borderdetail">
    
    <table>
        <tr>
            <td>
                No. Bukti (Opsional):
            </td>
            <td>
                <dx:ASPxTextBox ID="txtNoBkti" runat="server" Width="250px" Theme="Youthful"></dx:ASPxTextBox>
            </td>
            <td style="width:20px">

            </td>
           <td>
                Dari:
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTanggalDari" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
            <td style="width:20px">

            </td>
            <td>
                Hingga:
            </td>
            <td>
                <dx:ASPxDateEdit runat="server" ID="txtTanggalHingga" Theme="Youthful" DisplayFormatString="dd/MM/yyyy"></dx:ASPxDateEdit>
            </td>
            <td style="width:20px">

            </td>
            <td>
                Program:
            </td>
            <td>
                <dx:ASPxComboBox ID="cbbJenisProgram" Theme="Youthful" runat="server" ValueType="System.String"
                    ClientSideEvents-Init="Init">
                    <Items>
                        <dx:ListEditItem Text="Pilih" Value="0" Selected="true" />
                        <dx:ListEditItem Text="Kemitraan" Value="1"/>
                        <dx:ListEditItem Text="Bina Lingkungan" Value="2" />
                        <dx:ListEditItem Text="Kemitraan dan Bina Lingkungan" Value="3"/>
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width:20px">

            </td>
            <td>
                <dx:ASPxButton runat="server" ID="btnFilter" Text="Filter" Theme="Youthful" AutoPostBack="true" OnClick="btnFilter_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    </div>
    <br />
    
    <dx:ASPxGridView runat="server" ID="gvDaftarJrnal" KeyFieldName="IdJurnalKasDetail"  AutoGenerateColumns="False" 
        EnableTheming="True" Theme="Youthful" Width="100%" ClientInstanceName="gvDaftarJrnal" ClientSideEvents-CustomButtonClick="Change" OnCustomButtonCallback="gvDaftarJrnal_CustomButtonCallback"
         OnHtmlRowPrepared="gvDaftarJrnal_HtmlRowPrepared" Visible="false">
        <Columns>
          <dx:GridViewDataTextColumn Caption="No" VisibleIndex="0" Visible="false"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No.Bukti" Name="NoBukti" FieldName="NoBukti" VisibleIndex="1"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tanggal#.No.Bukti" Name="TglBukti" FieldName="TglBukti" VisibleIndex="1">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Deskripsi" Name="KetBayar" FieldName="KetBayar" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Akun" Name="COA" FieldName="COA" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Debet" Name="Debet" FieldName="Debet" VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatString="{0:##,#}.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Kredit" Name="Kredit" FieldName="Kredit" VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="{0:##,#}.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Opr."  VisibleIndex="5" ButtonType="Image" ShowClearFilterButton="True" Width="80px">
                 <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnKoreksi" Text="Koreksi" Visibility="AllDataRows" >
                         <Image Url="~/content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>            
                </CustomButtons>  
                <CustomButtons>
                     <dx:GridViewCommandColumnCustomButton ID="btnPrint" Text="Print" Visibility="AllDataRows" >
                         <Image Url="~/content/images/print.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>    
                    
                    <dx:GridViewCommandColumnCustomButton ID="edit">
                        <Image Url="~/content/images/edit.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>          
                </CustomButtons>
            </dx:GridViewCommandColumn>
        </Columns>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="Debet" DisplayFormat="Total Debet : {0:##,#}.00" ShowInGroupFooterColumn="Debet" SummaryType="Sum" />
            <dx:ASPxSummaryItem FieldName="Kredit" DisplayFormat="Total Kredit : {0:##,#}.00" ShowInGroupFooterColumn="Kredit" SummaryType="Sum" />
        </GroupSummary>
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

        <SettingsPager AlwaysShowPager="true" PageSize="100" Mode="ShowPager"> </SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" ShowGroupFooter="VisibleIfExpanded" />
        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
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
        <Settings ShowFilterRow="True"/>
    </dx:ASPxGridView>