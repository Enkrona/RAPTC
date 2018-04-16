<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="WebApplication1.UserReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>        
    <style type="text/css">
        #button {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 id="button">Example User Report</h1>
        <asp:RadioButton ID="radio_week" runat="server" Text="This Week" />
        <asp:RadioButton ID="radio_month" runat="server" Text="This Month" /><br />
        <asp:Label ID="label_UserID" runat="server"></asp:Label><br />
        <asp:Label ID="label_First" runat="server"></asp:Label><br />
        <asp:Label ID="label_Last" runat="server"></asp:Label><br />
        <asp:Label ID="label_TimeSpan" runat="server"></asp:Label><br />
        <asp:Table ID="table_report" runat="server">
        </asp:Table>
        <br/> <br/>
        <asp:Label ID="label_timeWorked" runat="server" Text="<b>Total Time Worked This Pay Period: </b>"></asp:Label> <br />
        <asp:Label ID="label_roundedTimeWorked" runat="server" Text="<b>Total Rounded Time Worked This Pay Period: </b>"></asp:Label> 

        <asp:Button ID="button_generate" runat="server" OnClick="Button2_Click" Text="Generate Reports" />
        <div id="button">
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
