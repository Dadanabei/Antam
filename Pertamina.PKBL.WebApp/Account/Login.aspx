<%@ Page Title="" Language="C#" MasterPageFile="~/Auth.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Account.Login" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../content/web.ui.panel.css" rel="stylesheet" />
    <link href="../content/web.ui.login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <fieldset>
            <legend>Program Kemitraan & Bina Lingkungan</legend>
    </fieldset>
    <div id="outer">
        <div id="middle">
            <div id="inner">
                <asp:Login ID="Loginform" runat="server" CssClass="AspNet-Login" FailureText="The username or password you entered is incorrect"
                    DestinationPageUrl="Default.aspx" OnLoggedIn="Loginform_LoggedIn" OnAuthenticate="Login1_Authenticate" OnLoad="Loginform_Load">
                    <LayoutTemplate>
                        <div class="web-panel panel-red corner-all shadows">
                            <div class="panel-title">
                                <span class="master-icon icon-16-locked"></span>
                                <h1>Sign In</h1>
                            </div>
                            <div style="font-size: 11px; padding: 10px; clear: both; border-left: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; font-style: italic; color: Red">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="false"></asp:Literal>
                            </div>
                            <div class="panel-content">
                                <ol>
                                    <li>
                                        <asp:Label ID="lb_domain" runat="server" AssociatedControlID="cbbDomain">Domain :</asp:Label>
                                        <dx:ASPxComboBox ID="cbbDomain" runat="server" ValueType="System.String" Theme="Youthful"></dx:ASPxComboBox>
                                    </li>
                                    <li>
                                        <asp:Label ID="lb_UserName" runat="server" AssociatedControlID="UserName">User Name :</asp:Label>
                                        <dx:ASPxTextBox ID="UserName" runat="server" MaxLength="30" ValidationErrorProvider="Icon" ValidationEnabled="True"
                                            ValidationGroup="MasterValidation" />
                                    </li>
                                    <li>
                                        <asp:Label ID="lb_Password" runat="server" AssociatedControlID="Password">Password :</asp:Label>
                                        <dx:ASPxTextBox ID="Password" runat="server" MaxLength="30"
                                            ValidationSettings-ValidationGroup="MasterValidation"
                                            ValidateRequestMode="Enabled" Password="true" />
                                    </li>
                                    <li>
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="MasterValidation" />
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div style="font-size: 11px; padding: 3px; clear: both; font-style: italic; color: Red">
                            <asp:Literal ID="Literal1" runat="server" EnableViewState="false" Text="*Please use your Pertamina Email ID and Password to Log In"></asp:Literal>
                        </div>
                        <div class="browser-placeholder no-float" style="width: 360px; margin-left: 85px;">
                            <div style="float: left; margin: 0 4px 0;">
                                Browser Support :
                            </div>
                            <div style="float: left">
                                <ul class="iconlist ul-horizontal-type">
                                    <li class="horizontal-type"><a class="browser ie" title="IE7 &amp; IE8"></a></li>
                                    <li class="horizontal-type"><a class="browser ff" title="Firefox 3.xx"></a></li>
                                    <li class="horizontal-type"><a class="browser chrome" title="Google Chrome 8.xx &amp; 9.xx"></a></li>
                                    <li class="horizontal-type"><a class="browser opera" title="Opera 11.x"></a></li>
                                    <li class="horizontal-type"><a class="browser safari" title="Safari 5.x"></a></li>
                                </ul>
                            </div>
                        </div>
                    </LayoutTemplate>
                </asp:Login>
            </div>
        </div>
    </div>
</asp:Content>
