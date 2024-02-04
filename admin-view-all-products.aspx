<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="admin-view-all-products.aspx.cs" Inherits="admin_view_all_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="assets/css/Search.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
        <br />
        <div class="pagetitle">All Bags</div>
        <div class="sidecontainer">
            <div style="width: auto; height: auto; float: right">
                <a style="font-family: 'Oswald', sans-serif;">FEATURED</a>
                <a href="Admin-BestSeller.aspx" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">All-Time BestSellers</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Trending Now</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Online Exclusive</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Back In Stock</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Summer 2023 Bags</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">The Bucks Collection</a>
                <a style="font-family: 'Oswald', sans-serif;"></a>
                <a style="font-family: 'Oswald', sans-serif;">SHOP BY CATEGORY</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">View All Bags</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">New Arriavls</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Backpacks</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Crossbody bags</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Handbags</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Shoulder Bags</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Tote Bags</a>
                <a style="font-family: 'Oswald', sans-serif;"></a>
                <a style="font-family: 'Oswald', sans-serif;">TRENDS & OCCASIONS</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Esstentials</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Party</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Wedding</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Work</a>
            </div>
        </div>

        <div class="bookcontainer">
            <div class="bookshelf">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton PostBackUrl='<%# ResolveClientUrl("Admin-ProductDetails.aspx?ProdID=" + Eval("ID") ) %>' class="bookimage" ID="imgBooks" ImageUrl='<%#Eval("Image") %>' runat="server" />
                            <asp:Label class="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("Title")%>'></asp:Label><br />
                           $<asp:Label class="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("Price") %>' Style="color: black;"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </body>
</asp:Content>