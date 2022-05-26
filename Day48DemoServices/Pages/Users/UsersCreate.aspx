<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersCreate.aspx.cs" Inherits="Day48DemoServices.Pages.Users.UsersCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Create</title>
     <link rel="stylesheet" href="/www-resources/css/form.css" />
</head>
<body>
    <h1>Create new User</h1>
    <form id="form1" runat="server">
        <div class="status-message">
            <asp:Label runat="server" id="LabelStatus" Visible="false" />
        </div>
        <div>
            <table class="form-block">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LabelId">Id</asp:Label></td>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxId" placeholder="Enter  Id" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelFirstName" runat="server" Text="FirstName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxFirstName" runat="server" placeholder="Enter First Name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelLastName" runat="server" Text="LastName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxLastName" runat="server" placeholder="Enter Last Name"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelDateOfBirth" runat="server" Text="DateOfBirth"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
