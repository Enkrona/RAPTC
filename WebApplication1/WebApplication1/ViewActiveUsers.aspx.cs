using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ViewActiveUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Default.aspx", false);
            }

            try
            {
                webtimeclockEntities db = new webtimeclockEntities();

                // query active users, join with users table for name info
                var table = from row in db.activeusers
                            join name in db.users on row.UserID equals name.UserID
                            select new { uid = row.UserID, fn = name.FirstName, ln = name.LastName, t = row.Time };



                // create active user list
                List<ActiveUserDisp> auTableRows = new List<ActiveUserDisp>();

                foreach (var item in table)
                {
                    //read data from data table
                    string userid = item.uid;
                    string firstname = item.fn;
                    string lastname = item.ln;
                    string date = item.t.ToShortDateString();
                    string time = item.t.ToShortTimeString();
                    

                    //add rows to active user list
                    ActiveUserDisp activeuserRowToAdd = new ActiveUserDisp(userid, firstname, lastname, date, time);
                    auTableRows.Add(activeuserRowToAdd);
                }

                // if no active users display empty warning
                if (!auTableRows.Any())
                {
                    empty_warning.Visible = true;
                }

                // if active users, display activeusers table
                else
                {
                    TableRow header = new TableRow
                    {
                        Cells =
                {
                    new TableCell {Text = "User ID", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "First Name", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Last Name", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Clock In Date", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell {Text = "Clock In Time", Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                }
                    };

                    table_activeusers.Rows.Add(header);
                    table_activeusers.CellSpacing = 10;

                    foreach (ActiveUserDisp row in auTableRows.AsEnumerable())
                    {
                        TableRow rowToAdd = new TableRow
                        {
                            Cells =
                {
                    new TableCell{Text = row.GetUserID(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetFirstName(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetLastName(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetDate(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                    new TableCell{Text = row.GetTime(), Wrap = false, HorizontalAlign = HorizontalAlign.Center},
                }
                        };

                        table_activeusers.CellPadding = 7;
                        table_activeusers.Rows.Add(rowToAdd);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin.aspx");
        }

        internal class ActiveUserDisp
        {
            String UserID;
            String FirstName;
            String LastName;
            String Date;
            String Time;

            public ActiveUserDisp(String userID, String firstName, String lastName, String date, String time)
            {
                this.UserID = userID;
                this.FirstName = firstName;
                this.LastName = lastName;
                this.Date = date;
                this.Time = time;
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

            public string GetDate()
            {
                return Date;
            }

            public string GetTime()
            {
                return Time;
            }
        }

        protected void RefreshBttn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewActiveUsers.aspx");
        }
    }
}