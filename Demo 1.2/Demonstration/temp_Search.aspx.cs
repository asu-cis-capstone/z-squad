using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demonstration
{
    public partial class temp_Search : System.Web.UI.Page
    {
       
#region meta data
    static bool flagVirus;
    int iR = 1;
    String[,] rLists = new String[1, 1];
    protected string[] viruses = new string[] { " --------- Select--------- ", "H5N1, Influenza A", "H3N2, Influenza A", 
        "H1N1 Pandemic 2009, Influenza A", "H1N1 Seasonal, Influenza A", "H1N2, Influenza A", "H2N2, Influenza A", 
        "Rabies", "Porcine Reproductive and Respiratory Virus (PRRS)", "Hantavirus", "West Nile Virus", "Dengue Fever" };
#endregion
    public static string[] StaticHosts;
    public static Dictionary<String,String> hostDic = new Dictionary<String,String>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            
            try
            {
                VirusLstBox.Attributes.Add("onchange", "updateGenes();");
                fromTxtBox.Attributes.Add("onchange", "checkFrom();");
                fromTxtBox.Attributes.Add("onclick", "clearFrom();");
                toTxtBox.Attributes.Add("onchange", "checkTo();");
                toTxtBox.Attributes.Add("onclick", "clearTo();");
                StatesLbl.Style.Add("visibility", "hidden");//must make it invisible on page load or else it can't find it
                stateLstBox.Style.Add("visibility", "hidden");
                countryLstBox.Attributes.Add("onclick", "USA();");
                continentLstBox.Attributes.Add("onchange", "updateCountries();");
                clearBtn.Attributes.Add("onclick", "clearSelections();return false");//need the 'return false' to avoid postback
                mcmcTxtBox.Attributes.Add("onclick", "clearMCMC();");
                mcmcTxtBox.Attributes.Add("onchange", "checkMCMC();");
                sampTxtBox.Attributes.Add("onclick", "clearSamp();");
                sampTxtBox.Attributes.Add("onchange", "checkSamp();");
                avesLst.Style.Add("visibility", "hidden");
                hostLst.Attributes.Add("onclick", "Aves();");
            }
            catch (System.IO.FileNotFoundException fnf) { System.Diagnostics.Debug.WriteLine(fnf.StackTrace); }
        }//end if !Page.IsPostBack
    }//end Page_Load
  
    protected void nextBtn_Click(object sender, EventArgs e)
    {
        String virus = VirusLstBox.SelectedValue.ToString();//get virus (taxid)
        //get indeces for multiple list box selections
        int[] geneIndeces = GeneLstBox.GetSelectedIndices();
        int[] hostIndeces = hostLst.GetSelectedIndices();
        int[] avianIndeces = avesLst.GetSelectedIndices();
        int[] continentIndeces = continentLstBox.GetSelectedIndices();
        int[] countryIndeces = countryLstBox.GetSelectedIndices();
        int[] stateIndeces = stateLstBox.GetSelectedIndices();

        String gene = "";
        for (int i = 0; i < geneIndeces.Length;i++ )//add multiple genes if selected
        {
            int geneIndex = geneIndeces[i];
            if (gene == "") gene = GeneLstBox.Items[geneIndex].Value.ToString();
            else { gene = gene + "_" + GeneLstBox.Items[geneIndex].Value.ToString(); }
        
        }

        
        String hostTaxID = "";



        if (avesLst.SelectedValue.ToString() != "")//if a bird is selected
        {
            if (avianIndeces.Length > 1)//if multiple birds selected
            {
                for (int i = 0; i < avianIndeces.Length; i++)
                {
                    int avianIndex = avianIndeces[i];
                    if (hostTaxID  == "") hostTaxID = avesLst.Items[avianIndex].Value.ToString();
                    else { hostTaxID = hostTaxID  + "_" + avesLst.Items[avianIndex].Value.ToString(); }

                }
            }
            else hostTaxID = avesLst.SelectedValue.ToString();
        }//end if avesLst.SelectedValue.ToString() != ""
        if (hostIndeces.Length > 1)//check first host list box (non avian specific)
        {
            for (int j = 0; j < hostIndeces.Length; j++)
            {
                int hostIndex = hostIndeces[j];
                if (hostLst.Items[hostIndex].Value.ToString() == "8782" & avianIndeces.Length > 0)//ignore the aves selected in this list since we already have it
                { String x = "";//basically do nothing 
                }
                else
                {
                    if (hostTaxID == "") hostTaxID = hostLst.Items[hostIndex].Value.ToString();
                    else
                    {
                        hostTaxID = hostTaxID + "_" + hostLst.Items[hostIndex].Value.ToString();
                    }
                }//end else
            }//end for
        }//end hostIndeces.Length > 1
        else 
        {
            if (hostLst.SelectedValue != "8782")//if something other than 'Aves'
            {
                hostTaxID = hostLst.SelectedValue.ToString();
            }
            else//if only aves is selected then already have the specific birds
            {
                String y = "";//do nothing
            }

        }//end else
     
        String fromYear = fromTxtBox.Text.ToString();//get from Year
        if (fromYear == "YYYY") fromYear = "";
        String toYear = toTxtBox.Text.ToString();
        if (toYear== "YYYY") toYear = "";

       
        String geoID = "";//GeonamesID
        if (stateLstBox.SelectedValue.ToString() != "")
        {
            if (stateIndeces.Length>1)//if multiple states
            {
                for (int i = 0; i < stateIndeces.Length; i++)
                {
                    int stateIndex = stateIndeces[i];
                    if (geoID == "") geoID = stateLstBox.Items[stateIndex].Value.ToString();
                    else { geoID = geoID + "_" + stateLstBox.Items[stateIndex].Value.ToString(); }

                }
            
            
            }
            else
                geoID = stateLstBox.SelectedValue.ToString();//one state selected
        }//end stateLstBox.SelectedValue.ToString() != ""
        else if (countryIndeces.Length > 1)//check first country list box (non avian specific)
        {
            for (int j = 0; j < countryIndeces.Length; j++)
            {
                int countryIndex = countryIndeces[j];
                if (countryLstBox.Items[countryIndex].Value.ToString() == "6252001" & stateIndeces.Length > 0)//ignore the 'USA' selected in this list since we already have it
                {
                    String x = "";//basically do nothing 
                }
                else
                {
                    if (geoID == "") geoID = countryLstBox.Items[countryIndex].Value.ToString();
                    else
                    {
                        geoID = geoID + "_" + countryLstBox.Items[countryIndex].Value.ToString();
                    }
                }//end else
            }//end for
        }//end countryIndeces.Length > 1
        else if (countryIndeces.Length == 1)
        {
           // if (countryLstBox.SelectedValue != "6252001")//if something other than 'USA'
            //{
                geoID = countryLstBox.SelectedValue.ToString();
            //}
           
        }//end else

        if (geoID == "")//else select continent.
        {
            geoID = continentLstBox.SelectedValue.ToString();
        }

        String mcmc = mcmcTxtBox.Text.ToString().Replace(",","");
        String samp = sampTxtBox.Text.ToString().Replace(",", "");

        //WS_ZooPhy.Service1 srv = new WS_ZooPhy.Service1();
        String email = Page.Session["email"].ToString();
        String username = Page.Session["Username"].ToString();
        //substitution model
        String model = "";
        if (InvGamLst.SelectedValue.ToString() != "") {  model = MdlLst.SelectedValue.ToString() + InvGamLst.SelectedValue.ToString(); }
        else {  model = MdlLst.SelectedValue.ToString(); }

      // srv.getSequences_runZooPhy("mscotch@asu.edu",virus,geography,hostTaxID,gene,fromYear+"-"+toYear,"","","10000000","1000");
        Response.Redirect("search2.ashx?email="+email+"&virus=" + virus + "&geography=" + geoID + "&host=" + hostTaxID + "&gene=" + gene + "&time=" + fromYear + "-" + toYear + "&model="+ model +"&userID="+username+"&mcmc=" + mcmc + "&samp=" + samp);

        
    }
}
    
}