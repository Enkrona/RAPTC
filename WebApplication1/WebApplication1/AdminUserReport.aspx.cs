﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class AdminUserReport : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx", false);
            }
        }

        protected List<TimeTableRow> GenerateHoursTables(DateTime startDate, DateTime endDate, String UserID)
        {
            //read shifts from the shift table
            webtimeclockEntities db = new webtimeclockEntities();

            //query the table for shifts with the matching user id and within specified begin and end time
            var table =  from row in db.shifts
                         where row.UserID == UserID
                         where row.Date >= startDate
                         where row.Date <= endDate
                         orderby row.Date
                         select row;

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

        protected string TimeSpanStringg(DateTime StartDate, DateTime EndDate)
        {
            return "Shifts from " + StartDate.ToShortDateString() + " to " + EndDate.ToShortDateString();
        }


        protected void Button1_Clickk(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin.aspx");
        }

        protected void Button2_Clickk(object sencer, EventArgs e)
        {
            try
            {
                webtimeclockEntities db = new webtimeclockEntities();

                String userID = Session["uid"].ToString().Split(' ')[0];
                var user = (from use in db.users
                           where use.UserID == userID
                           select use).Single();

                TimeReport s = new TimeReport();

                if (!radio_month.Checked && !radio_week.Checked)
                {
                    //say some stuff about needing to check it
                }
                else if (radio_month.Checked)
                {
                    DateTime time = DateTime.Now;
                    DateTime monthStart = new DateTime(time.Year, time.Month, 1);
                    DateTime monthEnd = new DateTime(time.Year, time.Month, DateTime.DaysInMonth(time.Year, time.Month));

                    //incorporates all the functions of report generation
                    s = new TimeReport(user.UserID, user.FirstName, user.LastName,
                        TimeSpanStringg(monthStart, monthEnd), GenerateHoursTables(monthStart, monthEnd, userID));

                    DisplayReportt(s);
                }
                else if (radio_week.Checked)
                {
                    DateTime time = DateTime.Today;
                    int offset = time.DayOfWeek - DayOfWeek.Sunday;

                    //last sunday
                    DateTime start = time.AddDays(-offset);
                    //this saturday
                    DateTime end = start.AddDays(6);

                    s = new TimeReport(user.UserID, user.FirstName, user.LastName,
                        TimeSpanStringg(start, end), GenerateHoursTables(start, end, userID));

                    DisplayReportt(s);
                }

            } catch (Exception ex)
            {

            }
        }

        public void DisplayReportt(TimeReport timeReport)
        {
            int TotalHoursWorked = 0;
            int TotalMinutesWorked = 0;
            int TotalSecondsWorked = 0;
            int RoundedHoursWorked = 0;
            int RoundedMinutesWorked = 0;

            label_UserID.Text = "User ID: " + timeReport.GetUserID();
            label_First.Text = "First Name: " + timeReport.GetUserFirstName();
            label_Last.Text = "Last Name: " + timeReport.GetUserLastName();
            label_TimeSpan.Text = "<b>" + timeReport.GetReportTimeSpan() + "</b>";

            TableRow header = new TableRow
            {
                Cells =
                {
                    new TableCell {Text = "Shift Date", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Time In", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Time Out", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Rounded Time In", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Rounded Time Out", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Total Time Worked", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Rounded Time Worked", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Comment", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                }
            };

            table_report.Rows.Add(header);
            table_report.CellSpacing = 10;

            List<TimeTableRow> ttrList = timeReport.TimeTableRows;

            foreach (TimeTableRow row in ttrList.AsEnumerable())
            {

                //keep track of total time worked
                string totalHours = row.GetTotalHoursWorked();
                string[] totalHoursParsed = totalHours.Split(":".ToCharArray());
                TotalHoursWorked += int.Parse(totalHoursParsed[0]);
                TotalMinutesWorked += int.Parse(totalHoursParsed[1]);
                TotalSecondsWorked += int.Parse(totalHoursParsed[2]);

                //keep track of rounded time worked
                string roundedTime = row.GetRoundedHoursWorked();
                string[] roundedHoursParsed = roundedTime.Split(":".ToCharArray());
                RoundedHoursWorked += int.Parse(roundedHoursParsed[0]);
                RoundedMinutesWorked += int.Parse(roundedHoursParsed[1]);

                TableRow rowToAdd = new TableRow
                {
                    Cells =
                {
                    new TableCell{Text = row.GetDate(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetTimeIn(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetTimeOut(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetRoundedTimeIn(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetRoundedTimeOut(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetTotalHoursWorked(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetRoundedHoursWorked(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetComment(), Wrap = true},
                }
                };

                table_report.CellPadding = 7;
                table_report.Rows.Add(rowToAdd);
            }

            
            

            label_timeWorked.Text = "Total Time Worked: " + CalculateTimeWorkedd(TotalHoursWorked, TotalMinutesWorked, TotalSecondsWorked);
            label_roundedTimeWorked.Text = "Rounded Time Worked: " + CalculateRoundedTimeWorkedd(RoundedHoursWorked, RoundedMinutesWorked);
        }

        protected string CalculateTimeWorkedd(int totalHours, int totalMinutes, int totalSeconds)
        {
            int finalMinutes, finalSeconds;

            if (totalSeconds / 60 >= 1)
            {
                totalMinutes += totalSeconds / 60;
                finalSeconds = totalSeconds % 60;
            }
            else
                finalSeconds = totalSeconds;

            if (totalMinutes / 60 >= 1)
            {
                totalHours += totalMinutes / 60;
                finalMinutes = totalMinutes % 60;
            }
            else
                finalMinutes = totalMinutes;

            return totalHours + ":" + finalMinutes + ":" + finalSeconds;
        }

        protected string CalculateRoundedTimeWorkedd(int roundedHours, int roundedMinutes)
        {
            int finalRoundedMinutes;

            if (roundedMinutes / 60 >= 1)
            {
                roundedHours += roundedMinutes / 60;
                finalRoundedMinutes = roundedMinutes % 60;
            }
            else
                finalRoundedMinutes = roundedMinutes;

            return roundedHours + ":" + finalRoundedMinutes;
        }
    }
}