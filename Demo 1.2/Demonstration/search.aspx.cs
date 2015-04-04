using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demonstration
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string virus;
        string gene;
        string host;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void VirusLstBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            virus = VirusLstBox.SelectedItem.ToString();
        }

        protected void GeneLstBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            gene = GeneLstBox.SelectedItem.ToString();
        }

        protected void hostLst_SelectedIndexChanged(object sender, EventArgs e)
        {
            host = hostLst.SelectedItem.ToString();
        }


    }
}