using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewReport(object sender, EventArgs e)
        {
            //go to the admin login page
            Response.Redirect("UserReport.aspx");
        }
        protected void logout(object sender, EventArgs e)
        {
            //go to the admin login page
            Response.Redirect("Default.aspx");
        }
    }
}