using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BestSellerBags :BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DataSet is an in-memory cache of data retrieved from a data source
        //step 1: create Dataset with a GET method
        DataSet backpacks = GetDataBackpacks();
        DataSet crossbody = GetDataCrossbody();
        DataSet handbags = GetDataHandbags();
        DataSet shoulder = GetDataShoulder();
        DataSet tote = GetDataTote();

        //DataSource is used to pull the data from the database and populate them
        //step 8: pull data using DataSource
        Repeater1.DataSource = backpacks;
        Repeater2.DataSource = crossbody;
        Repeater3.DataSource = handbags;
        Repeater4.DataSource = shoulder;
        Repeater5.DataSource = tote;

        //step 9: bind the data to the repeater
        Repeater1.DataBind();
        Repeater2.DataBind();
        Repeater3.DataBind();
        Repeater4.DataBind();
        Repeater5.DataBind();
    }

    private DataSet GetDataBackpacks()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM BS_Backpacks", conn);
            DataSet databackpacks = new DataSet();
            cmd.Fill(databackpacks);
            return databackpacks;
        }
    }

    private DataSet GetDataCrossbody()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM BS_Crossbody", conn);
            DataSet datacrossbody = new DataSet();
            cmd.Fill(datacrossbody);
            return datacrossbody;
        }
    }

    private DataSet GetDataHandbags()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM BS_Handbags", conn);
            DataSet datapaperbacks = new DataSet();
            cmd.Fill(datapaperbacks);
            return datapaperbacks;
        }
    }

    private DataSet GetDataShoulder()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM BS_Shoulder", conn);
            DataSet datashoulder = new DataSet();
            cmd.Fill(datashoulder);
            return datashoulder;
        }
    }

    private DataSet GetDataTote()
    {
        string AliciaCS = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(AliciaCS))
        {
            SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM BS_Tote", conn);
            DataSet datatote = new DataSet();
            cmd.Fill(datatote);
            return datatote;
        }
    }
}