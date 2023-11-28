import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('StackMixture', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        StyleMix(
          const StackMixAttribute(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
          ),
          const TextDirectionAttribute(TextDirectionAttribute.ltr),
        ),
      );

      final mixture = StackMixAttribute.of(mix).resolve(mix);

      expect(mixture.alignment, Alignment.center);
      expect(mixture.fit, StackFit.expand);
      expect(mixture.textDirection, TextDirectionAttribute.ltr);
      expect(mixture.clipBehavior, Clip.antiAlias);
    });

    test('copyWith', () {
      const spec = StackMixture(
        alignment: Alignment.center,
        fit: StackFit.expand,
        textDirection: TextDirectionAttribute.ltr,
        clipBehavior: Clip.antiAlias,
      );

      final copiedSpec = spec.copyWith(
        alignment: Alignment.topLeft,
        fit: StackFit.loose,
        textDirection: TextDirectionAttribute.rtl,
        clipBehavior: Clip.none,
      );

      expect(copiedSpec.alignment, Alignment.topLeft);
      expect(copiedSpec.fit, StackFit.loose);
      expect(copiedSpec.textDirection, TextDirectionAttribute.rtl);
      expect(copiedSpec.clipBehavior, Clip.none);
    });

    test('lerp', () {
      const spec1 = StackMixture(
        alignment: Alignment.topLeft,
        fit: StackFit.loose,
        textDirection: TextDirectionAttribute.ltr,
        clipBehavior: Clip.none,
      );

      const spec2 = StackMixture(
        alignment: Alignment.bottomRight,
        fit: StackFit.expand,
        textDirection: TextDirectionAttribute.rtl,
        clipBehavior: Clip.antiAlias,
      );

      const t = 0.5;
      final lerpedSpec = spec1.lerp(spec2, t);

      expect(lerpedSpec.alignment,
          Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, t));
      expect(lerpedSpec.fit, StackFit.expand);
      expect(lerpedSpec.textDirection, TextDirectionAttribute.rtl);
      expect(lerpedSpec.clipBehavior, Clip.antiAlias);

      expect(lerpedSpec, isNot(spec1));
    });
  });
}
