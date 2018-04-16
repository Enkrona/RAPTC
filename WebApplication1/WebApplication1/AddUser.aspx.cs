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
            webtimeclockEntities db = new webtimeclockEntities();

            // get info from text input
            String sNum = SNumTxtBx.Text.ToString();
            String fName = FNameTxtBx.Text.ToString();
            String lName = LNameTxtBx.Text.ToString();
            int role = Int32.Parse(RoleDDL.SelectedItem.Value);

            try
            { // check if userid is in users table
                Boolean usercheck1 = (from use in db.users
                                    where use.UserID == sNum
                                    select use).Count() == 1;
                
                // if it is, display warning
                if (usercheck1)
                {
                    WarningLbl.Visible = true;
                    return;
                }
                
                // if not, create new user
                
                // have to add domain user name check
                // ex: s123 is not a valid user

                user u = new user
                {
                    UserID = sNum,
                    FirstName = fName,
                    LastName = lName,
                    Role = role
                };

                db.users.Add(u);
                db.SaveChanges();

                Boolean usercheck2 = (from use in db.users
                                    where use.UserID == sNum
                                    select use).Count() == 1;

                // if it is, redirect to admin
                if (usercheck2)
                {
                    WarningLbl.Text = "User was added!";
                    WarningLbl.Visible = true;

                    // add a timer?
                    Response.Redirect("~/Admin.aspx");
                }
                else
                {
                    WarningLbl.Text = "User was not added";
                    WarningLbl.Visible = true;
                }


            }
            catch (Exception ex)
            {
                throw ex;
            }

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
    }
}