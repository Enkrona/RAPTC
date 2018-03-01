﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cite.DomainAuthentication;

namespace WebApplication1
{
    public partial class AdminLogin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string adminID = txtAdminUserName.Text.ToString();

            string password = txtAdminPass.Text.ToString();

            //Basic Cite.DomainAuthentication use
            DomainAccount d = new DomainAccount(adminID);
            Boolean admin = false;
            if (d.OU == OrganizationalUnit.FacultyUsers || d.OU == OrganizationalUnit.StaffUsers)
            {
                admin = true;
            }


            //log the user in, if this user id exists within the database
            //UsersDataSetTableAdapters.UserTableAdapter userTableAdapter = new UsersDataSetTableAdapters.UserTableAdapter();
            // DataTable usersDataTable = userTableAdapter.GetUserData();

            // just a basic demo login to display an admin login page  
            if (adminID.Equals("demo") && password.Equals("password"))
            {
                Response.Redirect("Admin.aspx");
            }
            else
            {
                Response.Redirect("LoginFailure.aspx");
            }
        }

    }
}