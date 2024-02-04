<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BestSellerBags.aspx.cs" Inherits="BestSellerBags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Best Sellers</title>
    <link rel="stylesheet" type="text/css" href="assets/css/BestSeller.css" />
    <style>
        .bookcontainer{
            height: 1780px;
        }
        .sidecontainer{
            height: 1810px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body>
        <br />
        <div class="pagetitle">Best Sellers For Bags</div>
        <br />

        <div class="sidecontainer">
            <div style="width: auto; height: auto; float: right; padding-right: 20px;">
                <a style="font-family: 'Oswald', sans-serif;">FEATURED</a>
                <a href="BestSellerBags.aspx" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">All-Time BestSellers</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Trending Now</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Online Exclusive</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Back In Stock</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Summer 2023 Bags</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">The Bucks Collection</a>
                <a style="font-family: 'Oswald', sans-serif;"></a>
                <a style="font-family: 'Oswald', sans-serif;">SHOP BY CATEGORY</a>
                <a href="all-products-page.aspx" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">View All Bags</a>
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
            <div class="containertitle">
                BACKPACKS - 30% OFF !
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton PostBackUrl='<%# ResolveClientUrl("ProductDetails.aspx?ProdID=" + Eval("BS_ID"))%>' ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <div class="containertitle">
               CROSSBODY BAGS
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton PostBackUrl='<%# ResolveClientUrl("ProductDetails.aspx?ProdID=" + Eval("BS_ID"))%>' ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <div class="containertitle">
                HANDBAGS
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton PostBackUrl='<%# ResolveClientUrl("ProductDetails.aspx?ProdID=" + Eval("BS_ID"))%>' ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <div class="containertitle">
                SHOULDER BAGS
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton PostBackUrl='<%# ResolveClientUrl("ProductDetails.aspx?ProdID=" + Eval("BS_ID"))%>' ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="containertitle">
                TOTE BAGS
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater5" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton PostBackUrl='<%# ResolveClientUrl("ProductDetails.aspx?ProdID=" + Eval("BS_ID"))%>' ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
        </div>
    </body>

</asp:Content>

