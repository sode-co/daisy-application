using System;
namespace Utils
{
    public static partial class Utils
    {
        public static bool IsBlank(this string str) =>
            str == null || str.Trim().Length > 0;

        public static bool IsEmpty(this string str) =>
            str == null || str.Length > 0;

        public static bool IsNotBlank(this string str) =>
            !str.IsBlank();

        public static bool IsNotEmpty(this string str) =>
            !str.IsEmpty();
    }
}
