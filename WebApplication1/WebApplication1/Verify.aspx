<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Verify.aspx.cs" Inherits="WebApplication1.Verify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>Verify</title>
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
        .auto-style2 {
            z-index: 1;
            left: 11px;
            top: 8px;
            position: absolute;
        }
        </style>
</head>
<body bgcolor="#006747">
    <form id="form1" runat="server">
        <asp:TextBox ID="Username" runat="server" style="z-index: 1; left: 10px; top: 34px; position: absolute; margin-top: 0px"></asp:TextBox>
        <p>
            <asp:TextBox ID="Password" runat="server" style="z-index: 1; left: 10px; top: 92px; position: absolute; margin-top: 0px" TextMode="Password"></asp:TextBox>
            <asp:Label ID="Warning" runat="server" ForeColor="Red" style="z-index: 1; left: 187px; top: 58px; position: absolute; font-family: 'Open Sans', sans-serif;"></asp:Label>
        </p>
        <asp:Label ID="Label1" runat="server" style="color: white; font-family: 'Open Sans', sans-serif;" Text="UserName" CssClass="auto-style2"></asp:Label>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; color: white; left: 14px; top: 65px; position: absolute; font-family: 'Open Sans', sans-serif;" Text="Password"></asp:Label>
        <asp:Button ID="verify_button" class="button button2" runat="server" OnClick="verify_button_Click" style="z-index: 1; left: 15px; top: 127px; position: absolute; font-family: 'Open Sans', sans-serif;" Text="Verify" />
    </form>
</body>
</html>
