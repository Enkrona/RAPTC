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

        protected List<TimeTableRow> GenerateHoursTable(DateTime startDate, DateTime endDate, String UserID)
        {
            //read shifts from the shift table
            webtimeclockEntities db = new webtimeclockEntities();

            //query the table for shifts with the matching user id and within specified begin and end time
            var table = from row in db.shifts
                        where row.UserID == UserID
                        where row.Date >= startDate
                        where row.Date <= endDate
                        orderby row.Date
                        select row;

            /* var table =
            from row in shiftTable.AsEnumerable()
            where row.Field<string>("UserID") == UserID
            && row.Field<DateTime>("Date") >= startDate
            && row.Field<DateTime>("Date") <= endDate
            orderby row.Field<DateTime>("Date")
            select row;*/

            //create time table rows with the selected shifts
            List <TimeTableRow> timeTableRows = new List<TimeTableRow>();

            foreach (shift row in table)
            {
                //read data from data table
                DateTime shiftDate = row.Date.Date;
                string timeIn = row.TimeIn.ToShortTimeString();
                string timeOut = row.TimeOut.ToShortTimeString();
                TimeSpan timeWorked = row.TimeWorked;
                string totalHoursWorked = timeWorked.Hours + ":" + timeWorked.Minutes + ":" + timeWorked.Seconds;
                TimeSpan rounded = row.RoundedTimeWorked;
                string roundedHoursWorked = rounded.Hours + ":" + rounded.Minutes;
                string comment = row.Comments;

                //add rows to time table
                TimeTableRow timeTableRowToAdd = new TimeTableRow(shiftDate.ToShortDateString(), timeIn, timeOut, totalHoursWorked, roundedHoursWorked, comment);
                timeTableRows.Add(timeTableRowToAdd);

            }
            return timeTableRows;
        }

        protected string TimeSpanString(DateTime StartDate, DateTime EndDate)
        {
            return "Shifts from " + StartDate.ToShortDateString() + " to " + EndDate.ToShortDateString();
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
                var user = (from use in db.users
                           where use.UserID == userID
                           select use).Single();

                TimeReport s = new TimeReport();

                if (!radio_month.Checked && !radio_week.Checked)
                {
                    //say some stuff about needing to check it
                } else if (radio_month.Checked)
                {
                    DateTime time = DateTime.Now;
                    DateTime monthStart = new DateTime(time.Year, time.Month, 1);
                    DateTime monthEnd = new DateTime(time.Year, time.Month, DateTime.DaysInMonth(time.Year, time.Month));

                    var stt = GenerateHoursTable(monthStart, monthEnd, userID);

                    //incorporates all the functions of report generation
                    s = new TimeReport(user.UserID, user.FirstName, user.LastName,
                        TimeSpanString(monthStart, monthEnd), GenerateHoursTable(monthStart, monthEnd, userID));

                    DisplayReport(s);
                }

            } catch (Exception ex)
            {

            }
        }

        public void DisplayReport(TimeReport timeReport)
        {

        }

    }
}