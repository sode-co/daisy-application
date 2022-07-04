using Domain.Models;
using Microsoft.AspNetCore.Http;
using Utils;
using Microsoft.AspNetCore;

namespace WebApplication.Pages.Utils
{
    public class UserAuthentication
    {
        public static User UserLogin
        {
            get
            {
                return SessionUtils.GetUser();
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

