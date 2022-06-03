using System;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Utils;

namespace DataAccess.MssqlServerIntegration
{
    public class ApplicationDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<AuthToken> AuthTokens { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<ArtWork> ArtWorks { get; set; }
        public DbSet<JobApplication> JobApplications { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<PaymentAction> PaymentActions { get; set; }
        public DbSet<Portfolio> Portfolios { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Request> Requests { get; set; }
        public DbSet<Resource> Resources { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<Discussion> Discussions { get; set; }
        public DbSet<Workspace> Workspaces { get; set; }

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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                    .HasIndex(u => u.Email)
                    .IsUnique();
        }
    }
}
