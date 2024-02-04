using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using Salt_Password_Sample;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using static System.Net.WebRequestMethods;
using System.Activities.Expressions;
using System.Data;
using System.Drawing;
using System.Text;
//using Twilio;
//using Twilio.Rest.Api.V2010.Account;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public static string to;
    DataTable dt;
    SqlDataAdapter adp;
    SqlCommand cmd;

    //static void Main(string[] args)
    //{
    //    // Find your Account SID and Auth Token at twilio.com/console
    //    // and set the environment variables. See http://twil.io/secure
    //    string accountSid = Environment.GetEnvironmentVariable("SK14729db8e6f16174b179a7e3be35f39e");
    //    string authToken = Environment.GetEnvironmentVariable("ZSYTOvtgsRqrnDPceghnSMuAkq4HQiQA");

    //    TwilioClient.Init(accountSid, authToken);

    //    var message = MessageResource.Create(
    //        body: "McAvoy or Stewart? These timelines can get so confusing.",
    //        from: new Twilio.Types.PhoneNumber("+16067755516"),
    //        statusCallback: new Uri("http://postb.in/1234abcd"),
    //        to: new Twilio.Types.PhoneNumber("+16067755516")
    //    );

    //    Console.WriteLine(message.Sid);
    //}

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public static bool IsPasswordStrong(string password)

    {
        return Regex.IsMatch(password, @"^(?=.{8,})(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Search"] = txtSearch.Text;
        Response.Redirect("Search.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Guid newGUID = Guid.NewGuid();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString);

        conn.Open();

        bool exists = false;

        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [REGISTRATION] WHERE Email = @email", conn))
        {
            cmd.Parameters.AddWithValue("Email", txt_RegEmail.Text);
            exists = (int)cmd.ExecuteScalar() > 0;
        }

        if (exists)
        {
            Response.Write("<script>alert('Sorry, Email is already taken!');</script>");
        }

        else
        {
            string insertQuery = "INSERT INTO REGISTRATION (Id, First_Name, Last_Name, Email, Password) " +
                "values (@id, @first, @last, @email, @password)";

            SqlCommand com = new SqlCommand(insertQuery, conn);
            string ePass = Hash.ComputeHash(txt_RegPassword.Text, "SHA512", null);
            com.Parameters.AddWithValue("@password", ePass);
            com.Parameters.AddWithValue("@id", newGUID.ToString());
            com.Parameters.AddWithValue("@email", txt_RegEmail.Text);
            com.Parameters.AddWithValue("@first", txt_FirstName.Text);
            com.Parameters.AddWithValue("@last", txt_LastName.Text);

            com.ExecuteNonQuery();

            Response.Write("<script>alert('Successfully created account! Welcome! ');</script>");
        }

        conn.Close();

        txt_FirstName.Text = "";
        txt_LastName.Text = "";
        txt_RegEmail.Text = "";
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Session["Email"] = txt_Email.Text;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString);

        conn.Open();

        string checkuser = "SELECT COUNT(*) FROM REGISTRATION WHERE Email = @email";
        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@email", txt_Email.Text);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        conn.Close();

        if (temp == 1)      //checks if email exists inside DB
        {
            conn.Open();

            string checkPasswordQuery = "SELECT Password FROM REGISTRATION WHERE Email = @email2";

            SqlCommand pwcomm = new SqlCommand(checkPasswordQuery, conn);
            pwcomm.Parameters.AddWithValue("@email2", txt_Email.Text);
            string password = pwcomm.ExecuteScalar().ToString();
            bool flag = Hash.VerifyHash(txt_Password.Text, "SHA512", password); //verifies password through hash function

            if (flag == true)
            {
                Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
                Session["CHANGE_MASTERPAGE2"] = null;
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                Response.Write("<script language=javascript>alert('Password or UserName is not correct')</script>");
            }
        }
        else if (txt_Email.Text == "" || txt_Password.Text == "")
        {
            Response.Write("<script language=javascript>alert('Please fill up the fields.')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('Password or UserName is not correct')</script>");
        }

        txt_Email.Text = ""; //clears textbox after login
    }

    protected void btnAdminSignIn_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString);

        conn.Open();

        string checkuser = "SELECT COUNT(*) FROM [ADMIN] WHERE Email = @email";

        SqlCommand com = new SqlCommand(checkuser, conn);
        com.Parameters.AddWithValue("@email", txt_AdminEmail.Text);

        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        conn.Close();

        if (temp == 1)
        {
            conn.Open();

            string checkPasswordQuery = "SELECT AdminID, Password FROM [ADMIN] WHERE Email = @email2";

            SqlCommand pwcomm = new SqlCommand(checkPasswordQuery, conn);
            pwcomm.Parameters.AddWithValue("@email2", txt_AdminEmail.Text);

            SqlDataReader reader = pwcomm.ExecuteReader();
            reader.Read();
            string password = reader["Password"].ToString();
            string UserId = reader["AdminID"].ToString();
            reader.Close();

            if (password == txt_AdminPassword.Text)
            {
                Response.Redirect("Admin-index.aspx");
            }
            else
            {
                reader.Close();
                Response.Write("<script language=javascript>alert('Password or Username is not correct')</script>");
            }
        }
        else if (txt_Email.Text == "" || txt_Password.Text == "")
        {
            Response.Write("<script language=javascript>alert('Please fill up the fields.')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('Password or UserName is not correct')</script>");
        }

        txt_AdminEmail.Text = "";
    }

    protected void btnResetSubmit_Click(object sender, EventArgs e)
    {

    }

    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString);
        conn.Open();
        try
        {
            adp = new SqlDataAdapter("SELECT Email FROM REGISTRATION WHERE Email = @email", conn);
            adp.SelectCommand.Parameters.AddWithValue("@email", tbEmail.Text);

            dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                lbl_msg.Text = "Email not found, please proceed to register.";
                tbEmail.Text = "";
                return;
            }

            else
            {
                string code = Guid.NewGuid().ToString();
                cmd = new SqlCommand("UPDATE REGISTRATION SET code=@code WHERE Email=@email", conn);
                cmd.Parameters.AddWithValue("@code", code);
                cmd.Parameters.AddWithValue("@email", tbEmail.Text);
                Session["cust_reset_pwd"] = tbEmail.Text;
                Session["code"] = code;
                StringBuilder sbody = new StringBuilder();
                sbody.Append("Hi, There was a request to change your password! " +
                "If did not make this request, just ignore this email. " +
                "Someone else might have typed your email address by mistake. " +
                "Otherwise, please <a href=http://localhost:10068/ResetPwd.aspx/");
                sbody.Append(code + ">click here to change your password</a>. Thanks, Shopbagz Team :)");
                MailMessage mail = new MailMessage("secprj2022@gmail.com", tbEmail.Text, "Reset Your Password", sbody.ToString());
                NetworkCredential mailAuthentication = new NetworkCredential("secprj2022@gmail.com", "fjzwgqyaubidzmgo");
                SmtpClient mailclient = new SmtpClient("smtp.gmail.com", 587);
                mailclient.EnableSsl = true;
                mailclient.Credentials = mailAuthentication;
                mail.IsBodyHtml = true;
                mailclient.Send(mail);
                cmd.ExecuteNonQuery();
                conn.Close();
                
                Response.Write("<script language=javascript>alert('Email Sent Successfully ! Please check your inbox.')</script>");
                tbEmail.Text = "";
            }
        }
        catch (Exception ex)
        {
            lbl_msg.Text = ex.Message;
        }
        finally
        {
            conn.Close();
        }
    }

}

