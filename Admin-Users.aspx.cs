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

public partial class Admin_Users : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    SqlConnection con;
    SqlDataAdapter adapt;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowData();
        }
    }


    protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int result = 0;
        Product prod = new Product();
        string UserID = gvUsers.DataKeys[e.RowIndex].Value.ToString();
        result = prod.UserDelete(UserID);

        if (result > 0)
        {
            //Response.Write("<script>alert('User Removed successfully');</script>");
            Response.Write("<script type='text/javascript' language='javascript'> alert('User Removed successfully !');document.location.href='Admin-Users.aspx';</script>");


        }
        else
        {
            //Response.Write("<script>alert('User Removal NOT successful');</script>");
            Response.Write("<script type='text/javascript' language='javascript'> alert('User Removal NOT successful !');document.location.href='Admin-Users.aspx';</script>");

        }

        //Response.Redirect("Admin-Users.aspx");
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[1].Text;
            foreach (Button button in e.Row.Cells[3].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                }
            }
        }
    }

    //ShowData method for Displaying Data in Gridview  
    protected void ShowData()
    {
        dt = new DataTable();
        con = new SqlConnection(cs);
        con.Open();
        adapt = new SqlDataAdapter("SELECT [Id], [First_Name], [Last_Name], [Email] FROM [REGISTRATION]", con);
        adapt.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            gvUsers.DataSource = dt;
            gvUsers.DataBind();
        }
        con.Close();
    }

    protected void gvUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        gvUsers.EditIndex = e.NewEditIndex;
        ShowData();
    }
    protected void gvUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        //Finding the controls from Gridview for the row which is going to update  
        Label id = gvUsers.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
        TextBox fname = gvUsers.Rows[e.RowIndex].FindControl("txt_FName") as TextBox;
        TextBox lname = gvUsers.Rows[e.RowIndex].FindControl("txt_LName") as TextBox;
        TextBox email = gvUsers.Rows[e.RowIndex].FindControl("txt_Email") as TextBox;
        con = new SqlConnection(cs);
        con.Open();
        //updating the record  
        SqlCommand cmd = new SqlCommand("UPDATE [REGISTRATION] SET [First_Name]='" + fname.Text + "',[Last_Name]='" + lname.Text + "',[Email]='" + email.Text + "' WHERE ID='" + id.Text + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        gvUsers.EditIndex = -1;
        //Call ShowData method for displaying updated data  
        ShowData();
    }
    protected void gvUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        gvUsers.EditIndex = -1;
        ShowData();
    }

}