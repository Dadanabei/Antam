<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AddJenisBL.aspx.cs" Inherits="Pertamina.PKBL.WebApp.AddJenisBL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Jenis Bina Lingkungan</h2>

        <div class="row">
            <div class="col-md-3 form-group">
                <label>Deskripsi</label>
                <input type="text" class="form-control" />
            </div>
            <div class="col-md-3 form-group">
                <label>Keterangan</label>
                <input type="text" class="form-control" />
            </div>
        </div>
        <% if (this.Request.QueryString["id"] != null && this.Request.QueryString["id"].ToString() != "0")
        { %>
            <div class="row">
                <div class="col-md-3 form-group">
                    <button type="button" class="btn btn-default" onclick="$(this).children().first().toggle().next().toggle();">
                        <i class="fa fa-check-square-o fa-fw"></i><i class="fa fa-square-o fa-fw" style="display:none;"></i>
                        <span> Aktif</span>
                    </button>
                </div>
            </div>
        <% } %>
        <div class="row">
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary">
                    <i class="fa fa-save"></i>
                    <span> SUBMIT</span>
                </button>
            </div>
        </div>
    </div>
</asp:Content>
