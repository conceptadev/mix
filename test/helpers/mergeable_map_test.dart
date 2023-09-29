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

void main() {
  test('Initialization', () {
    const map = MergeableMap<MergeableInt>.empty();
    expect(map.isEmpty, true);
  });

  test('FromList Constructor', () {
    final map = MergeableMap.fromList([MergeableInt(1), MergeableInt(2)]);
    expect(map.length, 2);
    // Further verification.
  });

  test('Merge Functionality', () {
    final map1 = MergeableMap.fromList([MergeableInt(1)]);
    final map2 = MergeableMap.fromList([MergeableInt(2)]);
    final merged = map1.merge(map2);
  });

  test('Insertion Order', () {
    // Create and merge maps
    // Check if the key order is maintained
  });

  test('Clone Functionality', () {
    final map = MergeableMap.fromList([MergeableInt(1)]);
    final clone = map.clone();
    expect(clone, map);
  });
}
