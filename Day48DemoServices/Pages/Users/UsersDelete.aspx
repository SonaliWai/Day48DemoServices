<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersDelete.aspx.cs" Inherits="Day48DemoServices.Pages.Users.UsersDelete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users Delete</title>
    <link rel="stylesheet" href="/www-resources/css/form.css" />

</head>
<body>
<h1>Delete Users</h1>

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
                    <asp:Label runat="server" ID="LabelIdData" CssClass="readonly-data"></asp:Label>
                </td>
            </tr>
            </table>
        </div>
    </form>
</body>
</html>
