<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InputTime.aspx.cs" Inherits="WebApplication1.InputTime" %>

<!DOCTYPE html>
<html>
     <head> 
        <script type="text/javascript">

            function updateClock ( )
            {
              var currentTime = new Date ( );

              var currentHours = currentTime.getHours ( );
              var currentMinutes = currentTime.getMinutes ( );
              var currentSeconds = currentTime.getSeconds ( );

              // Pad the minutes and seconds with leading zeros, if required
              currentMinutes = ( currentMinutes < 10 ? "0" : "" ) + currentMinutes;
              currentSeconds = ( currentSeconds < 10 ? "0" : "" ) + currentSeconds;

              // Choose either "AM" or "PM" as appropriate
              var timeOfDay = ( currentHours < 12 ) ? "AM" : "PM";

              // Convert the hours component to 12-hour format if needed
              currentHours = ( currentHours > 12 ) ? currentHours - 12 : currentHours;

              // Convert an hours component of "0" to "12"
              currentHours = ( currentHours == 0 ) ? 12 : currentHours;

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
        </style>
    </head>

<body onload="updateClock(); setInterval(&#39;updateClock()&#39;, 1000 )" bgcolor="#006747">

    <form id="form1" runat="server">

     <div id="container"> 
            <font size="20" color="white" > <p id="clock">10:15:23 AM</p> 
            <p style="width: 317px"><script> document.write(new Date().toLocaleDateString()); </script></p> 
            <asp:Label ID="ClockedinTime" runat="server" style="z-index: 1; left: 351px; top: 109px; position: absolute"></asp:Label>
            </font> </div>

            <asp:Button ID="Clock" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 214px; top: 227px; position: absolute" Text="ClockIn" />
            <asp:Button ID="ViewReportBttn" runat="server" OnClick="ViewReportBttn_Click" Text="View Time Report" />
        <br />
        <br />
        <br />
        <br />
        <asp:TextBox ID="FCCtxtBx" runat="server" OnTextChanged="FCCtxtBx_TextChanged" Width="230px"></asp:TextBox>
        <asp:Label ID="WarningText" runat="server" Font-Size="X-Large" ForeColor="Red" Text="Not a Valid FCC Code" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button ID="FCCBttn" runat="server" OnClick="FCCBttn_Click" Text="Ener FCC Code" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="GoToFCCLogBttn" runat="server" OnClick="GoToFCCLogBttn_Click" Text="Go to FCC Log" />
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 425px; top: 333px; position: absolute" Text="Comments:"></asp:Label>
        <br />
        <br />
        <br />
        <asp:TextBox ID="Comments" runat="server" MaxLength="200" style="z-index: 1; left: 419px; top: 369px; position: absolute; width: 278px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="logoutBttn" runat="server" OnClick="logoutBttn_Click" Text="Logout" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>