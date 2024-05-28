import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/animated/animated_data.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('FlexMixAttribute', () {
    test('of returns correct FlexMixAttribute', () {
      final attribute = FlexSpecAttribute.of(EmptyMixData);

      expect(attribute.direction, null);
      expect(attribute.mainAxisAlignment, null);
      expect(attribute.crossAxisAlignment, null);
      expect(attribute.mainAxisSize, null);
      expect(attribute.verticalDirection, null);
      expect(attribute.textDirection, null);
      expect(attribute.textBaseline, null);
      expect(attribute.clipBehavior, null);
      expect(attribute.gap, null);
    });

    test('resolve returns correct FlexSpec', () {
      const attribute = FlexSpecAttribute(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.up,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.antiAlias,
        gap: 10.0,
      );
      final mixData = MixData.create(MockBuildContext(), Style(attribute));
      final resolvedSpec = attribute.resolve(mixData);

      expect(resolvedSpec.crossAxisAlignment, CrossAxisAlignment.start);
      expect(resolvedSpec.mainAxisAlignment, MainAxisAlignment.center);
      expect(resolvedSpec.mainAxisSize, MainAxisSize.max);
      expect(resolvedSpec.verticalDirection, VerticalDirection.up);
      expect(resolvedSpec.direction, Axis.horizontal);
      expect(resolvedSpec.textDirection, TextDirection.rtl);
      expect(resolvedSpec.textBaseline, TextBaseline.alphabetic);
      expect(resolvedSpec.clipBehavior, Clip.antiAlias);
      expect(resolvedSpec.gap, 10.0);
    });

    test('merge returns correct FlexMixAttribute', () {
      const attribute1 = FlexSpecAttribute(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.up,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.antiAlias,
        gap: 10.0,
      );
      const attribute2 = FlexSpecAttribute(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        textBaseline: TextBaseline.ideographic,
        clipBehavior: Clip.hardEdge,
        gap: 20.0,
      );
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute.direction, Axis.vertical);
      expect(mergedAttribute.mainAxisAlignment, MainAxisAlignment.end);
      expect(mergedAttribute.crossAxisAlignment, CrossAxisAlignment.end);
      expect(mergedAttribute.mainAxisSize, MainAxisSize.min);
      expect(mergedAttribute.verticalDirection, VerticalDirection.down);
      expect(mergedAttribute.textDirection, TextDirection.ltr);
      expect(mergedAttribute.textBaseline, TextBaseline.ideographic);
      expect(mergedAttribute.clipBehavior, Clip.hardEdge);
      expect(mergedAttribute.gap, 20.0);
    });

    test('props returns correct list of properties', () {
      const attribute = FlexSpecAttribute(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        verticalDirection: VerticalDirection.up,
        textDirection: TextDirection.rtl,
        textBaseline: TextBaseline.alphabetic,
        clipBehavior: Clip.antiAlias,
        gap: 10.0,
        animated: AnimatedDataDto.withDefaults(),
      );
      final props = attribute.props;

      expect(props.length, 10);
      expect(props[0], Axis.horizontal);
      expect(props[1], MainAxisAlignment.center);
      expect(props[2], CrossAxisAlignment.start);
      expect(props[3], MainAxisSize.max);
      expect(props[4], VerticalDirection.up);
      expect(props[5], TextDirection.rtl);
      expect(props[6], TextBaseline.alphabetic);
      expect(props[7], Clip.antiAlias);
      expect(props[8], 10.0);
      expect(
        props[9],
        const AnimatedDataDto.withDefaults(),
      );
    });
  });
}
