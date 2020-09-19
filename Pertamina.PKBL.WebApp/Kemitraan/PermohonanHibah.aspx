<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PermohonanHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PermohonanHibah" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Hibah</h2>
        
        <div class="row">
            <div class="col-md-10" style="overflow-x:scroll;">
                <img id="img01" src="<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-permohonan(list).jpg") %>" />
            </div>
        </div>
        <hr />
        <div style="margin-top:30px;opacity:0.35;">
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-permohonan(list-checklist).jpg") %>'">(list &rArr; checklist)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-permohonan(list-opr).jpg") %>'">(list &rArr; edit)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-permohonan-tambah.jpg") %>'">(tambah)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-permohonan(list).jpg") %>'">(list)</a>
        </div>
    </div>
</asp:Content>
