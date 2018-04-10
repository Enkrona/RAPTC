using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication1
{
    public partial class FCCLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if application is verified on current computer
            try
            {
                String activated = Response.Cookies["ApplicationActivated"].Value;

                if (activated != "activated")
                {
                    Response.Redirect("~/Verify.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Verify.aspx");
            }

            try
            {
                XmlReader xmlFile;
                xmlFile = XmlReader.Create("FCCLogData.xml", new XmlReaderSettings());
                DataSet ds = new DataSet();
                ds.ReadXml(xmlFile);
                GridView1.DataSource = ds.Tables[0];
            }

            catch (Exception ex)
            {
              
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}