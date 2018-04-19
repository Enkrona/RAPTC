using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using System.Collections;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Configuration;
using Cite.DomainAuthentication;

namespace WebApplication1
{
    public partial class Admin : System.Web.UI.Page
    {
        public static ArrayList users = new ArrayList();

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


        protected int? getUserRole()
        {
            int? role = 0;

            try
            {
                webtimeclockEntities db = new webtimeclockEntities();

                String userID = Session["UserID"].ToString().Split(' ')[0];
                DomainAccount u = new DomainAccount(userID);
                String activated = Request.Cookies["ApplicationActivated"].Value;

                if (activated != "activated")
                {
                    Response.Redirect("~/Verify.aspx", false);
                }

                role = (from aUser in db.users
                        where aUser.UserID == userID
                        select aUser.Role).First();

                if (role == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }

                else if (role == 1)
                {
                    AddUsrBttn.Visible = false;
                    editUsrBttn.Visible = false;
                }

            }

            catch (Exception ex)
            {
                Response.Redirect("~/Verify.aspx");
            }

            return role;
        }

        protected void getuserDDL(object sender, EventArgs e)
        {
            webtimeclockEntities db = new webtimeclockEntities();

            var uq = from use in db.users
                     select new { uid = use.UserID, fn = use.FirstName, ln = use.LastName };
            List<UsersDisp> u = new List<UsersDisp>();

            foreach (var item in uq)
            {
                string userid = item.uid;
                string firstname = item.fn;
                string lastname = item.ln;

                UsersDisp uta = new UsersDisp(userid, firstname, lastname);
                u.Add(uta);
            }


            foreach (UsersDisp row in u.AsEnumerable())
            {
                string dispstring = row.GetFirstName() + " " + row.GetLastName();
                string value = row.GetUserID();
                UsersDDL.Items.Add(new ListItem(dispstring, value));
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

        protected void editUsrBttn_Click(object sender, EventArgs e)
        {
            //Edit User Button
            Response.Redirect("~/EditUser.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Add User Button
            Response.Redirect("~/AddUser.aspx");
        }

        protected void InputTimeBttn_Click(object sender, EventArgs e)
        {
            //
            Response.Redirect("~/InputTime.aspx");
        }

        protected void ViewActiveUsersBttn_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/ViewActiveUsers.aspx");
            /*webtimeclockEntities db = new webtimeclockEntities();

            //  Make the label and data box visible! 
            ViewDataBox.Visible = true;
            LoggedInUsersLbl.Visible = true;

            string SID = "";
            
            var au = (from user in db.activeusers
                       select user);

            
            foreach (activeuser item in au)
            {
                SID += item.UserID.ToString() + " \n ";
                ViewDataBox.Items.Add((SID));
            }


            
            foreach (activeuser item in au)
            {
                ClientScript.RegisterArrayDeclaration("userids ", item.ToString());
            }

            ClientScript.RegisterStartupScript(this.GetType(), "Active Users", "<script language='javascript'>alert(userids);</script>");*/

            //  Old Message Box Prompt
            //ClientScript.RegisterStartupScript(this.GetType(), "Active Users", "alert('" + test + "');", true);

        }

        protected void genreporttest_Click(object sender, EventArgs e)
        {
            string reportuser = UsersDDL.SelectedItem.Value;
            Session["uid"] = reportuser;
            Response.Redirect("~/UserReportnon.aspx");
        }

        internal class UsersDisp
        {
            String UserID;
            String FirstName;
            String LastName;

            public UsersDisp(String userID, String firstName, String lastName)
            {
                this.UserID = userID;
                this.FirstName = firstName;
                this.LastName = lastName;
            }

            public string GetUserID()
            {
                return UserID;
            }

            public string GetFirstName()
            {
                return FirstName;
            }

            public string GetLastName()
            {
                return LastName;
            }
        }

        protected void viewReportsButton_Click(object sender, EventArgs e)
        {
            string reportuser = UsersDDL.SelectedItem.Value;
            Session["uid"] = reportuser;
        }
    }
}