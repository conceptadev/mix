import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/helpers/attributes_map.dart';

import 'random_dto.dart';

class IntAttribute extends Attribute {
  final int value;

  IntAttribute(this.value);

  @override
  IntAttribute merge(IntAttribute? other) {
    return IntAttribute(value + (other?.value ?? 0));
  }

  @override
  get props => [value];
}

class Int2Attribute extends IntAttribute {
  Int2Attribute(super.value);
}

class Int3Attribute extends IntAttribute {
  Int3Attribute(super.value);
}

void main() {
  test('Initialization', () {
    const map = AttributesMap<IntAttribute>.empty();
    expect(map.isEmpty, true);
  });

  test('FromList Constructor', () {
    final map = AttributesMap.fromIterable([IntAttribute(1), IntAttribute(2)]);
    expect(map.length, 1);

    final map2 =
        AttributesMap.fromIterable([Int2Attribute(1), Int3Attribute(2)]);
    expect(map2.length, 2);

    final map3 = AttributesMap.fromIterable(
      [Int2Attribute(1), Int3Attribute(2), IntAttribute(3), Int2Attribute(0)],
    );

    expect(map3.length, 3);
  });

  test('Merge Functionality', () {
    final map1 = AttributesMap.fromIterable([IntAttribute(1)]);
    final map2 = AttributesMap.fromIterable([IntAttribute(2)]);
    final merged = map1.merge(map2);
    expect(merged.length, 1);
  });

  test('Insertion Order', () {
    final map = AttributesMap.fromIterable(
      [IntAttribute(1), Int3Attribute(4), IntAttribute(2)],
    );
    // Check that first value is of type MergeableInt
    expect(map.values.first, isA<IntAttribute>());
    expect(map.values.first.value, 3);
    expect(map.values.last.value, 4);
  });

  test('Clone Functionality', () {
    final map = AttributesMap.fromIterable([IntAttribute(1)]);
    final clone = map.clone();
    expect(clone, map);
  });

  group('Merge benchmark', () {
    const N = 1000000;

    final map1 = AttributesMap.fromIterable(
        RandomGenerator.boxAttributesList(length: 100, someNullable: false));

    final map2 = AttributesMap.fromIterable(
        RandomGenerator.boxAttributesList(length: 100, someNullable: false));

    final mergedMap = map1.merge(map2);

    test('Benchmark merge method', () {
      var merged = map1;
      var stopwatch = Stopwatch()..start();
      for (int i = 0; i < N; i++) {
        merged = map1.merge(map2);
      }

      stopwatch.stop();

      print('Average merge time: ${stopwatch.elapsedMilliseconds / N} ms');
      expect(merged, mergedMap);
    });
  });
}
