<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<!DOCTYPE html>
<script runat="server">

	protected void Page_Load(object sender, EventArgs e)
	{



	}
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
	<style type="text/css">
		#form1 {
			height: 586px;
			width: 405px;
			float: left;
		}
		#form2 {
			width: 1020px;
			margin-left: 436px;
			margin-right: 362px;
			margin-top: 0px;
			height: 582px;
			margin-bottom: 3px;
		}
		.auto-style1 {
			height: 25px;
			font-size: x-large;
			width: 385px;
			margin-left: 5px;
		}
		
		.auto-style2 {
			font-size: xx-large;
		}
		
		#form2 {
			height: 13px;
			width: 405px;
			float: left;
		}
				
		</style>
</head>
<body bgcolor="#006747">
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h1 class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Adminstrator </h1>
    <form id="form1" runat="server">
        <div>
        	<p class="auto-style1">
				Generated data table displays students&nbsp; shift date, time, and clockin times.&nbsp;&nbsp; </p>
			
        </div>

        <%-- start comment
        
		<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="478px" style="margin-left: 6px; margin-top: 32px; margin-right: 22px;" Width="397px" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="LinqDataSource1">
			<AlternatingRowStyle BackColor="White" />
			<Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:DynamicField DataField="UserID" HeaderText="UserID" />
                <asp:DynamicField DataField="Time" HeaderText="Time" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:DynamicField DataField="Comments" HeaderText="Comments" />
            </Columns>
			<EditRowStyle BackColor="#7C6F57" />
			<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
			<RowStyle BackColor="#E3EAEB" />
			<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
			<SortedAscendingCellStyle BackColor="#F8FAFA" />
			<SortedAscendingHeaderStyle BackColor="#246B61" />
			<SortedDescendingCellStyle BackColor="#D4DFE1" />
			<SortedDescendingHeaderStyle BackColor="#15524A" />
		</asp:GridView>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication1.webtimeclockEntities" EntityTypeName="" TableName="activeusers">
        </asp:LinqDataSource>

            end comment --%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <img src="logo.png" align="right" style="height: 578px; width: 699px; margin-left: 4px; float: left;" /> -->
		<br />
	
			<asp:Label ID="LoggedInUsersLbl" runat="server" Font-Size="Large" Font-Underline="True" ForeColor="Black" Text="Logged in users" Visible="False"></asp:Label>
	
			<br />

	    <asp:ListBox ID="ViewDataBox" runat="server" Visible="False" Width="387px"></asp:ListBox>
			<br />
	
		&nbsp;<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<br />
&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
		<br />
        <br />
		&nbsp;<br />

	    <br />
        <br />

        <div id="buttons" runat="server">
			<br />
			<asp:Button ID="viewReportsButton" runat="server" Text="View Reports" Width="92px" OnClick="editUsrBttn_Click" Height="51px" style="margin-left: 0px; margin-top: 0px;" />
	
		&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="editUsrBttn" runat="server" Text="Edit User" Width="92px" OnClick="editUsrBttn_Click" Height="51px" />
		&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="AddUsrBttn" runat="server" OnClick="Button1_Click" Text="Add User" Height="51px" Width="92px" />

			<br />
			<br />
        <asp:Button ID="InputTimeBttn" runat="server" OnClick="InputTimeBttn_Click" Text="Input Time" Height="51px" Width="92px" />
        <br />
        <asp:Button ID="ViewActiveUsersBttn" runat="server" OnClick="ViewActiveUsersBttn_Click" Text="View Active Users" Height="51px" Width="120px" />
			<br />
        <asp:Button ID="logoutBttn" runat="server" OnClick="Button4_Click" Text="Logout" />

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
