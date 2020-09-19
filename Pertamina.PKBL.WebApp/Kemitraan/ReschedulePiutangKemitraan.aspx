<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ReschedulePiutangKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.ReschedulePiutangKemitraan" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Reschedule Piutang</h2>
        
        <div class="row">
            <dx:ASPxGridView runat="server" ID="gvRescheduleKemitraan" Theme="Youthful" Width="100%" AutoGenerateColumns="False" KeyFieldName="id" OnCustomButtonCallback="gvRescheduleKemitraan_CustomButtonCallback">
                <Columns >
                    <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0" >
                    </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn Caption="No.Mitra" VisibleIndex="1" FieldName="id">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Pinj.Ke" VisibleIndex="2" FieldName="pinjamKe">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Nama Lengkap" VisibleIndex="3" FieldName="nama">
                     </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Tgl.Realisasi" VisibleIndex="4" FieldName="TglRealisasi" PropertiesDateEdit-DisplayFormatString="dd-MMM-yyyy"> 
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn Caption="JKR" VisibleIndex="5" FieldName="JKR"></dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="BP" VisibleIndex="6" FieldName="BP"></dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="JSU" VisibleIndex="7" FieldName="JSU"></dx:GridViewDataComboBoxColumn>
                     <dx:GridViewDataTextColumn Caption="Init" VisibleIndex="8" FieldName="init">
                     </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn Caption="Opr." Name="Opr" VisibleIndex="9" ButtonType="Link" ShowClearFilterButton="True">
                        <CustomButtons>
                             <dx:GridViewCommandColumnCustomButton ID="btnReschedule" Text="Reschedule" Visibility="AllDataRows" Image-ToolTip="tambah" >
                                    
                                <Image ToolTip="tambah"></Image>
                                    
                             </dx:GridViewCommandColumnCustomButton>
                         </CustomButtons>                  
                    </dx:GridViewCommandColumn>
                    <dx:GridViewCommandColumn Caption="   " VisibleIndex="10" ButtonType="Image">
                        <CustomButtons>
                             <dx:GridViewCommandColumnCustomButton ID="btnPrint"  Visibility="AllDataRows" Image-ToolTip="tambah" >
                                    <Image Url="~/content/images/print.png"></Image>
                             </dx:GridViewCommandColumnCustomButton>
                         </CustomButtons>                  
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn Caption="   "  VisibleIndex="11" FieldName="branch_code">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn FieldName="proposal_number" Visible="false"></dx:GridViewDataColumn>




                </Columns>
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
                    </Styles>
                   
                
                    <Settings ShowFilterRow="True" />
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
                       
                
            </dx:ASPxGridView>
            
        </div>
       
    </div>
</asp:Content>
