using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cite.DomainAuthentication;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        //string user = this.UserName;

        protected void Page_Load(object sender, EventArgs e)
        {
            //check to make sure the program has been activated on this machine
            string activatedCookie = "";

            //*****************PRELIM COOKIE CHECK: DELETE EVENTUALLY**********************
            //Request.Cookies["ApplicationActivated"].Value = "activated";
            //*****************************************************************************

            try
            {
                //attempt to retrieve the activated cookie
                activatedCookie = Request.Cookies["ApplicationActivated"].Value;
            }
            catch
            {
                Response.Redirect("~/Verify.aspx");
            }

            //if the cookies value is not equal to Activated redirect to the activation page
            if (activatedCookie != "Activated")
            {
                Response.Redirect("~/Verify.aspx");
            }

            //lblTime.Text = DateTime.Now.ToString();
            txtUserName.Focus();
        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            webtimeclockEntities db = new webtimeclockEntities();

            //get the username from the username text box
            string userID = txtUserName.Text.ToString();
            string password = txtPassword.Text.ToString();

            string checkUser;
            try
            {   //authenticates the username and password before it passes it to the database to set session login.
                DomainAccount u = new DomainAccount(userID, password);
                checkUser = u.Username;
            }
            catch (Exception ex)
            {
                checkUser = "";
            }

            try
            {
                var username = (from use in db.users
                                where use.UserID == checkUser
                                select use).Single();
                string s = username.UserID + " " + username.Role.ToString();
                Session["UserID"] = username.UserID + " " + username.Role.ToString();

                if (username.Role == 0)
                {
                    Response.Redirect("~/InputTime.aspx");
                }
                else if (username.Role == 1 || username.Role == 2)
                {
                    Response.Redirect("~/Admin.aspx");
                } else
                {
                    Response.Redirect("~/LoginFailure.aspx");
                }
            }
            catch (Exception ex)
            {
                
            }

        }
        protected void lbtnAdminLogin_Click(object sender, EventArgs e)
        {
            //go to the admin login page
            Response.Redirect("~/AdminLogin.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //lblTime.Text = DateTime.Now.ToString();
        }

    }
}