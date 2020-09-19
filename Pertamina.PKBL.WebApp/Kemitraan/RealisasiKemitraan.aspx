<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RealisasiKemitraan.aspx.cs" Inherits="Pertamina.PKBL.WebApp.RealisasiKemitraan" %>


<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Kemitraan/RealisasiKemitraanControl/Persetujuan.ascx" TagPrefix="uc1" TagName="Persetujuan" %>
<%@ Register Src="~/Kemitraan/RealisasiKemitraanControl/ListAkad.ascx" TagPrefix="uc1" TagName="ListAkad" %>
<%@ Register Src="~/Kemitraan/ListKemitraan/ListKemitraanAll.ascx" TagPrefix="uc1" TagName="ListKemitraanAll" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
        
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%" Theme="Youthful">
        <TabPages>
            <dx:TabPage Text="Persetujuan">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                            <div class="tabContent">
                            <uc1:Persetujuan runat="server" ID="Persetujuan" />
                            </div>
                        </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <dx:TabPage Text="List Akad">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                            <div class="tabContent">
                                <uc1:ListAkad runat="server" id="ListAkad" />
                            </div>
                        </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
    <uc1:ListKemitraanAll runat="server" ID="ListKemitraanAll" />
</asp:Content>
