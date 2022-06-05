
using System;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Core.EntityClient;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using BusinessObject;
using Domain.Models;
using Utils;
using static Utils.Utils;

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

        public ApplicationDbContext() : base(SingleConnection.ConString) { }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    // when using dotnet command to generate db, we can not load connection string in
        //    // the normalway because only DataAccess is triggered
        //    if (Config.Get().DB_HOST_NAME == null || Config.Get().DB_HOST_NAME == "")
        //    {
        //        Config.Load();
        //    }

        //    string connectionString =
        //        $"server={Config.Get().DB_HOST_NAME},{Config.Get().DB_PORT};" +
        //        $"Database={ Config.Get().DB_NAME};User={Config.Get().DB_USER};" +
        //        $"Password={Config.Get().DB_PASSWORD};" +
        //        $"Trusted_Connection=False;" +
        //        $"MultipleActiveResultSets=True";

        //    Console.WriteLine("database-connect-connection-string " + connectionString);
        //    Console.WriteLine("database-connect " + "connecting to db...");

        //    optionsBuilder.UseLazyLoadingProxies();
        //    optionsBuilder.ConfigureWarnings(warnings => warnings.Ignore(Microsoft.EntityFrameworkCore.Diagnostics.CoreEventId.DetachedLazyLoadingWarning));

        //    optionsBuilder.UseSqlServer(@connectionString);
        //}

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                   .HasIndex(u => u.Email)
                   .IsUnique();
        }

        public override int SaveChanges()
        {

            var ctx = ((IObjectContextAdapter)(DbContext)this).ObjectContext;

            ChangeTracker.DetectChanges();

            var objectStateEntryList =
                ctx.ObjectStateManager.GetObjectStateEntries(EntityState.Added |
                                                            EntityState.Modified)
                .ToList();


            foreach (ObjectStateEntry entry in objectStateEntryList)
            {
                var entity = (entry.Entity as Entity);

                if (!entry.IsRelationship)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            entity.CreatedAt = DateTime.Now;
                            entity.ObjectId = GenerateObjectId(entity);
                            break;
                        case EntityState.Modified:
                            entity.UpdatedAt = DateTime.Now;
                            break;
                    }
                }
            }

            try
            {
                return base.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                var newException = new FormattedDbEntityValidationException(e);
                throw newException;
            }
        }
    }

    [Serializable]
    public class FormattedDbEntityValidationException : Exception
    {
        public FormattedDbEntityValidationException(DbEntityValidationException innerException) :
            base(null, innerException)
        {
        }

        public override string Message
        {
            get
            {
                var innerException = InnerException as DbEntityValidationException;
                if (innerException == null) return base.Message;

                var sb = new System.Text.StringBuilder();

                sb.AppendLine();
                sb.AppendLine();
                foreach (var eve in innerException.EntityValidationErrors)
                {
                    sb.AppendLine(string.Format("- Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().FullName, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        object value;
                        if (ve.PropertyName.Contains("."))
                        {
                            var propertyChain = ve.PropertyName.Split('.');
                            var complexProperty = eve.Entry.CurrentValues.GetValue<DbPropertyValues>(propertyChain.First());
                            value = GetComplexPropertyValue(complexProperty, propertyChain.Skip(1).ToArray());
                        }
                        else
                        {
                            value = eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName);
                        }
                        sb.AppendLine(string.Format("-- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
                            ve.PropertyName,
                            value,
                            ve.ErrorMessage));
                    }
                }
                sb.AppendLine();

                return sb.ToString();
            }
        }

        private static object GetComplexPropertyValue(DbPropertyValues propertyValues, string[] propertyChain)
        {
            var propertyName = propertyChain.First();
            return propertyChain.Count() == 1
                ? propertyValues[propertyName]
                : GetComplexPropertyValue((DbPropertyValues)propertyValues[propertyName], propertyChain.Skip(1).ToArray());
        }
    }

    public class SingleConnection
    {
        private SingleConnection() { }
        private static SingleConnection _ConsString = null;
        private string _String;
        public static string ConString
        {
            get
            {
                if (_ConsString == null)
                {
                    _ConsString = new SingleConnection { _String = Connect() };
                    return _ConsString._String;
                }
                else
                    return _ConsString._String;
            }
        }

        public static string Connect()
        {
            //Build an Entity Framework connection string  
            EntityConnectionStringBuilder entityString = new EntityConnectionStringBuilder()
            {
                Provider = "System.Data.SqlClient",
                Metadata = "res://*/testModel.csdl|res://*/testModel.ssdl|res://*/testModel.msl",
                ProviderConnectionString = Config.Get().DB_CONNECTION_STRING
            };

            return entityString.ConnectionString;
        }
    }
}
