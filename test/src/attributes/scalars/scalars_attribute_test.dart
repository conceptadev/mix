import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('AxisAttribute Tests', () {
    test('initializes correctly', () {
      const axisAttribute = AxisAttribute(Axis.vertical);
      expect(axisAttribute.value, Axis.vertical);
    });

    // maybeFrom
    test('maybeFrom returns null if value is null', () {
      final axisAttribute = AxisAttribute.maybeFrom(null);
      expect(axisAttribute, isNull);
    });
  });

  group('TransformAttribute Tests', () {
    test('initializes correctly', () {
      final transformAttribute = TransformAttribute(Matrix4.identity());
      expect(transformAttribute.value, Matrix4.identity());
    });

    test('maybeFrom returns null if value is null', () {
      final transformAttribute = TransformAttribute.maybeFrom(null);
      expect(transformAttribute, isNull);
    });

    test('build returns a Transform widget', () {
      final transformAttribute = TransformAttribute(Matrix4.identity());
      final transform = transformAttribute.build(EmptyMixData, Container());
      expect(transform, isA<Transform>());
      expect(transform.transform, Matrix4.identity());
    });
  });

  group('AlignmentGeometryAttribute Tests', () {
    test('initializes correctly', () {
      const alignmentGeometryAttribute =
          AlignmentGeometryAttribute(Alignment.center);
      expect(alignmentGeometryAttribute.value, Alignment.center);
    });

    test('maybeFrom returns null if value is null', () {
      final alignmentGeometryAttribute =
          AlignmentGeometryAttribute.maybeFrom(null);
      expect(alignmentGeometryAttribute, isNull);
    });

    test('build returns an Align widget', () {
      const alignmentGeometryAttribute =
          AlignmentGeometryAttribute(Alignment.topLeft);
      final align = alignmentGeometryAttribute.build(EmptyMixData, Container());
      expect(align, isA<Align>());
      expect(align.alignment, Alignment.topLeft);
    });
  });

  group('ClipBehaviorAttribute Tests', () {
    test('initializes correctly', () {
      const clipBehaviorAttribute = ClipBehaviorAttribute(Clip.hardEdge);
      expect(clipBehaviorAttribute.value, Clip.hardEdge);
    });

    test('maybeFrom returns null if value is null', () {
      final clipBehaviorAttribute = ClipBehaviorAttribute.maybeFrom(null);
      expect(clipBehaviorAttribute, isNull);
    });
  });

  group('BackgroundColorAttribute Tests', () {
    test('initializes correctly', () {
      const backgroundColorAttribute =
          BackgroundColorAttribute(ColorDto(Colors.red));
      expect(backgroundColorAttribute.value.value, Colors.red);
    });

    test('maybeFrom returns null if value is null', () {
      final backgroundColorAttribute = BackgroundColorAttribute.maybeFrom(null);
      expect(backgroundColorAttribute, isNull);
    });

    test('build returns a ColoredBox widget', () {
      const backgroundColorAttribute =
          BackgroundColorAttribute(ColorDto(Colors.red));
      final coloredBox =
          backgroundColorAttribute.build(EmptyMixData, Container());
      expect(coloredBox, isA<ColoredBox>());
      expect(coloredBox.color, Colors.red);
    });
  });
}
