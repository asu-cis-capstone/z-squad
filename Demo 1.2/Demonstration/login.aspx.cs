using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using MySql.Data.MySqlClient; 

namespace Demonstration
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.AppSettings["ConnectionString"];

            //create db connection using the connection string
            MySqlConnection myConnection = new MySqlConnection(connectionString);
            MySqlCommand query = new MySqlCommand("SELECT * FROM user WHERE email = "+email.Text+";");
            query.Connection = myConnection;

            if (query.)
            {
                 
            }

            try
            {
                //open connection to mySql server
                //if the code fails at this point, you likely have:
                    //incorrect permission to your database
                    //or a bad connection string
                myConnection.Open();

                //prepare statement
                query.Prepare();

                //run command
                //this is where your statement is ran
                //if the code fails here, it is likely due to a bad statement
                query.ExecuteReader();

                //also note, the method ExecuteReader() returns a MySqlDataReader object. 
                //this object can be used for reading your data
                //  EG MySqlDataReader myReader = cmd.ExecuteReader(); 

                //redirect them to the "thank you page" or something.
                Response.Redirect("search.aspx");
            }
        }
    }
}