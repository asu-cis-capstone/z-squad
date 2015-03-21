using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demonstration
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        //property for 'lTitle' on Master page.
        //this element is a literal, explanation is on Site1.Master
        public string Title
        {
            get
            {
                //return current text
                return lTitle.Text;
            }
            set
            {
                //set text to value supplied
                lTitle.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}