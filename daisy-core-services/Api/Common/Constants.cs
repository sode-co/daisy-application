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

        public class ROLE
        {
            public const string CUSTOMER = "CUSTOMER";
            public const string DESIGNER = "DESIGNER";
        }

        public static class STATUS_JOB_APPLICATION
        {
            public static readonly string PENDING = "PENDING";
            public static readonly string APPROVE = "APPROVE";
            public static readonly string REJECT = "REJECT";
        }
    }
}
