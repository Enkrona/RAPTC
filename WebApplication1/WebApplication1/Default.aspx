<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

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
    </head>
    <body onload="updateClock(); setInterval(&#39;updateClock()&#39;, 1000 )">
        <h1> 
            Welcome to the X106 Student Employee and Practicum Timeclock Application
        </h1>
        <font size="20" > <p id="clock">10:15:23 AM</p> </font>
        <div id="date">
            <font size="20" > <p><script> document.write(new Date().toLocaleDateString()); </script></p> </font>
        </div>
        <div id="container">
    <div id="hold">
    <form id="form1" runat="server">
        <br />
        <br />
        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label> &nbsp 
        <asp:TextBox ID="txtUserName" runat="server" Width="214px"></asp:TextBox><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <br />
        <asp:Button ID="btnUserLogin" runat="server" Text="Submit" OnClick="btnUserLogin_Click" Width="130px" />
         <br />
         <br />
        <p>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </p>
        <div id="footer">
        <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/admin.png" Width="34px" OnClick="lbtnAdminLogin_Click" />
            </div>     
      </form>
        </div> 
    </div> 
    </body>

</html>