T limit<T extends num>(T value, {T? min, T? max}) {
  if (min != null && value < min) {
    return min;
  }

  if (max != null && value > max) {
    return max;
  }

  return value;
}
