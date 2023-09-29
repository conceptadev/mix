import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/helpers/mergeable_map.dart';

class MergeableInt with Mergeable {
  final int value;

  MergeableInt(this.value);

  @override
  MergeableInt merge(MergeableInt? other) {
    return MergeableInt(value + (other?.value ?? 0));
  }
}

class MergeableInt2 extends MergeableInt {
  MergeableInt2(super.value);
}

class MergeableInt3 extends MergeableInt {
  MergeableInt3(super.value);
}

void main() {
  test('Initialization', () {
    const map = MergeableMap<MergeableInt>.empty();
    expect(map.isEmpty, true);
  });

  test('FromList Constructor', () {
    final map = MergeableMap.fromList([MergeableInt(1), MergeableInt(2)]);
    expect(map.length, 1);

    final map2 = MergeableMap.fromList([MergeableInt2(1), MergeableInt3(2)]);
    expect(map2.length, 2);

    final map3 = MergeableMap.fromList(
      [MergeableInt2(1), MergeableInt3(2), MergeableInt(3), MergeableInt2(0)],
    );

    expect(map3.length, 3);
  });

  test('Merge Functionality', () {
    final map1 = MergeableMap.fromList([MergeableInt(1)]);
    final map2 = MergeableMap.fromList([MergeableInt(2)]);
    final merged = map1.merge(map2);
    expect(merged.length, 1);
  });

  test('Insertion Order', () {
    final map = MergeableMap.fromList(
      [MergeableInt(1), MergeableInt3(4), MergeableInt(2)],
    );
    // Check that first value is of type MergeableInt
    expect(map.values.first, isA<MergeableInt>());
    expect(map.values.first.value, 3);
    expect(map.values.last.value, 4);
  });

  test('Clone Functionality', () {
    final map = MergeableMap.fromList([MergeableInt(1)]);
    final clone = map.clone();
    expect(clone, map);
  });
}
