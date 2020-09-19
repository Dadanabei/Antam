<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PenilaianSurvey.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PenilaianSurvey" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJKR.ascx" TagPrefix="uc1" TagName="ListKemitraanJKR" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJDB.ascx" TagPrefix="uc2" TagName="ListKemitraanJDB" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanJSU.ascx" TagPrefix="uc3" TagName="ListKemitraanJSU" %>    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <dx:ASPxGridView ID="gvPenilaianSurvey" OnPageIndexChanged="gvPenilaianSurvey_PageIndexChanged" Theme="Youthful" Width="100%" OnRowUpdating="gvPenilaianSurvey_RowUpdating"  runat="server" KeyFieldName="proposal_number" OnCustomButtonCallback="gvPenilaianSurvey_CustomButtonCallback" OnCustomButtonInitialize="gvPenilaianSurvey_CustomButtonInitialize">
        <Settings ShowFilterRowMenu="true" ShowFilterRow="true" />
        <SettingsPager AlwaysShowPager="true"></SettingsPager>
        <SettingsCommandButton>
            <UpdateButton>
                <Image ToolTip="update" Url="../content/images/assembly-exist.png"></Image>
            </UpdateButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewDataColumn Caption="No. Ref" VisibleIndex="0" FieldName="proposal_number" Name="proposal_number"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Nama" VisibleIndex="1" FieldName="name"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Nama Usaha" VisibleIndex="2" FieldName="nama_usaha"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Alamat Usaha" VisibleIndex="3" FieldName="alamat_usaha"></dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn Caption="Jmlh Kredit" VisibleIndex="4" FieldName="jmlh_kredit">
                <PropertiesTextEdit DisplayFormatString="##,#.00"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="JKR" VisibleIndex="5" FieldName="JKR"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="JDB" VisibleIndex="6" FieldName="JDB"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="JSU" VisibleIndex="7" FieldName="sektor_usaha"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Keputusan" VisibleIndex="8" FieldName="Keputusan"></dx:GridViewDataComboBoxColumn>
            <dx:GridViewCommandColumn Caption="Opr." ShowUpdateButton="true" VisibleIndex="9" ButtonType="Image" Name="opr">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="Tambah" Text="TAMBAH" Visibility="AllDataRows" Image-ToolTip="tambah">
                        <Image Url="~/content/images/new.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>                  
            </dx:GridViewCommandColumn>
            <dx:GridViewDataColumn Caption="Cabang" VisibleIndex="10" FieldName="branch_code"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="User Log" VisibleIndex="11" FieldName="user_log" ></dx:GridViewDataColumn>
        </Columns>
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
    <br />
    <br />
    <table>
        <tr>
            <td>
                <p><b>Keterangan</b></p>
            </td>
        </tr>
        <tr>
            <td class="peding">
                <uc1:ListKemitraanJKR runat="server" id="ListKemitraanJKR" />
            </td>
            <td class="peding">
                <uc2:ListKemitraanJDB runat="server" id="ListKemitraanJDB" />
            </td>
            <td>
                <uc3:ListKemitraanJSU runat="server" id="ListKemitraanJSU" />
            </td>
        </tr>
    </table>
</asp:Content>
