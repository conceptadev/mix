// import 'package:flutter_test/flutter_test.dart';
// import 'package:mix/src/attributes/exports.dart';
// import 'package:mix/src/helpers/mergeable_map.dart';

// import 'random_dto.dart';

// class MergeableInt with MergeMixin {
//   final int value;

//   MergeableInt(this.value);

//   @override
//   MergeableInt merge(MergeableInt? other) {
//     return MergeableInt(value + (other?.value ?? 0));
//   }
// }

// class MergeableInt2 extends MergeableInt {
//   MergeableInt2(super.value);
// }

// class MergeableInt3 extends MergeableInt {
//   MergeableInt3(super.value);
// }

// void main() {
//   test('Initialization', () {
//     final map = MergeableMap<MergeableInt>.empty();
//     expect(map.isEmpty, true);
//   });

//   test('FromList Constructor', () {
//     final map = MergeableMap.fromIterable([MergeableInt(1), MergeableInt(2)]);
//     expect(map.length, 1);

//     final map2 =
//         MergeableMap.fromIterable([MergeableInt2(1), MergeableInt3(2)]);
//     expect(map2.length, 2);

//     final map3 = MergeableMap.fromIterable(
//       [MergeableInt2(1), MergeableInt3(2), MergeableInt(3), MergeableInt2(0)],
//     );

//     expect(map3.length, 3);
//   });

//   test('Merge Functionality', () {
//     final map1 = MergeableMap.fromIterable([MergeableInt(1)]);
//     final map2 = MergeableMap.fromIterable([MergeableInt(2)]);
//     final merged = map1.merge(map2);
//     expect(merged.length, 1);
//   });

//   test('Insertion Order', () {
//     final map = MergeableMap.fromIterable(
//       [MergeableInt(1), MergeableInt3(4), MergeableInt(2)],
//     );
//     // Check that first value is of type MergeableInt
//     expect(map.values.first, isA<MergeableInt>());
//     expect(map.values.first.value, 3);
//     expect(map.values.last.value, 4);
//   });

//   test('Clone Functionality', () {
//     final map = MergeableMap.fromIterable([MergeableInt(1)]);
//     final clone = map.clone();
//     expect(clone, map);
//   });

//   group('Merge benchmark', () {
//     const N = 1000000;

//     final map1 = MergeableMap.fromIterable(
//         RandomGenerator.boxAttributesList(length: 100, someNullable: false));

//     final map2 = MergeableMap.fromIterable(
//         RandomGenerator.boxAttributesList(length: 100, someNullable: false));

//     final mergedMap = map1.merge(map2);

//     test('Benchmark merge method', () {
//       var merged = map1;
//       var stopwatch = Stopwatch()..start();
//       for (int i = 0; i < N; i++) {
//         merged = map1.merge(map2);
//       }

//       stopwatch.stop();

//       print('Average merge time: ${stopwatch.elapsedMilliseconds / N} ms');
//       expect(merged, mergedMap);
//     });
//   });
// }
