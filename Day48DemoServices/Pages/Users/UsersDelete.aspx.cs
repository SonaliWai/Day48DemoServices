using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UserServices.Services;
using UserServices.Services.Utilities;

namespace Day48DemoServices.Pages.Users
{
    public partial class UsersDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonDelete_OnClick(object sender, EventArgs e)
        {
            DeleteData();
        }

        private void ShowDataToDelete()
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

                LabelFirstNameData.Text = user.FirstName;
                LabelLastNameData.Text = user.LastName;
                LabelDateOfBirthData.Text = user.DateOfBirth.ToString();
                LabelPanData.Text = user.pan;
                LabelAddressData.Text = user.Address;
                LabelGenderData.Text = user.Gender;
                LabelMobileNumberData.Text = user.MobileNumber;
                LabelEmailData.Text = user.Email;
                LabelCommentData.Text = user.Comments;
                LabelDepartmentRefIdData.Text = user.DepartmentRefId.ToString();
            }
            catch (Exception e)
            {
                LabelStatus.ShowStatusMessage("Id parameter not found!");
            }
        }

        private void DeleteData()
        {
            var idText = Request.QueryString["id"];
            var id = int.Parse(idText);

            var usersService = new UserService();

            try
            {
                usersService.Delete(id);

                LabelStatus.ShowStatusMessage("User record successfully deleted!");
            }
            catch (SqlException sqlException)
            {
                Console.WriteLine(sqlException);
                LabelStatus.ShowStatusMessage("Failed to delete User record! Maybe a foreign key was found! Please contact database admin!");
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                LabelStatus.ShowStatusMessage("Failed to delete User record!");
            }
        }
    }
}