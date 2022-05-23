using System;
using System.Collections.Generic;
using System.IO;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace Utils
{
    public class Config
    {
        public class _Config
        {
            public string DB_HOST_NAME { get; set; }
            public int DB_PORT { get; set; }
            public string DB_NAME { get; set; }
            public string DB_USER { get; set; }
            public string DB_PASSWORD { get; set; }
            public string API_HOST { get; set; }
            public string API_PORT { get; set; }
            public string GRPC_HOST { get; set; }
            public string PROTOCOL { get; set; }
            public string GRPC_PORT { get; set; }
        }

        private static _Config Value = new _Config();

        public static _Config Get() => Value;

        public static void Load()
        {
            using (StreamReader r = new StreamReader("../Shared/appsettings.json"))
            {
                string json = r.ReadToEnd();
                Console.WriteLine(json);
                Value = JsonConvert.DeserializeObject<_Config>(json);
            }
        }

        public static void Load(IConfiguration configuration)
        {
            try
            {
                Value.DB_HOST_NAME = configuration.GetValue<string>("DB_HOST_NAME");
                Value.DB_PORT = configuration.GetValue<int>("DB_PORT");
                Value.DB_NAME = configuration.GetValue<string>("DB_NAME");
                Value.DB_PASSWORD = configuration.GetValue<string>("DB_PASSWORD");
                Value.DB_USER = configuration.GetValue<string>("DB_USER");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Failed to load environment variables, error: " + ex.Message);
                throw;
            }
        }
    }
}
