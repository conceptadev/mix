import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/gradient/gradient_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Gradient Creation Tests', () {
    test('LinearGradient is created with correct parameters', () {
      final colors = [Colors.red, Colors.blue];
      final dto = LinearGradientDto(
        colors: colors.map(ColorDto.new).toList(),
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

      final attribute = GradientAttribute(dto);

      final linearGradientValue =
          attribute.resolve(EmptyMixData) as LinearGradient;
      expect(linearGradientValue, isA<LinearGradient>());

      expect(linearGradientValue.begin, Alignment.topLeft);
      expect(linearGradientValue.end, Alignment.bottomRight);
      expect(linearGradientValue.colors, equals(colors));
    });

    test('LinearGradient uses default values when parameters are not provided',
        () {
      final colors = [Colors.red, Colors.blue];
      final dto = LinearGradientDto(
        colors: colors.map(ColorDto.new).toList(),
      );

      final attribute = GradientAttribute(dto);

      final linearGradientValue =
          attribute.resolve(EmptyMixData) as LinearGradient;
      expect(linearGradientValue, isA<LinearGradient>());
      expect(linearGradientValue.begin, LinearGradient(colors: colors).begin);
      expect(linearGradientValue.end, LinearGradient(colors: colors).end);
    });

    test('RadialGradient is created with correct parameters', () {
      final colors = [Colors.red, Colors.blue];
      final dto = RadialGradientDto(
        colors: colors.map(ColorDto.new).toList(),
        center: Alignment.center,
        radius: 0.5,
      );

      final attribute = GradientAttribute(dto);
      final radialGradientValue =
          attribute.resolve(EmptyMixData) as RadialGradient;

      expect(radialGradientValue, isA<RadialGradient>());

      expect(radialGradientValue.center, Alignment.center);
      expect(radialGradientValue.radius, 0.5);
      expect(radialGradientValue.colors, equals(colors));
    });

    test('RadialGradient uses default values when parameters are not provided',
        () {
      final colors = [Colors.red, Colors.blue];
      final dto = RadialGradientDto(colors: colors.map(ColorDto.new).toList());

      final attribute = GradientAttribute(dto);

      final radialGradientValue =
          attribute.resolve(EmptyMixData) as RadialGradient;
      expect(radialGradientValue, isA<RadialGradient>());
      expect(radialGradientValue.center, RadialGradient(colors: colors).center);
      expect(radialGradientValue.radius, RadialGradient(colors: colors).radius);
    });
  });
}
