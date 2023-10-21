import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AxisAttribute', () {
    test('merge returns merged object correctly', () {
      const attr1 = AxisAttribute(Axis.horizontal);
      const attr2 = AxisAttribute(Axis.vertical);

      final merged = attr1.merge(attr2);

      expect(merged.axis, Axis.vertical); // should take from attr2
    });

    test('merge returns itself if other is null', () {
      const attr1 = AxisAttribute(Axis.horizontal);
      final merged = attr1.merge(null);

      expect(merged, attr1);
    });

    test('resolve returns correct Axis', () {
      const attr = AxisAttribute(Axis.horizontal);
      final axis = attr.resolve(EmptyMixData);

      expect(axis, Axis.horizontal);
      return const Placeholder();
    });

    test('Equality holds when Axis is the same', () {
      const attr1 = AxisAttribute(Axis.horizontal);
      const attr2 = AxisAttribute(Axis.horizontal);

      expect(attr1, attr2);
    });

    test('Equality fails when Axis is different', () {
      const attr1 = AxisAttribute(Axis.horizontal);
      const attr2 = AxisAttribute(Axis.vertical);

      expect(attr1, isNot(attr2));
    });
  });
}
