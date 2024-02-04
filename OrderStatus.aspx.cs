using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderStatus : System.Web.UI.Page
{
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
            Response.Write("<script type='text/javascript' language='javascript'> alert('Order Removed successfully !');document.location.href='http://localhost:10068/Admin-Orders.aspx';</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript' language='javascript'> alert('Order Removal NOT successful !');document.location.href='http://localhost:10068/Admin-Orders.aspx';</script>");
        }
    }
}