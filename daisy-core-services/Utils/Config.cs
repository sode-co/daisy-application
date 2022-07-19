﻿using System;
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
            public string SERVER_NAME { get; set; }
            public string DB_HOST_NAME { get; set; }
            public int DB_PORT { get; set; }
            public string DB_NAME { get; set; }
            public string ACCESS_TOKEN_SECRET { get; set; }
            public string REFRESH_TOKEN_SECRET { get; set; }
            public string DB_USER { get; set; }
            public string DB_PASSWORD { get; set; }
            public string API_HOST { get; set; }
            public string API_PORT { get; set; }
            public string GRPC_HOST { get; set; }
            public int GRPC_MOBILE_PORT { get; set; }
            public string PROTOCOL { get; set; }
            public int GRPC_PORT { get; set; }
            public string GOOGLE_CLIENT_ID { get; set; }
            public string GOOGLE_CLIENT_SECRET { get; set; }
            public string MOMO_TEST_ENV_PARTNER_CODE { get; set; }
            public string MOMO_TEST_ENV_ACCESS_KEY { get; set; }
            public string MOMO_TEST_ENV_SECRET_KEY { get; set; }
            public string ADMIN_EMAIL { get; set; }
            public string ENVIRONMENT { get { return Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT"); } }
            public bool IsProduction { get { return (ENVIRONMENT != null && ENVIRONMENT.ToLower() == "Production".ToLower()); } }
            public bool IsTest { get { return (ENVIRONMENT != null && ENVIRONMENT.ToLower() == "Test".ToLower()); } }
            public bool IsDevelopment { get { return !IsProduction && !IsTest; } }
        }

        private static _Config Value = new _Config();

        public static _Config Get()
        {
            if (Value.DB_HOST_NAME == null || Value.DB_HOST_NAME == "")
            {
                Load();
            }

            return Value;
        }

        public static void AdaptEnv(string EnvName)
        {
            Console.WriteLine("Adjust Config depend on env: " + EnvName);
            if (EnvName.ToLower() == "test")
            {
                Value.DB_NAME += "_test";
                Console.WriteLine("DB_NAME changed to " + Value.DB_NAME);
            }
        }

        public static void Load()
        {
            string appSettingsPath = "../Shared/appsettings.json";

            if (Value.IsProduction || Value.IsTest)
            {
                appSettingsPath = "./appsettings.json";
            }

            Console.WriteLine("appsettings.jsons file path: " + appSettingsPath);
            using (StreamReader r = new StreamReader(appSettingsPath))
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
