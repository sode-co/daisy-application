﻿using System;
using Newtonsoft.Json.Linq;

namespace Utils
{
    public static partial class Utils
    {
        public static T Get<T>(this JObject json, string key)
        {
            var result = json[key.ToUpper()] ?? json[key.ToLower()];

            return ((T)(object)result);
        }

        public static T Or<T>(this T obj, T replacement)
        {
            if (obj == null) return replacement;

            Type type = typeof(T);
            if (type == typeof(string) || type == typeof(String))
            {

                string value = "" + obj;
                return value.IsNotBlank() ? (T)(object)value : replacement;
            }

            return obj; 
        }

        public static T Index<T>(this Array obj, int index)
        {
            if (index >= obj.Length || index < 0) return (T)(object)null;

            return (T)obj.GetValue(index);
        }

        public static T Offset<T>(this Array obj, int offset)
        {
            var index = 0;

            if (offset >= 0)
            {
                index += offset;
            }
            else
            {
                index = obj.Length + offset;
            }

            return (T)(object)obj.Index<T>(index);
        }
    }
}
