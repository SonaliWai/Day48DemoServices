<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersUpdate.aspx.cs" Inherits="Day48DemoServices.Pages.Users.UsersUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users Update</title>
    <link rel="stylesheet" href="/www-resources/css/form.css" />

</head>
<body>
    <h1>Update User</h1>

    <form id="form1" runat="server">
        <div class="status-message">
            <asp:Label runat="server" ID="LabelStatus" Visible="false" />
        </div>
        <div>
            <table class="form-block">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LabelFirstName">FirstName</asp:Label></td>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxFirstName" MaxLength="50" placeholder="Enter FirstName"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelLastName" runat="server" Text="Lastname"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxLastName" MaxLength="50" placeholder="Enter LastName"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelDateOfBirth" runat="server" Text="DateOfBirth"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxDateOfBirth" TextMode="Date" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelPan" runat="server" Text="Pan"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPan" runat="server" Placeholder="Enter Pan"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList runat="server" ID="RadioButtonListGender" RepeatDirection="Horizontal">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="O">Other</asp:ListItem>
                        </asp:RadioButtonList>

                        <%--<asp:RadioButton ID="MaleRadioButton" Text="M" runat="server" GroupName="Gender" />
                        <asp:RadioButton ID="FemaleRadioButton" Text="F" runat="server" GroupName="Gender" />
                        <asp:RadioButton ID="OtherRadioButton" Text="O" runat="server" GroupName="Gender" />--%>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="LabelMobileNumber" runat="server" Text="MobileNumber"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxMobileNumber" TextMode="Number" runat="server" placeholder="Enter MobileNumber"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxEmail" TextMode="Email" runat="server" placeholder="Enter Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Comments" runat="server" Text="Comments"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxComments" TextMode="MultiLine" runat="server" placeholder="Enter Comments"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LabelDepartmentRefId">DepartmentRefId</asp:Label></td>
                    <td>
                        <asp:DropDownList runat="server" ID="DropDownListDepartmentRefId" DataTextField="Name" DataValueField="Id" DataSourceID="SqlDataSource1" />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserManagementConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserManagementConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>--%>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button runat="server" ID="ButtonUpdate" Text="Update" OnClick="ButtonUpdate_Click" />
                        <a style="float: right" href="UsersDefault.aspx">
                            <input type="button" value="Back to Listing" /></a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
