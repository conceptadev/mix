import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/extensions/iterable_ext.dart';

void main() {
  test('Mock Iterable extension methods', () {
    final list = [1, 2, 3, 4, 5];
    expect(list.firstMaybeNull, 1);
    expect(list.firstWhereOrNull((element) => element == 3), 3);
    expect(list.firstWhereOrNull((element) => element == 6), null);
    expect(list.sorted(), [1, 2, 3, 4, 5]);
    expect(list.sorted((a, b) => b.compareTo(a)), [5, 4, 3, 2, 1]);
  });

  test('Mock Iterable extension methods empty list', () {
    final list = <int>[];
    expect(list.firstMaybeNull, null);
    expect(list.firstWhereOrNull((element) => element == 3), null);
    expect(list.firstWhereOrNull((element) => element == 6), null);
    expect(list.sorted(), []);
    expect(list.sorted((a, b) => b.compareTo(a)), []);
  });
}
