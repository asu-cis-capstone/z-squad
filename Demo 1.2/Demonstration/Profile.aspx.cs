using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demonstration
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Session["email"] == null)
            {
                Response.Redirect("login.aspx");
            }

            label.Text = Page.Session["id"].ToString();
        }
    }
}