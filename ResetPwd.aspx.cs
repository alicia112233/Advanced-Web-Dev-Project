using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Salt_Password_Sample;

public partial class ResetPwd : System.Web.UI.Page
{
    DataTable dt;
    SqlDataAdapter adp;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString);
        if (Session["cust_reset_pwd"] == null)
        {
            Response.Write("<script type='text/javascript' language='javascript'> alert('Oops! Reset Link is invalid! Please request for another link.');document.location.href='http://localhost:10068/Error.aspx';</script>");
        }
        else
        {
            try
            {
                adp = new SqlDataAdapter("SELECT Email, code FROM REGISTRATION WHERE code=@code AND Email=@email", conn);
                adp.SelectCommand.Parameters.AddWithValue("@code", Session["code"]);
                adp.SelectCommand.Parameters.AddWithValue("@email", Session["cust_reset_pwd"]);

                dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    Response.Write("<script type='text/javascript' language='javascript'> alert('Oops! Reset Link is invalid! Please request for another link.');document.location.href='http://localhost:10068/Error.aspx';</script>");
                }
                else
                {
                    return;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        
    }

    public void btnReset_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString);
        using (SqlCommand cmd = new SqlCommand("UPDATE REGISTRATION SET code='', Password=@pwd WHERE code=@code AND Email=@email", conn))
        {
            conn.Open();

            cmd.Parameters.AddWithValue("@code", Session["code"]);
            string ePass = Hash.ComputeHash(tb_pwd.Text, "SHA512", null);
            cmd.Parameters.AddWithValue("@pwd", ePass);
            cmd.Parameters.AddWithValue("@email", Session["cust_reset_pwd"]);
            cmd.ExecuteNonQuery();
        }

        conn.Close();
        Response.Write("<script type='text/javascript' language='javascript'> alert('You have successfully resetted your password! Proceed to log in now!');document.location.href='http://localhost:10068/indexBags.aspx';</script>");
        tb_pwd.Text = "";
        tb_cfmpwd.Text = "";
    }

}