<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FCCLog.aspx.cs" Inherits="WebApplication1.FCCLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
</head>

<body bgcolor="#006747">
    <form id="form1" runat="server">
        <div>
            <h1>Welcome to the FCC Log Page</h1>
            <br />
            <p>Located below is the log of all FCC codes input:</p><br />
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
    </form>
</body>
</html>
