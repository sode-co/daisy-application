﻿using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils;
using Utils.Models;


namespace DataAccess.Repositories.Requests
{
    public class RequestRepository : Repository<Request>, IRequestRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public RequestRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
            _dbContext = dbContext;
        }

        public void CreateRequest(Request request)
        {
            _dbContext.Requests.Add(request);
        }

        public IEnumerable<Request> GetRequestsByTitle(string title) => _dbContext.Requests.Where(req => req.Title.Equals(title)).ToList();

        public IEnumerable<Request> RequestPaging(DateTime timeOffset, int count) =>
            GetAll((request => request.CreatedAt < timeOffset), null, "Customer,Category")
                .OrderByDescending(request => request.CreatedAt)
                .Take(5)
                .ToList();
    }
}
