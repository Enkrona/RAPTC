<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<script runat="server">

	protected void txtUserName_TextChanged(object sender, EventArgs e)
	{

	}

	protected void Page_Load(object sender, EventArgs e)
	{

	}
</script>


<html>
    <head> 
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <title>User Login</title>
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
    <body onload="updateClock(); setInterval(&#39;updateClock()&#39;, 1000 )" bgcolor="#006747">
        <h1> 
            <!-- This is me trying to get the "Official" NW Font. This will be fixed in a css update once core functionality is in place -->
            <h1 id="center">Welcome to the X106 Radio and Practicum Time Clock</h1>
        <img src="x106logo.png" align="right" height="400" width="800" />
        <div id="date">
        </div>
        <div id="container"> 
            <font size="20" color="white" style="font-family: 'Open Sans', sans-serif;"> <p id="clock" style="font-family: 'Open Sans', sans-serif;">10:15:23 AM</p> 
            <p style="width: 317px"; "font-family: 'Open Sans', sans-serif;"><script style="font-family: 'Open Sans', sans-serif;"> document.write(new Date().toLocaleDateString()); </script></p> </font> </div>
    <div id="hold">
    <form id="form1" runat="server">
        <br />
        <br />
        &nbsp;<asp:Label ID="lblUsername" runat="server" ForeColor="White" Text="S#:" style="font-family: 'Open Sans', sans-serif;"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtUserName" runat="server" Width="214px" style="margin-left: 47px" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
         <br />
        <br />
         <br />
        <asp:Label ID="lblPassword" runat="server" ForeColor="White" Text="Password:" style="font-family: 'Open Sans', sans-serif;"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="214px" Height="22px"></asp:TextBox><br />
         <br />&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &ensp;&ensp;<asp:Button class="button button2"  ID="btnUserLogin" runat="server" Text="Login" OnClick="btnUserLogin_Click" Width="130px"/>
         &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
         <br />
         <br />
        <p>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </p>
        <div id="footer">
            </div>     
      </form>
        </div> 
 
        <p>
            &nbsp;
        </p>
    </body>

