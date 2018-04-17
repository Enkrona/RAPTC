<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InputTime.aspx.cs" Inherits="WebApplication1.InputTime" %>

<!DOCTYPE html>
<html>
     <head> 
        <script type="text/javascript">

            function updateClock() {
                var currentTime = new Date();

                var currentHours = currentTime.getHours();
                var currentMinutes = currentTime.getMinutes();
                var currentSeconds = currentTime.getSeconds();

                // Pad the minutes and seconds with leading zeros, if required
                currentMinutes = (currentMinutes < 10 ? "0" : "") + currentMinutes;
                currentSeconds = (currentSeconds < 10 ? "0" : "") + currentSeconds;

                // Choose either "AM" or "PM" as appropriate
                var timeOfDay = (currentHours < 12) ? "AM" : "PM";

                // Convert the hours component to 12-hour format if needed
                currentHours = (currentHours > 12) ? currentHours - 12 : currentHours;

                // Convert an hours component of "0" to "12"
                currentHours = (currentHours == 0) ? 12 : currentHours;

                // Compose the string for display
                var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;

                // Update the time display
                document.getElementById("clock").firstChild.nodeValue = currentTimeString;
            }

        </script>
        <style type="text/css">
            #clock {
                width: 921px;
            }
            #center {
                text-align: center;
                background-color: gold;
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
            .auto-style1 {
                width: 107px;
            }
            .button {
                background-color: #4CAF50;
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

<body onload="updateClock(); setInterval(&#39;updateClock()&#39;, 1000 )" bgcolor="#006747">

    <form id="form1" runat="server">

    <header>
        <h1 id="center">Welcome back, <%=name()%>!</h1>
    </header>
    <table>
        <colgroup>
            <col width="300px">
            <col width="700px" />
        </colgroup>
        <tbody>
            <tr>
                <td id="leftcol" style="align-content:center; column-width:300px">
                    <h1 id="clock" style="color: white; font-size: 40px; width">10:15:23 AM</h1>
                </td>
                <td id="centercol" style="align-content:center; column-width:auto">
                    <asp:Label ID="ClockedinTime" runat="server" style="z-index: 1; align-self:center; color: white; font-size: 40px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td id="centercol" style="align-content:center; column-width:300px">
                    <h7 style="width: 300px; color: white; align-self:center"><script> document.write(new Date().toLocaleDateString()); </script></h7> 
                </td>
                <td id="centercol" style="align-content:center; column-width:auto">                    
                    <asp:Button class="button button2" ID="Clock" runat="server" OnClick="Button1_Click" style="z-index: 1; align-self:center" Text="ClockIn" />
                </td>
            </tr>
        </tbody>
    </table>

            
            <asp:Button class="button button2" ID="ViewReportBttn" runat="server" OnClick="ViewReportBttn_Click" Text="View Time Report" />
        <br />
        <br />
        <br />
        <br />
        <asp:TextBox ID="FCCtxtBx" runat="server" OnTextChanged="FCCtxtBx_TextChanged" Width="230px"></asp:TextBox>
        <asp:Label ID="WarningText" runat="server" Font-Size="X-Large" ForeColor="Red" Text="Not a Valid FCC Code" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button class="button button2" ID="FCCBttn" runat="server" OnClick="FCCBttn_Click" Text="Enter FCC Code" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button class="button button2" ID="GoToFCCLogBttn" runat="server" OnClick="GoToFCCLogBttn_Click" Text="Go to FCC Log" />
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 425px; top: 333px; position: absolute" Text="Comments:"></asp:Label>
        <br />
        <br />
        <br />
        <asp:TextBox ID="Comments" runat="server" MaxLength="200" style="z-index: 1; left: 419px; top: 369px; position: absolute; width: 278px"></asp:TextBox>
        <br />
        <br />
        <asp:Button class="button button2" ID="logoutBttn" runat="server" OnClick="logoutBttn_Click" Text="Logout" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>