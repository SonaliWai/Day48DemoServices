<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultGridView6.aspx.cs" Inherits="Day48DemoServices.Pages.Departments.DefaultGridView6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department GridView 6</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" 
                          AllowPaging="True" 
                          AllowSorting="True" 
                          AutoGenerateColumns="False" 
                          DataKeyNames="Id" 
                          DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Id" ,  "~/Pages/Users/Default.aspx?Id={0}") %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>' style="color: pink;"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>             
                            <asp:Image ID="ImageGender" runat="server" ImageUrl='<%# GetImageUrl(Eval("Gender")) %>' style="width: 20px;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:ButtonField Text="Button" />
                </Columns>
            </asp:GridView>
            <hr />

            <a href="#" onclick="tableNewRecord.style.display = 'block'">Add new Department</a>
            
            <table id="tableNewRecord" class="form-block" style="display: none;">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LabelName">Name</asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="LabelDescription">Description</asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxName" placeholder="Enter Department Name" 
                                     MaxLength="50"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxDescription" placeholder="Department Description" 
                                     TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="ButtonCreate" Text="Create" OnClick="ButtonCreate_Click" />
                        <input type="reset" />
                    </td>
                </tr>
            </table>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserManagementConnectionString %>" 
                               DeleteCommand="DELETE FROM [Department] WHERE [Id] = @Id"
                               InsertCommand="INSERT INTO [Department] ([Name], [Description], [Gender]) VALUES (@Name, @Description, @Gender)"
                               SelectCommand="SELECT * FROM [Department]" 
                               UpdateCommand="UPDATE [Department] SET [Name] = @Name, [Description] = @Description, [Gender] = @Gender WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Gender" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Gender" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
