using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * 
 * If you haven't alread, check out README.txt for a walkthrough of how all of this works.
 * 
 */

namespace Demonstration 
{
    public partial class Sample_Page : System.Web.UI.Page
    {
        
        //Here, I will encapsulate the object given to us by the web service.
        //You will notice a handful of methods in there, but the ones we
        //are interested in are in the Service1SoapClient object.
        //So, it is necessary for us to instantiate one.
        //as outlined in the Readme, we want to store it within the session.
        //the best way to do that is within a property
        private ServiceReference1.Service1SoapClient myWebServObject
        {
            get
            {
                //get object from session
                //cast it
                //return it
                return (ServiceReference1.Service1SoapClient)Session["myObject"];
            }
            set
            {
                //store in session
                Session["myObject"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) //if this isn't a postback
            {
                //This code will be executed the first time a page loads

                //This code is accessing a property on the master page
                //the property will set the text given to it into an asp:literal
                //see master page for more detail, or step through code
                //this.Master.Title = "Sample of what can be done with asp.net";

                //here, we will instantiate our soapclient object
                //this will only be done once, then the instance will be stored in the session
                myWebServObject = new ServiceReference1.Service1SoapClient();
                
            }
            else //is a postback
            {
                //this code will be executed on every page load BUT the first
            }
        }

        protected void callService_Click(object sender, EventArgs e)
        {
            //this code will be executed on button click. Remember, the page_load will execute before this each time it is called.

            //we will declare a string to store the XML returned by the Web Service.
            string xmlResult = "";

            //At this point, we have an instance of the SoapClientObject. We can now use its methods
            //We can store the xml result in a string for the time being
            xmlResult = myWebServObject.getGeoSequences_Unaligned("disease", "region", "hosts", "gene", "StartEnd");

            //The following will be pseudo code. You guys will have to do the fine details.

            // declare xml serializer
            // declare custom object.
                //this will have to be created by you guys.
                //example: GeoSequence result = new GeoSequence();
                // here, GeoSequence will have properties that match those of the XML result.
                // google can probably explain xml a little better than me, but basically it is a language that defines data structures
                // in many ways, c# objects are just data structures. You just need to create it in a way that matches the xml data

            //use xml serializer to create object/array of objects

            //    ARRAY
                //GeoSequence[] mySequences = XMLSerializer.DeSerialize(xmlResult);

            //    single object
                //GeoSequence mySequence = XMLSerializer.DeSerialize(xmlResult);

            //At this point, it would just be normal c# to handle it.
            //You can look into using an asp:ObjectDataSource object to access the data on the page.
            //otherwise, you can display it using labels, literals, etc.
            //EG

            //myLabel.Text = mySequence.Name; (just an example of what MAY be in your datastructure)

            

            //Unfortunately, web services are intricate: What exactly it want's for those properties is a little vague.
            //Your first step will be to give the method what it wants. It will almost certainly yell at you a lot,
            // but if it was designed well it will give you meaningul error messages and you will be able to figure out what to give it.

            //the next step will be getting the xml into a format you can use.


            /*
             * 
             * Hopefully this has been helpful. 
             * 
             * Feel free to reach out to me if any of this demo was unclear or if you have any other questions.
             * Whether you chose to go the asp.net route or stick with php, good luck in getting this working.
             * 
             * 
             */
        }
    }
}