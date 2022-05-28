using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UserServices.Services.Utilities
{
    public static class WebConfigHelper
    {
        public static string ConnectionString =>
           ConfigurationManager.ConnectionStrings["UserManagement"].ConnectionString;
    }
}
