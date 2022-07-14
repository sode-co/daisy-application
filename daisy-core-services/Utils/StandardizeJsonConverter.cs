using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace Utils
{
	public class StandardizeJsonConverter
	{
            private static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
            {
                ContractResolver = new LowercaseContractResolver()
            };

            public static string SerializeObject(object o)
            {
                return JsonConvert.SerializeObject(o, Formatting.Indented, Settings);
            }

            public class LowercaseContractResolver : DefaultContractResolver
            {
                protected override string ResolvePropertyName(string propertyName)
                {
                return propertyName[0].ToString().ToLower() + propertyName[1..propertyName.Length];
                }
        }

    }
}

