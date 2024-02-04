﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_InsertHandbags : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsertItems_Click(object sender, EventArgs e)
    {
        int result = 0;
        int result2 = 0;
        string image = "";
        if (txtHandbagsID.Text == "" || txtHandbagsName.Text == "" || txtHandbagsDesc.Text == "" || txtHandbagsPrice.Text == "" || txtHandbagsType.Text == "")
        {
            Response.Write("<script>alert('Please fill in all fields !');</script>");
        }
        else
        {
            if (FileUpload1.HasFile == true)
            {
                image = "Images/" + FileUpload1.FileName;
            }

            Product prod = new Product(txtHandbagsID.Text, txtHandbagsName.Text,
                txtHandbagsDesc.Text, decimal.Parse(txtHandbagsPrice.Text),
                image, txtHandbagsType.Text);
            Handbags item = new Handbags(txtHandbagsID.Text, image,
                txtHandbagsType.Text, txtHandbagsPrice.Text);
            result = prod.ProductInsert();
            result2 = item.HandbagsInsert();

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

            txtHandbagsID.Text = "";
            txtHandbagsName.Text = "";
            txtHandbagsDesc.Text = "";
            txtHandbagsPrice.Text = "";
            txtHandbagsType.Text = "";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin-BestSeller.aspx");
    }
}