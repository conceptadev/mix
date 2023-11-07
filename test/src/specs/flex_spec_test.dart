import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('FlexSpec', () {
    test('resolve', () {
      final mix = MixData.create(
        MockBuildContext(),
        StyleMix(
          const CrossAxisAlignmentAttribute(CrossAxisAlignment.center),
          const MainAxisAlignmentAttribute(MainAxisAlignment.center),
          const MainAxisSizeAttribute(MainAxisSize.min),
          const VerticalDirectionAttribute(VerticalDirection.down),
          const AxisAttribute(Axis.horizontal),
          const TextDirectionAttribute(TextDirection.ltr),
          const TextBaselineAttribute(TextBaseline.alphabetic),
          const ClipAttribute(Clip.antiAlias),
        ),
      );

      final spec = FlexSpec.resolve(mix);

      expect(spec.crossAxisAlignment, CrossAxisAlignment.center);
      expect(spec.mainAxisAlignment, MainAxisAlignment.center);
      expect(spec.mainAxisSize, MainAxisSize.min);
      expect(spec.verticalDirection, VerticalDirection.down);
      expect(spec.direction, Axis.horizontal);
      expect(spec.textDirection, TextDirection.ltr);
      expect(spec.textBaseline, TextBaseline.alphabetic);
      expect(spec.clipBehavior, Clip.antiAlias);
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
      );

      expect(copiedSpec.crossAxisAlignment, CrossAxisAlignment.start);
      expect(copiedSpec.mainAxisAlignment, MainAxisAlignment.end);
      expect(copiedSpec.mainAxisSize, MainAxisSize.max);
      expect(copiedSpec.verticalDirection, VerticalDirection.up);
      expect(copiedSpec.direction, Axis.vertical);
      expect(copiedSpec.textDirection, TextDirection.rtl);
      expect(copiedSpec.textBaseline, TextBaseline.ideographic);
      expect(copiedSpec.clipBehavior, Clip.none);

      expect(copiedSpec, isNot(spec));
    });
  });
}
