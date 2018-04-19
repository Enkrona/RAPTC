<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewActiveUsers.aspx.cs" Inherits="WebApplication1.ViewActiveUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>Active Users</title>        
    <style type="text/css">
        #aus {
            text-align: center;
        }
        #clock {
            width: 921px;
        }
        #center {
            text-align: center;
            background-color: #005467;
            color: white;
        }
        #centercol {
            text-align:center;
            align-content:center;
            align-items:center;
            align-self:center;
        }
        #leftcol {
            text-align:left;
            align-content:flex-start;
            align-items:flex-start;
            align-self:flex-start;
        }
        #rightcol {
            text-align:right;
            align-content:flex-end;
            align-items:flex-end;
            align-self:flex-end;
        }
        .auto-style1 {
            width: 107px;
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
        }
        .button2:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
        }   
        </style>
    </style>
</head>
<body bgcolor="#006747">
    <form id="form1" runat="server">
	<header>
        <h1 id="center" style="font-family: 'Open Sans', sans-serif;">Active Users</h1>
    </header>
        <br />
        <asp:Label ID="empty_warning" runat="server" style="font-family: 'Open Sans', sans-serif;" Font-Bold="true" Font-Overline="False" Font-Size="XX-Large" Font-Underline="False" ForeColor="Red" Text="No active users!" Visible="False"></asp:Label>
        <asp:Table ID="table_activeusers" color="white" style="font-family: 'Open Sans', sans-serif; color: white" runat="server">
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
            <asp:Button ID="Button1" class="button button2" runat="server" style="font-family: 'Open Sans', sans-serif;" Text="Back" OnClick="Button1_Click"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="RefreshBttn" class="button button2" runat="server" style="font-family: 'Open Sans', sans-serif;" OnClick="RefreshBttn_Click" Text="Refresh Users" />
        </p>
    </form>
</body>
</html>
