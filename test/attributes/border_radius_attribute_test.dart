// Necessary libraries

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/visual_attributes.dart';
import 'package:mix/src/helpers/extensions/values_ext.dart';

void main() {
  group('BorderRadiusAttribute', () {
    test('circular creates BorderRadiusAttribute with circular radius', () {
      const radius = 10.0;
      final borderRadius =
          BorderRadiusGeometryData.circular(radius).asAttribute;
      final borderRadiusDirectional = BorderRadiusGeometryData.circular(
        radius,
      ).toDirectional.asAttribute;

      expect(borderRadius.value.topLeft, const Radius.circular(radius));
      expect(borderRadius.value.topRight, const Radius.circular(radius));
      expect(borderRadius.value.bottomLeft, const Radius.circular(radius));
      expect(borderRadius.value.bottomRight, const Radius.circular(radius));
      expect(borderRadiusDirectional.value.topStart,
          const Radius.circular(radius));
      expect(
        borderRadiusDirectional.value.topEnd,
        const Radius.circular(radius),
      );
      expect(
        borderRadiusDirectional.value.bottomStart,
        const Radius.circular(radius),
      );
      expect(
        borderRadiusDirectional.value.bottomEnd,
        const Radius.circular(radius),
      );
    });

    test('vertical creates BorderRadiusAttribute with vertical radius', () {
      const topRadius = 10.0;
      const bottomRadius = 20.0;
      final borderRadius = BorderRadiusGeometryData.vertical(
        top: const Radius.circular(topRadius),
        bottom: const Radius.circular(bottomRadius),
      );

      expect(borderRadius.topLeft, const Radius.circular(topRadius));
      expect(borderRadius.topRight, const Radius.circular(topRadius));
      expect(
        borderRadius.bottomLeft,
        const Radius.circular(bottomRadius),
      );
      expect(
        borderRadius.bottomRight,
        const Radius.circular(bottomRadius),
      );

      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('horizontal creates BorderRadiusAttribute with horizontal radius', () {
      const leftRadius = 10.0;
      const rightRadius = 20.0;
      final borderRadius = BorderRadiusAttribute.horizontal(
        left: const Radius.circular(leftRadius),
        right: const Radius.circular(rightRadius),
      );

      expect(borderRadius.topLeft, const Radius.circular(leftRadius));
      expect(
        borderRadius.topRight,
        const Radius.circular(rightRadius),
      );
      expect(borderRadius.bottomLeft, const Radius.circular(leftRadius));
      expect(
        borderRadius.bottomRight,
        const Radius.circular(rightRadius),
      );
      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('only creates BorderRadiusAttribute with specific radii', () {
      const topLeftRadius = 10.0;
      const topRightRadius = 20.0;
      const bottomLeftRadius = 30.0;
      const bottomRightRadius = 40.0;
      const borderRadius = BorderRadiusAttribute.only(
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
      );

      expect(
        borderRadius.topLeft,
        const Radius.circular(topLeftRadius),
      );
      expect(
        borderRadius.topRight,
        const Radius.circular(topRightRadius),
      );
      expect(
        borderRadius.bottomLeft,
        const Radius.circular(bottomLeftRadius),
      );
      expect(
        borderRadius.bottomRight,
        const Radius.circular(bottomRightRadius),
      );
      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('directionalOnly creates BorderRadiusAttribute with directional radii',
        () {
      const topStartRadius = 10.0;
      const topEndRadius = 20.0;
      const bottomStartRadius = 30.0;
      const bottomEndRadius = 40.0;
      const borderRadius = BorderRadiusAttribute.directionalOnly(
        topStart: Radius.circular(topStartRadius),
        topEnd: Radius.circular(topEndRadius),
        bottomStart: Radius.circular(bottomStartRadius),
        bottomEnd: Radius.circular(bottomEndRadius),
      );

      expect(borderRadius.topLeft, null);
      expect(borderRadius.topRight, null);
      expect(borderRadius.bottomLeft, null);
      expect(borderRadius.bottomRight, null);
      expect(
        borderRadius.topStart,
        const Radius.circular(topStartRadius),
      );
      expect(borderRadius.topEnd, const Radius.circular(topEndRadius));
      expect(
        borderRadius.bottomStart,
        const Radius.circular(bottomStartRadius),
      );
      expect(
        borderRadius.bottomEnd,
        const Radius.circular(bottomEndRadius),
      );
    });

    test('all creates BorderRadiusAttribute with uniform radii', () {
      const radius = 10.0;
      const borderRadius = BorderRadiusAttribute.all(
        Radius.circular(radius),
      );

      expect(borderRadius.topLeft, const Radius.circular(radius));
      expect(borderRadius.topRight, const Radius.circular(radius));
      expect(borderRadius.bottomLeft, const Radius.circular(radius));
      expect(borderRadius.bottomRight, const Radius.circular(radius));
      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('merge of non-directional attributes', () {
      const radius1 = BorderRadiusAttribute.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(40),
      );
      const radius2 = BorderRadiusAttribute.only(
        topLeft: Radius.circular(100),
        bottomRight: Radius.circular(400),
      );

      final merged = radius1.merge(radius2);

      expect(merged.topLeft, const Radius.circular(100)); // Overridden
      expect(merged.topRight, const Radius.circular(20)); // Kept original
      expect(merged.bottomLeft, const Radius.circular(30)); // Kept original
      expect(merged.bottomRight, const Radius.circular(400)); // Overridden
      expect(merged.topStart, null);
      expect(merged.topEnd, null);
      expect(merged.bottomStart, null);
      expect(merged.bottomEnd, null);
    });

    test('merge of directional attributes', () {
      const radius1 = BorderRadiusAttribute.directionalOnly(
        topStart: Radius.circular(10),
        topEnd: Radius.circular(20),
        bottomStart: Radius.circular(30),
        bottomEnd: Radius.circular(40),
      );
      const radius2 = BorderRadiusAttribute.directionalOnly(
        topEnd: Radius.circular(400),
        bottomStart: Radius.circular(300),
      );

      final merged = radius1.merge(radius2);

      expect(merged.topLeft, null);
      expect(merged.topRight, null);
      expect(merged.bottomLeft, null);
      expect(merged.bottomRight, null);
      expect(merged.topStart, const Radius.circular(10));
      expect(merged.topEnd, const Radius.circular(400));
      expect(merged.bottomStart, const Radius.circular(300));
      expect(merged.bottomEnd, const Radius.circular(40));
    });

    test('merge fails with directional and non-directional', () {
      const radius1 = BorderRadiusAttribute.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(40),
      );
      const radius2 = BorderRadiusAttribute.directionalOnly(
        topStart: Radius.circular(100),
        topEnd: Radius.circular(200),
        bottomStart: Radius.circular(300),
        bottomEnd: Radius.circular(400),
      );

      expect(() => radius1.merge(radius2), throwsUnsupportedError);
    });

    group('BorderRadius utilities', () {
      test('rounded creates BorderRadiusAttribute with circular radius', () {
        const radius = 10.0;
        final borderRadius = rounded(radius);

        expect(borderRadius.topLeft, const Radius.circular(radius));
        expect(borderRadius.topRight, const Radius.circular(radius));
        expect(borderRadius.bottomLeft, const Radius.circular(radius));
        expect(borderRadius.bottomRight, const Radius.circular(radius));
        expect(borderRadius.topStart, null);
        expect(borderRadius.topEnd, null);
        expect(borderRadius.bottomStart, null);
        expect(borderRadius.bottomEnd, null);
      });

      test('squared creates BorderRadiusAttribute with zero radius', () {
        final borderRadius = squared();

        expect(borderRadius.topLeft, const Radius.zero());
        expect(borderRadius.topRight, const Radius.zero());
        expect(borderRadius.bottomLeft, const Radius.zero());
        expect(borderRadius.bottomRight, const Radius.zero());
        expect(borderRadius.topStart, null);
        expect(borderRadius.topEnd, null);
        expect(borderRadius.bottomStart, null);
        expect(borderRadius.bottomEnd, null);
      });

      test('roundedOnly creates BorderRadiusAttribute with specified radii',
          () {
        const topLeftRadius = 10.0;
        const topRightRadius = 20.0;
        const bottomLeftRadius = 30.0;
        const bottomRightRadius = 40.0;
        final borderRadius = roundedOnly(
          topLeft: topLeftRadius,
          topRight: topRightRadius,
          bottomLeft: bottomLeftRadius,
          bottomRight: bottomRightRadius,
        );

        expect(
          borderRadius.topLeft,
          const Radius.circular(topLeftRadius),
        );
        expect(
          borderRadius.topRight,
          const Radius.circular(topRightRadius),
        );
        expect(
          borderRadius.bottomLeft,
          const Radius.circular(bottomLeftRadius),
        );
        expect(
          borderRadius.bottomRight,
          const Radius.circular(bottomRightRadius),
        );
        expect(borderRadius.topStart, null);
        expect(borderRadius.topEnd, null);
        expect(borderRadius.bottomStart, null);
        expect(borderRadius.bottomEnd, null);
      });

      test(
          'roundedOnlyDirectional creates BorderRadiusAttribute with specified radii',
          () {
        const topStartRadius = 10.0;
        const topEndRadius = 20.0;
        const bottomStartRadius = 30.0;
        const bottomEndRadius = 40.0;
        final borderRadius = roundedDirectionalOnly(
          topStart: topStartRadius,
          topEnd: topEndRadius,
          bottomStart: bottomStartRadius,
          bottomEnd: bottomEndRadius,
        );

        expect(borderRadius.topLeft, null);
        expect(borderRadius.topRight, null);
        expect(borderRadius.bottomLeft, null);
        expect(borderRadius.bottomRight, null);
        expect(
          borderRadius.topStart,
          Radius.circular(topStartRadius.toDto),
        );
        expect(
          borderRadius.topEnd,
          Radius.circular(topEndRadius.toDto),
        );
        expect(
          borderRadius.bottomStart,
          Radius.circular(bottomStartRadius.toDto),
        );
        expect(
          borderRadius.bottomEnd,
          Radius.circular(bottomEndRadius.toDto),
        );
      });

      test(
          'roundedHorizontal creates BorderRadiusAttribute with specified horizontal radii',
          () {
        const leftRadius = 10.0;
        const rightRadius = 20.0;
        final borderRadius = roundedHorizontal(
          left: leftRadius,
          right: rightRadius,
        );

        expect(
          borderRadius.topLeft,
          Radius.circular(leftRadius.toDto),
        );
        expect(
          borderRadius.topRight,
          Radius.circular(rightRadius.toDto),
        );
        expect(
          borderRadius.bottomLeft,
          Radius.circular(leftRadius.toDto),
        );
        expect(
          borderRadius.bottomRight,
          Radius.circular(rightRadius.toDto),
        );
        expect(borderRadius.topStart, null);
        expect(borderRadius.topEnd, null);
        expect(borderRadius.bottomStart, null);
        expect(borderRadius.bottomEnd, null);
      });

      test(
          'roundedHorizontalDirectional creates BorderRadiusAttribute with specified horizontal directional radii',
          () {
        const startRadius = 10.0;
        const endRadius = 20.0;
        final borderRadius = roundedDirectionalHorizontal(
          start: startRadius,
          end: endRadius,
        );

        expect(borderRadius.topLeft, null);
        expect(borderRadius.topRight, null);
        expect(borderRadius.bottomLeft, null);
        expect(borderRadius.bottomRight, null);
        expect(
          borderRadius.topStart,
          Radius.circular(startRadius.toDto),
        );
        expect(
          borderRadius.topEnd,
          Radius.circular(endRadius.toDto),
        );
        expect(
          borderRadius.bottomStart,
          Radius.circular(startRadius.toDto),
        );
        expect(
          borderRadius.bottomEnd,
          Radius.circular(endRadius.toDto),
        );
      });

      test(
          'roundedVertical creates BorderRadiusAttribute with specified vertical radii',
          () {
        const topRadius = 10.0;
        const bottomRadius = 20.0;
        final borderRadius = roundedVertical(
          top: topRadius,
          bottom: bottomRadius,
        );

        expect(
          borderRadius.topLeft,
          Radius.circular(topRadius.toDto),
        );
        expect(
          borderRadius.topRight,
          Radius.circular(topRadius.toDto),
        );
        expect(
          borderRadius.bottomLeft,
          Radius.circular(bottomRadius.toDto),
        );
        expect(
          borderRadius.bottomRight,
          Radius.circular(bottomRadius.toDto),
        );
        expect(borderRadius.topStart, null);
        expect(borderRadius.topEnd, null);
        expect(borderRadius.bottomStart, null);
        expect(borderRadius.bottomEnd, null);
      });

      test(
          'roundedVerticalDirectional creates BorderRadiusAttribute with specified vertical directional radii',
          () {
        const topRadius = 10.0;
        const bottomRadius = 20.0;
        final borderRadius = roundedDirectionalVertical(
          top: topRadius,
          bottom: bottomRadius,
        );

        expect(borderRadius.topLeft, null);
        expect(borderRadius.topRight, null);
        expect(borderRadius.bottomLeft, null);
        expect(borderRadius.bottomRight, null);
        expect(
          borderRadius.topStart,
          Radius.circular(topRadius.toDto),
        );
        expect(
          borderRadius.topEnd,
          Radius.circular(topRadius.toDto),
        );
        expect(
          borderRadius.bottomStart,
          Radius.circular(bottomRadius.toDto),
        );
        expect(
          borderRadius.bottomEnd,
          Radius.circular(bottomRadius.toDto),
        );
      });
    });
  });
}
