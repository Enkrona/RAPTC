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
            
            webtimeclockEntities db = new webtimeclockEntities();

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


            /*
            foreach (activeuser item in au)
            {
                ClientScript.RegisterArrayDeclaration("userids ", item.ToString());
            }*/

            /*ClientScript.RegisterStartupScript(this.GetType(), "Active Users", "<script language='javascript'>alert(userids);</script>");*/

            //  Old Message Box Prompt
            //ClientScript.RegisterStartupScript(this.GetType(), "Active Users", "alert('" + test + "');", true);

        }
    }
}