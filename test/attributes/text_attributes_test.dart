import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/widgets/text/text.attributes.dart';

import '../helpers/random_dto.dart';

void main() {
  group('TextAttributes', () {
    test('Test merge method', () {
      final ta1 = RandomGenerator.textAttributes();

      const ta2 = StyledTextAttributes(
        textAlign: TextAlign.right,
        maxLines: 3,
        strutStyle: StrutStyle(forceStrutHeight: true),
      );

      final merged = ta1.merge(ta2);

      expect(merged.textAlign, TextAlign.right);
      expect(merged.maxLines, 3);
      expect(merged.strutStyle?.forceStrutHeight, true);
    });

    test('Test copyWith method', () {
      const ta1 = StyledTextAttributes(
        textAlign: TextAlign.left,
        maxLines: 2,
      );

      final ta2 = ta1.copyWith(
        textAlign: TextAlign.right,
        maxLines: 3,
        strutStyle: const StrutStyle(forceStrutHeight: true),
      );

      expect(ta2.textAlign, TextAlign.right);
      expect(ta2.maxLines, 3);
      expect(ta2.strutStyle?.forceStrutHeight, true);

      // Ensure original object properties remain unchanged
      expect(ta1.textAlign, TextAlign.left);
      expect(ta1.maxLines, 2);
      expect(ta1.strutStyle, null);
    });

    test('Test merge method with null values', () {
      const ta1 = StyledTextAttributes(
        textAlign: TextAlign.left,
        maxLines: 2,
      );

      const ta2 = StyledTextAttributes(
        textAlign: null,
        maxLines: 3,
        textScaleFactor: 2,
      );

      var merged = ta1.merge(ta2);

      expect(merged.textAlign, TextAlign.left);
      expect(merged.maxLines, 3);
      expect(merged.textScaleFactor, 2);

      merged = ta2.merge(ta1);

      expect(merged.textAlign, TextAlign.left);
      expect(merged.maxLines, 2);
      expect(merged.textScaleFactor, 2);
    });
  });
}
