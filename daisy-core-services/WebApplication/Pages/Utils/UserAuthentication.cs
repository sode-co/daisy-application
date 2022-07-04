using Domain.Models;
using Microsoft.AspNetCore.Http;
using Utils;

namespace WebApplication.Pages.Utils
{
    public class UserAuthentication
    {
        public static User UserLogin
        {
            get
            {
                IHttpContextAccessor _httpContextAccessor = new HttpContextAccessor();
                return ( _httpContextAccessor.HttpContext.Session.GetString("User") != null) ?
                            JsonUtil.DeserializeComplexData<User>(_httpContextAccessor.HttpContext.Session.GetString("User")) : null;
            }
        }
        public static bool CheckRole(string role)
        {
            if (UserLogin == null || UserLogin.Role != role)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public static string Role()
        {
            return UserLogin != null ? UserLogin.Role : "";
        }

        public static bool CheckLoggedIn()
        {
            return (UserLogin != null);
        }
    }
}

