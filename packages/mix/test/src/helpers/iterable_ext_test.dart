import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/internal/iterable_ext.dart';

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
  test('IterableExt elementAtOrNull returns correct element or null', () {
    final list = [1, 2, 3, 4, 5];
    expect(list.elementAtOrNull(2), 3);
    expect(list.elementAtOrNull(-1), null);
    expect(list.elementAtOrNull(5), null);
  });

  test('ListExt merge returns correct merged list', () {
    final list1 = [1, 2, 3, 4, 5];
    final list2 = [4, 5, 6, 7];
    final list3 = <int>[];

    expect(list1.merge(list2), [4, 5, 6, 7, 5]);
    expect(list1.merge(list3), [1, 2, 3, 4, 5]);
    expect(list3.merge(list2), [4, 5, 6, 7]);
    expect(list3.merge(null), []);
  });

  test('IterableExt sorted returns correct sorted list', () {
    final list = [5, 2, 4, 1, 3];
    expect(list.sorted(), [1, 2, 3, 4, 5]);
    expect(list.sorted((a, b) => a.compareTo(b)), [1, 2, 3, 4, 5]);
    expect(list.sorted((a, b) => b.compareTo(a)), [5, 4, 3, 2, 1]);
  });
}
