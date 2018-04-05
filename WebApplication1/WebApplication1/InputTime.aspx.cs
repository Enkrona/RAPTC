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
                Clocked = Session["ClockedIn"].ToString();
            }
            catch (Exception ex)
            {
                Clocked = "in";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Clocked == "in")
            {
                Clock.Text = "Clock out";
                Session["ClockedIn"] = "out";
            } else
            {
                Clock.Text = "Clock in";
                Session["ClockedOut"] = "in";
            }
        }
    }
}