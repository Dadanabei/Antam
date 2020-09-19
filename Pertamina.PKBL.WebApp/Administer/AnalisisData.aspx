<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="AnalisisData.aspx.cs" Inherits="Pertamina.PKBL.WebApp.AnalisisData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%=this.ResolveUrl("~/content/datepicker.css")%>" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" >
        <h2 class="page-header">Analisis Data</h2>

        <div class="row" role="form">
            <ol>
                <% for (int i = 0; i < Links.Length;i++) { %>
                <li>
                    <a href="<%=ResolveUrl( Urls[i] )%>"><%=Links[i] %></a>
                </li>
                <% } %>
            </ol>
        </div>
        <div class="row">
            
        </div>
    </div>
    <script type="text/javascript" src="<%=ResolveUrl("~/scripts/bootstrap-datepicker.js") %>"></script>
    <script type="text/javascript">$('.datepicker').datepicker(); $('#dp01').datepicker();</script>
</asp:Content>
