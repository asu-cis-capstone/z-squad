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

            user_id.Text = Page.Session["user_id"].ToString();
            institution.Text = Page.Session["user_inst"].ToString(); //ohhh lol wrong name lol
            user_name.Text = Page.Session["user_name"].ToString();
            email.Text = Page.Session["email"].ToString();
        }
    }
}