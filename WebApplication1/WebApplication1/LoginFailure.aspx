<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <title>Login Failure</title>
    <script runat="server">


        protected void HomeBttn_Click(object sender, EventArgs e)
        {
            // On button click, it will attempt to disable to cookie, and then redirect to the homepage
            try
            {

                Response.Redirect("~/Default.aspx");

                //Commented out the cookie because I don't get how it works :p 
                //Response.Cookies["ApplicationActivated"].Value = "Deactivated";

            }
            catch (Exception ex)
            {

            }
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
<body bgcolor="#F00">
    <form id="form1" runat="server">
    <h1 style="color: white; font-family: 'Open Sans', sans-serif;">Authentication Failed </h1> 
    <h2 style="color: white; font-family: 'Open Sans', sans-serif;"> Something messed up! Make sure your S# and Password are correct </h2>
        <p> 
            &nbsp;</p>
        <p>
            <asp:Button ID="HomeBttn" class="button button2" style="color: white; font-family: 'Open Sans', sans-serif;" runat="server" OnClick="HomeBttn_Click" Text="Return to Login" />
        </p>
    </form>
</body>
</html>