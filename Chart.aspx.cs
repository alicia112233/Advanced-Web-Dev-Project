using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

public partial class Chart : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Chart1.Visible = true;
            GetChartData();
        }
    }

    private void GetChartData()
    {
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("SELECT distinct(Title), avg(rating) as sumRating FROM RATINGS WHERE BagType='Backpack' GROUP BY Title", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            Series series = Chart1.Series["Series1"];
            while (rdr.Read())
            {
                series.Points.AddXY(rdr["Title"].ToString(),
                    rdr["sumRating"]);
            }
        }
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("SELECT distinct(Title), sum(rating) as sumRating FROM RATINGS WHERE BagType='Crossbody' GROUP BY Title", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            Series series = Chart2.Series["Series1"];
            while (rdr.Read())
            {
                series.Points.AddXY(rdr["Title"].ToString(),
                    rdr["sumRating"]);
            }
        }
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("SELECT distinct(Title), sum(rating) as sumRating FROM RATINGS WHERE BagType='Handbag' GROUP BY Title", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            Series series = Chart3.Series["Series1"];
            while (rdr.Read())
            {
                series.Points.AddXY(rdr["Title"].ToString(),
                    rdr["sumRating"]);
            }
        }
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("SELECT distinct(Title), sum(rating) as sumRating FROM RATINGS WHERE BagType='Shoulder' GROUP BY Title", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            Series series = Chart4.Series["Series1"];
            while (rdr.Read())
            {
                series.Points.AddXY(rdr["Title"].ToString(),
                    rdr["sumRating"]);
            }
        }
        using (SqlConnection con = new SqlConnection(constr))
        {
            SqlCommand cmd = new SqlCommand("SELECT distinct(Title), sum(rating) as sumRating FROM RATINGS WHERE BagType='Tote' GROUP BY Title", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            Series series = Chart5.Series["Series1"];
            while (rdr.Read())
            {
                series.Points.AddXY(rdr["Title"].ToString(),
                    rdr["sumRating"]);
            }
        }
    }
    protected void Label1_Click(object sender, EventArgs e)
    {
        Chart1.Visible= true;
        GetChartData();
    }

    protected void Label2_Click(object sender, EventArgs e)
    {
        Chart2.Visible = true;
        GetChartData();
    }

    protected void Label3_Click(object sender, EventArgs e)
    {
        Chart3.Visible = true;
        GetChartData();
    }

    protected void Label4_Click(object sender, EventArgs e)
    {
        Chart4.Visible = true;
        GetChartData();
    }

    protected void Label5_Click(object sender, EventArgs e)
    {
        Chart5.Visible = true;
        GetChartData();
    }
}