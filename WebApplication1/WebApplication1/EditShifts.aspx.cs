using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class EditShifts : System.Web.UI.Page
    {
        webtimeclockEntities db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                db = new webtimeclockEntities();
                BindGridView();
            }

        }

        protected void GridViewShift_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewShift.EditIndex = -1;
            BindGridView();
        }

        protected void GridViewShift_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewShift.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridViewShift_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            db = new webtimeclockEntities();

            try
            {
                string shiftID = GridViewShift.Rows[e.RowIndex].Cells[1].Text;
                string userID = ((TextBox)GridViewShift.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                DateTime date = Convert.ToDateTime(((TextBox)GridViewShift.Rows[e.RowIndex].Cells[3].Controls[0]).Text).Date;
                DateTime timeIn = Convert.ToDateTime(((TextBox)GridViewShift.Rows[e.RowIndex].Cells[4].Controls[0]).Text);
                DateTime timeOut = Convert.ToDateTime(((TextBox)GridViewShift.Rows[e.RowIndex].Cells[5].Controls[0]).Text);
                DateTime timeWorked = Convert.ToDateTime(((TextBox)GridViewShift.Rows[e.RowIndex].Cells[6].Controls[0]).Text);
                DateTime roundedTimeWorked = Convert.ToDateTime(((TextBox)GridViewShift.Rows[e.RowIndex].Cells[7].Controls[0]).Text);
                string comments = ((TextBox)GridViewShift.Rows[e.RowIndex].Cells[8].Controls[0]).Text;

                int sInt = Convert.ToInt32(shiftID);

                var sh = (from shift in db.shifts
                          where shift.ShiftID == sInt
                          select shift).Single();

                sh.UserID = userID;
                sh.Date = date.Date;
                sh.TimeIn = timeIn;
                sh.TimeOut = timeOut;
                sh.TimeWorked = timeWorked.TimeOfDay;
                sh.RoundedTimeWorked = roundedTimeWorked.TimeOfDay;
                sh.Comments = comments;

                db.SaveChanges();

                GridViewShift.EditIndex = -1;
                BindGridView();
            }
            catch (Exception ex)
            {
                //TODO: write the thing to do the stuff with the prompt to do the datetime correctly like 
                //format: "mm/dd/yyyy hh:mm:ss (A or P)M"
            }
        }

        protected void GridViewShift_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            db = new webtimeclockEntities();

            string shiftID = GridViewShift.Rows[e.RowIndex].Cells[1].Text;
            int s = Convert.ToInt32(shiftID);

            try
            {
                var sh = (from shift in db.shifts
                          where shift.ShiftID == s
                          select shift).Single();

                db.shifts.Remove(sh);
                db.SaveChanges();

                BindGridView();
            }
            catch (Exception ex)
            {
                //no
            }
        }

        protected void GridViewShift_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridViewShift_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewShift.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        private void BindGridView()
        {
            db = new webtimeclockEntities();

            var shift = from s in db.shifts
                        select s;

            if (shift.Count() > 0)
            {
                GridViewShift.DataSource = shift.ToList();
                GridViewShift.DataBind();
            }
        }
    }
}