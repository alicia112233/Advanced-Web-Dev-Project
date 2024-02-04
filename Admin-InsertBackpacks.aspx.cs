using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_InsertBackpacks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsertItems_Click(object sender, EventArgs e)
    {
        int result = 0;
        int result2 = 0;
        string image = "";
        if (txtBackpackID.Text == "" || txtBackpackName.Text == "" || txtBackpackDesc.Text == "" || txtBackpackPrice.Text == "" || txtBackpackType.Text == "")
        {
            Response.Write("<script>alert('Please fill in all fields !');</script>");
        }
        else
        {
            if (FileUpload1.HasFile == true)
            {
                image = "Images/" + FileUpload1.FileName;
            }

            Product prod = new Product(txtBackpackID.Text, txtBackpackName.Text,
                txtBackpackDesc.Text, decimal.Parse(txtBackpackPrice.Text),
                image, txtBackpackType.Text);
            Backpacks item = new Backpacks(txtBackpackID.Text, image,
                txtBackpackType.Text, txtBackpackPrice.Text);
            result = prod.ProductInsert();
            result2 = item.BackpacksInsert();

            if (result > 0)
            {
                string saveimg = Server.MapPath(" ") + "\\" + image;
                FileUpload1.SaveAs(saveimg);
                //loadProductInfo();
                //loadProduct();
                //clear1();
            }

            if (result2 > 0)
            {
                string saveimg = Server.MapPath(" ") + "\\" + image;
                FileUpload1.SaveAs(saveimg);
                //loadProductInfo();
                //loadProduct();
                //clear1();
                Response.Write("<script>alert('Insert Successful !');</script>");
            }

            else
            {
                Response.Write("<script>alert('Failed to Insert !');</script>");
            }

            txtBackpackID.Text = "";
            txtBackpackName.Text = "";
            txtBackpackDesc.Text = "";
            txtBackpackPrice.Text = "";
            txtBackpackType.Text = "";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-BestSeller.aspx");
    }
}