<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AddKantorCabangRek.aspx.cs" Inherits="Pertamina.PKBL.WebApp.AddKantorCabangRek" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Add/Edit Kantor Cabang</h2>
        
        <div class="row">
            <div class="col-md-10" style="overflow-x:scroll;">
                <img src="<%=ResolveUrl("~/content/images/ss/admin-pkbl-kantorcabang-edit-rek.jpg") %>" />
            </div>
        </div>
        <hr />
        <div style="margin-top:30px;">
            <a href="<%=ResolveUrl("~/Administer/AddKantorCabang.aspx") %>" style="opacity:0.3;">(detil)</a>
        </div>
    </div>
</asp:Content>
