import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/modifiers/positioned_widget_modifier.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('PositionedModifierSpec', () {
    test('Constructor assigns values correctly', () {
      const bottom = 0;
      const top = 1.0;
      const left = 2;
      const right = 3;
      const width = 4;
      const height = 5;
      const modifier = PositionedModifierSpec(
        bottom: bottom,
        top: top,
        left: left,
        right: right,
        width: width,
        height: height,
      );
      expect(modifier.bottom, bottom);
      expect(modifier.top, top);
      expect(modifier.left, left);
      expect(modifier.right, right);
      expect(modifier.width, width);
      expect(modifier.height, height);
    });

    test('Lerp method interpolates correctly', () {
      const start = PositionedModifierSpec(
        bottom: 0,
        top: 1.0,
        left: 2,
        right: 3,
        width: 4,
        height: 5,
      );

      const end = PositionedModifierSpec(
        bottom: 6,
        top: 7.0,
        left: 8,
        right: 9,
        width: 10,
        height: 11,
      );
      final result = start.lerp(end, 0.5);
      expect(result.bottom, 3);
      expect(result.top, 4.0);
      expect(result.left, 5);
      expect(result.right, 6);
      expect(result.width, 7);
      expect(result.height, 8);
    });

    test('Equality and hashcode test', () {
      const modifier1 = PositionedModifierSpec(
        bottom: 0,
        top: 1.0,
        left: 2,
        right: 3,
        width: 4,
        height: 5,
      );
      const modifier2 = PositionedModifierSpec(
        bottom: 0,
        top: 1.0,
        left: 2,
        right: 3,
        width: 4,
        height: 5,
      );
      const modifier3 = PositionedModifierSpec(
        bottom: null,
        top: null,
        left: null,
        right: null,
        width: null,
        height: null,
      );

      expect(modifier1, modifier2);
      expect(modifier1.hashCode, modifier2.hashCode);
      expect(modifier1 == modifier3, false);
      expect(modifier1.hashCode == modifier3.hashCode, false);
    });

    testWidgets(
      'Build method creates Positioned widget with correct positioning properties',
      (WidgetTester tester) async {
        const bottom = 0;
        const top = 1.0;
        const left = 2;
        const right = 3;
        const width = 4;
        const height = 5;
        const modifier = PositionedModifierSpec(
          bottom: bottom,
          top: top,
          left: left,
          right: right,
          width: width,
          height: height,
        );

        await tester.pumpMaterialApp(
          Row(children: [modifier.build(Container())]),
        );

        final Positioned flexibleWidget =
            tester.widget(find.byType(Positioned));

        expect(find.byType(Positioned), findsOneWidget);
        expect(flexibleWidget.bottom, bottom.toDouble());
        expect(flexibleWidget.top, top.toDouble());
        expect(flexibleWidget.left, left.toDouble());
        expect(flexibleWidget.right, right.toDouble());
        expect(flexibleWidget.width, width.toDouble());
        expect(flexibleWidget.height, height.toDouble());
      },
    );
  });

  group('PositionedModifierSpecAttribute', () {
    test('merge', () {
      const modifier = PositionedModifierSpecAttribute(
          right: 1, top: 2, width: 3, height: 4);
      const other = PositionedModifierSpecAttribute(
          right: 1, top: 2, width: 3, height: 4);
      final result = modifier.merge(other);
      expect(result, modifier);
    });

    test('resolve', () {
      const modifier = PositionedModifierSpecAttribute();
      final result = modifier.resolve(EmptyMixData);
      expect(result, isA<PositionedModifierSpec>());
    });

    // equality
    test('equality', () {
      const modifier = PositionedModifierSpecAttribute(
          right: 1, top: 2, width: 3, height: 4);
      const other = PositionedModifierSpecAttribute(
          right: 1, top: 2, width: 3, height: 4);
      expect(modifier, other);
    });

    test('inequality', () {
      const modifier = PositionedModifierSpecAttribute(
          right: 1, top: 2, width: 3, height: 4);
      const other = PositionedModifierSpecAttribute(
          right: 1, top: 2, width: 3, height: 5);
      expect(modifier, isNot(other));
    });
  });
}
