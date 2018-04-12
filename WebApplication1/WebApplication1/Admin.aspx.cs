using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                String activated = Request.Cookies["ApplicationActivated"].Value;

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

        protected void Button4_Click(object sender, EventArgs e)
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Add User Button
        }

        protected void remUsrBttn_Click(object sender, EventArgs e)
        {
            //Remove User Button
        }

        protected void editUsrBttn_Click(object sender, EventArgs e)
        {
            //Edit User Button
        }
    }
}