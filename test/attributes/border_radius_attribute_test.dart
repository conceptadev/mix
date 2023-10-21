// Necessary libraries

import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('BorderRadiusAttribute', () {
    test('circular creates BorderRadiusAttribute with circular radius', () {
      const radius = 10.0;
      final borderRadius = BorderRadiusAttribute.circular(radius);
      final borderRadiusDirectional =
          BorderRadiusDirectionalAttribute.circular(radius);

      expect(borderRadius.topLeft, const RadiusDto.circular(radius));
      expect(borderRadius.topRight, const RadiusDto.circular(radius));
      expect(borderRadius.bottomLeft, const RadiusDto.circular(radius));
      expect(borderRadius.bottomRight, const RadiusDto.circular(radius));
      expect(
          borderRadiusDirectional.topStart, const RadiusDto.circular(radius));
      expect(borderRadiusDirectional.topEnd, const RadiusDto.circular(radius));
      expect(borderRadiusDirectional.bottomStart,
          const RadiusDto.circular(radius));
      expect(
          borderRadiusDirectional.bottomEnd, const RadiusDto.circular(radius));
    });

    test('vertical creates BorderRadiusAttribute with vertical radius', () {
      const topRadius = 10.0;
      const bottomRadius = 20.0;
      const borderRadius = BorderRadiusAttribute.vertical(
        top: RadiusDto.circular(topRadius),
        bottom: RadiusDto.circular(bottomRadius),
      );

      expect(borderRadius.topLeft, const RadiusDto.circular(topRadius));
      expect(borderRadius.topRight, const RadiusDto.circular(topRadius));
      expect(
        borderRadius.bottomLeft,
        const RadiusDto.circular(bottomRadius),
      );
      expect(
        borderRadius.bottomRight,
        const RadiusDto.circular(bottomRadius),
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
        left: RadiusDto.circular(leftRadius),
        right: RadiusDto.circular(rightRadius),
      );

      expect(borderRadius.topLeft, const RadiusDto.circular(leftRadius));
      expect(
        borderRadius.topRight,
        const RadiusDto.circular(rightRadius),
      );
      expect(borderRadius.bottomLeft, const RadiusDto.circular(leftRadius));
      expect(
        borderRadius.bottomRight,
        const RadiusDto.circular(rightRadius),
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
        topLeft: RadiusDto.circular(topLeftRadius),
        topRight: RadiusDto.circular(topRightRadius),
        bottomLeft: RadiusDto.circular(bottomLeftRadius),
        bottomRight: RadiusDto.circular(bottomRightRadius),
      );

      expect(
        borderRadius.topLeft,
        const RadiusDto.circular(topLeftRadius),
      );
      expect(
        borderRadius.topRight,
        const RadiusDto.circular(topRightRadius),
      );
      expect(
        borderRadius.bottomLeft,
        const RadiusDto.circular(bottomLeftRadius),
      );
      expect(
        borderRadius.bottomRight,
        const RadiusDto.circular(bottomRightRadius),
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
        topStart: RadiusDto.circular(topStartRadius),
        topEnd: RadiusDto.circular(topEndRadius),
        bottomStart: RadiusDto.circular(bottomStartRadius),
        bottomEnd: RadiusDto.circular(bottomEndRadius),
      );

      expect(borderRadius.topLeft, null);
      expect(borderRadius.topRight, null);
      expect(borderRadius.bottomLeft, null);
      expect(borderRadius.bottomRight, null);
      expect(
        borderRadius.topStart,
        const RadiusDto.circular(topStartRadius),
      );
      expect(borderRadius.topEnd, const RadiusDto.circular(topEndRadius));
      expect(
        borderRadius.bottomStart,
        const RadiusDto.circular(bottomStartRadius),
      );
      expect(
        borderRadius.bottomEnd,
        const RadiusDto.circular(bottomEndRadius),
      );
    });

    test('all creates BorderRadiusAttribute with uniform radii', () {
      const radius = 10.0;
      const borderRadius = BorderRadiusAttribute.all(
        RadiusDto.circular(radius),
      );

      expect(borderRadius.topLeft, const RadiusDto.circular(radius));
      expect(borderRadius.topRight, const RadiusDto.circular(radius));
      expect(borderRadius.bottomLeft, const RadiusDto.circular(radius));
      expect(borderRadius.bottomRight, const RadiusDto.circular(radius));
      expect(borderRadius.topStart, null);
      expect(borderRadius.topEnd, null);
      expect(borderRadius.bottomStart, null);
      expect(borderRadius.bottomEnd, null);
    });

    test('merge of non-directional attributes', () {
      const radius1 = BorderRadiusAttribute.only(
        topLeft: RadiusDto.circular(10),
        topRight: RadiusDto.circular(20),
        bottomLeft: RadiusDto.circular(30),
        bottomRight: RadiusDto.circular(40),
      );
      const radius2 = BorderRadiusAttribute.only(
        topLeft: RadiusDto.circular(100),
        bottomRight: RadiusDto.circular(400),
      );

      final merged = radius1.merge(radius2);

      expect(merged.topLeft, const RadiusDto.circular(100)); // Overridden
      expect(merged.topRight, const RadiusDto.circular(20)); // Kept original
      expect(merged.bottomLeft, const RadiusDto.circular(30)); // Kept original
      expect(merged.bottomRight, const RadiusDto.circular(400)); // Overridden
      expect(merged.topStart, null);
      expect(merged.topEnd, null);
      expect(merged.bottomStart, null);
      expect(merged.bottomEnd, null);
    });

    test('merge of directional attributes', () {
      const radius1 = BorderRadiusAttribute.directionalOnly(
        topStart: RadiusDto.circular(10),
        topEnd: RadiusDto.circular(20),
        bottomStart: RadiusDto.circular(30),
        bottomEnd: RadiusDto.circular(40),
      );
      const radius2 = BorderRadiusAttribute.directionalOnly(
        topEnd: RadiusDto.circular(400),
        bottomStart: RadiusDto.circular(300),
      );

      final merged = radius1.merge(radius2);

      expect(merged.topLeft, null);
      expect(merged.topRight, null);
      expect(merged.bottomLeft, null);
      expect(merged.bottomRight, null);
      expect(merged.topStart, const RadiusDto.circular(10));
      expect(merged.topEnd, const RadiusDto.circular(400));
      expect(merged.bottomStart, const RadiusDto.circular(300));
      expect(merged.bottomEnd, const RadiusDto.circular(40));
    });

    test('merge fails with directional and non-directional', () {
      const radius1 = BorderRadiusAttribute.only(
        topLeft: RadiusDto.circular(10),
        topRight: RadiusDto.circular(20),
        bottomLeft: RadiusDto.circular(30),
        bottomRight: RadiusDto.circular(40),
      );
      const radius2 = BorderRadiusAttribute.directionalOnly(
        topStart: RadiusDto.circular(100),
        topEnd: RadiusDto.circular(200),
        bottomStart: RadiusDto.circular(300),
        bottomEnd: RadiusDto.circular(400),
      );

      expect(() => radius1.merge(radius2), throwsUnsupportedError);
    });

    group('BorderRadius utilities', () {
      test('rounded creates BorderRadiusAttribute with circular radius', () {
        const radius = 10.0;
        final borderRadius = rounded(radius);

        expect(borderRadius.topLeft, const RadiusDto.circular(radius));
        expect(borderRadius.topRight, const RadiusDto.circular(radius));
        expect(borderRadius.bottomLeft, const RadiusDto.circular(radius));
        expect(borderRadius.bottomRight, const RadiusDto.circular(radius));
        expect(borderRadius.topStart, null);
        expect(borderRadius.topEnd, null);
        expect(borderRadius.bottomStart, null);
        expect(borderRadius.bottomEnd, null);
      });

      test('squared creates BorderRadiusAttribute with zero radius', () {
        final borderRadius = squared();

        expect(borderRadius.topLeft, const RadiusDto.zero());
        expect(borderRadius.topRight, const RadiusDto.zero());
        expect(borderRadius.bottomLeft, const RadiusDto.zero());
        expect(borderRadius.bottomRight, const RadiusDto.zero());
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
          const RadiusDto.circular(topLeftRadius),
        );
        expect(
          borderRadius.topRight,
          const RadiusDto.circular(topRightRadius),
        );
        expect(
          borderRadius.bottomLeft,
          const RadiusDto.circular(bottomLeftRadius),
        );
        expect(
          borderRadius.bottomRight,
          const RadiusDto.circular(bottomRightRadius),
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
          const RadiusDto.circular(topStartRadius),
        );
        expect(
          borderRadius.topEnd,
          const RadiusDto.circular(topEndRadius),
        );
        expect(
          borderRadius.bottomStart,
          const RadiusDto.circular(bottomStartRadius),
        );
        expect(
          borderRadius.bottomEnd,
          const RadiusDto.circular(bottomEndRadius),
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
          const RadiusDto.circular(leftRadius),
        );
        expect(
          borderRadius.topRight,
          const RadiusDto.circular(rightRadius),
        );
        expect(
          borderRadius.bottomLeft,
          const RadiusDto.circular(leftRadius),
        );
        expect(
          borderRadius.bottomRight,
          const RadiusDto.circular(rightRadius),
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
          const RadiusDto.circular(startRadius),
        );
        expect(
          borderRadius.topEnd,
          const RadiusDto.circular(endRadius),
        );
        expect(
          borderRadius.bottomStart,
          const RadiusDto.circular(startRadius),
        );
        expect(
          borderRadius.bottomEnd,
          const RadiusDto.circular(endRadius),
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
          const RadiusDto.circular(topRadius),
        );
        expect(
          borderRadius.topRight,
          const RadiusDto.circular(topRadius),
        );
        expect(
          borderRadius.bottomLeft,
          const RadiusDto.circular(bottomRadius),
        );
        expect(
          borderRadius.bottomRight,
          const RadiusDto.circular(bottomRadius),
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
          const RadiusDto.circular(topRadius),
        );
        expect(
          borderRadius.topEnd,
          const RadiusDto.circular(topRadius),
        );
        expect(
          borderRadius.bottomStart,
          const RadiusDto.circular(bottomRadius),
        );
        expect(
          borderRadius.bottomEnd,
          const RadiusDto.circular(bottomRadius),
        );
      });
    });
  });
}
