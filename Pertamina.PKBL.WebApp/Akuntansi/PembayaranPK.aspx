<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PembayaranPK.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.PembayaranPK" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <script type="text/javascript">
        function Change(s, e) {
            if (e.buttonID == 'daftarangsur') {
                debugger;
                gvPembayaran.GetRowValues(e.visibleIndex, 'proposal_number', fc);
            }
            else {
                e.processOnServer = true;
            }

        }

        function fc(values) {
            window.open('DaftarAngsuran.aspx?prop=' + values);
        }

</script>
    <dx:ASPxGridView ID="gvPembayaran" ClientIDMode="Static" ClientInstanceName="gvPembayaran" runat="server" OnCustomButtonCallback="gvPembayaran_CustomButtonCallback" 
         Theme="Youthful" AutoGenerateColumns="False" Width="100%" SettingsBehavior-AllowFocusedRow="true"  ClientSideEvents-CustomButtonClick="Change"
        KeyFieldName="proposal_number" OnCustomButtonInitialize="gvPembayaran_CustomButtonInitialize">
        <Columns>
            <dx:GridViewDataTextColumn Caption="prop" Name="proposal_number" FieldName="proposal_number" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="No. Debitur" Name="mitraid" FieldName="mitraid" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama" Name="requestor_name" FieldName="requestor_name" VisibleIndex="1" Settings-FilterMode="DisplayText">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nama Usaha" Name="company_name" FieldName="company_name" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Alamat" Name="requestor_address" FieldName="requestor_address" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tgl. Akad" VisibleIndex="4" Name="tglAkad" FieldName="tglAkad" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn Caption="Jt. Tempo" VisibleIndex="5" Name="TglJatuhTempo" FieldName="TglJatuhTempo" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Jk. Wkt" VisibleIndex="6" Name="Jangka" FieldName="Jangka">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Realisasi" VisibleIndex="7" Name="NilaiSetuju" FieldName="NilaiSetuju" PropertiesTextEdit-DisplayFormatString="##,#.00">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Init" Name="Init" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn Caption="Opr." Name="Opr." VisibleIndex="9" ButtonType="Image" Width="50">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="Tambah" Text="Tambah" Visibility="AllDataRows" > 
                            <Image Url="~/content/images/new.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                    <dx:GridViewCommandColumnCustomButton ID="daftarangsur" Text="Tambah" Visibility="AllDataRows" > 
                        <Image Url="~/content/images/checklist.png"></Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn Caption=" " VisibleIndex="10">
                <CustomButtons>
                     <dx:GridViewCommandColumnCustomButton ID="Kartu" Text="Kartu" Visibility="AllDataRows" >
                            <Image Url="~/content/images/checklist.png"></Image>
                        </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="User Log" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <CommandColumn Spacing="5px" />
            </Styles>
            <SettingsPager AlwaysShowPager="true" PageSize="30"></SettingsPager>
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
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
