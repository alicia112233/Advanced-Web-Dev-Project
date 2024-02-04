<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin-BestSeller.aspx.cs" Inherits="BestSeller" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Best Sellers For Bags</title>
    <link rel="stylesheet" type="text/css" href="assets/css/BestSeller.css" />
    <style>
        .bookcontainer {
            width: 79%;
            height: 2040px;
            float: right;
            text-align: center;
            margin-bottom: 50px;
            margin-top: 50px;
            margin-left: 6px;
        }
        .sidecontainer {
            width: 20%;
            height: 2036px;
            float: left;
            text-align: left;
            margin-bottom: 50px;
            margin-top: 40px;
            border-right: 0.5px solid black;
            text-decoration: none;
            margin-left: -15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <br />
        <div class="pagetitle">Best Sellers For Bags</div>
        <br />

        <div class="sidecontainer">
            <div style="width: auto; height: auto; float: right; padding-right: 30px;">
                <a style="font-family: 'Oswald', sans-serif;">FEATURED</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">All-Time BestSellers</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Trending Now</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Online Exclusive</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Back In Stock</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">Summer 2023 Bags</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">The Bucks Collection</a>
                <a style="font-family: 'Oswald', sans-serif;"></a>
                <a style="font-family: 'Oswald', sans-serif;">SHOP BY CATEGORY</a>
                <a href="admin-view-all-products.aspx" style="font-family: 'Oswald', sans-serif; color: #b3b3ff; font-size: 12.5px">View All Bags</a>
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
                <asp:Button 
                    ID="btnAddItem"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid; cursor: pointer;" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddItem_Click" />
            </div>

            <div class="bookshelf">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("BS_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("BS_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                            <asp:TextBox ID="txtAuthor" Text='<%#Eval("BS_Price")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblBookId" runat="server" Text='<%#Eval("BS_ID")%>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="Edit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdate" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <div class="containertitle">
               CROSSBODY BAGS
                <asp:Button 
                    ID="Button1"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid; cursor: pointer;" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddItem2_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("BS_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("BS_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                            <asp:TextBox ID="txtAuthor" Text='<%#Eval("BS_Price")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblBookId" runat="server" Text='<%#Eval("BS_ID")%>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="Edit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdate" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <div class="containertitle">
                HANDBAGS
                <asp:Button 
                    ID="Button2"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid; cursor: pointer;" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddItem3_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("BS_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("BS_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                            <asp:TextBox ID="txtAuthor" Text='<%#Eval("BS_Price")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblBookId" runat="server" Text='<%#Eval("BS_ID")%>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="Edit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdate" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <div class="containertitle">
                SHOULDER BAGS
                <asp:Button 
                    ID="Button3"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid; cursor: pointer;" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddItem4_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("BS_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("BS_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                            <asp:TextBox ID="txtAuthor" Text='<%#Eval("BS_Price")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblBookId" runat="server" Text='<%#Eval("BS_ID")%>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="Edit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdate" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="containertitle">
                TOTE BAGS
                <asp:Button 
                    ID="Button4"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid; cursor: pointer;" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddItem5_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater5" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("BS_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("BS_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("BS_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("BS_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            $<asp:Label CssClass="bookauthor" ID="lblAuthor" runat="server" Text='<%#Eval("BS_Price") %>' Style="color: black"></asp:Label>
                            <asp:TextBox ID="txtAuthor" Text='<%#Eval("BS_Price")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <asp:Label ID="lblBookId" runat="server" Text='<%#Eval("BS_ID")%>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="Edit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdate" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
        </div>
    </body>
</asp:Content>

