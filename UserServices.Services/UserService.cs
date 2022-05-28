using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UserServices.Services.Models;
using UserServices.Services.Utilities;

namespace UserServices.Services
{
    public class UserService
    {
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["UserManagement"].ConnectionString;

        public List<User> GetAll()
        {
            var users = new List<User>();

            using (var connection = new SqlConnection(ConnectionString))
            {
                const string cmdText = "Users_GetAll";

                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var user = new User
                            {
                                Id = (int)reader["Id"],
                                FirstName = reader["FirstName"].GetDataFromDb<string>(),
                                LastName = reader["LastName"].GetDataFromDb<string>(),
                                DateOfBirth = reader["DateOfBirth"].GetDataFromDb<DateTime>(),
                                pan = reader["Pan"].GetDataFromDb<string>(),
                                Address = reader["Address"].GetDataFromDb<string>(),
                                Gender = reader["Gender"].GetDataFromDb<string>(),
                                MobileNumber = reader["MobileNumber"].GetDataFromDb<string>(),
                                Email = reader["Email"].GetDataFromDb<string>(),
                                Comments = reader["Comments"].GetDataFromDb<string>(),
                                DepartmentRefId = (int)reader["DepartmentRefId"]
                                //DepatmentObj =reader["DeparmentName"]
                            };

                            users.Add(user);
                        }
                    }
                }
            }

            return users;
        }

        public void Delete(int id)
        {
            using (var connection = new SqlConnection(WebConfigHelper.ConnectionString))
            {
                const string cmdText = "Users_Delete";

                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();

                    var rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected != 1)
                        throw new Exception("Add returned 0 rows affected. Expecting 1 rows affected");
                }
            }
        }

        public void Add(User user)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                const string cmdText = "User_Add";

                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@FirstName", user.FirstName);
                    command.Parameters.AddWithValue("@LastNmae", user.LastName);
                    command.Parameters.AddWithValue("@DateOfBirth",user.DateOfBirth);
                    command.Parameters.AddWithValue("@Pan",user.pan);
                    command.Parameters.AddWithValue("@Address",user.Address);
                    command.Parameters.AddWithValue("@Gender",user.Gender);
                    command.Parameters.AddWithValue("@MobileNumber",user.MobileNumber);
                    command.Parameters.AddWithValue("@Email",user.Email);
                    command.Parameters.AddWithValue("@Comments", user.Comments);
                    command.Parameters.AddWithValue("@DepartmentRefId", user.DepartmentRefId);


                    connection.Open();

                    var rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected != 1)
                        throw new Exception("Add returned 0 rows affected. Expecting 1 rows affected");
                }
            }
        }
        public void Update(User user)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                const string cmdText = "User_Update";

                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@id", user.Id);
                    command.Parameters.AddWithValue("@FirstName", user.FirstName.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@LastName", user.LastName.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@DateOfBirth", user.DateOfBirth.GetDataFromUi<DateTime>());
                    command.Parameters.AddWithValue("@Pan", user.pan.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@Address", user.Address.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@Gender", user.Gender.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@MobileNumber", user.MobileNumber.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@Email", user.Email.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@Comments ", user.Comments.GetDataFromUi<string>());
                    command.Parameters.AddWithValue("@DepartmentRefId", user.DepartmentRefId.GetDataFromUi<int>());


                    connection.Open();

                    var rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected != 1)
                        throw new Exception("Add returned 0 rows affected. Expecting 1 rows affected");
                }
            }
        }
        public User GetById(int id)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                const string cmdText = "User_GetById";

                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Id", id);

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            var user = new User
                            {
                                Id = (int)reader["Id"],
                                FirstName = (string)reader["FirstName"],
                                LastName = (string)reader["LastName"],
                                DateOfBirth = (DateTime)reader["DateOfBirth"],
                                pan = (string)reader["Pan"],
                                Address = (string)reader["Address"],
                                Gender = (string)reader["Gender"],
                                MobileNumber = (string)reader["MobileNumber"],
                                Email = (string)reader["Email"],
                                Comments = (string)reader["Comments"],
                                DepartmentRefId = (int)reader["DepartmentRefId"]
                            };
                            return user;
                        }
                    }
                }
            }

            return null;
        }
    }
}
