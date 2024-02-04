using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_view_all_products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConnectionString = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        SqlConnection myConnect = new SqlConnection(strConnectionString);

        myConnect.Open();

        string all = "SELECT * FROM [ALL_Products]";
        SqlCommand cmd = new SqlCommand(all, myConnect);

        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds, "Title");
        Repeater1.DataSource = ds;
        Repeater1.DataBind();

        myConnect.Close();
    }
}