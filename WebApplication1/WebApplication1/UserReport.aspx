<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="WebApplication1.UserReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>User Report</title>        
    <style type="text/css">
        #button {
            text-align: center;
        }
        #clock {
            width: 921px;
        }
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
<body>
    <form id="form1" runat="server">
        <header>
            <h1 id="center" style="font-family: 'Open Sans', sans-serif;">User Report</h1>
        </header>
        <asp:RadioButton ID="radio_week" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server" Text="This Week" />
        <asp:RadioButton ID="radio_month" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server" Text="This Month" /><br />
        <asp:Label ID="label_UserID" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server"></asp:Label><br />
        <asp:Label ID="label_First" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server"></asp:Label><br />
        <asp:Label ID="label_Last" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server"></asp:Label><br />
        <asp:Label ID="label_TimeSpan" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server"></asp:Label><br />
        <asp:Table ID="table_report" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server">
        </asp:Table>
        <br/> <br/>
        <asp:Label ID="label_timeWorked" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server" Text="<b>Total Time Worked This Pay Period: </b>"></asp:Label> 
        <br />
        <br />
        <asp:Label ID="label_roundedTimeWorked" color="white" style="font-family: 'Open Sans', sans-serif;" runat="server" Text="<b>Total Rounded Time Worked This Pay Period: </b>"></asp:Label> 

        <br />
        <br />

        <asp:Button ID="button_generate" class="button button2" runat="server" OnClick="Button2_Click" style="font-family: 'Open Sans', sans-serif;" Text="Generate Report" />
        <div id="button">
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" class="button button2" runat="server" Text="Back" color="white" style="font-family: 'Open Sans', sans-serif;" OnClick="Button1_Click"/>
        </p>
    </form>
</body>
</html>