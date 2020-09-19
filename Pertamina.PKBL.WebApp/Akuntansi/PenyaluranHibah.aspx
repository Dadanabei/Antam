<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PenyaluranHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.PenyaluranHibah" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanAll.ascx" TagPrefix="uc1" TagName="ListKemitraanAll" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">

    <h2 class="page-header">Penyaluran Hibah Kemitraan</h2>
       
        <dx:ASPxGridView ID="gvPenyaluran" runat="server" AutoGenerateColumns="False" Theme="Youthful"
            Width="100%" OnCustomButtonCallback="gvPenyaluran_CustomButtonCallback" KeyFieldName="proposal_number" 
            SettingsBehavior-AllowFocusedRow="true" OnCustomButtonInitialize="gvPenyaluran_CustomButtonInitialize" 
             OnHtmlRowPrepared="gvPenyaluran_HtmlRowPrepared" OnPageIndexChanged="gvPenyaluran_PageIndexChanged">
            <Columns>
                <dx:GridViewDataTextColumn Caption="#" VisibleIndex="1" Name="No"></dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="No.Mitra" Name="mitraid" FieldName="mitraid" VisibleIndex="2" ReadOnly="true">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="Nama" Name="requestor_name" FieldName="requestor_name" VisibleIndex="3">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="Nama_Usaha" Name="company_name" FieldName="company_name"  VisibleIndex="4" ReadOnly="true">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataDateColumn Caption="Tgl.Tagihan" Name="TglRealisasi" FieldName="TglRealisasi" VisibleIndex="5" ReadOnly="true">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataTextColumn Caption="Nilai" Name="NilaiSetuju" FieldName="NilaiSetuju"  VisibleIndex="6" ReadOnly="true">
                    <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                    
                <dx:GridViewDataComboBoxColumn Caption ="JDB" Name="company_kind_id" FieldName="company_kind_id" VisibleIndex="7" >

                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption ="JKR" Name="creditkind_id" FieldName="creditkind_id" VisibleIndex="8" ></dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption ="JSU" Name="sector_id" FieldName="sector_id" VisibleIndex="9" ></dx:GridViewDataComboBoxColumn>
                
                <dx:GridViewCommandColumn Caption="Opr." Name="Opr." VisibleIndex="10" ButtonType="Image">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="Detail" Text="Tambah" Visibility="AllDataRows" Image-ToolTip="tambah">
                                <Image Url="~/content/images/new.png"></Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons> 
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption ="Cabang" Name="branch_code" FieldName="branch_code" VisibleIndex="11" ></dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn Caption="Userlog" Name="Created_by" FieldName="Created_by"  VisibleIndex="12" ></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Userlog" Name="asd" FieldName="iscair"  Visible="false" ></dx:GridViewDataTextColumn>
            </Columns>
            <settings ShowFilterRow="true" ShowFilterRowMenu="true" />
            <SettingsDataSecurity AllowDelete="False" />
            <SettingsPager AlwaysShowPager="True">
            </SettingsPager>
            <Styles>
                <CommandColumn Spacing="5px" />
                <EditingErrorRow HorizontalAlign="Right">
                </EditingErrorRow>
            </Styles>
            <StylesPager>
                <CurrentPageNumber BackColor="#FB000C">
                </CurrentPageNumber>
                </StylesPager>
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

    <uc1:ListKemitraanAll runat="server" id="ListKemitraanAll" />
</asp:Content>
