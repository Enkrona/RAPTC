using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        //string user = this.UserName;

        protected void Page_Load(object sender, EventArgs e)
        {
            //check to make sure the program has been activated on this machine
            string activatedCookie = "";

            try
            {
                //attempt to retrieve the activated cookie
                activatedCookie = Request.Cookies["ApplicationActivated"].Value;
            }
            catch
            {

            }

            //if the cookies value is not equal to Activated redirect to the activation page
            if (activatedCookie != "Activated")
            {
                //Response.Redirect("Default.aspx");
            }

            //lblTime.Text = DateTime.Now.ToString();
            txtUserName.Focus();
        }

        protected void btnUserLogin_Click(object sender, EventArgs e)
        {
            //get the username from the username text box

            string userID = txtUserName.Value.ToString();

            //log the user in, if this user id exists within the database
            //UsersDataSetTableAdapters.UserTableAdapter userTableAdapter = new UsersDataSetTableAdapters.UserTableAdapter();
            // DataTable usersDataTable = userTableAdapter.GetUserData();

            // Redirect for demo 
            if (userID.Equals("demo"))
            {
                Response.Redirect("InputTime.aspx");
            }
            else 
            {
                Response.Redirect("UserLoginDemo.aspx");
            }

        }
        protected void lbtnAdminLogin_Click(object sender, EventArgs e)
        {
            //go to the admin login page
            Response.Redirect("AdminLogin.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //lblTime.Text = DateTime.Now.ToString();
        }

    }
}