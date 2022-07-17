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
        public class PAYMENT_ACTION_STATUS
        {
            public const string PENDING = "PENDING";
            public const string SUCCESSFULLY = "SUCCESSFULLY";
            public const string CANCELED = "CANCELED";
            public const string WAITING = "WAITING";
            public const string URGENT = "URGENT";
        }
        public class PAYMENT_STATUS
        {
            public const string IN_COMPLETE = "IN_COMPLETE";
            public const string COMPLETE = "COMPLETE";
            public const string FAILED = "FAILED";
            public const string CANCELED = "CANCELED";
        }
        public class PAYMENT_CURRENCY
        {
            public const string VND = "VNĐ";
            public const string DOLLAR = "$";
        }
        public class WORKSPACE_STATUS
        {
            public const string DONE = "DONE";
            public const string IN_PROGRESS = "IN_PROGRESS";
            public const string CANCELED = "CANCELED";
        }
        public class RESOURCE_WORK_STATUS
        {
            public const string IN_PROGRESS = "IN_PROGRESS";
            public const string DECLINED = "DECLINED";
            public const string FINAL = "FINAL";
        }
        public class FILE_TYPE
        {
            public const string IMAGE_PNG = "image/png";
            public const string IMAGE_JPEG = "image/jpeg";
        }
    }
}
