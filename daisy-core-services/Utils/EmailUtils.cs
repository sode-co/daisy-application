using System;
using System.Text.RegularExpressions;

namespace Utils
{
    public static partial class Utils
    {
        public static bool IsFptOrganization(string email)
        {
            return Regex.IsMatch(email, "^[a-z0-9](\\.?[a-z0-9]){5,}@fpt.edu.vn$");
        }
    }
}
