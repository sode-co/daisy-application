using System;
using BusinessObject;

namespace Utils
{
    public static partial class Utils
    {
        public static string GenerateObjectId(Entity entity)
        {
            return _base64Encode(string.Format("daisy-{0}-{1}-{2}",
                entity.TableName,
                new DateTimeOffset(entity.CreatedAt).ToUnixTimeMilliseconds(),
                entity.DeletedAt != null ? new DateTimeOffset(entity.DeletedAt.Value).ToUnixTimeMilliseconds() : 0));
        }

        public static string _base64Encode(string plainText)
        {
            Console.WriteLine("Encoding objectId, plainText:" + plainText);
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        public static string _base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            var str = System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
            return str.Replace("+", "-").Replace("/", "_");
        }
    }
}
