import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/alignment_attribute.dart';
import 'package:mix/src/attributes/clip_behavior_attribute.dart';
import 'package:mix/src/attributes/text_direction_attribute.dart';
import 'package:mix/src/recipes/stack/stack_attribute.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('StackMixture', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        StyleMix(
          const AlignmentGeometryAttribute(Alignment.center),
          const StackFitAttribute(StackFit.expand),
          const TextDirectionAttribute(TextDirection.ltr),
          const ClipBehaviorAttribute(Clip.antiAlias),
        ),
      );

      final spec = StackMixture.resolve(mix);

      expect(spec.alignment, Alignment.center);
      expect(spec.fit, StackFit.expand);
      expect(spec.textDirection, TextDirection.ltr);
      expect(spec.clipBehavior, Clip.antiAlias);
    });

    test('copyWith', () {
      const spec = StackMixture(
        alignment: Alignment.center,
        fit: StackFit.expand,
        textDirection: TextDirection.ltr,
        clipBehavior: Clip.antiAlias,
      );

      final copiedSpec = spec.copyWith(
        alignment: Alignment.topLeft,
        fit: StackFit.loose,
        textDirection: TextDirection.rtl,
        clipBehavior: Clip.none,
      );

      expect(copiedSpec.alignment, Alignment.topLeft);
      expect(copiedSpec.fit, StackFit.loose);
      expect(copiedSpec.textDirection, TextDirection.rtl);
      expect(copiedSpec.clipBehavior, Clip.none);
    });

    test('lerp', () {
      const spec1 = StackMixture(
        alignment: Alignment.topLeft,
        fit: StackFit.loose,
        textDirection: TextDirection.ltr,
        clipBehavior: Clip.none,
      );

      const spec2 = StackMixture(
        alignment: Alignment.bottomRight,
        fit: StackFit.expand,
        textDirection: TextDirection.rtl,
        clipBehavior: Clip.antiAlias,
      );

      const t = 0.5;
      final lerpedSpec = spec1.lerp(spec2, t);

      expect(lerpedSpec.alignment,
          Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, t));
      expect(lerpedSpec.fit, StackFit.expand);
      expect(lerpedSpec.textDirection, TextDirection.rtl);
      expect(lerpedSpec.clipBehavior, Clip.antiAlias);

      expect(lerpedSpec, isNot(spec1));
    });
  });
}
