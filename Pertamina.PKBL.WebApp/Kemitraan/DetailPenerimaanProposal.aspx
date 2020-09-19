<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailPenerimaanProposal.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Kemitraan.DetailPenerimaanProposal" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/DataPribadi.ascx" TagPrefix="uc1" TagName="DataPribadi" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/DataUsaha.ascx" TagPrefix="uc1" TagName="DataUsaha" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/DataPenjamin.ascx" TagPrefix="uc1" TagName="DataPenjamin" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/DataAgunan.ascx" TagPrefix="uc1" TagName="DataAgunan" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/Administrasi.ascx" TagPrefix="uc1" TagName="Administrasi" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/BidangUsaha.ascx" TagPrefix="uc1" TagName="BidangUsaha" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/Checklist.ascx" TagPrefix="uc1" TagName="Checklist" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/Files.ascx" TagPrefix="uc1" TagName="Files" %>
<%@ Register Src="~/Kemitraan/PenerimaanPropsalControl/HasilInventarisasi.ascx" TagPrefix="uc1" TagName="HasilInventarisasi" %>
<%@ Register Src="~/Kemitraan/profile.ascx" TagName="profileUserControl" TagPrefix="uc1" %>

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
    <div style="margin:10px 20px;">
        <asp:LinkButton ID="linkProfile" runat="server" OnClientClick="showProfile();return false;" CssClass="linkOff" Font-Size="Medium" ForeColor="Blue" CausesValidation="false">Profile</asp:LinkButton>                                           
    </div>
    
    <br />
        <dx:ASPxPageControl Theme="Youthful" ID="ASPxTabControl1" runat="server" ActiveTabIndex="0" Width="100%">
            <TabPages>
                <dx:TabPage Text="Data Pribadi">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div class="tabContent">
                                <uc1:DataPribadi runat="server" ID="DataPribadi" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Data Usaha">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl1" runat="server">
                            <div class="tabContent">
                                <uc1:DataUsaha runat="server" ID="DataUsaha" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Data Penjamin">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server">
                            <div class="tabContent">
                                <uc1:DataPenjamin runat="server" ID="DataPenjamin" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Data Agunan">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl3" runat="server">
                            <div class="tabContent">
                                <uc1:DataAgunan runat="server" ID="DataAgunan" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Administrasi">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl4" runat="server">
                            <div class="tabContent">
                                  
                                <uc1:Administrasi runat="server" ID="Administrasi" />
                          
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Bidang Usaha">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl5" runat="server">
                            <div class="tabContent">
                                <uc1:BidangUsaha runat="server" ID="BidangUsaha" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Checklist">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl6" runat="server">
                            <div class="tabContent">
                                <uc1:Checklist runat="server" ID="Checklist" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Files">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl7" runat="server">
                            <div class="tabContent">
                                <uc1:Files runat="server" ID="Files" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Hasil Inventarisasi">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl8" runat="server">
                            <div class="tabContent">
                                <uc1:HasilInventarisasi runat="server" ID="HasilInventarisasi" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>

    <dx:ASPxPopupControl ID="ASPxPopupControl1" HeaderText="Profile" runat="server"
        ClientInstanceName="popup" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto"
        Height="600px" Width="700px"
        EnableViewState="False">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel1" runat="server">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <uc1:profileUserControl runat="server" ID="profileUserControl" />
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
