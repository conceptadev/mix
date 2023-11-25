import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('Gradient Creation Tests', () {
    test('LinearGradient is created with correct parameters', () {
      final colors = [Colors.red, Colors.blue];
      final attr = linearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

      final linearGradientValue = attr.resolve(EmptyMixData);
      expect(linearGradientValue, isA<LinearGradient>());

      expect(linearGradientValue.begin, Alignment.topLeft);
      expect(linearGradientValue.end, Alignment.bottomRight);
      expect(linearGradientValue.colors, equals(colors));
    });

    test('LinearGradient uses default values when parameters are not provided',
        () {
      final colors = [Colors.red, Colors.blue];
      final attr = linearGradient(colors: colors);

      final linearGradientValue = attr.resolve(EmptyMixData);
      expect(linearGradientValue, isA<LinearGradient>());
      expect(linearGradientValue.begin, LinearGradient(colors: colors).begin);
      expect(linearGradientValue.end, LinearGradient(colors: colors).end);
    });

    test('RadialGradient is created with correct parameters', () {
      final colors = [Colors.red, Colors.blue];
      final attr =
          radialGradient(colors: colors, center: Alignment.center, radius: 0.5);
      final radialGradientValue = attr.resolve(EmptyMixData);
      expect(radialGradientValue, isA<RadialGradient>());

      expect(radialGradientValue.center, Alignment.center);
      expect(radialGradientValue.radius, 0.5);
      expect(radialGradientValue.colors, equals(colors));
    });

    test('RadialGradient uses default values when parameters are not provided',
        () {
      final colors = [Colors.red, Colors.blue];
      final attr = radialGradient(colors: colors);

      final radialGradientValue = attr.resolve(EmptyMixData);
      expect(radialGradientValue, isA<RadialGradient>());
      expect(radialGradientValue.center, RadialGradient(colors: colors).center);
      expect(radialGradientValue.radius, RadialGradient(colors: colors).radius);
    });
  });
}
