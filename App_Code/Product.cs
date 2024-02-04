using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
    string _connStr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    private string _prodID = null;
    private string _prodName = string.Empty;
    private string _prodDesc = "";
    private decimal _unitPrice = 0;
    private string _prodImage = "";
    private string _bagType = "";

    public Product()
    {
    }

    public Product(string prodID, string prodName, string prodDesc,
                    decimal unitPrice, string prodImage, string bagType)
    {
        _prodID = prodID;
        _prodName = prodName;
        _prodDesc = prodDesc;
        _unitPrice = unitPrice;
        _prodImage = prodImage;
        _bagType = bagType;
    }

    // get/set the attributes of the Product object.
    // note the attribute name (e.g. Product_ID) is same as the actual database field name.
    // this is for ease of referencing.
    public string Product_ID
    {
        get { return _prodID; }
        set { _prodID = value; }
    }
    public string Product_Name
    {
        get { return _prodName; }
        set { _prodName = value; }
    }
    public string Product_Desc
    {
        get { return _prodDesc; }
        set { _prodDesc = value; }
    }
    public decimal Unit_Price
    {
        get { return _unitPrice; }
        set { _unitPrice = value; }
    }
    public string Product_Image
    {
        get { return _prodImage; }
        set { _prodImage = value; }
    }

    public string Bag_Type
    {
        get { return _bagType; }
        set { _bagType = value; }
    }

    //below as the Class methods for some DB operations. 
    public Product getProduct(string prodID)
    {
        Product prodDetail = null;

        string prod_Name, prod_Desc, Prod_Image, Bag_Type;
        decimal unit_Price;

        string queryStr = "SELECT * FROM ALL_Products WHERE ID = @ProdID";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ProdID", prodID);

        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            prod_Name = dr["Title"].ToString();
            prod_Desc = dr["Description"].ToString();
            Prod_Image = dr["Image"].ToString();
            unit_Price = decimal.Parse(dr["Price"].ToString());
            Bag_Type = dr["Type"].ToString();

            prodDetail = new Product(prodID, prod_Name, prod_Desc, unit_Price, Prod_Image, Bag_Type);
        }
        else
        {
            prodDetail = null;
        }

        conn.Close();
        dr.Close();
        dr.Dispose();

        return prodDetail;
    }

    public int UserDelete(string ID)
    {
        string queryStr = "DELETE FROM REGISTRATION WHERE ID=@ID";
        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@ID", ID);
        conn.Open();
        int nofRow = 0;
        nofRow = cmd.ExecuteNonQuery();
        conn.Close();
        return nofRow;
    }

    public int ProductInsert()
    {
        int result = 0;
        string queryStr = "INSERT INTO ALL_Products(ID, Title, Description, Price, Image, Type)" + "values (@Product_ID, @Product_Name, @Product_Desc, @Unit_Price, @Product_Image, @Bag_Type)";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStr, conn);
        cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
        cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
        cmd.Parameters.AddWithValue("@Product_Desc", this.Product_Desc);
        cmd.Parameters.AddWithValue("@Unit_Price", this.Unit_Price);
        cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
        cmd.Parameters.AddWithValue("@Bag_Type", this.Bag_Type);

        conn.Open();
        result += cmd.ExecuteNonQuery();
        conn.Close();

        return result;
    }//end Insert

}

public class Backpacks
{
    //System.Configuration.ConnectionStringSettings _connStr;
    string _connStr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    private string _prodID = null;
    private string _prodName = string.Empty;
    private string _prodImage = "";
    private string _price = "";

    // Default constructor
    public Backpacks()
    {
    }

    // PRODUCTS
    public Backpacks(string prodID, string prodName, string prodImage, string price)
    {
        _prodID = prodID;
        _prodName = prodName;
        _prodImage = prodImage;
        _price = price;
    }

    // Constructor that take in all except product ID
    public Backpacks(string prodName, string prodImage, string price)
        : this(null, prodName, prodImage, price)
    {
    }

