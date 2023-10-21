import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('ColorAttribute', () {
    test('from constructor sets color correctly', () {
      final colorAttr = ColorAttribute.from(Colors.red);

      expect(colorAttr.color.value, Colors.red);
    });

    test('merge returns merged object correctly', () {
      const attr1 = ColorAttribute(ColorDto(Colors.red));
      const attr2 = ColorAttribute(ColorDto(Colors.blue));

      final merged = attr1.merge(attr2);

      expect(merged.color.value, Colors.blue); // should take from attr2
    });

    test('resolve returns correct color', () {
      const attr = ColorAttribute(ColorDto(Colors.red));
      final color = attr.resolve(EmptyMixData);

      expect(color, Colors.red);
    });

    test('Equality holds when Color is the same', () {
      const attr1 = ColorAttribute(ColorDto(Colors.red));
      const attr2 = ColorAttribute(ColorDto(Colors.red));

      expect(attr1, attr2);
    });

    test('Equality fails when Color is different', () {
      const attr1 = ColorAttribute(ColorDto(Colors.red));
      const attr2 = ColorAttribute(ColorDto(Colors.blue));

      expect(attr1, isNot(attr2));
    });
  });

  group('BackgroundColorAttribute', () {
    test('from constructor sets color correctly', () {
      final colorAttr = BackgroundColorAttribute.from(Colors.red);

      expect(colorAttr.color.value, Colors.red);
    });

    test('merge returns merged object correctly', () {
      const attr1 = BackgroundColorAttribute(ColorDto(Colors.red));
      const attr2 = BackgroundColorAttribute(ColorDto(Colors.blue));

      final merged = attr1.merge(attr2);

      expect(merged.color.value, Colors.blue); // should take from attr2
    });

    test('Equality holds when color is the same', () {
      const attr1 = BackgroundColorAttribute(ColorDto(Colors.red));
      const attr2 = BackgroundColorAttribute(ColorDto(Colors.red));

      expect(attr1, attr2);
    });

    test('Equality fails when color is different', () {
      const attr1 = BackgroundColorAttribute(ColorDto(Colors.red));
      const attr2 = BackgroundColorAttribute(ColorDto(Colors.blue));

      expect(attr1, isNot(attr2));
    });
  });
}
