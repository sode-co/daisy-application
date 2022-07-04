using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication.Pages.Utils
{
    public class JsonUtil
    {
        public static T DeserializeComplexData<T>(string data)
        {
            return JsonConvert.DeserializeObject<T>(data);
        }

        public static string SerializeComplexData(object? value)
        {
            return (value != null) ? JsonConvert.SerializeObject(value) : null;
        }
    }
}
