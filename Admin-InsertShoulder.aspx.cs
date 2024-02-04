using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_InsertShoulder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsertItems_Click(object sender, EventArgs e)
    {
        int result = 0;
        int result2 = 0;
        string image = "";
        if (txtShoulderID.Text == "" || txtShoulderName.Text == "" || txtShoulderDesc.Text == "" || txtShoulderPrice.Text == "" || txtShoulderType.Text == "")
        {
            Response.Write("<script>alert('Please fill in all fields !');</script>");
        }
        else
        {
            if (FileUpload1.HasFile == true)
            {
                image = "Images/" + FileUpload1.FileName;
            }

            Product prod = new Product(txtShoulderID.Text, txtShoulderName.Text,
                txtShoulderDesc.Text, decimal.Parse(txtShoulderPrice.Text),
                image, txtShoulderType.Text);
            Shoulder item = new Shoulder(txtShoulderID.Text, image,
                txtShoulderType.Text, txtShoulderPrice.Text);
            result = prod.ProductInsert();
            result2 = item.ShoulderInsert();

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

            txtShoulderID.Text = "";
            txtShoulderName.Text = "";
            txtShoulderDesc.Text = "";
            txtShoulderPrice.Text = "";
            txtShoulderType.Text = "";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-BestSeller.aspx");
    }
}