using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class UserReport : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/InputTime.aspx");
        }

        protected void Button2_Click(object sencer, EventArgs e)
        {
            try
            {
                webtimeclockEntities db = new webtimeclockEntities();

                String userID = Session["UserID"].ToString().Split(' ')[0];
                var user = from use in db.users
                           where use.UserID == userID
                           select use;

                TimeReport s = new TimeReport();

                if (!radio_month.Checked && !radio_week.Checked)
                {
                    //say some stuff about needing to check it
                } else if (radio_month.Checked)
                {
                    DateTime time = DateTime.Now;
                    DateTime monthStart = new DateTime(time.Year, time.Month, 1);
                    DateTime monthEnd = new DateTime(time.Year, time.Month, DateTime.DaysInMonth(time.Year, time.Month));
                }

            } catch (Exception ex)
            {

            }
        }

    }
}