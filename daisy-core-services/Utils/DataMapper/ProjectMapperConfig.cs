using System;
using AutoMapper;
using Domain.Models;
using Utils.Models;

namespace Utils.DataMapper
{
    public static partial class MapperConfig
    {
        public static void CreateProjectMap(IMapperConfigurationExpression cfg)
        {
            cfg.CreateMap<JobApplication, JobApplicationVM>();
            cfg.CreateMap<JobApplicationVM, JobApplication>();
            cfg.CreateMap<WorkspaceVM, Workspace>();
            cfg.CreateMap<Workspace, WorkspaceVM>();
            cfg.CreateMap<ProjectVM, Project>();
            cfg.CreateMap<Project, ProjectVM>();
            cfg.CreateMap<Discussion, DiscussionVM>();
            cfg.CreateMap<DiscussionVM, Discussion>();
        }
    }
}
