extension ListUtils<T> on List<T> {
  T? find(bool Function(T) condition) {
    try {
      return firstWhere((element) => condition(element));
    } on StateError catch (_) {
      return null;
    }
  }
}
