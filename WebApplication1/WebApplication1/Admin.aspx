<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<!DOCTYPE html>
<script runat="server">

	protected void Page_Load(object sender, EventArgs e)
	{
        getuserDDL(sender, e);

        getUserRole();

	}
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>Admin Page</title>
	<style type="text/css">
        #form1 {
            height: 524px;
            width: 962px;
            float: left;
            margin-left: 15px;
          
        }
        #form2 {
            width: 1020px;
            margin-right: 362px;
            margin-top: 0px;
            height: 582px;
            margin-bottom: 3px;
        }
                
        #center {
            text-align: center;
            background-color: #005467;
            color: white;
        }
        
        #form2 {
            height: 13px;
            width: 405px;
            float: left;
        }
        .button {  
                float:unset;
                border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #4CAF50;
                color: white;
                border-radius: 8px;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px 4px 5px;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
            }
            .button2:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }           
        .auto-style3 {
            
            margin-right: 0px;
        }
        </style>
</head>
<body bgcolor="#006747">
    	
	<header>
        <h1 id="center" style="font-family: 'Open Sans', sans-serif;">Administrator</h1>
    </header>
    <form id="form1" runat="server" class="auto-style3">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <img src="logo.png" align="right" style="height: 578px; width: 699px; margin-left: 4px; float: left;" /> -->
		<br />
	
			<asp:Label ID="LoggedInUsersLbl" runat="server" style="font-family: 'Open Sans', sans-serif;" Font-Size="Large" Font-Underline="True" ForeColor="White" Text="All Users" Visible="False"></asp:Label>
	
			<br />

	    <asp:DropDownList ID="UsersDDL" style="font-family: 'Open Sans', sans-serif;" placeholder="Select Name" runat="server">
            </asp:DropDownList>
			<br />
	
		&nbsp;<br />
        <asp:Button class="button button2" ID="viewReportsButton" runat="server" Text="View Reports" Width="169px" OnClick="viewReportsButton_Click" Height="51px" style="margin-left: 0px; margin-top: 0px; font-family: 'Open Sans', sans-serif;" />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<br />
		&nbsp;<br />

	    <br />
        <br />

        <div id="buttons" runat="server">
			<br />
			
	
		 <asp:Button class="button button2" ID="editUsrBttn" runat="server" style="font-family: 'Open Sans', sans-serif;" Text="Edit Users" Width="169px" OnClick="editUsrBttn_Click" Height="51px" />
		&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button class="button button2" ID="AddUsrBttn" runat="server" style="font-family: 'Open Sans', sans-serif;" OnClick="Button1_Click" Text="Add User" Height="51px" Width="169px" />
            <asp:Button ID="editShiftsBttn" runat="server" OnClick="editShiftsBttn_Click" Text="Edit Shifts" />
			<br />
			<br />
        <asp:Button class="button button2" ID="InputTimeBttn" style="font-family: 'Open Sans', sans-serif;" runat="server" OnClick="InputTimeBttn_Click" Text="Input Time" Height="51px" Width="169px" />
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button class="button button2" style="font-family: 'Open Sans', sans-serif;" ID="ViewActiveUsersBttn" runat="server" OnClick="ViewActiveUsersBttn_Click" Text="View Active Users" Height="51px" Width="206px" />
            <br />
            <br />
            <br />
        <br />
			<br />
        <asp:Button class="button button2" ID="logoutBttn" style="font-family: 'Open Sans', sans-serif;" runat="server" OnClick="Button4_Click" Text="Logout" />

			<br />
			<br />
			<br />
			<br />
			<br />
	
		&nbsp;<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<br />
&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<br />
        <br />
		&nbsp;<br />

	    <br />
        <br />

	</div>
    </form>
</body>
</html>
