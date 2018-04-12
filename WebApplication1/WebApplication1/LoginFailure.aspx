<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head runat="server">
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
</head>
<body bgcolor="#F00">
    <form id="form1" runat="server">
    <p>Authentication Failed </p> 
    <p> Here would be an error page, or failure page taking the user to the login </p>
        <p> &nbsp;</p>
        <p> &nbsp;</p>
        <p> 
            &nbsp;</p>
        <p>
            <asp:Button ID="HomeBttn" runat="server" OnClick="HomeBttn_Click" Text="Return to Login" />
        </p>
    </form>
</body>
</html>