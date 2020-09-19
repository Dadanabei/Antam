<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PersetujuanHibah.aspx.cs" Inherits="Pertamina.PKBL.WebApp.PersetujuanHibah" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Persetujuan Hibah Program Kemitraan</h2>
        
        <div class="row">
            <div class="col-md-10" style="overflow-x:scroll;">
                <img id="img01" src="<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-persetujuan-daftardise7i.jpg") %>" />
            </div>
        </div>
        <hr />
        <div style="margin-top:30px;opacity:0.35;">
            <a href="#" oncl\ick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-persetujuan-daftarditolak.jpg") %>'">(daftar ditolak)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-persetujuan-daftarditolak(edit).jpg") %>'">(daftar ditolak &rArr; details)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-persetujuan(tambah).jpg") %>'">(tambah)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-persetujuan(tambah-tambah).jpg") %>'">(tambah &rArr; tambah)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-persetujuan-daftardise7i(edit).jpg") %>'">(edit)</a>
            <span> | </span>
            <a href="#" onclick="document.getElementById('img01').src='<%=ResolveUrl("~/content/images/ss/programkemitraan-hibah-persetujuan-daftardise7i.jpg") %>'">(list)</a>
        </div>
    </div>
</asp:Content>
