﻿using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repositories.Projects
{
    public interface IProjectRepository : IRepository<Project>
    {
        public void CreateProjectAndWorkspace(int jobApplicationId, bool isAllowedPublic, string projectStatus, string requestStatus, string parentRequestStatus);
        public void DeactivateProject(int projectId, string projectStatus);
    }
}
