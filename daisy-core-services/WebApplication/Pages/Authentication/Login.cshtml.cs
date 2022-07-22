using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using DataAccess.UnitOfWork;
using Domain.Models;
using Microsoft.Extensions.Configuration;
using System.IO;
using Api.Common;
using Utils;
using System.Threading;
using Microsoft.AspNetCore.Http;
using WebApplication.Pages.Utils;

namespace WebApplication.Pages.Authentication
{
    public class LoginModel : PageModel
    {
        private UnitOfWorkFactory _unitOfWorkFactory;
        public LoginModel(UnitOfWorkFactory unitOfWorkFactory)
        {
            _unitOfWorkFactory = unitOfWorkFactory;
        }
        public IActionResult OnGet()
        {
            var properties = new AuthenticationProperties { RedirectUri = Url.Page("./Login", pageHandler: "GoogleResponse") };
            return Challenge(properties, GoogleDefaults.AuthenticationScheme);
        }

        // UPDATE 22/07/2022: This website is for ADMIN to manage Daisy's core data. Only administrators of the system can access this website
        public async Task<IActionResult> OnGetGoogleResponse()
        {
            var result = await HttpContext.AuthenticateAsync();
            var claims = result.Principal.Identities.FirstOrDefault().Claims.ToList();
            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principle = new ClaimsPrincipal(identity);

            string email = principle.FindFirstValue(ClaimTypes.Email);
            string displayName = principle.FindFirstValue(ClaimTypes.Name);
            string avatar = principle.FindFirstValue("urn:google:picture");
            // old
            //User user = new()
            //{
            //    DisplayName = displayName,
            //    Email = email,
            //    Avatar = avatar,
            //    CreatedAt = DateTime.Now,
            //};
            //if (GetCurrentUser(email) == null)
            //{
            //    AddUserFromGoogleResponse(user);
            //    return RedirectToPage("DetailInformation/", new { @email = email });
            //}

            //var loginUser = _unitOfWorkFactory.Get.UserRepository.GetUsersByEmail(email);
            //SessionUtils.SetUser(loginUser);

            //return RedirectToPage("../Index");


           var loginUser = _unitOfWorkFactory.Get.UserRepository.GetUsersByEmail(email);

            if (IsAdminLogin(loginUser))
            {
                SessionUtils.SetUser(loginUser);
                return RedirectToPage("../Index");
            }
            return RedirectToPage("/Unauthorized");
        }

        public void AddUserFromGoogleResponse(User user)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                work.UserRepository.Add(user);
                work.Save();
            }
        }
        public User GetCurrentUser(string email)
        {
            using (var work = _unitOfWorkFactory.Get)
            {
                return work.UserRepository.GetUsersByEmail(email);
            }
        }

        public IActionResult OnGetLogout()
        {
            HttpContext.SignOutAsync();
            HttpContext.Session.Clear();
            return RedirectToPage("../Index");
        }
        
        // check for logging in user is admin or not
        public bool IsAdminLogin(User user)
        {
            if (user != null)
            {
                if (user.Role == Constants.ROLE.ADMIN)
                {
                    return true;
                }
            }
            return false;
        }
    }
}