import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('FlexAttributes', () {
    test('merge returns merged object correctly', () {
      const attr1 = FlexAttributes(
        direction: AxisAttribute(Axis.horizontal),
        mainAxisAlignment: MainAxisAlignmentAttribute(MainAxisAlignment.start),
        crossAxisAlignment:
            CrossAxisAlignmentAttribute(CrossAxisAlignment.start),
        mainAxisSize: MainAxisSizeAttribute(MainAxisSize.max),
        verticalDirection: VerticalDirectionAttribute(VerticalDirection.down),
        textDirection: TextDirectionAttribute(TextDirection.ltr),
        textBaseline: TextBaselineAttribute(TextBaseline.alphabetic),
        clipBehavior: ClipAttribute(Clip.hardEdge),
      );
      const attr2 = FlexAttributes(
        direction: AxisAttribute(Axis.vertical),
        mainAxisAlignment: MainAxisAlignmentAttribute(MainAxisAlignment.end),
        crossAxisAlignment: CrossAxisAlignmentAttribute(CrossAxisAlignment.end),
        mainAxisSize: MainAxisSizeAttribute(MainAxisSize.min),
        verticalDirection: VerticalDirectionAttribute(VerticalDirection.up),
        textDirection: TextDirectionAttribute(TextDirection.rtl),
        textBaseline: TextBaselineAttribute(TextBaseline.ideographic),
        clipBehavior: ClipAttribute(Clip.antiAlias),
      );

      final merged = attr1.merge(attr2);

      expect(merged.direction!.axis, Axis.vertical); // should take from attr2
      expect(merged.mainAxisAlignment!.alignment,
          MainAxisAlignment.end); // should take from attr2
      expect(merged.crossAxisAlignment!.alignment,
          CrossAxisAlignment.end); // should take from attr2
      expect(merged.mainAxisSize!.size,
          MainAxisSize.min); // should take from attr2
      expect(merged.verticalDirection!.direction,
          VerticalDirection.up); // should take from attr2
      expect(merged.textDirection!.value,
          TextDirection.rtl); // should take from attr2
      expect(merged.textBaseline!.baseline,
          TextBaseline.ideographic); // should take from attr2
      expect(
          merged.clipBehavior!.clip, Clip.antiAlias); // should take from attr2
    });

    test('resolve returns correct FlexSpec', () {
      const attr = FlexAttributes(
        direction: AxisAttribute(Axis.horizontal),
        mainAxisAlignment: MainAxisAlignmentAttribute(MainAxisAlignment.start),
        crossAxisAlignment:
            CrossAxisAlignmentAttribute(CrossAxisAlignment.start),
        mainAxisSize: MainAxisSizeAttribute(MainAxisSize.max),
        verticalDirection: VerticalDirectionAttribute(VerticalDirection.down),
        textDirection: TextDirectionAttribute(TextDirection.ltr),
        textBaseline: TextBaselineAttribute(TextBaseline.alphabetic),
        clipBehavior: ClipAttribute(Clip.hardEdge),
      );
      final spec = attr.resolve(EmptyMixData);

      expect(spec.direction, Axis.horizontal);
      expect(spec.mainAxisAlignment, MainAxisAlignment.start);
      expect(spec.crossAxisAlignment, CrossAxisAlignment.start);
      expect(spec.mainAxisSize, MainAxisSize.max);
      expect(spec.verticalDirection, VerticalDirection.down);
      expect(spec.textDirection, TextDirection.ltr);
      expect(spec.textBaseline, TextBaseline.alphabetic);
      expect(spec.clipBehavior, Clip.hardEdge);
      return const Placeholder();
    });

    test('Equality holds when all properties are the same', () {
      const attr1 = FlexAttributes(
        direction: AxisAttribute(Axis.horizontal),
        mainAxisAlignment: MainAxisAlignmentAttribute(MainAxisAlignment.start),
        crossAxisAlignment:
            CrossAxisAlignmentAttribute(CrossAxisAlignment.start),
        mainAxisSize: MainAxisSizeAttribute(MainAxisSize.max),
        verticalDirection: VerticalDirectionAttribute(VerticalDirection.down),
        textDirection: TextDirectionAttribute(TextDirection.ltr),
        textBaseline: TextBaselineAttribute(TextBaseline.alphabetic),
        clipBehavior: ClipAttribute(Clip.hardEdge),
      );
      const attr2 = FlexAttributes(
        direction: AxisAttribute(Axis.horizontal),
        mainAxisAlignment: MainAxisAlignmentAttribute(MainAxisAlignment.start),
        crossAxisAlignment:
            CrossAxisAlignmentAttribute(CrossAxisAlignment.start),
        mainAxisSize: MainAxisSizeAttribute(MainAxisSize.max),
        verticalDirection: VerticalDirectionAttribute(VerticalDirection.down),
        textDirection: TextDirectionAttribute(TextDirection.ltr),
        textBaseline: TextBaselineAttribute(TextBaseline.alphabetic),
        clipBehavior: ClipAttribute(Clip.hardEdge),
      );

      expect(attr1, attr2);
    });

    test('Equality fails when properties are different', () {
      const attr1 = FlexAttributes(
        direction: AxisAttribute(Axis.horizontal),
        mainAxisAlignment: MainAxisAlignmentAttribute(MainAxisAlignment.start),
        crossAxisAlignment:
            CrossAxisAlignmentAttribute(CrossAxisAlignment.start),
        mainAxisSize: MainAxisSizeAttribute(MainAxisSize.max),
        verticalDirection: VerticalDirectionAttribute(VerticalDirection.down),
        textDirection: TextDirectionAttribute(TextDirection.ltr),
        textBaseline: TextBaselineAttribute(TextBaseline.alphabetic),
        clipBehavior: ClipAttribute(Clip.hardEdge),
      );
      const attr2 = FlexAttributes(
        direction: AxisAttribute(Axis.vertical),
        mainAxisAlignment: MainAxisAlignmentAttribute(MainAxisAlignment.start),
        crossAxisAlignment:
            CrossAxisAlignmentAttribute(CrossAxisAlignment.start),
        mainAxisSize: MainAxisSizeAttribute(MainAxisSize.max),
        verticalDirection: VerticalDirectionAttribute(VerticalDirection.down),
        textDirection: TextDirectionAttribute(TextDirection.ltr),
        textBaseline: TextBaselineAttribute(TextBaseline.alphabetic),
        clipBehavior: ClipAttribute(Clip.hardEdge),
      );

      expect(attr1, isNot(attr2));
    });
  });

  group('FlexSpec', () {
    test('lerp returns correct FlexSpec', () {
      const spec1 = FlexSpec(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.hardEdge,
      );
      const spec2 = FlexSpec(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.up,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.ideographic,
        clipBehavior: Clip.antiAlias,
      );

      final lerpedSpec = spec1.lerp(spec2, 0.4);

      expect(lerpedSpec.direction, Axis.horizontal);
      expect(lerpedSpec.mainAxisAlignment, MainAxisAlignment.start);
      expect(lerpedSpec.crossAxisAlignment, CrossAxisAlignment.start);
      expect(lerpedSpec.mainAxisSize, MainAxisSize.max);
      expect(lerpedSpec.verticalDirection, VerticalDirection.down);
      expect(lerpedSpec.textDirection, TextDirection.ltr);
      expect(lerpedSpec.textBaseline, TextBaseline.alphabetic);
      expect(lerpedSpec.clipBehavior, Clip.hardEdge);
    });

    test('copyWith returns correct FlexSpec', () {
      const spec = FlexSpec(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.hardEdge,
      );

      final copiedSpec = spec.copyWith(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.up,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.ideographic,
        clipBehavior: Clip.antiAlias,
      );

      expect(copiedSpec.direction, Axis.vertical);
      expect(copiedSpec.mainAxisAlignment, MainAxisAlignment.end);
      expect(copiedSpec.crossAxisAlignment, CrossAxisAlignment.end);
      expect(copiedSpec.mainAxisSize, MainAxisSize.min);
      expect(copiedSpec.verticalDirection, VerticalDirection.up);
      expect(copiedSpec.textDirection, TextDirection.rtl);
      expect(copiedSpec.textBaseline, TextBaseline.ideographic);
      expect(copiedSpec.clipBehavior, Clip.antiAlias);
    });

    test('Equality holds when all properties are the same', () {
      const spec1 = FlexSpec(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.hardEdge,
      );
      const spec2 = FlexSpec(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.hardEdge,
      );

      expect(spec1, spec2);
    });

    test('Equality fails when properties are different', () {
      const spec1 = FlexSpec(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.hardEdge,
      );
      const spec2 = FlexSpec(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.hardEdge,
      );

      expect(spec1, isNot(spec2));
    });
  });
}
