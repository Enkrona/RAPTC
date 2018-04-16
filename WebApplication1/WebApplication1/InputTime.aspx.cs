using Cite.DomainAuthentication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class InputTime : System.Web.UI.Page
    {
        public string Clocked;

        protected void Page_Load(object sender, EventArgs e)
        {
            //check if current computer is verified for use of application
            try
            {
                webtimeclockEntities db = new webtimeclockEntities();

                String userID = Session["UserID"].ToString().Split(' ')[0];
                DomainAccount u = new DomainAccount(userID);
                String name = u.FirstName;
                String activated = Request.Cookies["ApplicationActivated"].Value;

                if (activated != "activated")
                {
                    Response.Redirect("~/Verify.aspx", false);
                }

                Boolean clockedIn = (from aUser in db.activeusers
                                     where aUser.UserID == userID
                                     select aUser).Count() == 1;

                if (clockedIn)
                {
                    Clock.Text = "Clock out.";
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Verify.aspx");
            }
        }

        protected String name()
        {
            String userID = Session["UserID"].ToString().Split(' ')[0];
            DomainAccount u = new DomainAccount(userID);
            return u.FirstName;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            webtimeclockEntities db = new webtimeclockEntities();

            String userID = Session["UserID"].ToString().Split(' ')[0];

            //Check if userid is already in active users
            //if so, is clocked in
            Boolean clockedIn = (from aUser in db.activeusers
                                 where aUser.UserID == userID
                                 select aUser).Count() == 1;

            DateTime ClockTime = DateTime.Now;

            if (!clockedIn)
            {
                String comments = Comments.Text;
                Session["ClockedIn"] = "in " + ClockTime.ToString();
                Clock.Text = "Clock out";
                ClockedinTime.Text = "You clocked in at " + ClockTime.ToShortTimeString();

                activeuser s = new activeuser
                {
                    UserID = userID,
                    Time = ClockTime,
                    Comments = comments
                };

                db.activeusers.Add(s);
                db.SaveChanges();
            }

            else if (clockedIn)
            {
                Clock.Text = "Clock in";

                DateTime inTime = (from aUser in db.activeusers
                                   where aUser.UserID == userID
                                   select aUser).Single().Time;
                DateTime outTime = DateTime.Now;
                TimeSpan difference = outTime - inTime;
                TimeSpan roundedDifference = TimeSpan.FromMinutes(15 * Math.Ceiling((difference.TotalMinutes - 7) / 15));
                ClockedinTime.Text = "You worked " + difference.ToString();
                Session["ClockedIn"] = "out " + ClockTime.ToString();

                //Add worked shift to the database
                shift s = new shift()
                {
                    UserID = userID,
                    Date = DateTime.Now,
                    TimeIn = inTime,
                    TimeOut = outTime,
                    TimeWorked = difference,
                    RoundedTimeWorked = roundedDifference,
                    Comments = Comments.Text
                };
                db.shifts.Add(s);
                db.SaveChanges();

                //Remove user as active user
                var user = (from aUser in db.activeusers
                           where aUser.UserID == userID
                           select aUser).Single();

                db.activeusers.Remove(user);
                db.SaveChanges();
            }
        }

        protected void logoutBttn_Click(object sender, EventArgs e)
        {
            // On button click, it will attempt to disable to cookie, and then redirect to the homepage
            try
            {

                Response.Redirect("~/Default.aspx");

                //Commented out the cookie because I don't get how it works :p //cokie must stay, it is how kirt authenticates the computer they log in on
                //Response.Cookies["ApplicationActivated"].Value = "Deactivated";  //session can change but i don't think we need to do that either.
                                                                                  //will all get changed when someone else logs on anyway

            }
            catch (Exception ex)
            {

            }
        }

        protected void FCCBttn_Click(object sender, EventArgs e)
        {
            String fcc_Code = FCCtxtBx.Text;

            try
            {
                if (fcc_Code == "")
                {
                    //WarningText.Text = "That is not a valid FCC Code";
                    WarningText.Visible = true;
                }

                else
                {
                    // input logic for FCC Code to the DB
                }

            }

            catch (Exception ex)
            {

            }

        }

        protected void FCCtxtBx_TextChanged(object sender, EventArgs e)
        {
            WarningText.Visible = false;
        }

        protected void GoToFCCLogBttn_Click(object sender, EventArgs e)
        {
            // On button click, it will attempt to redirect to the FCCLog
            try
            {
                Response.Redirect("~/FCCLog.aspx");
            }
            catch (Exception ex)
            {

            }
        }

        protected void ViewReportBttn_Click(object sender, EventArgs e)
        {
            // On button click, it will attempt to redirect to the report page
            try
            {
                Response.Redirect("~/UserReport.aspx");
            }
            catch (Exception ex)
            {

            }
        }
    }
}