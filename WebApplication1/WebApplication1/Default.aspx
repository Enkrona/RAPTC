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
        <style type="text/css">
            #clock {
                width: 921px;
            }
        </style>
    </head>
    <body onload="updateClock(); setInterval(&#39;updateClock()&#39;, 1000 )" bgcolor="#006747">
        <h1> 
            <!-- This is me trying to get the "Official" NW Font. This will be fixed in a css update once core functionality is in place -->
            <font color="white" font-family="Futara"> Welcome to the X106 Radio and Practicum Time Clock (RAPTC)</font>
        </h1>
        <img src="logo.png" align="right" height="400" width="800" />
        <div id="date">
        </div>
        <div id="container"> 
            <font size="20" color="white" > <p id="clock">10:15:23 AM</p> 
            <p style="width: 317px"><script> document.write(new Date().toLocaleDateString()); </script></p> </font> </div>
    <div id="hold">
    <form id="form1" runat="server">
        <br />
        <br />
        &nbsp;<asp:Label ID="lblUsername" runat="server" ForeColor="White" Text="919#:"></asp:Label>&nbsp;<asp:TextBox ID="txtUserName" runat="server" Width="214px" style="margin-left: 49px"></asp:TextBox>
         <br />
        <br />
         <br />
        <asp:Label ID="lblPassword" runat="server" ForeColor="White" Text="Password:"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="214px" Height="22px"></asp:TextBox><br />
         <br />&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<asp:Button ID="btnUserLogin" runat="server" Text="Login" OnClick="btnUserLogin_Click" Width="130px" />
         &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
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
 
        <p>
            &nbsp;</p>
    </body>

</html>