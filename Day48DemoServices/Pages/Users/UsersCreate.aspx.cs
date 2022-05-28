using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserServices.Services;
using UserServices.Services.Models;
using UserServices.Services.Utilities;

namespace Day48DemoServices.Pages.Users
{
    public partial class UsersCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonCreate_OnClick(object sender, EventArgs e)
        {
            CreateData();
        }
        private void CreateData()
        {
            var userService = new UserService();

            try
            {
                ListItem listItem = DropDownListDepartmentRefId.SelectedItem;


                var user = new User

                {
                    FirstName = TextBoxFirstName.Text,
                    LastName = TextBoxLastName.Text,
                    DateOfBirth = DateTime.Parse(TextBoxDateOfBirth.Text),
                    pan = TextBoxPan.Text,
                    Address = TextBoxAddress.Text,
                    Gender = RadioButtonListGender.SelectedValue,
                    MobileNumber = TextBoxMobileNumber.Text,
                    Email = TextBoxEmail.Text,
                    Comments = TextBoxComments.Text,
                    DepartmentRefId = int.Parse(listItem.Value)
                    //DepartmentRefId = int.Parse(DropDownListDepartmentRefId.Text)
                };

                userService.Add(user);

                LabelStatus.ShowStatusMessage("Users record successfully added!");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                LabelStatus.ShowStatusMessage("Failed to add Users record!");
            }
        }
    }
}