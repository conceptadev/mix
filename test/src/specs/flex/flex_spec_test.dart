import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('FlexSpec', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        Style(
          const FlexSpecAttribute(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            direction: Axis.horizontal,
            textDirection: TextDirection.ltr,
            textBaseline: TextBaseline.alphabetic,
            clipBehavior: Clip.antiAlias,
            gap: 10,
          ),
        ),
      );

      final spec = FlexSpec.of(mix);

      expect(spec.crossAxisAlignment, CrossAxisAlignment.center);
      expect(spec.mainAxisAlignment, MainAxisAlignment.center);
      expect(spec.mainAxisSize, MainAxisSize.min);
      expect(spec.verticalDirection, VerticalDirection.down);
      expect(spec.direction, Axis.horizontal);
      expect(spec.textDirection, TextDirection.ltr);
      expect(spec.textBaseline, TextBaseline.alphabetic);
      expect(spec.clipBehavior, Clip.antiAlias);
      expect(spec.gap, 10);
    });

    test('copyWith', () {
      const spec = FlexSpec(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        direction: Axis.horizontal,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.antiAlias,
        gap: 10,
      );

      final copiedSpec = spec.copyWith(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.up,
        direction: Axis.vertical,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.ideographic,
        clipBehavior: Clip.none,
        gap: 20,
      );

      expect(copiedSpec.crossAxisAlignment, CrossAxisAlignment.start);
      expect(copiedSpec.mainAxisAlignment, MainAxisAlignment.end);
      expect(copiedSpec.mainAxisSize, MainAxisSize.max);
      expect(copiedSpec.verticalDirection, VerticalDirection.up);
      expect(copiedSpec.direction, Axis.vertical);
      expect(copiedSpec.textDirection, TextDirection.rtl);
      expect(copiedSpec.textBaseline, TextBaseline.ideographic);
      expect(copiedSpec.clipBehavior, Clip.none);
      expect(copiedSpec.gap, 20);

      expect(copiedSpec, isNot(spec));
    });

    test('lerp', () {
      const spec1 = FlexSpec(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        direction: Axis.horizontal,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.none,
        gap: 10,
      );

      const spec2 = FlexSpec(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.up,
        direction: Axis.vertical,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.ideographic,
        clipBehavior: Clip.antiAlias,
        gap: 20,
      );

      const t = 0.5;
      final lerpedSpec = spec1.lerp(spec2, t);

      expect(lerpedSpec.crossAxisAlignment, CrossAxisAlignment.end);
      expect(
        lerpedSpec.mainAxisAlignment,
        MainAxisAlignment.end,
      );
      expect(
        lerpedSpec.mainAxisSize,
        MainAxisSize.max,
      );
      expect(
        lerpedSpec.verticalDirection,
        VerticalDirection.up,
      );
      expect(lerpedSpec.direction, Axis.vertical);
      expect(lerpedSpec.textDirection, TextDirection.rtl);
      expect(lerpedSpec.textBaseline, TextBaseline.ideographic);
      expect(lerpedSpec.clipBehavior, Clip.antiAlias);
      expect(lerpedSpec.gap, lerpDouble(spec1.gap, spec2.gap, t));

      expect(lerpedSpec, isNot(spec1));
    });

    // equality
    test('equality', () {
      const spec1 = FlexSpec(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        direction: Axis.horizontal,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.none,
        gap: 10,
      );

      const spec2 = FlexSpec(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        direction: Axis.horizontal,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.none,
        gap: 10,
      );

      const spec3 = FlexSpec(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.up,
        direction: Axis.vertical,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.ideographic,
        clipBehavior: Clip.antiAlias,
        gap: 20,
      );

      expect(spec1, spec2);
      expect(spec1, isNot(spec3));
    });
  });
}
