<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="HibahCheckList.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.DetailPenerimaanProposal" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/Checklist.ascx" TagPrefix="uc1" TagName="Checklist" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="html_header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
<style>
    td{
        padding:0px 10px 10px 0px;
    }
</style>
        <style>
        td {
            /*padding: 0px 40px 10px 0px;*/
            width: 400px;
        }
        table {
            width: 80%;
        }
    </style>
    <script type="text/javascript">

        function OnTextChanged(s, e) {
            a = parseInt(hUang.GetText(), 10);
            b = parseInt(hPersediaan.GetText(), 10);
            c = parseInt(hPiutang.GetText(), 10);
            d = parseInt(hPeralatan.GetText(), 10);
            e = parseInt(hKendaraan.GetText(), 10);
            total = a + b + c + d + e;
            hTotalAktiva.SetText(total);


            f = parseInt(hHutangDagang.GetText(), 10);
            g = parseInt(hModal.GetText(), 10);
            totalPasiva = f + g;
            hTotalPasiva.SetText(totalPasiva);

            jTotalAgunan.SetText(parseInt(jHargaTanah.GetText(), 10) + parseInt(jNilaiTanah.GetText(), 10) + parseInt(jNilaiBangunan.GetText(), 10));
        }


        function showProfile() {
            popup.Show();
        }
    </script>
    <%--<div style="margin:10px 20px;">
        <h2 class="page-header">Checklist Persyaratan</h2>
    </div>--%>
    
    <br />
    <dx:ContentControl ID="ContentControl6" runat="server">
        <div class="tabContent">
            <div style="margin:10px 10px;">
            <h2 class="page-header">Checklist Persyaratan</h2>
                </div>
            <uc1:Checklist runat="server" ID="Checklist" />
        </div>
    </dx:ContentControl>
    <%--    <dx:ASPxPageControl Theme="Youthful" ID="ASPxTabControl1" runat="server" ActiveTabIndex="0" Width="100%">
            <TabPages>                
                <dx:TabPage Text="Checklist">
                    <ContentCollection>
                        
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>--%>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
