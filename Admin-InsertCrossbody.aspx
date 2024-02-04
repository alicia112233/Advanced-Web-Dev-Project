<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin-InsertCrossbody.aspx.cs" Inherits="Admin_InsertCrossbody" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <style>
            .insertcontainer {
                margin: 20px auto;
                padding: 20px;
                height: 100%;
                width: 50%;
                border: 0.5px solid;
            }

            .textboxes {
                width: 100% !important;
                height: 30px !important;
                border: 0.5px solid !important;
            }

            .labels {
                font-size: 12px;
                font-family: 'Poppins', sans-serif;
            }

            .btns {
                width: 46%;
                height: 30px;
                padding: 5px;
                border: 0.5px solid;
                background-color: yellow;
            }

            tr {
                border: none;
            }

            .pgdesc {
                text-align: center;
                font-size: 28px;
                font-family: 'Playfair Display', serif;
                color: black;
                margin-top: 30px;
            }

            .pgdesc2 {
                text-align: center;
                font-size: 15px;
                font-family: 'Poppins', sans-serif;
                color: black;
                margin-top: 5px;
            }
        </style>
    </head>

    <body>
        <div class="pgdesc">
            INSERT A NEW BAG LISTING
        </div>
        <div class="pgdesc2">
            Crossbody Bags
        </div>
        <div class="insertcontainer">
            <table>
                <tr>
                    <td>
                        <asp:Label CssClass="labels" ID="lblID" runat="server" Text="Product ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox Style="width: 20%; height: 30px; border: 0.5px solid" ID="txtCrossbodyID" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="labels" ID="Label1" runat="server" Text="Product Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textboxes" ID="txtCrossbodyName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="labels" ID="Label2" runat="server" Text="Product Description"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox  Style="width: 100%; height: 80px; border: 0.5px solid" ID="txtCrossbodyDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="labels" ID="Label3" runat="server" Text="Unit Price"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox Style="width: 30%; height: 30px; border: 0.5px solid" ID="txtCrossbodyPrice" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label CssClass="labels" ID="Label5" runat="server" Text="Image"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="labels" ID="Label6" runat="server" Text="Bag Type"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="textboxes" ID="txtCrossbodyType" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button CssClass="btns" ID="btnInsertItems" runat="server" Text="Insert" OnClick="btnInsertItems_Click" />
                        <asp:Button CssClass="btns" ID="btnBack" runat="server" Text="Back" BackColor="#66FFFF" OnClick="btnBack_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </body>
    </html>
</asp:Content>

