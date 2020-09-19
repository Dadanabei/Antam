<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MonitoringMitra.aspx.cs" Inherits="Pertamina.PKBL.WebApp.MonitoringMitra" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
   <span style="font-size:large">Monitoring dan Evaluasi Mitra Binaan</span>
    <br /><br />
    <dx:ASPxGridView runat="server" ID="gvMonitoring" Width="100%" Theme="Youthful" OnCustomButtonCallback="gvMonitoring_CustomButtonCallback" 
        KeyFieldName="mitraId" OnCustomButtonInitialize="gvMonitoring_CustomButtonInitialize" OnHtmlRowPrepared="gvMonitoring_HtmlRowPrepared">
        <Columns>
            <dx:GridViewDataTextColumn Caption="#" >
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Kode" FieldName="mitraId">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Nama" FieldName="nama">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn Caption="Tgl Realisasi" FieldName="TglRealisasi" PropertiesDateEdit-DisplayFormatString="dd/MM/yyyy">
             </dx:GridViewDataDateColumn>
              <dx:GridViewDataTextColumn Caption="Ke" FieldName="pinjamanke">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Opr" Name="Opr" ButtonType="Image">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnTambah" Text="Tambah">
                        <Image Url="../content/images/new.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>       
            <dx:GridViewCommandColumn Caption="I">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="button1" Text="coba" ></dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>      
            <dx:GridViewCommandColumn Caption="II">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="button2" Text="coba" ></dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>  
            <dx:GridViewCommandColumn Caption="III">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="button3" Text="coba"  ></dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>  
            <%-- <dx:GridViewDataTextColumn FieldName="I" Visible="false">
            </dx:GridViewDataTextColumn>            
             <dx:GridViewDataTextColumn  FieldName="II" Visible="false">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn  FieldName="III" Visible="false">
            </dx:GridViewDataTextColumn>--%>
             <dx:GridViewDataTextColumn Caption="Cabang" FieldName="branch_code">
            </dx:GridViewDataTextColumn>            

        </Columns>

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
    </dx:ASPxGridView>

    
   
    
</asp:Content>
