import 'dart:math';

// @nodoc
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

  T? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;

    return elementAt(index);
  }

  Iterable<T> sorted([Comparator<T>? compare]) {
    List<T> newList = List.of(this);
    newList.sort(compare);

    return newList;
  }
}

extension ListExt<T> on List<T> {
  List<T> merge(List<T>? other) {
    if (other == null) return this;
    if (isEmpty) return other;

    return List.generate(
      max(length, other.length),
      (index) {
        if (index < length) {
          final currentValue = this[index];
          final otherValue = index < other.length ? other[index] : null;

          return otherValue ?? currentValue;
        }
        return other[index];
      },
    );
  }
}

List<T>? merge<T>(List<T>? a, List<T>? b) {
  if (b == null) return a;
  if (a == null) return b;

  return List.generate(
    max(a.length, b.length),
    (index) {
      if (index < a.length) {
        final currentValue = a[index];
        final otherValue = index < b.length ? b[index] : null;

        return otherValue ?? currentValue;
      }
      return b[index];
    },
  );
}
