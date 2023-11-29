import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
// Assuming BoxDecorationUtility is part of a library that needs to be tested
  const boxDecoration = BoxDecorationUtility.selfBuilder;
  group('BoxDecorationUtility', () {
    test('color setting', () {
      final result = boxDecoration.color(Colors.red);
      expect(result.color, equals(Colors.red.toDto()));
    });

    test('shape setting', () {
      final result = boxDecoration.shape.circle();
      expect(result.shape, equals(BoxShape.circle));
    });

    test('border setting', () {
      final result = boxDecoration.border.all(color: Colors.red, width: 2.0);
      expect(result.border?.resolve(EmptyMixData),
          equals(Border.all(color: Colors.red, width: 2.0)));
    });

    test('borderRadius setting', () {
      final result = boxDecoration.borderRadius(10.0);
      expect(result.borderRadius?.resolve(EmptyMixData),
          equals(BorderRadius.circular(10.0)));
    });

    test('gradient setting', () {
      const gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.red, Colors.blue],
      );
      final result = boxDecoration.gradient.from(gradient);
      expect(result.gradient, equals(gradient.toAttribute()));
    });

    test('boxShadow setting', () {
      final boxShadow = [
        const BoxShadow(
          color: Colors.black,
          blurRadius: 10.0,
          offset: Offset(5.0, 5.0),
        )
      ];
      final result = boxDecoration.boxShadow(boxShadow);
      expect(result.boxShadow, equals(boxShadow.toAttribute()));
    });

    test('elevation setting', () {
      final result = boxDecoration.elevation(9);
      final boxShadows = result.boxShadow?.map((e) => e.resolve(EmptyMixData));
      expect(boxShadows, equals(kElevationToShadow[9]!));
    });
  });
}
