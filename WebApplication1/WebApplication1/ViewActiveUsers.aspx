<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewActiveUsers.aspx.cs" Inherits="WebApplication1.ViewActiveUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>        
    <style type="text/css">
        #aus {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 id="aus">Active Users</h1>
        <br />
        <asp:Label ID="empty_warning" runat="server" Font-Bold="true" Font-Overline="False" Font-Size="XX-Large" Font-Underline="False" ForeColor="Red" Text="No active users!" Visible="False"></asp:Label>
        <asp:Table ID="table_activeusers" runat="server">
        </asp:Table>
        <br/> <br/>
        <br /> 
        <div id="aus">
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click"/>
        </p>
    </form>
</body>
</html>