    // Constructor that take in only Product ID. The other attributes will be set to 0 or empty.
    public Backpacks(string prodID)
        : this(prodID, "", "", "")
    {
    }

    // Get/Set the attributes of the Product object.
    // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
    // This is for ease of referencing.
    public string Product_ID
    {
        get { return _prodID; }
        set { _prodID = value; }
    }
    public string Product_Name
    {
        get { return _prodName; }
        set { _prodName = value; }
    }

    public string Product_Image
    {
        get { return _prodImage; }
        set { _prodImage = value; }
    }

    public string Price
    {
        get { return _price; }
        set { _price = value; }
    }

    public int BackpacksInsert()
    {
        int result = 0;
        string queryStrBackpacks = "INSERT INTO BS_Backpacks(BS_ID, BS_Image, BS_Title, BS_Price)" + "values (@Product_ID, @Product_Name, @Product_Image, @Price)";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStrBackpacks, conn);
        cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
        cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
        cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
        cmd.Parameters.AddWithValue("@Price", this.Price);

        conn.Open();
        result += cmd.ExecuteNonQuery();
        conn.Close();

        return result;
    }//end Insert
}

public class Crossbody
{
    //System.Configuration.ConnectionStringSettings _connStr;
    string _connStr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    private string _prodID = null;
    private string _prodName = string.Empty;
    private string _prodImage = "";
    private string _price = "";

    // Default constructor
    public Crossbody()
    {
    }

    // PRODUCTS
    public Crossbody(string prodID, string prodName, string prodImage, string price)
    {
        _prodID = prodID;
        _prodName = prodName;
        _prodImage = prodImage;
        _price = price;
    }

    public Crossbody(string prodName, string prodImage, string price)
        : this(null, prodName, prodImage, price)
    {
    }

    public Crossbody(string prodID)
        : this(prodID, "", "", "")
    {
    }

    public string Product_ID
    {
        get { return _prodID; }
        set { _prodID = value; }
    }
    public string Product_Name
    {
        get { return _prodName; }
        set { _prodName = value; }
    }

    public string Product_Image
    {
        get { return _prodImage; }
        set { _prodImage = value; }
    }

    public string Price
    {
        get { return _price; }
        set { _price = value; }
    }

    public int CrossbodyInsert()
    {
        int result = 0;
        string queryStrBackpacks = "INSERT INTO BS_Crossbody(BS_ID, BS_Image, BS_Title, BS_Price)" + "values (@Product_ID, @Product_Name, @Product_Image, @Price)";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStrBackpacks, conn);
        cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
        cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
        cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
        cmd.Parameters.AddWithValue("@Price", this.Price);

        conn.Open();
        result += cmd.ExecuteNonQuery();
        conn.Close();

        return result;
    }//end Insert
}

public class Handbags
{
    //System.Configuration.ConnectionStringSettings _connStr;
    string _connStr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    private string _prodID = null;
    private string _prodName = string.Empty;
    private string _prodImage = "";
    private string _price = "";

    // Default constructor
    public Handbags()
    {
    }

    // PRODUCTS
    public Handbags(string prodID, string prodName, string prodImage, string price)
    {
        _prodID = prodID;
        _prodName = prodName;
        _prodImage = prodImage;
        _price = price;
    }

    public Handbags(string prodName, string prodImage, string price)
        : this(null, prodName, prodImage, price)
    {
    }

    public Handbags(string prodID)
        : this(prodID, "", "", "")
    {
    }

    public string Product_ID
    {
        get { return _prodID; }
        set { _prodID = value; }
    }
    public string Product_Name
    {
        get { return _prodName; }
        set { _prodName = value; }
    }

    public string Product_Image
    {
        get { return _prodImage; }
        set { _prodImage = value; }
    }

    public string Price
    {
        get { return _price; }
        set { _price = value; }
    }

