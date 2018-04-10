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
                Clocked = "out";
                Session["ClockedIn"] = "out";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Clocked == "in")
            {
                Clock.Text = "Clock in";
                Session["ClockedIn"] = "out";
            }
            else if (Clocked == "out")
            {
                Clock.Text = "Clock out";
                Session["ClockedIn"] = "in";
            }
        }
    }
}