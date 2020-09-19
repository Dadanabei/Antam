<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AddKantorCabang.aspx.cs" Inherits="Pertamina.PKBL.WebApp.AddKantorCabang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Add/Edit Kantor Cabang</h2>
        
        <div class="row">
            <div class="col-md-10" style="overflow-x:scroll;">
                <img src="<%=ResolveUrl("~/content/images/ss/admin-pkbl-kantorcabang-edit.jpg") %>" />
            </div>
        </div>
        <hr />
        <div style="margin-top:30px;">
            <a href="<%=ResolveUrl("~/Administer/AddKantorCabangRek.aspx") %>" style="opacity:0.3;">(rekening)</a>
        </div>
    </div>
</asp:Content>
