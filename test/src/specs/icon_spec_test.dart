import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('IconSpec', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        StyleMix(
          const IconColorAttribute(Colors.red),
          const IconSizeAttribute(20.0),
          const TextDirectionAttribute(TextDirection.ltr),
        ),
      );

      final spec = IconSpec.resolve(mix);

      expect(spec.color, Colors.red);
      expect(spec.size, 20.0);
      expect(spec.textDirection, TextDirection.ltr);
    });

    test('copyWith', () {
      const spec = IconSpec(
        color: Colors.red,
        size: 20.0,
        textDirection: TextDirection.ltr,
      );

      final copiedSpec = spec.copyWith(color: Colors.blue, size: 30.0);

      expect(copiedSpec.color, Colors.blue);
      expect(copiedSpec.size, 30.0);
      expect(copiedSpec.textDirection, TextDirection.ltr);
    });

    test('lerp', () {
      const spec1 = IconSpec(
        color: Colors.red,
        size: 20.0,
        textDirection: TextDirection.ltr,
      );

      const spec2 = IconSpec(
        color: Colors.blue,
        size: 30.0,
        textDirection: TextDirection.rtl,
      );

      const t = 0.5;
      final lerpedSpec = spec1.lerp(spec2, t);

      expect(lerpedSpec.color, Color.lerp(Colors.red, Colors.blue, t));
      expect(lerpedSpec.size, lerpDouble(20.0, 30.0, t));
      expect(lerpedSpec.textDirection, TextDirection.rtl);
    });
  });
}
