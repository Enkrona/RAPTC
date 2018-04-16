<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="WebApplication1.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#006747">
    <form id="form1" runat="server">
        <div>


            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" ForeColor="White" Text="Please fill out the form below to Add a User"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="Medium" ForeColor="White" Text="S#: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="SNumTxtBx" runat="server" MaxLength="7" Width="117px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="Medium" ForeColor="White" Text="First Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="FNameTxtBx" runat="server" MaxLength="30" Width="165px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="White" Text="Last Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="LNameTxtBx" runat="server" MaxLength="30" Width="165px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Size="Medium" ForeColor="White" Text="User Role:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="RoleDDL" runat="server">
                <asp:ListItem Text="Regular User" Value="0"></asp:ListItem>
                <asp:ListItem Text="Time Admin" Value="1"></asp:ListItem>
                <asp:ListItem Text="Super Time Admin" Value="2"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="WarningLbl" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" Font-Underline="True" ForeColor="Red" Text="User already exists" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="CreateUserBttn" runat="server" OnClick="CreateUserBttn_Click" Text="Create User" />


        </div>
    </form>
</body>
</html>