    public int HandbagsInsert()
    {
        int result = 0;
        string queryStrBackpacks = "INSERT INTO BS_Handbags(BS_ID, BS_Image, BS_Title, BS_Price)" + "values (@Product_ID, @Product_Name, @Product_Image, @Price)";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStrBackpacks, conn);
        cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
        cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
        cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
        cmd.Parameters.AddWithValue("@Price", this.Price);

        conn.Open();
        result += cmd.ExecuteNonQuery();
        conn.Close();

        return result;
    }//end Insert
}

public class Shoulder
{
    //System.Configuration.ConnectionStringSettings _connStr;
    string _connStr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    private string _prodID = null;
    private string _prodName = string.Empty;
    private string _prodImage = "";
    private string _price = "";

    // Default constructor
    public Shoulder()
    {
    }

    // PRODUCTS
    public Shoulder(string prodID, string prodName, string prodImage, string price)
    {
        _prodID = prodID;
        _prodName = prodName;
        _prodImage = prodImage;
        _price = price;
    }

    public Shoulder(string prodName, string prodImage, string price)
        : this(null, prodName, prodImage, price)
    {
    }

    public Shoulder(string prodID)
        : this(prodID, "", "", "")
    {
    }

    public string Product_ID
    {
        get { return _prodID; }
        set { _prodID = value; }
    }
    public string Product_Name
    {
        get { return _prodName; }
        set { _prodName = value; }
    }

    public string Product_Image
    {
        get { return _prodImage; }
        set { _prodImage = value; }
    }

    public string Price
    {
        get { return _price; }
        set { _price = value; }
    }

    public int ShoulderInsert()
    {
        int result = 0;
        string queryStrBackpacks = "INSERT INTO BS_Shoulder(BS_ID, BS_Image, BS_Title, BS_Price)" + "values (@Product_ID, @Product_Name, @Product_Image, @Price)";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStrBackpacks, conn);
        cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
        cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
        cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
        cmd.Parameters.AddWithValue("@Price", this.Price);

        conn.Open();
        result += cmd.ExecuteNonQuery();
        conn.Close();

        return result;
    }//end Insert
}

public class Tote
{
    //System.Configuration.ConnectionStringSettings _connStr;
    string _connStr = ConfigurationManager.ConnectionStrings["AliciaCS"].ConnectionString;
    private string _prodID = null;
    private string _prodName = string.Empty;
    private string _prodImage = "";
    private string _price = "";

    // Default constructor
    public Tote()
    {
    }

    // PRODUCTS
    public Tote(string prodID, string prodName, string prodImage, string price)
    {
        _prodID = prodID;
        _prodName = prodName;
        _prodImage = prodImage;
        _price = price;
    }

    public Tote(string prodName, string prodImage, string price)
        : this(null, prodName, prodImage, price)
    {
    }

    public Tote(string prodID)
        : this(prodID, "", "", "")
    {
    }

    public string Product_ID
    {
        get { return _prodID; }
        set { _prodID = value; }
    }
    public string Product_Name
    {
        get { return _prodName; }
        set { _prodName = value; }
    }

    public string Product_Image
    {
        get { return _prodImage; }
        set { _prodImage = value; }
    }

    public string Price
    {
        get { return _price; }
        set { _price = value; }
    }

    public int ToteInsert()
    {
        int result = 0;
        string queryStrBackpacks = "INSERT INTO BS_Tote(BS_ID, BS_Image, BS_Title, BS_Price)" + "values (@Product_ID, @Product_Name, @Product_Image, @Price)";

        SqlConnection conn = new SqlConnection(_connStr);
        SqlCommand cmd = new SqlCommand(queryStrBackpacks, conn);
        cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
        cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
        cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
        cmd.Parameters.AddWithValue("@Price", this.Price);

        conn.Open();
        result += cmd.ExecuteNonQuery();
        conn.Close();

        return result;
    }//end Insert
}