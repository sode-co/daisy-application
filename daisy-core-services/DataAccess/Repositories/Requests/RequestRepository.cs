﻿using DataAccess.MssqlServerIntegration;
using Domain.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
            _dbContext.Requests.ToList().Add(request);
        }
    }
}