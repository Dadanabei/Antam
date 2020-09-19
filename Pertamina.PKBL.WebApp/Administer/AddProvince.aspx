<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AddProvince.aspx.cs" Inherits="Pertamina.PKBL.WebApp.AddProvince" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <h2 class="page-header">Add/Edit Propinsi</h2>
        
        <div class="row">
            <div class="col-md-3 form-group">
                <label>Kode</label>
                <input type="text" class="form-control" />
            </div>
            <div class="col-md-3 form-group">
                <label>Propinsi</label>
                <input type="text" class="form-control" />
            </div>
            <div class="col-md-3 form-group">
                <label>Ibu Kota</label>
                <input type="text" class="form-control" />
            </div>
        </div>
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
