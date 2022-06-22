﻿using System;
namespace Utils
{
	public static partial class Utils
	{
		public static double ConvertToMilliseconds(this DateTime dateTime) =>
			dateTime.ToUniversalTime()
			.Subtract(new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc))
			.TotalMilliseconds;
	}
}

