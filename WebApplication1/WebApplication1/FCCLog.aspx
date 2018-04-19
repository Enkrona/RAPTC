<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FCCLog.aspx.cs" Inherits="WebApplication1.FCCLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>FCC Log</title>
    <style type="text/css">
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
</head>

<body bgcolor="#006747">
    <form id="form1" runat="server">
        <div>
            <header>
                <h1 id="center" style="font-family: 'Open Sans', sans-serif;">Welcome to the FCC Log Page</h1>
            </header>
            <br />
            <p style="color: white; font-family: 'Open Sans', sans-serif;">Located below is the log of all FCC codes input:</p><br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" Width="122px">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    
                </Columns>
            </asp:GridView>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="FCCLogData.xml"></asp:XmlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="returnBttn" style="color: white; font-family: 'Open Sans', sans-serif;" runat="server" OnClick="returnBttn_Click" Text="Return Home" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>
