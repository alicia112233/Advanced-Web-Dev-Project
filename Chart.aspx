<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Chart.aspx.cs" Inherits="Chart" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 171px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="border: 1px solid black; font-family: Arial">
    <tr>
        <td class="auto-style1">
            <b>Select Bag Type:</b>
        </td>
        <td>
            <asp:LinkButton ID="Label1" runat="server" Text="Backpacks" OnClick="Label1_Click"></asp:LinkButton> |
            <asp:LinkButton ID="Label2" runat="server" Text="Crossbody Bags" OnClick="Label2_Click"></asp:LinkButton> |
            <asp:LinkButton ID="Label3" runat="server" Text="HandBags" OnClick="Label3_Click"></asp:LinkButton> |
            <asp:LinkButton ID="Label4" runat="server" Text="Shoulder Bags" OnClick="Label4_Click"></asp:LinkButton> |
            <asp:LinkButton ID="Label5" runat="server" Text="Tote Bags" OnClick="Label5_Click"></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Chart ID="Chart1" runat="server" Width="350px" style="margin: auto; margin-left: 390px;" Visible="False">
        <Titles>
            <asp:Title Text="Ratings for Backpacks"></asp:Title>
        </Titles>
        <Series>
            <asp:Series Name="Series1" ChartArea="ChartArea1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Bags">
                </AxisX>
                <AxisY Title="Average Score">
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
            <asp:Chart ID="Chart2" runat="server" Width="350px" style="margin: auto; margin-left: 390px;" Visible="False">
        <Titles>
            <asp:Title Text="Ratings for Crossbody Bags"></asp:Title>
        </Titles>
        <Series>
            <asp:Series Name="Series1" ChartArea="ChartArea1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Bags">
                </AxisX>
                <AxisY Title="Average Score">
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
            <asp:Chart ID="Chart3" runat="server" Width="350px" style="margin: auto; margin-left: 390px;" Visible="False">
        <Titles>
            <asp:Title Text="Ratings for HandBags"></asp:Title>
        </Titles>
        <Series>
            <asp:Series Name="Series1" ChartArea="ChartArea1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Bags">
                </AxisX>
                <AxisY Title="Average Score">
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
            <asp:Chart ID="Chart4" runat="server" Width="350px" style="margin: auto; margin-left: 390px;" Visible="False">
        <Titles>
            <asp:Title Text="Ratings for Shoulder Bags"></asp:Title>
        </Titles>
        <Series>
            <asp:Series Name="Series1" ChartArea="ChartArea1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Bags">
                </AxisX>
                <AxisY Title="Average Score">
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
            <asp:Chart ID="Chart5" runat="server" Width="350px" style="margin: auto; margin-left: 390px;" Visible="False">
        <Titles>
            <asp:Title Text="Ratings for Tote Bags"></asp:Title>
        </Titles>
        <Series>
            <asp:Series Name="Series1" ChartArea="ChartArea1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Title="Bags">
                </AxisX>
                <AxisY Title="Average Score">
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
        </td>
    </tr>
    </table>

</asp:Content>

