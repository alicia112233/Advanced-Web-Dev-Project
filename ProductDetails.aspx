﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Product Details</title>
        <link rel="stylesheet" type="text/css" href="assets/css/ProductDetails.css" />
        <style>
            .Star {
                background-image: url(Images/Star.gif);
                height: 17px;
                width: 17px;
            }

            .WaitingStar {
                background-image: url(Images/WaitingStar.gif);
                height: 17px;
                width: 17px;
            }

            .FilledStar {
                background-image: url(Images/FilledStar.gif);
                height: 17px;
                width: 17px;
            }
        </style>
    </head>

    <body>
        <div class="leftcontainer">
            <div class="imgcontainer">
                <asp:Image ID="imgProductDetails" runat="server" Style="width: 280px; height: 400px; padding: 12px 10px 1px" />
            </div>
        </div>

        <div class="rightcontainer">
            <div class="booktitle">
                <asp:Label ID="lblTitle" runat="server" Text="Label" style="font-size: 35px;"></asp:Label>
            </div>

            <div class="bookauthor">
                <asp:Label ID="lblAuthor" runat="server" Text="Label" Style="color: black"></asp:Label>
            </div>

            <div class="bookprice">
                <asp:Label ID="lblPrice" runat="server" Text="Label" style="font-size: 30px;"></asp:Label>
            </div>

            <div class="booktype">
                <a class="active">Standard<br />
                    $<asp:Label ID="lblPrice2" runat="server" Text="Label"></asp:Label></a>
            </div>

            <div class="bookshipping">
                ✔&nbsp Spend a Minimum of $250 to get Free Shipping
            </div>

            <div class="bookpurchase">
                <asp:Button ID="btnAddCart" runat="server" Text="ADD TO CART" class="cartbutton" style="cursor: pointer;" OnClick="btnAddCart_Click"/>
            </div> <br />

            <div class="footnote">
                &nbsp Choose Expedited Shipping at checkout for guaranteed delivery within 
            </div>

            <div class="footnote" style="font-weight: bold; margin-top: 0;">
                &nbsp 2-3 days
            </div>
        </div>

        <div class="bookdescription">
            <p style="text-align: center; font-family: 'Noticia Text', serif; font-weight: bold; font-size: 25px;">Overview</p>
            <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
        </div>

        <div class="booktitle" style="font-family: 'Playfair Display', serif; text-align: center; margin-bottom: 10px; font-size: 25px;">
            <asp:Label ID="Label2" runat="server" Text="Customer Review"></asp:Label>
        </div>

        <div class="leftratings">
            <asp:Label ID="Label1" Style="font-family: 'Noticia Text', serif; font-size: 16px" runat="server" Text="Average Rating"></asp:Label><br />
            <%--Add codes here--%>
            <asp:Label ID="lblavgrating" runat="server" Text="Label" Font-Size="37px"></asp:Label>

            <asp:Rating ID="Rating1" runat="server" StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star" FilledStarCssClass="FilledStar"></asp:Rating><br />
            <asp:Label ID="lblresult" runat="server" Text="" Font-Size="Smaller"></asp:Label>
        </div>

        <div class="rightratings">
            <asp:TextBox runat="server" ID="txtreview" TextMode="MultiLine" Height="100px"></asp:TextBox>
            <asp:Button runat="server" class="cartbutton" Style="float: right; cursor: pointer;" Text="Submit Review" ID="btnSubmit" OnClick="btnSubmit_Click" Height="30px" Width="100px" />
        </div>

    </body>
    </html>
</asp:Content>

