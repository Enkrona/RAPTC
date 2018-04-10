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

     <div id="container"> 
            <font size="20" color="white" > <p id="clock">10:15:23 AM</p> 
            <p style="width: 317px"><script> document.write(new Date().toLocaleDateString()); </script></p> </font> </div>

    <form id="form1" runat="server">
    <font color="white"><p> This is a test user profile for demo</p></font>
        <img src="genericprofile.png" style="margin-right: 0px" height="200" width="200" />
        <asp:Button ID="Clock" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 214px; top: 227px; position: absolute" Text="ClockIn" />
    </form>
</body>
</html>