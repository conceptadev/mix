import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('IconMix', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        Style(
          IconSpecAttribute(
            size: 20.0,
            color: Colors.red.toDto(),
            applyTextScaling: true,
            fill: 2,
            grade: 2,
            opticalSize: 2,
            shadows: [
              ShadowDto(
                color: Colors.black.toDto(),
              ),
              ShadowDto(
                color: Colors.black.toDto(),
              ),
            ],
            textDirection: TextDirection.ltr,
            weight: 2,
          ),
        ),
      );

      final spec = IconSpec.of(mix);

      expect(spec.color, Colors.red);
      expect(spec.size, 20.0);
      expect(spec.applyTextScaling, isTrue);
      expect(spec.grade, 2);
      expect(spec.opticalSize, 2);
      expect(spec.shadows, [
        const Shadow(
          color: Colors.black,
        ),
        const Shadow(
          color: Colors.black,
        ),
      ]);
      expect(spec.fill, 2);
      expect(spec.textDirection, TextDirection.ltr);
      expect(spec.weight, 2);
    });

    test('copyWith', () {
      const spec = IconSpec(color: Colors.red, size: 20.0);

      final copiedSpec = spec.copyWith(color: Colors.blue, size: 30.0);

      expect(copiedSpec.color, Colors.blue);
      expect(copiedSpec.size, 30.0);
    });

    test('lerp', () {
      const spec1 = IconSpec(color: Colors.red, size: 20.0);

      const spec2 = IconSpec(color: Colors.blue, size: 30.0);

      const t = 0.5;
      final lerpedSpec = spec1.lerp(spec2, t);

      expect(lerpedSpec.color, Color.lerp(Colors.red, Colors.blue, t));
      expect(lerpedSpec.size, lerpDouble(20.0, 30.0, t));
    });
  });
}
