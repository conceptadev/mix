// Import necessary packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

void main() {
  group('TextStyleAttribute', () {
    test('textStyle creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final purplePaint = Paint()..color = Colors.purple;
      final textStyleAttribute = textStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 16.0,
        letterSpacing: 1.0,
        wordSpacing: 2.0,
        textBaseline: TextBaseline.ideographic,
        shadows: [
          const Shadow(
            blurRadius: 1.0,
            color: Colors.black,
            offset: Offset(1.0, 1.0),
          ),
        ],
        color: Colors.red,
        backgroundColor: Colors.blue,
        fontFeatures: [const FontFeature.alternative(4)],
        decoration: TextDecoration.underline,
        decorationColor: Colors.green,
        decorationStyle: TextDecorationStyle.dashed,
        foreground: yellowPaint,
        background: purplePaint,
        debugLabel: 'debugLabel',
        locale: const Locale('en', 'US'),
        height: 2.0,
      );

      expect(textStyleAttribute.fontWeight, FontWeight.bold);
      expect(textStyleAttribute.fontStyle, FontStyle.italic);
      expect(textStyleAttribute.fontSize, 16.0);
      expect(textStyleAttribute.letterSpacing, 1.0);
      expect(textStyleAttribute.wordSpacing, 2.0);
      expect(textStyleAttribute.textBaseline, TextBaseline.ideographic);
      expect(textStyleAttribute.shadows?.length, 1);
      expect(textStyleAttribute.shadows?.first.blurRadius, 1.0);
      expect(textStyleAttribute.shadows?.first.color?.value, Colors.black);
      expect(textStyleAttribute.shadows?.first.offset, const Offset(1.0, 1.0));
      expect(textStyleAttribute.color?.value, Colors.red);
      expect(textStyleAttribute.backgroundColor?.value, Colors.blue);
      expect(textStyleAttribute.fontFeatures?.length, 1);
      expect(
        textStyleAttribute.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
      expect(textStyleAttribute.decoration, TextDecoration.underline);
      expect(textStyleAttribute.decorationColor?.value, Colors.green);
      expect(textStyleAttribute.decorationStyle, TextDecorationStyle.dashed);
      expect(textStyleAttribute.foreground, yellowPaint);
      expect(textStyleAttribute.background, purplePaint);
      expect(textStyleAttribute.debugLabel, 'debugLabel');
      expect(textStyleAttribute.locale, const Locale('en', 'US'));
      expect(textStyleAttribute.height, 2.0);
    });

    test('bold returns TextStyleAttribute with FontWeight.bold', () {
      final textStyleAttribute = bold();

      expect(textStyleAttribute.fontWeight, FontWeight.bold);
    });

    test('italic returns TextStyleAttribute with FontStyle.italic', () {
      final textStyleAttribute = italic();

      expect(textStyleAttribute.fontStyle, FontStyle.italic);
    });

    // textDirective
    test('textDirective returns TextStyleAttribute with TextDirective', () {
      final textStyleAttribute = textDirective(const UppercaseDirective());

      expect(textStyleAttribute.value, [const UppercaseDirective()]);
      expect(textStyleAttribute.value.first, const UppercaseDirective());
      expect(textStyleAttribute.value.first.runtimeType, UppercaseDirective);
    });
  });
}
