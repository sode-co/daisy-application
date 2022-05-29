using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Utils;

namespace DataAccess.MssqlServerIntegration
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext()
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // when using dotnet command to generate db, we can not load connection string in
            // the normalway because only DataAccess is triggered
            if (Config.Get().DB_HOST_NAME == null || Config.Get().DB_HOST_NAME == "")
            {
                Config.Load();
            }

            string connectionString =
                $"server={Config.Get().DB_HOST_NAME},{Config.Get().DB_PORT};" +
                $"Database={ Config.Get().DB_NAME};User={Config.Get().DB_USER};" +
                $"Password={Config.Get().DB_PASSWORD};" +
                $"Trusted_Connection=False;" +
                $"MultipleActiveResultSets=True";

            Console.WriteLine("database-connect-connection-string " + connectionString);
            Console.WriteLine("database-connect " + "connecting to db...");

            optionsBuilder.UseLazyLoadingProxies();
            optionsBuilder.ConfigureWarnings(warnings => warnings.Ignore(CoreEventId.DetachedLazyLoadingWarning));

            optionsBuilder.UseSqlServer(@connectionString);
        }
    }
}
