using DataAccess.MssqlServerIntegration;
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
    public class UnitOfWork : IUnitOfWork
    {
        private IArtWorkRepository _artWorkRepository;
        private ICategoryRepository _categoryRepository;
        private IDiscussionRepository _discussionRepository;
        private IJobApplicationRepository _jobApplicationRepository;
        private INotificationRepository _notificationRepository;
        private IPaymentActionRepository _paymentActionRepository;
        private IPaymentRepository _paymentRepository;
        private IPortfolioRepository _portfolioRepository;
        private IProjectRepository _projectRepository;
        private IRequestRepository _requestRepository;
        private IResourceRepository _resourceRepository;
        private IReviewRepository _reviewRepository;
        private IUserRepository _userRepository;
        private IWorkspaceRepository _workspaceRepository;

        private ApplicationDbContext _db;

        public UnitOfWork(ApplicationDbContext db)
        {
            _db = db;
            _artWorkRepository = new ArtWorkRepository(db);
            _categoryRepository = new CategoryRepository(db);
            _discussionRepository = new DiscussionRepository(db);
            _jobApplicationRepository = new JobApplicationRepository(db);
            _notificationRepository = new NotificationRepository(db);
            _paymentActionRepository = new PaymentActionRepository(db);
            _paymentRepository = new PaymentRepository(db);
            _portfolioRepository = new PortfolioRepository(db);
            _projectRepository = new ProjectRepository(db);
            _requestRepository = new RequestRepository(db);
            _resourceRepository = new ResourceRepository(db);
            _reviewRepository = new ReviewRepository(db);
            _userRepository = new UserRepository(db);
            _workspaceRepository = new WorkspaceRepository(db);
        }

        public IArtWorkRepository ArtWorkRepository => _artWorkRepository;

        public ICategoryRepository CategoryRepository => _categoryRepository;

        public IDiscussionRepository DiscussionRepository => _discussionRepository;

        public IJobApplicationRepository JobApplicationRepository => _jobApplicationRepository;

        public INotificationRepository NotificationRepository => _notificationRepository;

        public IPaymentActionRepository PaymentActionRepository => _paymentActionRepository;

        public IPaymentRepository PaymentRepository => _paymentRepository;

        public IPortfolioRepository PortfolioRepository => _portfolioRepository;

        public IProjectRepository ProjectRepository => _projectRepository;

        public IRequestRepository RequestRepository => _requestRepository;

        public IResourceRepository ResourceRepository => _resourceRepository;

        public IReviewRepository ReviewRepository => _reviewRepository;

        public IUserRepository UserRepository => _userRepository;

        public IWorkspaceRepository WorkspaceRepository => _workspaceRepository;

        public void Dispose()
        {
            Console.WriteLine("Unit of work has been dispose");
            _db.Dispose();
        }

            public void Save()
        {
            Console.WriteLine("Unit of work has been dispose");
            _db.Dispose();
        }
    }
}
