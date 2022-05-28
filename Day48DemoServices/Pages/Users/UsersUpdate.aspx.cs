using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserServices.Services;
using UserServices.Services.Models;
using UserServices.Services.Utilities;

namespace Day48DemoServices.Pages.Users
{
    public partial class UsersUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            ShowDataToUpdate();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            UpdateData();
        }

        private void UpdateData()
        {
            var usersService = new UserService();

            try
            {
                var idText = Request.QueryString["id"];

                var user = new User();
                user.Id = int.Parse(idText);
                user.FirstName = TextBoxFirstName.Text;
                user.LastName = TextBoxLastName.Text;
                user.DateOfBirth = string.IsNullOrEmpty(TextBoxDateOfBirth.Text) ? (DateTime?)null : DateTime.Parse(TextBoxDateOfBirth.Text);
                user.pan = TextBoxPan.Text;
                user.Address = TextBoxAddress.Text; //Gender = MaleRadioButton.Checked ? MaleRadioButton.Text : MaleRadioButton.Checked ? OtherRadioButton.Text : OtherRadioButton.Text,
                user.Gender = RadioButtonListGender.SelectedValue;
                user.MobileNumber = TextBoxMobileNumber.Text;
                user.Email = TextBoxEmail.Text;
                user.Comments = TextBoxComments.Text; //DepartmentRefId = int.Parse(TextBoxDepartmentRefId.Text)
                user.DepartmentRefId = int.Parse(DropDownListDepartmentRefId.SelectedValue);

                usersService.Update(user);

                LabelStatus.ShowStatusMessage("User record successfully updated!");
            }
            catch (Exception exception)
            {
                Debug.Print(exception.StackTrace);
                LabelStatus.ShowStatusMessage("Failed to update User record!");
            }
        }

        private void ShowDataToUpdate()
        {
            var idText = Request.QueryString["id"];
            try
            {
                var id = int.Parse(idText);

                var usersService = new UserService();

                var user = usersService.GetById(id);

                if (user == null)
                {
                    LabelStatus.ShowStatusMessage("Specified Id not found in database!");
                    return;
                }

                TextBoxFirstName.Text = user.FirstName;
                TextBoxLastName.Text = user.LastName;
                TextBoxDateOfBirth.Text = user.DateOfBirth.ToString();
                TextBoxPan.Text = user.pan;
                TextBoxAddress.Text = user.Address;
                RadioButtonListGender.SelectedValue = user.Gender;
                TextBoxMobileNumber.Text = user.MobileNumber;
                TextBoxEmail.Text = user.Email;
                TextBoxComments.Text = user.Comments;
                DropDownListDepartmentRefId.Text = user.DepartmentRefId.ToString();

                LoadDepartmentDropDown();
            }
            catch (Exception e)
            {
                LabelStatus.ShowStatusMessage("Id parameter not found!");
            }
        }

        private void LoadDepartmentDropDown()
        {
            var departmentsService = new DepartmentService();
            DropDownListDepartmentRefId.DataSource = departmentsService.GetAllForDropDown();
            DropDownListDepartmentRefId.DataBind();
        }
    }
}