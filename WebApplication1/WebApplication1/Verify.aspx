<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="WebApplication1.Verify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:TextBox ID="Username" runat="server" style="z-index: 1; left: 10px; top: 34px; position: absolute; margin-top: 0px"></asp:TextBox>
        <p>
            <asp:TextBox ID="Password" runat="server" style="z-index: 1; left: 10px; top: 92px; position: absolute; margin-top: 0px" TextMode="Password"></asp:TextBox>
            <asp:Label ID="Warning" runat="server" ForeColor="Red" style="z-index: 1; left: 187px; top: 58px; position: absolute"></asp:Label>
        </p>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 11px; top: 8px; position: absolute" Text="UserName"></asp:Label>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 14px; top: 65px; position: absolute" Text="Password"></asp:Label>
        <asp:Button ID="verify_button" runat="server" OnClick="verify_button_Click" style="z-index: 1; left: 15px; top: 127px; position: absolute" Text="Verify" />
    </form>
</body>
</html>
