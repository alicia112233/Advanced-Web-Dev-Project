﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin-index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SHOPBAGZ</title>
    <link rel="stylesheet" type="text/css" href="assets/css/index.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <body>
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
                <asp:LinkButton ID="btnIndexBS" runat="server" Text="VIEW NOW" href="Admin-BestSeller.aspx"  style="cursor: pointer;" CssClass="bcbtn" />
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
    </body>
</asp:Content>