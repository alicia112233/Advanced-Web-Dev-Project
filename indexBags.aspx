<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="indexBags.aspx.cs" Inherits="indexBags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="assets/css/index.css" />
    <style>
        /* Fading animation */
        .fade {
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @keyframes fade {
            from {opacity: .4} 
            to {opacity: 1}
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <asp:ImageButton ID="img1" style="width: 100%;" CssClass="image" ImageUrl='<%#Eval("Image") %>' runat="server" />
                    </ItemTemplate>
                </asp:Repeater>
<%--                <img src="Images/29.jpg" style="width: 100%">--%>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                     <a href="http://localhost:10068/BestSellerBags.aspx"> <asp:ImageButton ID="img2" CssClass="image" style="width: 100%;" ImageUrl='<%#Eval("Image") %>' runat="server" /> </a>   
                    </ItemTemplate>
                </asp:Repeater>
<%--                <img src="Images/30.jpg" style="width: 100%">--%>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <asp:ImageButton ID="img3" CssClass="image" style="width: 100%;" ImageUrl='<%#Eval("Image") %>' runat="server" />
                    </ItemTemplate>
                </asp:Repeater>
<%--                <img src="Images/32.jpg" style="width: 100%">--%>
            </div>

            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>

        <div class="collage">
            <div class="zone1"></div>
            <div class="zone2"></div>
            <div class="zone3"></div>
        </div>
        <br />
        <br />
        <div class="bookcontainer">
            <div class="zoneA">
                Shopbagz's TOP PICKS<br />
                <asp:LinkButton ID="btnIndexBS" runat="server" Text="VIEW NOW" href="BestSellerBags.aspx"  style="cursor: pointer;" CssClass="bcbtn" />
            </div>
            <div class="zoneB"></div>
            <div class="zoneC"></div>
            <div class="zoneD"></div>
            <div class="zoneE"></div>
        </div>
        <br />
        <br />
        <div class="titletext">
            CHECK OUT OUR LATEST BAGS
        </div>
        <br />
        <div class="movieposter">
            <div class="poster1"></div>
            <div class="poster2"></div>
            <div class="poster3"></div>
        </div>
        <br />
        <div class="titletext">
            BAGS WITH THE CHIC LOOKS
        </div>
        <br />
        <div class="toyposter">
            <div class="toy1"></div>
            <div class="toy2"></div>
            <div class="toy3"></div>
        </div>
        <br />
        <div class="titletext">
            TOP NEW COLLECTION
        </div>
        <br />
        <div class="bookcontainer2">
            <div class="zoneF"></div>
            <div class="zoneG"></div>
            <div class="zoneH"></div>
            <div class="zoneI"></div>
            <div class="zoneJ"></div>
            <div class="zoneK"></div>
            <div class="zoneL"></div>
            <div class="zoneM"></div>
            <div class="zoneN"></div>
            <div class="zoneO"></div>
        </div>
        <br />
        <br />

        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length) { slideIndex = 1 }
                if (n < 1) { slideIndex = slides.length }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 2000); // Change image every 2 seconds
            }
        </script>
</asp:Content>

