using System;
using System.Web;
using System.Web.UI;
namespace WebApplication1
{
    public partial class UserLoginDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if current computer is verified for use of application
            try
            {
                String activated = Response.Cookies["ApplicationActivated"].Value;

                if (activated != "activated")
                {
                    Response.Redirect("~/Verify.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Verify.aspx");
            }
        }
    }
}
