<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersDefault.aspx.cs" Inherits="Day48DemoServices.Pages.Users.UsersDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User view All</title>
    <link rel="stylesheet" href="/www-resources/css/form.css" />

</head>
<body>
    <h1>View All Users</h1>

    <a href="Create.aspx">Add new department</a>
    <br />
    <br />
    <form id="form1" runat="server">
        <div>
            <table class="data-view">
                <tr>
                    <th>Id</th>
                    <th>FirstName</th>
                    <th>LastName</th>
                    <th>DateOfBirth</th>
                    <th>Pan</th>
                    <th>Address</th>
                    <th>Gender</th>
                    <th>MobileNumber</th>
                    <th>Email</th>
                    <th>Comments</th>
                    <th>DepartmentRefId</th>

                    <th colspan="2"></th>
                </tr>
                <%
                    foreach (var user in users)
                    {
                %>
                <tr>
                    <td><%= user.Id %></td>
                    <td><%= user.FirstName %></td>
                    <td><%= user.LastName %></td>
                    <td><%= user.DateOfBirth %></td>
                    <td><%= user.Pan %></td>
                    <td><%= user.Address %></td>
                    <td><%= user.Gender %></td>
                    <td><%= user.MobileNumber %></td>
                    <td><%= user.Email %></td>
                    <td><%= user.Comments %></td>
                    <td><%= user.DepartmentRefId %></td>
                    
                    
                    <td><%= user.Description.GetFormattedValue() %></td>
                    <td><a href="Update.aspx?id=<%= user.Id %>">Edit</a></td>
                    <td><a href="Delete.aspx?id=<%= user.Id %>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </form>
</body>
</html>
