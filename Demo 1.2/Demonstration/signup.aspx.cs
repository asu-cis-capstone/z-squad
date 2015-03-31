using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

//Added the following references:
using System.Data; //Allows for use of DataTable object, will be used for managing data
                    //For signing up, you will not need to use it. However, for logging in you will
                    
using System.Web.Configuration; //allows for access to web.config, where your connectionstring will be stored. 
                                //add connection string in this file to actually connect to the database
                                //there are plenty of tutorials online as to how you can create one
                                //there is more information below

using MySql.Data.MySqlClient;   //allows for connections to mysql databases
                                //downloaded from Nuget, build into vs for managing external API's 
                                //check it out : Project > Manage NuGet packages


namespace Demonstration
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //This will generate the random number you were generating in your php
        //I would, however, recommend you use autoincrement within mysql instead if you plan to use this as a unique id, 
        //as it is GUARANTEED to be unique, where as a random number may not be
        private int GetRandomInteger()
        {
            //create object for generating random numbeers
            Random r = new Random();

            //get random number between 0 and 1000
            //return that number
            return r.Next(0, 1000);

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            //********************************************************
            //  this code is essentially what my project uses
            //  it is very generic c# code to run a query on a database
            //*********************************************************
            
            
            //get connection string from web.config
            //this will be under <AppSettings> in the web.config file, add an entry there with the connection string to make this code work
            
            //an example of this is <add key="ConnectionString" value="SERVER={UrlToServer};DATABASE=cis440db;UID={yourUserName};PASSWORD={YourPassword}"/>
            
            //the value under "key" lets you access it by name, where the value under "value" is the connection string itself
            //this example will work for mySQL databases given the correct info
            string connectionString = WebConfigurationManager.AppSettings["ConnectionString"];
            
            //create db connection using the connection string
            MySqlConnection myConnection = new MySqlConnection(connectionString);

            //build the insert statement: note, these values are unescaped
            //this statement is given to the cmd object
            //the object will need the statement, and the connection created above to execute it
            MySqlCommand cmd = new MySqlCommand("INSERT INTO temp_user(confirmation, lastName, firstName, email, pword, institution)"+
	            "VALUES("+GetRandomInteger()+", '"+lName.Text+"', '"+fName.Text+"', '"+email.Text+"', '"+password.Text+"', '"+institution.Text+"');");

            //give connection to cmd
            //This will allow the MySqlCommend object to connect to your database
            cmd.Connection = myConnection;

            try
            {
                //open connection to mySql server
                //if the code fails at this point, you likely have:
                    //incorrect permission to your database
                    //or a bad connection string
                myConnection.Open();

                //prepare statement
                cmd.Prepare();

                //run command
                //this is where your statement is ran
                //if the code fails here, it is likely due to a bad statement
                cmd.ExecuteReader();

                //also note, the method ExecuteReader() returns a MySqlDataReader object. 
                //this object can be used for reading your data
                //  EG MySqlDataReader myReader = cmd.ExecuteReader(); 

                //redirect them to the "thank you page" or something.
                //Response.Redirect("Someotherpage.aspx");
            }
            catch (Exception ex)
            {
                //you can handle errors as you see fit here
                //as an example, if you have an asp:label for error messages called lblError, you could do this
                    //lblError.Text = ex.Message;
                throw ex;
            }
            finally
            {
                //dispose of the connection
                //the code will crash if the connection isn't closed before another open attempt is made
                myConnection.Close();
            }
        }

        protected void randomButton_Click(object sender, EventArgs e)
        {
            //This, in a nutshell, is how you will dynamically change what is displayed to a user.
            //based on some event or variable, you can alter asp elements to display different text.

            //when this button is clicked, the text will change
            randomLabel.Text = "This text just changed";

            //if you want to take this a step further and change the color, position, or some other attribute: change the css class
            randomLabel.CssClass = "aDifferentClass";

            //now, you can use css and javascript to change and manipulate this label however you see fit.

            //feel free to delete this button, label, and event when you feel you understand how to alter your page dynamically
        }
    }
}