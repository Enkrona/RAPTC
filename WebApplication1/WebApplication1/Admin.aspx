<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<!DOCTYPE html>
<script runat="server">

	protected void TextBox1_TextChanged(object sender, EventArgs e)
	{

	}
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#006747">
    <form id="form1" runat="server">
        <div>
           <font color="white"> <p align="center"> This page is a place-holder for an admin view</p> </font>
        </div>
    	<asp:Button ID="Button1" runat="server" Text="Button" />
		<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
    &nbsp;&nbsp;&nbsp; looks good?</form>
</body>
</html>
