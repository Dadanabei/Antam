<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TransaksiKasBank.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Akuntansi.WebForm5" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Akuntansi/JurnalTransaksiKasbank/DaftarKasBank.ascx" TagPrefix="uc1" TagName="DaftarKasBank" %>
<%@ Register Src="~/Akuntansi/JurnalTransaksiKasbank/PostingKasBank.ascx" TagPrefix="uc1" TagName="PostingKasBank" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div>
        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        <dx:aspxpagecontrol ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%" Theme="Youthful">
            <TabPages>
                <dx:TabPage Text="Daftar">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div class="tabContent">
                                <uc1:DaftarKasBank runat="server" ID="DaftarKasBank" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>             
                <dx:TabPage Text="Jurnal">
                    <ContentCollection>
                        <dx:ContentControl runat="server" >
                            <div class="tabContent">
                                <uc1:PostingKasBank runat="server" ID="PostingKasBank" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
             </TabPages>        
    </dx:aspxpagecontrol>

    </div>
</asp:Content>
