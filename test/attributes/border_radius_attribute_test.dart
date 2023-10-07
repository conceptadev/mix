// Necessary libraries

import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('BorderRadiusAttribute', () {
    test('circular creates BorderRadiusAttribute with circular radius', () {
      const radius = 10.0;
      final borderRadius = BorderRadiusAttribute.circular(radius);

      expect(borderRadius.topLeft, const RadiusAttribute.circular(radius));
      expect(borderRadius.topRight, const RadiusAttribute.circular(radius));
      expect(borderRadius.bottomLeft, const RadiusAttribute.circular(radius));
      expect(borderRadius.bottomRight, const RadiusAttribute.circular(radius));
      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('vertical creates BorderRadiusAttribute with vertical radius', () {
      const topRadius = 10.0;
      const bottomRadius = 20.0;
      const borderRadius = BorderRadiusAttribute.vertical(
        top: RadiusAttribute.circular(topRadius),
        bottom: RadiusAttribute.circular(bottomRadius),
      );

      expect(borderRadius.topLeft, const RadiusAttribute.circular(topRadius));
      expect(borderRadius.topRight, const RadiusAttribute.circular(topRadius));
      expect(
        borderRadius.bottomLeft,
        const RadiusAttribute.circular(bottomRadius),
      );
      expect(
        borderRadius.bottomRight,
        const RadiusAttribute.circular(bottomRadius),
      );
      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('horizontal creates BorderRadiusAttribute with horizontal radius', () {
      const leftRadius = 10.0;
      const rightRadius = 20.0;
      const borderRadius = BorderRadiusAttribute.horizontal(
        left: RadiusAttribute.circular(leftRadius),
        right: RadiusAttribute.circular(rightRadius),
      );

      expect(borderRadius.topLeft, const RadiusAttribute.circular(leftRadius));
      expect(
        borderRadius.topRight,
        const RadiusAttribute.circular(rightRadius),
      );
      expect(
          borderRadius.bottomLeft, const RadiusAttribute.circular(leftRadius));
      expect(
        borderRadius.bottomRight,
        const RadiusAttribute.circular(rightRadius),
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
        topLeft: RadiusAttribute.circular(topLeftRadius),
        topRight: RadiusAttribute.circular(topRightRadius),
        bottomLeft: RadiusAttribute.circular(bottomLeftRadius),
        bottomRight: RadiusAttribute.circular(bottomRightRadius),
      );

      expect(
        borderRadius.topLeft,
        const RadiusAttribute.circular(topLeftRadius),
      );
      expect(
        borderRadius.topRight,
        const RadiusAttribute.circular(topRightRadius),
      );
      expect(
        borderRadius.bottomLeft,
        const RadiusAttribute.circular(bottomLeftRadius),
      );
      expect(
        borderRadius.bottomRight,
        const RadiusAttribute.circular(bottomRightRadius),
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
        topStart: RadiusAttribute.circular(topStartRadius),
        topEnd: RadiusAttribute.circular(topEndRadius),
        bottomStart: RadiusAttribute.circular(bottomStartRadius),
        bottomEnd: RadiusAttribute.circular(bottomEndRadius),
      );

      expect(borderRadius.topLeft, null);
      expect(borderRadius.topRight, null);
      expect(borderRadius.bottomLeft, null);
      expect(borderRadius.bottomRight, null);
      expect(
        borderRadius.topStart,
        const RadiusAttribute.circular(topStartRadius),
      );
      expect(borderRadius.topEnd, const RadiusAttribute.circular(topEndRadius));
      expect(
        borderRadius.bottomStart,
        const RadiusAttribute.circular(bottomStartRadius),
      );
      expect(
        borderRadius.bottomEnd,
        const RadiusAttribute.circular(bottomEndRadius),
      );
    });

    test('all creates BorderRadiusAttribute with uniform radii', () {
      const radius = 10.0;
      const borderRadius = BorderRadiusAttribute.all(
        RadiusAttribute.circular(radius),
      );

      expect(borderRadius.topLeft, const RadiusAttribute.circular(radius));
      expect(borderRadius.topRight, const RadiusAttribute.circular(radius));
      expect(borderRadius.bottomLeft, const RadiusAttribute.circular(radius));
      expect(borderRadius.bottomRight, const RadiusAttribute.circular(radius));
      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('merge of non-directional attributes', () {
      const radius1 = BorderRadiusAttribute.only(
        topLeft: RadiusAttribute.circular(10),
        topRight: RadiusAttribute.circular(20),
        bottomLeft: RadiusAttribute.circular(30),
        bottomRight: RadiusAttribute.circular(40),
      );
      const radius2 = BorderRadiusAttribute.only(
        topLeft: RadiusAttribute.circular(100),
        bottomRight: RadiusAttribute.circular(400),
      );

      final merged = radius1.merge(radius2);

      expect(merged.topLeft, const RadiusAttribute.circular(100)); // Overridden
      expect(
          merged.topRight, const RadiusAttribute.circular(20)); // Kept original
      expect(merged.bottomLeft,
          const RadiusAttribute.circular(30)); // Kept original
      expect(merged.bottomRight,
          const RadiusAttribute.circular(400)); // Overridden
      expect(merged.topStart, null);
      expect(merged.topEnd, null);
      expect(merged.bottomStart, null);
      expect(merged.bottomEnd, null);
    });

    test('merge of directional attributes', () {
      const radius1 = BorderRadiusAttribute.directionalOnly(
        topStart: RadiusAttribute.circular(10),
        topEnd: RadiusAttribute.circular(20),
        bottomStart: RadiusAttribute.circular(30),
        bottomEnd: RadiusAttribute.circular(40),
      );
      const radius2 = BorderRadiusAttribute.directionalOnly(
        topEnd: RadiusAttribute.circular(400),
        bottomStart: RadiusAttribute.circular(300),
      );

      final merged = radius1.merge(radius2);

      expect(merged.topLeft, null);
      expect(merged.topRight, null);
      expect(merged.bottomLeft, null);
      expect(merged.bottomRight, null);
      expect(merged.topStart, const RadiusAttribute.circular(10));
      expect(merged.topEnd, const RadiusAttribute.circular(400));
      expect(merged.bottomStart, const RadiusAttribute.circular(300));
      expect(merged.bottomEnd, const RadiusAttribute.circular(40));
    });

    test('merge fails with directional and non-directional', () {
      const radius1 = BorderRadiusAttribute.only(
        topLeft: RadiusAttribute.circular(10),
        topRight: RadiusAttribute.circular(20),
        bottomLeft: RadiusAttribute.circular(30),
        bottomRight: RadiusAttribute.circular(40),
      );
      const radius2 = BorderRadiusAttribute.directionalOnly(
        topStart: RadiusAttribute.circular(100),
        topEnd: RadiusAttribute.circular(200),
        bottomStart: RadiusAttribute.circular(300),
        bottomEnd: RadiusAttribute.circular(400),
      );

      expect(() => radius1.merge(radius2), throwsUnsupportedError);
    });

    group('BorderRadius utilities', () {
      test('rounded creates BorderRadiusAttribute with circular radius', () {
        const radius = 10.0;
        final borderRadius = rounded(radius);

        expect(borderRadius.topLeft, const RadiusAttribute.circular(radius));
        expect(borderRadius.topRight, const RadiusAttribute.circular(radius));
        expect(borderRadius.bottomLeft, const RadiusAttribute.circular(radius));
        expect(
            borderRadius.bottomRight, const RadiusAttribute.circular(radius));
        expect(borderRadius.topStart, null);
        expect(borderRadius.topEnd, null);
        expect(borderRadius.bottomStart, null);
        expect(borderRadius.bottomEnd, null);
      });

      test('squared creates BorderRadiusAttribute with zero radius', () {
        final borderRadius = squared();

        expect(borderRadius.topLeft, const RadiusAttribute.zero());
        expect(borderRadius.topRight, const RadiusAttribute.zero());
        expect(borderRadius.bottomLeft, const RadiusAttribute.zero());
        expect(borderRadius.bottomRight, const RadiusAttribute.zero());
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
          const RadiusAttribute.circular(topLeftRadius),
        );
        expect(
          borderRadius.topRight,
          const RadiusAttribute.circular(topRightRadius),
        );
        expect(
          borderRadius.bottomLeft,
          const RadiusAttribute.circular(bottomLeftRadius),
        );
        expect(
          borderRadius.bottomRight,
          const RadiusAttribute.circular(bottomRightRadius),
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
          const RadiusAttribute.circular(topStartRadius),
        );
        expect(
          borderRadius.topEnd,
          const RadiusAttribute.circular(topEndRadius),
        );
        expect(
          borderRadius.bottomStart,
          const RadiusAttribute.circular(bottomStartRadius),
        );
        expect(
          borderRadius.bottomEnd,
          const RadiusAttribute.circular(bottomEndRadius),
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
          const RadiusAttribute.circular(leftRadius),
        );
        expect(
          borderRadius.topRight,
          const RadiusAttribute.circular(rightRadius),
        );
        expect(
          borderRadius.bottomLeft,
          const RadiusAttribute.circular(leftRadius),
        );
        expect(
          borderRadius.bottomRight,
          const RadiusAttribute.circular(rightRadius),
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
          const RadiusAttribute.circular(startRadius),
        );
        expect(
          borderRadius.topEnd,
          const RadiusAttribute.circular(endRadius),
        );
        expect(
          borderRadius.bottomStart,
          const RadiusAttribute.circular(startRadius),
        );
        expect(
          borderRadius.bottomEnd,
          const RadiusAttribute.circular(endRadius),
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
          const RadiusAttribute.circular(topRadius),
        );
        expect(
          borderRadius.topRight,
          const RadiusAttribute.circular(topRadius),
        );
        expect(
          borderRadius.bottomLeft,
          const RadiusAttribute.circular(bottomRadius),
        );
        expect(
          borderRadius.bottomRight,
          const RadiusAttribute.circular(bottomRadius),
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
          const RadiusAttribute.circular(topRadius),
        );
        expect(
          borderRadius.topEnd,
          const RadiusAttribute.circular(topRadius),
        );
        expect(
          borderRadius.bottomStart,
          const RadiusAttribute.circular(bottomRadius),
        );
        expect(
          borderRadius.bottomEnd,
          const RadiusAttribute.circular(bottomRadius),
        );
      });
    });
  });
}
