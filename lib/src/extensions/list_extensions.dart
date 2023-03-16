extension ListExtension<E> on List<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) {
        return element;
      }
    }

    return null;
  }
}
