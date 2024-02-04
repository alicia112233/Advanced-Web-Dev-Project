<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin-Users.aspx.cs" Inherits="Admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
      VIEWING: USERS
    <html>
    <head>
        <title>Admin - Users</title>
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
   
            <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="gvUsers_RowCancelingEdit" OnRowEditing="gvUsers_RowEditing" OnRowUpdating="gvUsers_RowUpdating" OnRowDeleting="gvUsers_RowDeleting" OnRowDataBound="OnRowDataBound">
                <Columns>
                    <%--<asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                    <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
<%--                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                            <asp:TextBox ID="tbFname" runat="server" Text='<%#Eval("First_Name") %>'></asp:TextBox>
                            <asp:TextBox ID="tbLname" runat="server" Text='<%#Eval("Last_Name") %>'></asp:TextBox>
                            <asp:TextBox ID="tbEmail" runat="server" Text='<%#Eval("Email") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    
                    
                    <asp:TemplateField HeaderText="ID">  
                        <ItemTemplate>  
                            <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>  
                        </ItemTemplate>  
                    </asp:TemplateField>  

                    <asp:TemplateField HeaderText="First_Name">  
                        <ItemTemplate>  
                            <asp:Label ID="lbl_FName" runat="server" Text='<%#Eval("First_Name") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txt_FName" runat="server" Text='<%#Eval("First_Name") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>  

                    <asp:TemplateField HeaderText="Last_Name">  
                        <ItemTemplate>  
                            <asp:Label ID="lbl_LName" runat="server" Text='<%#Eval("Last_Name") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txt_LName" runat="server" Text='<%#Eval("Last_Name") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">  
                        <ItemTemplate>  
                            <asp:Label ID="lbl_Email" runat="server" Text='<%#Eval("Email") %>'></asp:Label>  
                        </ItemTemplate>  
                        <EditItemTemplate>  
                            <asp:TextBox ID="txt_Email" runat="server" Text='<%#Eval("Email") %>'></asp:TextBox>  
                        </EditItemTemplate>  
                    </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                    <%--<asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small"
                                CommandName="Delete"/>
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
<%--            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AliciaCS %>" SelectCommand="SELECT [Id], [First_Name], [Last_Name], [Email] FROM [REGISTRATION]"></asp:SqlDataSource>--%>
        </div>
    </body>
    </html>

</asp:Content>

