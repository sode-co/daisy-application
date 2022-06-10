using AutoMapper;
using Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils.Models;

namespace Utils.DataMapper
{
    public static partial class MapperConfig
    {
        public static void CreateRequestMap(IMapperConfigurationExpression cfg)
        {
            cfg.CreateMap<Request, RequestVM>();
            cfg.CreateMap<RequestVM, Request>();
            cfg.CreateMap<Request, RequestJobPostVM>();
            cfg.CreateMap<RequestJobPostVM, Request>();
        }
    }
}
