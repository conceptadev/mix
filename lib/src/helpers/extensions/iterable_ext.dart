extension IterableExt<T> on Iterable<T> {
  T? get firstMaybeNull => isEmpty ? null : first;
}
