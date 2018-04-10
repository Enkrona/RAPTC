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
                DateTime inTime = Convert.ToDateTime(Clocked[1] + " " + Clocked[2]);
                DateTime outTime = DateTime.Now;
                TimeSpan difference = outTime - inTime;
                ClockedinTime.Text = "You worked " + difference.ToString();
                Session["ClockedIn"] = "out " + ClockTime.ToString();

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