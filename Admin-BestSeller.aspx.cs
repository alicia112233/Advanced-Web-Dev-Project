using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;

public partial class BestSeller : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindRepeater();
        }
    }

    private void BindRepeater()
    {
        string constr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Backpacks_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                }
            }

            using (SqlCommand cmd = new SqlCommand("Crossbody_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater2.DataSource = dt;
                        Repeater2.DataBind();
                    }
                }
            }

            using (SqlCommand cmd = new SqlCommand("Handbags_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater3.DataSource = dt;
                        Repeater3.DataBind();
                    }
                }
            }

            using (SqlCommand cmd = new SqlCommand("Shoulder_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater4.DataSource = dt;
                        Repeater4.DataBind();
                    }
                }
            }

            using (SqlCommand cmd = new SqlCommand("Tote_CRUD"))
            {
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater5.DataSource = dt;
                        Repeater5.DataBind();
                    }
                }
            }
        }
    }

    protected void Edit(object sender, EventArgs e)
    {
        //Find the reference of the Repeater Item.
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        this.ToggleElements(item, true);
    }

    private void ToggleElements(RepeaterItem item, bool isEdit)
    {
        item.FindControl("lnkEdit").Visible = !isEdit;
        item.FindControl("lnkUpdate").Visible = isEdit;
        item.FindControl("lnkCancel").Visible = isEdit;

        item.FindControl("lblTitle").Visible = !isEdit;
        item.FindControl("lblAuthor").Visible = !isEdit;
        item.FindControl("imgBooks").Visible = !isEdit;

        item.FindControl("txtTitle").Visible = isEdit;
        item.FindControl("txtAuthor").Visible = isEdit;
        item.FindControl("txtImage").Visible = isEdit;
    }

    protected void OnCancel(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        this.ToggleElements(item, false);
    }

    protected void OnUpdate(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

        int bagsID = int.Parse((item.FindControl("lblBookId") as Label).Text);
        string name = (item.FindControl("txtTitle") as TextBox).Text.Trim();
        string price = (item.FindControl("txtAuthor") as TextBox).Text.Trim();
        string image = (item.FindControl("txtImage") as TextBox).Text.Trim();

        string constr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            //using stored procedure
            using (SqlCommand cmd = new SqlCommand("Backpacks_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                cmd.Parameters.AddWithValue("@BookId", bagsID);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Crossbody_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                cmd.Parameters.AddWithValue("@BookId", bagsID);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Handbags_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                cmd.Parameters.AddWithValue("@BookId", bagsID);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Shoulder_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                cmd.Parameters.AddWithValue("@BookId", bagsID);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Tote_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                cmd.Parameters.AddWithValue("@BookId", bagsID);
                cmd.Parameters.AddWithValue("@Title", name);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Image", image);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            this.BindRepeater();
        }

    }

    protected void OnDelete(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        int bookId = int.Parse((item.FindControl("lblBookId") as Label).Text);

        string constr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Backpacks_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@BookId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Crossbody_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@BookId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Handbags_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@BookId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Shoulder_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@BookId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("Tote_CRUD"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@BookId", bookId);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindRepeater();
    }

    protected void btnAddItem_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertBackpacks.aspx");
    }
    protected void btnAddItem2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertCrossbody.aspx");
    }
    protected void btnAddItem3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertHandbags.aspx");
    }
    protected void btnAddItem4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertShoulder.aspx");
    }
    protected void btnAddItem5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-InsertTote.aspx");
    }
}







