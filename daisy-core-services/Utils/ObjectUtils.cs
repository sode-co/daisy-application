using System;
namespace Utils
{
	public static partial class Utils
	{
        public delegate void AplDelegate<T>(T obj);

        public static T Apl<T> (this T target, AplDelegate<T> callback)
        {
            callback(target);
            return target;
        }
	}
}

