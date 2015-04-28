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

using MySql.Data.MySqlClient;
using System.Net;   //allows for connections to mysql databases
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

            //generate confirmation code
            //Guid g;
            // g = Guid.NewGuid();

            //build the insert statement: note, these values are unescaped
            //this statement is given to the cmd object
            //the object will need the statement, and the connection created above to execute it


            MySqlCommand cmd = new MySqlCommand("INSERT INTO user(lastName, firstName, email, pword, institution)" +
                "VALUES('" + lName.Text + "', '" + fName.Text + "', '" + email.Text + "', '" + password.Text + "', '" + institution.Text + "');");

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
                //MySqlDataReader myReader = cmd.ExecuteReader(); 

                //redirect them to the "thank you page" or something.
                Response.Redirect("signup_confirm.aspx");
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

        //Code for confirmation email purposes
        public void SendMail(string to, string subject, string body)
        {
            SmtpClient smtp = new SmtpClient();
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;

            MailMessage message = new MailMessage("mehradi2492@gmail.com", to);
            message.Body = body;

            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("mehradi2492@gmail.com", "1Basketball24");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(message);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);

            //If there is an attachment:
            //Attachment attachment = new Attachment("File Name");
            //message.Attachments.Add(attachment);
            smtp.Send(message);
        }


        /*
       try
        {
            string Subject = "This is test mail using smtp settings",
            Body = txtMessage.Text.Trim(),
            ToEmail = txtToEmail.Text.Trim();

            string SMTPUser = "yourname@gmail.com", SMTPPassword = "yourpassword";

            //Now instantiate a new instance of MailMessage
            MailMessage mail = new MailMessage();

            //set the sender address of the mail message
            mail.From = new MailAddress(SMTPUser, "Webblogsforyou");

            //set the recepient addresses of the mail message
            mail.To.Add(ToEmail);

            //set the subject of the mail message
            mail.Subject = Subject;

            //set the body of the mail message
            mail.Body = Body;

            //leave as it is even if you are not sending HTML message
            mail.IsBodyHtml = true;

            //set the priority of the mail message to normal
            mail.Priority = MailPriority.Normal;

            //instantiate a new instance of SmtpClient
            SmtpClient smtp = new SmtpClient();

            //if you are using your smtp server, then change your host like "smtp.yourdomain.com"
            smtp.Host = "smtp.gmail.com";

            //chnage your port for your host
            smtp.Port = 25; //or you can also use port# 587

            //provide smtp credentials to authenticate to your account
            smtp.Credentials = new System.Net.NetworkCredential(SMTPUser, SMTPPassword);

            //if you are using secure authentication using SSL/TLS then "true" else "false"
            smtp.EnableSsl = true;

            smtp.Send(mail);

            lblMsg.Text = "Success: Mail sent successfully!";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        catch (SmtpException ex)
        {
            //catched smtp exception
            lblMsg.Text = "SMTP Exception: " + ex.Message.ToString();
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error: " + ex.Message.ToString();
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        } */
    }
}