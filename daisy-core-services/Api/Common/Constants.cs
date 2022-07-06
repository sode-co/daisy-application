﻿using System;
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
            public const string ADMIN = "ADMIN";
        }

        public static class STATUS_JOB_APPLICATION
        {
            public static readonly string PENDING = "PENDING";
            public static readonly string APPROVE = "APPROVE";
            public static readonly string REJECT = "REJECT";
        }
        public class PROJECT_STATUS
        {
            public const string DONE = "DONE";
            public const string IN_PROGRESS = "IN_PROGRESS";
            public const string CANCELED = "CANCELED";
        }
        public class REQUEST_STATUS
        {
            public const string AVAILABLE = "AVAILABLE";
            public const string TAKEN = "TAKEN";
        }
        public class DISCUSSION_STATUS
        {
            public const string SENT = "SENT";
            public const string REMOVED = "REMOVED";
        }
    }
}
