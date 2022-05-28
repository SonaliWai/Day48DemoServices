<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersCreate.aspx.cs" Inherits="Day48DemoServices.Pages.Users.UsersCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Create</title>
     <link rel="stylesheet" href="/www-resources/css/form.css" />
    <style type="text/css">
        .auto-style1{
            height:26px;
        }
    </style>
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
                        <asp:TextBox ID="TextBoxAddress"  runat="server" TextMode="MultiLine"></asp:TextBox>
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

                       
                    </td>
                </tr>
               <tr>
                   <td>
                       <asp:Label ID="LabelMobileNumber" runat="server" Text="MobileNumber"  ></asp:Label>
                   </td>
                   <td>
                       <asp:TextBox ID="TextBoxMobileNumber" TextMode="Number" runat="server" placeholder="Enter MobileNumber" ></asp:TextBox>
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
                        <asp:Label ID="LabelComments" runat="server" Text="Comments"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxComments" TextMode="MultiLine" runat="server" placeholder="Enter Comments"></asp:TextBox>
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="LabelDepartmentRefId" runat="server" Text="DepartmentRefId"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListDepartmentRefId" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserManagementConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                    </td>
                </tr>

                 <tr>
                    <td></td>
                    <td>
                        <asp:Button runat="server" ID="ButtonCreate" Text="Create" OnClick="ButtonCreate_OnClick" />
                        <a style="float: right" href="UsersDefault.aspx"><input type="button" value="Back to Listing" /></a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
