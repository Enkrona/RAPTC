<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="WebApplication1.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>Add User</title>
    <style type="text/css">
           #center {
                text-align: center;
                background-color: #005467;
                color: white;
                font-family: 'Open Sans', sans-serif;
            }
            .button {
                background-color: #006714;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                border-radius: 8px;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                font-family: 'Open Sans', sans-serif;
            }
            .button2:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }  
    </style>
</head>


<body bgcolor="#006747">
    <form id="form1" runat="server">
        <header>
            <h1 id="center">Please fill out the form below to Add a User</h1>
        </header>
        <div>
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="Medium" ForeColor="White" Text="S#: " style="font-family: 'Open Sans', sans-serif;"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="SNumTxtBx" placeholder="Add S#..." runat="server" MaxLength="7" Width="165px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="Medium" ForeColor="White" Text="First Name:" style="font-family: 'Open Sans', sans-serif;"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="FNameTxtBx" placeholder="Add First Name..." runat="server" MaxLength="30" Width="165px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Font-Size="Medium" ForeColor="White" Text="Last Name:" style="font-family: 'Open Sans', sans-serif;"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="LNameTxtBx" placeholder="Add a Last Name..." runat="server" MaxLength="30" Width="165px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Size="Medium" ForeColor="White" Text="User Role:" style="font-family: 'Open Sans', sans-serif;"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="RoleDDL" runat="server" placeholder="Select Role...">
                <asp:ListItem Text="Regular User" Value="0"></asp:ListItem>
                <asp:ListItem Text="Time Admin" Value="1"></asp:ListItem>
                <asp:ListItem Text="Super Time Admin" Value="2"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="WarningLbl" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Font-Underline="False" ForeColor="Red" Text="User already exists" Visible="False" style="font-family: 'Open Sans', sans-serif;"></asp:Label>
            <br />
            <br />
            <asp:Button class="button button2" ID="CreateUserBttn" runat="server" OnClick="CreateUserBttn_Click" Text="Create User"  style="font-family: 'Open Sans', sans-serif;"/>

            <br />
            <br />
            <asp:Button class="button button2" ID="SuccessBttn" runat="server" OnClick="SuccessUserBttn_Click" Text="Ok" Visible="False"  style="font-family: 'Open Sans', sans-serif;"/>



        </div>
    </form>
</body>
</html>
