<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="KartuMBBermasalah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.KartuMBBermasalah" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Kartu MB Bermasalah <%=this.Request.Params["area"] %></h2>
        
        <div class="row">
            <div class="col-md-10" style="overflow-x:scroll;">
                <img id="img01" src="<%=ResolveUrl("~/content/images/ss/admin-exportdata-kartumb-bermasalah.jpg") %>" />
            </div>
        </div>
    </div>
</asp:Content>
