using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using System.Net.Mail;

namespace Demonstration
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Session["email"] = null;
        }

        protected void submit_Click(object sender, EventArgs e)
        {

            string connectionString = WebConfigurationManager.AppSettings["ConnectionString"];


            MySqlConnection myConnection = new MySqlConnection(connectionString);



            MySqlCommand cmd = new MySqlCommand("SELECT id from user WHERE email = '"+ email.Text + "' and pword = '" + password.Text + "'");

            cmd.Connection = myConnection;

            MySqlDataReader reader = null;

            bool result = false;

            try
            {

                myConnection.Open();

                //prepare statement
                cmd.Prepare();


                reader = cmd.ExecuteReader();

                result = reader.HasRows;

                if (result)
                {
                    Page.Session["email"] = email.Text;
                    Page.Session["id"] = reader.GetInt32(1);

                    //login successful
                    Response.Redirect("Profile.aspx");
                }
                else
                {
                    //login failed
                    Response.Redirect("http://www.isitchristmas.com");

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

                myConnection.Close();
            }

            
        }

        public void SendMail(string to, string subject, string body)
        {
            SmtpClient client = new SmtpClient();
            MailMessage message = new MailMessage("adam@asu.edu", to);
            message.Body = body;
            Attachment attachment = new Attachment("File Name");
            message.Attachments.Add(attachment);
            client.Send(message);
        }

}


}