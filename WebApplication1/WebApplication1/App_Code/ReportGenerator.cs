using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

public class ReportGenerator
{

    public String UserID;
    public String UserFirstName;
    public String UserLastName;
    public DateTime StartDate;
    public DateTime EndDate;
    public TimeReport ReportToGenerate;

    //shift table indexes
    int SHIFT_DATE_INDEX = 2;
    int SHIFT_TIMEIN_INDEX = 3;
    int SHIFT_TIMEOUT_INDEX = 4;
    int SHIFT_TOTALHOURSWORKED_INDEX = 5;
    int SHIFT_ROUNDEDHOURSWORKED_INDEX = 6;
    int SHIFT_COMMENT_INDEX = 7;

    public ReportGenerator(String userID, String userFirstname, String userLastName, DateTime startDate, DateTime endDate)
    {
        this.UserID = userID;
        this.UserFirstName = userFirstname;
        this.UserLastName = userLastName;
        this.StartDate = startDate;
        this.EndDate = endDate;
    }

    public TimeReport GenerateReport()
    {
        ReportToGenerate = new TimeReport(UserID, UserFirstName, UserLastName,
               TimeSpanString(StartDate, EndDate), GenerateHoursTable(StartDate, EndDate));

        return ReportToGenerate;
    }

    protected List<TimeTableRow> GenerateHoursTable(DateTime startDate, DateTime endDate)
    {
        //read shifts from the shift table
        UserDataSetTableAdapters.ShiftTableAdapter shiftTableAdapter = new UserDataSetTableAdapters.ShiftTableAdapter();
        DataTable shiftTable = shiftTableAdapter.GetData();

        //query the table for shifts with the matching user id and within specified begin and end time
        var table =
            from row in shiftTable.AsEnumerable()
            where row.Field<string>("UserID") == UserID
            && row.Field<DateTime>("Date") >= startDate
            && row.Field<DateTime>("Date") <= endDate
            orderby row.Field<DateTime>("Date")
            select row;

        //create time table rows with the selected shifts
        List<TimeTableRow> timeTableRows = new List<TimeTableRow>();

        foreach (DataRow row in table)
        {
            //read data from data table
            DateTime shiftDate = (DateTime)row.ItemArray[SHIFT_DATE_INDEX];
            string timeIn = (string)row.ItemArray[SHIFT_TIMEIN_INDEX];
            string timeOut = (string)row.ItemArray[SHIFT_TIMEOUT_INDEX];
            string totalHoursWorked = (string)row.ItemArray[SHIFT_TOTALHOURSWORKED_INDEX];
            string roundedHoursWorked = (string)row.ItemArray[SHIFT_ROUNDEDHOURSWORKED_INDEX];
            string comment = (string)row.ItemArray[SHIFT_COMMENT_INDEX];

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
}