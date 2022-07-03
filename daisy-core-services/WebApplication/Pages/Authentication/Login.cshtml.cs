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

        public async Task<IActionResult> OnGetGoogleResponse()
        {
            var result = await HttpContext.AuthenticateAsync();
            var claims = (List<Claim>) result.Principal.Identities.FirstOrDefault().Claims;
            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principle = new ClaimsPrincipal(identity);

            string email = principle.FindFirstValue(ClaimTypes.Email);
            string displayName = principle.FindFirstValue(ClaimTypes.Name);
            string avatar = principle.FindFirstValue("urn:google:picture");

            User user = new()
            {
                DisplayName = displayName,
                Email = email,
                Avatar = avatar,
                CreatedAt = DateTime.Now,
            };
            if (GetCurrentUser(email) == null)
            {
                AddUserFromGoogleResponse(user);
                return RedirectToPage("DetailInformation/", new { @email = email });
            }

            if (IsAdminLogin(email))
            {
                SetRoleToClaim(email, Constants.ROLE.ADMIN);
            }    
            return RedirectToPage("../Index");
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

        public async Task<IActionResult> OnGetAsyncLogout()
        {
            await HttpContext.SignOutAsync();
            return Redirect("../Index");
        }
        public bool IsAdminLogin(String email)
        {
            String adminEmail = Config.Get().ADMIN_EMAIL;
            if (email == adminEmail)
                return true;
            return false;
        }

        public void SetRoleToClaim(string email, string role)
        {
            var claimList = new List<Claim>();
            claimList.Add(new Claim(ClaimTypes.Email, email));
            claimList.Add(new Claim(ClaimTypes.Role, role));

            var identity = new ClaimsIdentity(claimList, CookieAuthenticationDefaults.AuthenticationScheme);
            var principal = new ClaimsPrincipal(identity);
            var pros = new AuthenticationProperties();
            HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, pros).Wait();
        }
    }
}