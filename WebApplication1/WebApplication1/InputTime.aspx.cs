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
                String activated = Request.Cookies["ApplicationActivated"].Value;

                if (activated != "activated")
                {
                    Response.Redirect("~/Verify.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Verify.aspx");
            }


            try
            {
                var Clocked = Session["ClockedIn"].ToString().Split(' ');
            }
            catch (Exception ex)
            {
                Session["ClockedIn"] = "NA " + DateTime.Now.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {



            var Clocked = Session["ClockedIn"].ToString().Split(' ');
            DateTime ClockTime = DateTime.Now;

            if (Clocked[0] == "NA")
            {
                Session["ClockedIn"] = "in " + ClockTime.ToString();
                Clock.Text = "Clock out";
                ClockedinTime.Text = "You clocked in at " + ClockTime.ToLongTimeString();
            }

            else if (Clocked[0] == "in")
            {
                Clock.Text = "Clock in";
                DateTime inTime = Convert.ToDateTime(Clocked[1] + " " + Clocked[2] + " " + Clocked[3]);
                DateTime outTime = DateTime.Now;
                TimeSpan difference = outTime - inTime;
                ClockedinTime.Text = "You worked " + difference.ToString();
                Session["ClockedIn"] = "out " + ClockTime.ToString();

                /*webtimeclock_radioEntities1 db = new webtimeclock_radioEntities1();

                var shift = from shit in db.shifts
                            where shit.UserID == 524063
                            select shit;

                shift s = new WebApplication1.shift()
                {
                    UserID = 524063,
                    Date = DateTime.Now,
                    TimeIn = inTime,
                    TimeOut = outTime,
                    TimeWorked = difference,
                    Comments = "test"
                };*/

            }
            else if (Clocked[0] == "out")
            {
                Clock.Text = "Clock out";
                Session["ClockedIn"] = "in " + ClockTime.ToString();
                ClockedinTime.Text = "You clocked in at " + ClockTime.ToLongTimeString();
            }
        }
    }
}