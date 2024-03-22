// Import necessary packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('TextStyleUtility', () {
    const textStyle = TextStyleUtility(UtilityTestAttribute.new);
    test('call() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final purplePaint = Paint()..color = Colors.purple;
      final attr = textStyle(
        backgroundColor: Colors.blue,
        color: Colors.red,
        debugLabel: 'debugLabel',
        decoration: TextDecoration.underline,
        decorationColor: Colors.green,
        decorationStyle: TextDecorationStyle.dashed,
        fontFamily: 'Roboto',
        fontFeatures: [const FontFeature.alternative(4)],
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        height: 2.0,
        letterSpacing: 1.0,
        locale: const Locale('en', 'US'),
        shadows: [
          const Shadow(
            color: Colors.black,
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
        textBaseline: TextBaseline.ideographic,
        wordSpacing: 2.0,
      );

      final attrWithPaint = textStyle(
        background: purplePaint,
        foreground: yellowPaint,
      );

      final resolvedValue = attr.value.resolve(EmptyMixData);
      final resolvedWithPaint = attrWithPaint.value.resolve(EmptyMixData);

      expect(resolvedValue.fontWeight, FontWeight.bold);
      expect(resolvedValue.fontStyle, FontStyle.italic);
      expect(resolvedValue.fontSize, 16.0);
      expect(resolvedValue.letterSpacing, 1.0);
      expect(resolvedValue.wordSpacing, 2.0);
      expect(resolvedValue.textBaseline, TextBaseline.ideographic);
      expect(resolvedValue.shadows?.length, 1);
      expect(resolvedValue.shadows?.first.blurRadius, 1.0);
      expect(resolvedValue.shadows?.first.color, Colors.black);
      expect(resolvedValue.shadows?.first.offset, const Offset(1.0, 1.0));
      expect(resolvedValue.color, Colors.red);
      expect(resolvedValue.backgroundColor, Colors.blue);
      expect(resolvedValue.fontFeatures?.length, 1);
      expect(
        resolvedValue.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
      expect(resolvedValue.decoration, TextDecoration.underline);
      expect(resolvedValue.decorationColor, Colors.green);
      expect(resolvedValue.decorationStyle, TextDecorationStyle.dashed);
      // expect(textStyleAttribute.value.foreground, yellowPaint);
      // expect(textStyleAttribute.value.background, purplePaint);
      expect(resolvedValue.debugLabel, 'debugLabel');
      expect(resolvedValue.locale, const Locale('en', 'US'));
      expect(resolvedValue.height, 2.0);
      expect(resolvedWithPaint.foreground, yellowPaint);
      expect(resolvedWithPaint.background, purplePaint);
    });

    test('color() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle(color: Colors.red);
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.color, Colors.red);
    });

    test('backgroundColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle(backgroundColor: Colors.blue);
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.backgroundColor, Colors.blue);
    });

    test('fontFamily() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle(fontFamily: 'Roboto');
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.fontFamily, 'Roboto');
    });

    test('fontSize() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle(fontSize: 16.0);
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.fontSize, 16.0);
    });

    test('fontWeight() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontWeight.bold();
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.fontWeight, FontWeight.bold);
    });

    test('fontStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontStyle.italic();
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.fontStyle, FontStyle.italic);
    });

    test('letterSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle(letterSpacing: 1.0);
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.letterSpacing, 1.0);
    });

    test('wordSpacing() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle(wordSpacing: 2.0);
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.wordSpacing, 2.0);
    });

    test('textBaseline() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.textBaseline.ideographic();
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.textBaseline, TextBaseline.ideographic);
    });

    test('shadows() creates TextStyleAttribute correctly', () {
      const shadow = Shadow(
        color: Colors.black,
        offset: Offset(1.0, 1.0),
        blurRadius: 1.0,
      );
      final attribute = textStyle.shadow(
        blurRadius: 1.0,
        color: Colors.black,
        offset: const Offset(1.0, 1.0),
      );

      final resolved = attribute.value.resolve(EmptyMixData);

      expect(resolved.shadows?.length, 1);
      expect(resolved.shadows?.first.blurRadius, 1.0);
      expect(resolved.shadows?.first.color, Colors.black);
      expect(resolved.shadows?.first.offset, const Offset(1.0, 1.0));
      expect(resolved.shadows?.first, shadow);
    });

    test('fontFeatures() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.fontFeatures([
        const FontFeature.alternative(4),
      ]);

      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.fontFeatures?.length, 1);
      expect(
        resolvedValue.fontFeatures?.first,
        const FontFeature.alternative(4),
      );
    });

    test('decoration() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.decoration.underline();

      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.decoration, TextDecoration.underline);
    });

    test('decorationColor() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle(decorationColor: Colors.green);
      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.decorationColor, Colors.green);
    });

    test('decorationStyle() creates TextStyleAttribute correctly', () {
      final textStyleAttribute = textStyle.decorationStyle.dashed();

      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.decorationStyle, TextDecorationStyle.dashed);
    });

    test('foreground() creates TextStyleAttribute correctly', () {
      final yellowPaint = Paint()..color = Colors.yellow;
      final textStyleAttribute = textStyle.foreground(yellowPaint);

      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.foreground, yellowPaint);
    });

    test('background() creates TextStyleAttribute correctly', () {
      final purplePaint = Paint()..color = Colors.purple;
      final textStyleAttribute = textStyle.background(purplePaint);

      final resolvedValue = textStyleAttribute.value.resolve(EmptyMixData);

      expect(resolvedValue.background, purplePaint);
    });
  });
}
