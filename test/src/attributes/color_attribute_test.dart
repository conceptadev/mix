import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/color_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ColorAttribute', () {
    const colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.black,
      Colors.white,
      Colors.grey,
    ];
    test('ColorAttribute resolves correctly', () {
      const colorAttribute = ColorAttribute(Colors.red);
      final resolvedValue = colorAttribute.resolve(EmptyMixData);
      expect(resolvedValue, Colors.red);
    });
    test('ColorAttribute merge returns merged object correctly', () {
      const attr1 = ColorAttribute(Colors.red);
      const attr2 = ColorAttribute(Colors.green);
      final merged = attr1.merge(attr2);
      final resolvedValue = merged.resolve(EmptyMixData);
      expect(resolvedValue, Colors.green);
    });
    test('ColorAttribute merge returns itself if other is null', () {
      const attr1 = ColorAttribute(Colors.red);
      final merged = attr1.merge(null);
      expect(merged, attr1);
    });
    test('ColorAttribute equality holds when properties are the same', () {
      const attr1 = ColorAttribute(Colors.red);
      const attr2 = ColorAttribute(Colors.red);
      expect(attr1, attr2);
    });
    test('ColorAttribute equality fails when properties are different', () {
      const attr1 = ColorAttribute(Colors.red);
      const attr2 = ColorAttribute(Colors.green);
      expect(attr1, isNot(attr2));
    });
  });
}
