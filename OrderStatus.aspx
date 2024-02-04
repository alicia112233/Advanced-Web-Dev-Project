<%@ Page Title="" Language="C#" MasterPageFile="~/Afterlogin.master" AutoEventWireup="true" CodeFile="OrderStatus.aspx.cs" Inherits="OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Admin - Orders</title>
        <style>
            .GVcontainer {
                height: auto;
                width: 100%;
                border: 0.6px solid;
                margin-top: 40px;
                margin-bottom: 40px;
            }
        </style>
    </head>
    <body>
        <div class="GVcontainer">
            <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnRowDeleting="gvOrders_RowDeleting" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Item Received"/>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AliciaCS %>" SelectCommand="SELECT * FROM [ORDERS]"></asp:SqlDataSource>
        </div>
    </body>
    </html>
</asp:Content>

