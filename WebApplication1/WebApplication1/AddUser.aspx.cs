using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AddUser : System.Web.UI.Page
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

        protected void CreateUserBttn_Click(object sender, EventArgs e)
        {
            String sNum = SNumTxtBx.Text;
            String fName = FNameTxtBx.Text;
            String lName = LNameTxtBx.Text;
            String com = CommentTxtBx.Text;

            //  Pseduo Code for checking a successful post to database
            // try 
            //    if userID found in table users 
            //       WarningLbl.Visible = treu; 
            //       WarningLbl.Text = "User is already in the system!";
            //
            //    db append to table users... 
            //    if userID found in table users 
            //       Response.Redirect("~/Admin.aspx") 
            //    else
            //       WarningLbl.Visible = true; 

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            {
                // Cancel button - takes the user back to Admin
                Response.Redirect("~/Admin.aspx");
            }
        }
    }
}