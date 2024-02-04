using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class indexBags : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        { 
            DataSet image1 = GetDataImage1();
            DataSet image2 = GetDataImage2();
            DataSet image3 = GetDataImage3();

            Repeater1.DataSource = image1;
            Repeater2.DataSource = image2;
            Repeater3.DataSource = image3;

            Repeater1.DataBind();
            Repeater2.DataBind();
            Repeater3.DataBind();
        }
    }

    private DataSet GetDataImage1()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT Image FROM SliderImg WHERE Image='Images/29.jpg'", conn);
            DataSet dataimg1 = new DataSet();
            cmd.Fill(dataimg1);
            return dataimg1;
        }
    }

    private DataSet GetDataImage2()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT Image FROM SliderImg WHERE Image='Images/30.jpg'", conn);
            DataSet dataimg2 = new DataSet();
            cmd.Fill(dataimg2);
            return dataimg2;
        }
    }

    private DataSet GetDataImage3()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT Image FROM SliderImg WHERE Image='Images/32.jpg'", conn);
            DataSet dataimg3 = new DataSet();
            cmd.Fill(dataimg3);
            return dataimg3;
        }
    }
}