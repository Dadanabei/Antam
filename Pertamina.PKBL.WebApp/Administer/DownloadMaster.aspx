<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownloadMaster.aspx.cs" Inherits="Pertamina.PKBL.WebApp.Administer.DownloadCityIndexMaster" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="visibility:hidden">
        <dx:ASPxGridView ID="gvCity" runat="server" AutoGenerateColumns="true">
        </dx:ASPxGridView>
    </div>
        <dx:ASPxGridViewExporter ID="gve" GridViewID="gvCity" Landscape="false" runat="server"></dx:ASPxGridViewExporter>
    </form>

    <script>
        window.close();
    </script>
</body>
</html>
