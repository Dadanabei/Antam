<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="JurnalUmum.aspx.cs" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Src="~/Akuntansi/JurnalUmumControl/PostingJournal.ascx" TagPrefix="uc1" TagName="PostingJournal" %>
<%@ Register Src="~/Akuntansi/JurnalUmumControl/DaftarJurnalUmum.ascx" TagPrefix="uc1" TagName="DaftarJurnalUmum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <dx:ASPxPageControl Theme="Youthful" ID="ASPxTabControl1" runat="server" ActiveTabIndex="0" Width="100%">
            <TabPages>
                <dx:TabPage Text="Daftar">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div class="tabContent">
                                <uc1:DaftarJurnalUmum runat="server" id="DaftarJurnalUmum" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>             
                <dx:TabPage Text="Jurnal">
                    <ContentCollection>
                        <dx:ContentControl runat="server" >
                            <div class="tabContent">
                                <uc1:PostingJournal runat="server" id="PostingJournal" />
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
             </TabPages>         
    </dx:ASPxPageControl>
    
                            
                        
    
                            
                           
            
    
</asp:Content>
