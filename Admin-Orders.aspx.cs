using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Admin_Orders : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int result = 0;
        Orders orders = new Orders();
        string OrderID = gvOrders.DataKeys[e.RowIndex].Value.ToString();
        result = orders.OrdersDelete(OrderID);

        if (result > 0)
        {
            //Response.Write("<script>alert('Order Removed successfully');</script>");
            Response.Write("<script type='text/javascript' language='javascript'> alert('Order Removed successfully !');document.location.href='http://localhost:10068/Admin-Orders.aspx';</script>");
        }
        else
        {
            //Response.Write("<script>alert('Order Removal NOT successful');</script>");
            Response.Write("<script type='text/javascript' language='javascript'> alert('Order Removal NOT successful !');document.location.href='http://localhost:10068/Admin-Orders.aspx';</script>");
        }

        //Response.Redirect("Admin-Orders.aspx");
    }

}