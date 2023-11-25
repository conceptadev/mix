import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('PaddingAttribute', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      const padding = PaddingAttribute(top: 10, bottom: 5, left: 3, right: 7);

      expect(padding.top, 10);
      expect(padding.bottom, 5);
      expect(padding.left, 3);
      expect(padding.right, 7);
      expect(padding.start, null);
      expect(padding.end, null);
    });

    test('constructs correctly with no properties', () {
      const padding = PaddingAttribute();
      expect(padding.top, null);
      expect(padding.bottom, null);
      expect(padding.left, null);
      expect(padding.right, null);
      expect(padding.start, null);
      expect(padding.end, null);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      const padding1 = PaddingAttribute(top: 10, bottom: 5);

      const padding2 = PaddingAttribute(left: 3, right: 7);

      final merged = padding1.merge(padding2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.left, 3);
      expect(merged.right, 7);
    });

    test('merge returns itself if other is null', () {
      const padding = PaddingAttribute(top: 10, bottom: 5);
      final merged = padding.merge(null);

      expect(merged, equals(padding));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsets', () {
      const padding =
          EdgeInsetsAttribute(top: 10, bottom: 5, left: 3, right: 7);

      final resolvedValue = padding.resolve(EmptyMixData);

      expect(resolvedValue,
          equals(const EdgeInsets.only(top: 10, bottom: 5, left: 3, right: 7)));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      const padding1 = PaddingAttribute(top: 10, bottom: 5);

      const padding2 = PaddingAttribute(top: 10, bottom: 5);

      expect(padding1, equals(padding2));
    });

    test('equality fails when properties are different', () {
      const padding1 = PaddingAttribute(top: 10, bottom: 5);
      const padding2 = PaddingAttribute(top: 5, bottom: 10);

      expect(padding1, isNot(equals(padding2)));
    });
  });

  group('PaddingAttribute Directional', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      const padding = PaddingAttribute(top: 10, bottom: 5, start: 3, end: 7);

      expect(padding.top, 10);
      expect(padding.bottom, 5);
      expect(padding.start, 3);
      expect(padding.end, 7);
    });
    test('constructs correctly with no properties', () {
      const padding = PaddingAttribute();
      expect(padding.top, isNull);
      expect(padding.bottom, isNull);
      expect(padding.start, isNull);
      expect(padding.end, isNull);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      const padding1 = PaddingAttribute(top: 10, bottom: 5);

      const padding2 = PaddingAttribute(start: 3, end: 7);

      final merged = padding1.merge(padding2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.end, 7);
      expect(merged.start, 3);
    });

    test('merge returns itself if other is null', () {
      const padding = PaddingAttribute(top: 10, bottom: 5);
      final merged = padding.merge(null);

      expect(merged, equals(padding));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsetsDirectional', () {
      const padding = PaddingAttribute(top: 10, bottom: 5, start: 3, end: 7);

      final resolvedValue = padding.resolve(EmptyMixData);

      expect(
          resolvedValue,
          equals(const EdgeInsetsDirectional.only(
              top: 10, bottom: 5, start: 3, end: 7)));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      const padding1 = PaddingAttribute(top: 10, bottom: 5);
      const padding2 = PaddingAttribute(top: 10, bottom: 5);

      expect(padding1, equals(padding2));
    });

    test('equality fails when properties are different', () {
      const padding1 = PaddingAttribute(top: 10, bottom: 5);

      const padding2 = PaddingAttribute(top: 5, bottom: 10);

      expect(padding1, isNot(equals(padding2)));
    });
  });
}
