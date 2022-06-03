using DataAccess.Repositories.ArtWorks;
using DataAccess.Repositories.Categories;
using DataAccess.Repositories.Discussions;
using DataAccess.Repositories.JobApplications;
using DataAccess.Repositories.Notifications;
using DataAccess.Repositories.PaymentActions;
using DataAccess.Repositories.Payments;
using DataAccess.Repositories.Portfolios;
using DataAccess.Repositories.Projects;
using DataAccess.Repositories.Requests;
using DataAccess.Repositories.Resources;
using DataAccess.Repositories.Reviews;
using DataAccess.Repositories.Users;
using DataAccess.Repositories.Workspaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        IArtWorkRepository ArtWorkRepository { get; }
        ICategoryRepository CategoryRepository { get; }
        IDiscussionRepository DiscussionRepository { get; }
        IJobApplicationRepository JobApplicationRepository { get; }
        INotificationRepository NotificationRepository { get; }
        IPaymentActionRepository PaymentActionRepository { get; }
        IPaymentRepository PaymentRepository { get; }
        IPortfolioRepository PortfolioRepository { get; }
        IProjectRepository ProjectRepository { get; }
        IRequestRepository RequestRepository { get; }
        IResourceRepository ResourceRepository { get; }
        IReviewRepository ReviewRepository { get; }
        IUserRepository UserRepository { get; }
        IWorkspaceRepository WorkspaceRepository { get; }
        void Save();
    }
}
