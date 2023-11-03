import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/scalar_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('GradientAttribute', () {
    const gradient = LinearGradient(
      colors: [Colors.red, Colors.blue],
    );

    test('merge returns merged object correctly', () {
      const attr1 = GradientAttribute(gradient);
      const attr2 = GradientAttribute(RadialGradient(colors: [Colors.green]));

      final merged = attr1.merge(attr2);

      expect(merged.value, const RadialGradient(colors: [Colors.green]));
    });

    test('resolve returns correct Gradient', () {
      const attr = GradientAttribute(gradient);

      final resolvedGradient = attr.resolve(EmptyMixData);

      expect(resolvedGradient, gradient);
      expect(resolvedGradient.colors.length, 2);
      expect(resolvedGradient.colors[0], Colors.red);
      expect(resolvedGradient.colors[1], Colors.blue);
    });

    test('Equality holds when Gradient is the same', () {
      const attr1 = GradientAttribute(gradient);
      const attr2 = GradientAttribute(gradient);

      expect(attr1, attr2);
    });

    test('Equality fails when Gradient is different', () {
      const attr1 = GradientAttribute(gradient);
      const attr2 = GradientAttribute(
        RadialGradient(colors: [Colors.green]),
      );

      expect(attr1, isNot(attr2));
    });
  });
}
