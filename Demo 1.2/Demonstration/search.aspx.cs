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
        string startDate;
        string endDate;
        string continent;
        string country;
        string state;

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

        protected void fromTxtBox_TextChanged(object sender, EventArgs e)
        {
            startDate = fromTxtBox.Text;
        }

        protected void toTxtBox_TextChanged(object sender, EventArgs e)
        {
            endDate = toTxtBox.Text;
        }

        protected void continentLstBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            continent = continentLstBox.SelectedItem.ToString();
        }

        protected void countryLstBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            country = countryLstBox.SelectedItem.ToString();
        }

        protected void stateLstBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            state = stateLstBox.SelectedItem.ToString();
        }

        

    }
}