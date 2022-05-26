using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UserServices.Services.Models;

namespace UserServices.Services
{
    public class UserService
    {
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["UserManagement"].ConnectionString;

        public List<Users> GetAll()
        {
            var departments = new List<Users>();

            using (var connection = new SqlConnection(ConnectionString))
            {
                const string cmdText = "Department_GetAll";

                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var Users = new Users
                            {
                                Id = (int)reader["Id"],
                                FirstName = (string)reader["FirstName"],
                                LastName = (string)reader["Lastname"],
                                DateOfBirth = (string)reader["DateOfBirth"]

                            };

                            departments.Add(Users);
                        }
                    }
                }
            }

            return departments;
        }
    }
}
