<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TransferDanaBank.aspx.cs" Inherits="Pertamina.PKBL.WebApp.TransferDanaBank" %>
<%@ Register Src="~/Akuntansi/TransferDanaBankControl/DaftarTransfer.ascx" TagPrefix="uc1" TagName="Daftar" %>
<%@ Register Src="~/Akuntansi/TransferDanaBankControl/DetailTransfer.ascx" TagPrefix="uc1" TagName="Detail" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div>
        <dx:aspxpagecontrol ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" Width="100%" Theme="Youthful">
        <TabPages>
            <dx:TabPage Text="Daftar">   
                <ContentCollection>
                    <dx:ContentControl runat="server">
                            <div class="tabContent">      
               <uc1:Daftar runat="server" ID="daftar" />
                                 </div>
                        </dx:ContentControl>
                </ContentCollection>
                      
            </dx:TabPage>

            <dx:TabPage Text="Transfer Dana bank">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                            <div class="tabContent">
             <uc1:Detail runat="server" id="detail" />
                            </div>
                        </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:aspxpagecontrol>

    </div>
    
</asp:Content>
