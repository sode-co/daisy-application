using System;
using AutoMapper;
using Domain.Models;
using Utils.Models;

namespace Utils.DataMapper
{
    public static partial class MapperConfig
    {
        public static void CreateUserMap(IMapperConfigurationExpression cfg)
        {
            cfg.CreateMap<User, UserExposeModel>();
            cfg.CreateMap<UserExposeModel, User>();
        }
    }
}
