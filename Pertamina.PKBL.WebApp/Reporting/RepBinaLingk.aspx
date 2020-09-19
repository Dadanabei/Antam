<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RepBinaLingk.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Reporting.RepBinaLingk" %>

<%@ Register Src="~/Reporting/RepBinaLingUserControl/RepUsulanBinaLingUserControl.ascx" TagPrefix="uc1" TagName="RepUsulanBinaLingUserControl" %>
<%@ Register Src="~/Reporting/RepBinaLingUserControl/RepRealisasiBinaLingUserControl.ascx" TagPrefix="uc1" TagName="RepRealisasiBinaLingUserControl" %>
<%@ Register Src="~/Reporting/RepBinaLingUserControl/RepArusDanaProgramBinaLingUserControl.ascx" TagPrefix="uc1" TagName="RepArusDanaProgramBinaLingUserControl" %>
<%@ Register Src="~/Reporting/RepBinaLingUserControl/RepPerkembanganBinaLingUserControl.ascx" TagPrefix="uc1" TagName="RepPerkembanganBinaLingUserControl" %>
<%@ Register Src="~/Reporting/RepBinaLingUserControl/RepRekapLaporanPerPropinsiUserControl.ascx" TagPrefix="uc1" TagName="RepRekapLaporanPerPropinsiUserControl" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v13.2.Web, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div id="page-wrapper" style="width:100%">
        <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
        <h2 class="page-header">Laporan Bina Lingkungan</h2>
        <dx:ASPxPageControl ID="ASPxTabControl1" runat="server" Theme="Youthful" ActiveTabIndex="0">
            <TabPages>
                  <dx:TabPage Text="Laporan Usulan Bina Lingkungan">
                    <ContentCollection>                    
                        <dx:ContentControl runat="server">
                        <div style="overflow-x:scroll; max-width:1200px;width:1200px">
                              <uc1:RepUsulanBinaLingUserControl runat="server" id="RepUsulanBinaLingUserControl" />                          
                        </div>
                        </dx:ContentControl>                    
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Laporan Realisasi Bina Lingkungan">
                    <ContentCollection>                    
                        <dx:ContentControl runat="server">
                        <div style="overflow-x:scroll; max-width:1200px">
                           <uc1:RepRealisasiBinaLingUserControl runat="server" id="RepRealisasiBinaLingUserControl" />                          
                        </div>
                        </dx:ContentControl>                    
                    </ContentCollection>
                </dx:TabPage>
                <%--<dx:TabPage Text="Laporan Perkembangan Program Bina Lingkungan">
                    <ContentCollection>                    
                        <dx:ContentControl runat="server">
                        <div style="overflow-x:scroll; max-width:1200px">
                           <uc1:RepPerkembanganBinaLingUserControl runat="server" id="RepPerkembanganBinaLingUserControl" />                          
                        </div>
                        </dx:ContentControl>                    
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Laporan Arus dana Program Bina Lingkungan">
                    <ContentCollection>
                    
                        <dx:ContentControl runat="server">
                        <div style="overflow-x:scroll; max-width:1200px">
                           <uc1:RepArusDanaProgramBinaLingUserControl runat="server" id="RepRealisasiBinaLingUserControl2" />
                          
                        </div>
                        </dx:ContentControl>
                    
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Rekap Laporan Per Propinsi">
                    <ContentCollection>
                    
                        <dx:ContentControl runat="server">
                        <div style="overflow-x:scroll; max-width:1200px">
                           <uc1:RepRekapLaporanPerPropinsiUserControl runat="server" id="RepRealisasiBinaLingUserControl3" />
                          
                        </div>
                        </dx:ContentControl>
                    
                    </ContentCollection>
                </dx:TabPage>--%>
            
            </TabPages>
        </dx:ASPxPageControl>



    </div>
</asp:Content>
