<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersDefault.aspx.cs" Inherits="Day48DemoServices.Pages.Users.UsersDefault" %>
<%@ Import Namespace=" UserServices.Services" %>
<%@ Import Namespace="UserServices.Services.Utilities" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User view All</title>
    <link rel="stylesheet" href="/www-resources/css/form.css" />

    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
    </style>

</head>
<body>
    <h1>View All Users</h1>

    <a href="UsersCreate.aspx">Add new User</a>
    <br />
    <br />
    <form id="form1" runat="server">
        <div>
            <table class="data-view">
                <tr>
                    <th class="auto-style1">Id</th>
                    <th class="auto-style1">FirstName</th>
                    <th class="auto-style1">LastName</th>
                    <th class="auto-style1">DateOfBirth</th>
                    <th class="auto-style1">Pan</th>
                    <th class="auto-style1">Address</th>
                    <th class="auto-style1">Gender</th>
                    <th class="auto-style1">MobileNumber</th>
                    <th class="auto-style1">Email</th>
                    <th class="auto-style1">Comments</th>
                    <th class="auto-style1">DepartmentRefId</th>

                    <th colspan="2" class="auto-style1"></th>
                </tr>
                <%
                    var user = new UserService();
                    var users = user.GetAll();
                    foreach (var user1 in users)
                    {
                %>
                <tr>
                    <td><%= user1.Id %></td>
                    <td><%= user1.FirstName %></td>
                    <td><%= user1.LastName %></td>
                    <td><%= user1.DateOfBirth %></td>
                    <td><%= user1.pan %></td>
                    <td><%= user1.Address %></td>
                    <td><%= user1.Gender %></td>
                    <td><%= user1.MobileNumber %></td>
                    <td><%= user1.Email %></td>
                    <td><%= user1.Comments %></td>
                    <%--<td><%= user.DepartmentRefId %></td>--%>
                    
                    
                    <%--<td><%= user.Description.GetFormattedValue() %></td>--%>
                    <td><a href="UsersUpdate.aspx?id=<%= user1.Id %>">Edit</a></td>
                    <td><a href="UsersDelete.aspx?id=<%= user1.Id %>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </form>
</body>
</html>
