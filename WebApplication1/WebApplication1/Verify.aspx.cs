using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cite.DomainAuthentication;

namespace WebApplication1
{
    public partial class Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void verify_button_Click(object sender, EventArgs e)
        {
            String logUsername = Username.Text;
            String logPassword = Password.Text;
            try
            {
                DomainAccount d = new DomainAccount(logUsername, logPassword);
                if (d.Username != "AKIRT")
                {
                    Warning.Text = "Please log on as Alex Kirt";
                }
                else
                {
                    Response.Cookies["ApplicationActivated"].Value = "Activated";
                }
            }
            catch (Exception ex)
            {
                Warning.Text = "Please log on as Alex Kirt";
            }
        }
    }
}