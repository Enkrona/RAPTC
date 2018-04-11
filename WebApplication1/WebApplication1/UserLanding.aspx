<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLanding.aspx.cs" Inherits="WebApplication1.UserLanding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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

        function on() {
            alert('You worked for --:--:-- today');
        }


        </script>
<head runat="server">
    <title></title>
    <style type="text/css">
        #clock {
            height: 8px;
            text-align: center;
        }
        #overlay {
            position: fixed;
            display: none;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0,0,0,0.5);
            z-index: 2;
            cursor: pointer;
        }
        #form1 {
            height: 250px;
            text-align: center;
        }
        #header {
            text-align: center;
        }
    </style>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body onload="updateClock(); setInterval(&#39;updateClock()&#39;, 1000 )" bgcolor="#006747">
    <form id="form1" runat="server">
    <header id="header">
        <font color="white"><asp:Button ID="Button4" runat="server" Text="Logout" OnClick="logout" />
            <h1>Welcome Back</h1></font>
    </header>
    <div id="header"> 
            <font size="8" color="white" align="center"> <p id="clock">10:15:23 AM</p> 
            <p style="text-align: center" ><script> document.write(new Date().toLocaleDateString()); </script></p> </font> 
    </div>
        <asp:Button ID="Button1" runat="server" Text="Clock In" />
        <asp:Button ID="Button2" runat="server" Text="Clock Out" OnClientClick="on()" />
        <p>
            <asp:Button ID="Button3" runat="server" Text="View Report" OnClick="viewReport" />
        </p>
    </form>
</body>
</html>