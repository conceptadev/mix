extension IterableExt<T> on Iterable<T> {
  T? get firstMaybeNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    for (T element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }

  Iterable<T> sorted([Comparator<T>? compare]) {
    List<T> newList = List.of(this);
    newList.sort(compare);

    return newList;
  }
}
