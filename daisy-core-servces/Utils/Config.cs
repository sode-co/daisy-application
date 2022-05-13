using System;
using Microsoft.Extensions.Configuration;

namespace Utils
{
    public class Config
    {
        public static string DB_HOST_NAME { get; private set; }
        public static int DB_PORT { get; private set; }

        public static void Load(IConfiguration configuration)
        {
            try
            {
                DB_HOST_NAME = configuration.GetValue<string>("Database:DB_HOST_NAME");
                DB_PORT = configuration.GetValue<int>("Database:DB_PORT");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to load environment variables, error: " + ex.Message);
                throw;
            }
        }
    }
}
