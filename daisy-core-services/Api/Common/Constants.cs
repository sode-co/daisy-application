using System;
namespace Api.Common
{
    public class Constants
    {
        public static class STATUS_CODE
        {
            public static readonly int OK = 200;
            public static readonly int AUTH_FAILED = 403;
            public static readonly int BAD_REQUEST = 400;
            public static readonly int NOT_FOUND = 404;
            public static readonly int SERVER_ERROR = 500;
        }

        public static class ROLE
        {
            public static readonly string CUSTOMER = "CUSTOMER";
            public static readonly string DESIGNER = "DESIGNER";
        }
    }
}
