<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="Pertamina.PKBL.WebApp.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:#1565C0;color:whitesmoke">
    <form id="form1" runat="server">
    <div style="vertical-align:auto;height:auto;font-family:'Segoe UI';padding-left:20%;padding-top:100px">
        
        <div style="font-family:'Segoe UI';text-align:left;font-size:200px;">:( </div>
        <div>
             <div style="font-family:'Segoe UI';text-align:left;font-size:60px;margin-bottom:40px">Oops.. </div>
            
            PKBL Online is error because 
        <asp:Label ID="errorlabel" Text=""  runat="server" Font-Names="Segoe UI" Font-Size="Medium" />
        </div><br />
        <div style="font-family:'Segoe UI';text-align:left;font-size:medium;">
            Please contact <a style="color: white;" href="mailto:servicedesk@pertamina.com?Subject=[PKBL]">servicedesk@pertamina.com</a> to report this issue
        </div>
    </div>
    </form>
</body>
</html>
