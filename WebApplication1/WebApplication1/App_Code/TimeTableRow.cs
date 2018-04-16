using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TimeTableRow
/// </summary>
public class TimeTableRow
{

    String Date;
    String TimeIn;
    String TimeOut;
    String RoundedTimeIn;
    String RoundedTimeOut;
    String TotalHoursWorked;
    String RoundedHoursWorked;
    String Comment;

	public TimeTableRow(String date, String timeIn, String timeOut, String totalHoursWorked, String roundedHoursWorked, String comment)
	{
        this.Date = date;
        this.TimeIn = timeIn;
        this.TimeOut = timeOut;
        this.TotalHoursWorked = totalHoursWorked;
        this.RoundedHoursWorked = roundedHoursWorked;
        RoundedTimeIn = GenerateRoundedTime(timeIn);
        RoundedTimeOut = GenerateRoundedTime(timeOut);
        this.Comment = comment;
	}

    public TimeTableRow(String date, String timeIn, String timeOut, String totalHoursWorked, String roundedHoursWorked)
    {
        this.Date = date;
        this.TimeIn = timeIn;
        this.TimeOut = timeOut;
        this.TotalHoursWorked = totalHoursWorked;
        this.RoundedHoursWorked = roundedHoursWorked;
        RoundedTimeIn = GenerateRoundedTime(timeIn);
        RoundedTimeOut = GenerateRoundedTime(timeOut);
        Comment = "N/A";
    }

    private string GenerateRoundedTime(string time)
    {
        //get the minutes section from the time
        string[] timeParsed = time.Split(":".ToCharArray());
        string minutesSection = timeParsed[1];
        string hoursSection = timeParsed[0];
        string AMorPM = "";
        if (time.Length == 8)
            AMorPM = time.Substring(6, 2);
        else if (time.Length == 7)
            AMorPM = time.Substring(5, 2);

        minutesSection = minutesSection.Substring(0, 2);

        //convert the minutes section to int
        int minutes = int.Parse(minutesSection);

        //round minutes to nearest quarter hour

        if (minutes != 0 || minutes != 15 || minutes != 30 || minutes != 45)
        {
            #region minutes rounding
            if (minutes < 15)
            {
                minutes = 15;
            }
            else if (minutes < 30)
            {
                minutes = 30;
            }
            else if (minutes < 45)
            {
                minutes = 45;
            }
            else if (minutes < 60)
            {
                minutes = 0;
                int hours = int.Parse(hoursSection);
                hours++;

                if (hours == 13)
                    hours = 1;

                return hours.ToString() + ":00" + AMorPM;
            }
            #endregion


            if (minutes < 10)
            {
                string minString = "0";
                minString += minutes.ToString();
                return hoursSection + ":" + minString + " " + AMorPM;
            }

            return hoursSection + ":" + minutes.ToString() + " " + AMorPM;
        }
        else
            return time;
    }

    public String GetDate()
    {
        return Date;
    }

    public String GetTimeIn()
    {
        return TimeIn;
    }

    public String GetTimeOut()
    {
        return TimeOut;
    }

    public string GetRoundedTimeIn()
    {
        return RoundedTimeIn;
    }

    public string GetRoundedTimeOut()
    {
        return RoundedTimeOut;
    }

    public String GetTotalHoursWorked()
    {
        return TotalHoursWorked;
    }

    public String GetRoundedHoursWorked()
    {
        return RoundedHoursWorked;
    }

    public String GetComment()
    {
        return Comment;
    }
}

   