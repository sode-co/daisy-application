using Domain.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Pages.Utils
{
    public static class SessionUtils
    {
        static IHttpContextAccessor _httpContextAccessor = new HttpContextAccessor();
        public static void SetUser (User value)
        {
            _httpContextAccessor.HttpContext.Session.SetString("User", JsonUtil.SerializeComplexData(value));
        }

        public static User GetUser()
        {
            var value = _httpContextAccessor.HttpContext.Session.GetString("User");
            return value != null ? JsonUtil.DeserializeComplexData<User>(value) : null;
        }
    }
}
