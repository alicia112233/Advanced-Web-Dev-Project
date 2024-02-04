using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Orders
/// </summary>
public class Orders
{
    string _connStr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    public Orders()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int OrdersDelete(string ID)
    {
        string queryStr = "DELETE FROM ORDERS WHERE OrderID=@ID";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ID", ID);
        conn.Open();
        int nofRow = 0;
        nofRow = cmd.ExecuteNonQuery();
        conn.Close();
        return nofRow;
    }

}