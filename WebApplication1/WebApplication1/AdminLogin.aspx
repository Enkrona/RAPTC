<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebApplication1.AdminLogin1" %>


<!DOCTYPE html>
<html>
<head runat="server">
	<title>AdminLogin</title>
	<script runat="server">
	
	</script>
    <style type="text/css">
        #form1 {
            height: 255px;
        }
    </style>
</head>
<body bgcolor="#006747">
	<form id="form1" runat="server">
	<font color="white"><p> This is a test landing page for an admin</p></font>
        <p> &nbsp;</p> 
	    <font color="white">Admin Credentials:</font>
        <asp:TextBox ID="txtAdminUserName" runat="server" Width="214px" ></asp:TextBox>
        <br />
        <br />
        <font color="white">Admin Password:</font>
        <asp:TextBox ID="txtAdminPass" runat="server" Height="22px" style="margin-left: 9px" TextMode="Password" Width="214px"></asp:TextBox>
        <br />
        <br />
        <div style="margin-left: 160px">
            <asp:Button ID="Login" runat="server" OnClick="Button1_Click" Text="Login" />
        </div>
        <br />
	</form>
</body>
</html>
