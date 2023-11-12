import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/space_attribute.dart';

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
    });

    test('constructs correctly with no properties', () {
      const padding = PaddingAttribute();
      expect(padding.top, null);
      expect(padding.bottom, null);
      expect(padding.left, null);
      expect(padding.right, null);
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
      const padding = PaddingAttribute(top: 10, bottom: 5, left: 3, right: 7);

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

  group('PaddingDirectionalAttribute', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      const padding =
          PaddingDirectionalAttribute(top: 10, bottom: 5, start: 3, end: 7);
      expect(padding.top, 10);
      expect(padding.bottom, 5);
      expect(padding.start, 3);
      expect(padding.end, 7);
    });

    test('constructs correctly with no properties', () {
      const padding = PaddingDirectionalAttribute();
      expect(padding.top, null);
      expect(padding.bottom, null);
      expect(padding.start, null);
      expect(padding.end, null);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      const padding1 = PaddingDirectionalAttribute(top: 10, bottom: 5);
      const padding2 = PaddingDirectionalAttribute(start: 3, end: 7);

      final merged = padding1.merge(padding2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.start, 3);
      expect(merged.end, 7);
    });

    test('merge returns itself if other is null', () {
      const padding = PaddingDirectionalAttribute(top: 10, bottom: 5);
      final merged = padding.merge(null);

      expect(merged, equals(padding));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsetsDirectional', () {
      const padding =
          PaddingDirectionalAttribute(top: 10, bottom: 5, start: 3, end: 7);

      final resolvedValue = padding.resolve(EmptyMixData);

      expect(
          resolvedValue,
          equals(const EdgeInsetsDirectional.only(
              top: 10, bottom: 5, start: 3, end: 7)));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      const padding1 = PaddingDirectionalAttribute(top: 10, bottom: 5);
      const padding2 = PaddingDirectionalAttribute(top: 10, bottom: 5);

      expect(padding1, equals(padding2));
    });

    test('equality fails when properties are different', () {
      const padding1 = PaddingDirectionalAttribute(top: 10, bottom: 5);
      const padding2 = PaddingDirectionalAttribute(top: 5, bottom: 10);

      expect(padding1, isNot(equals(padding2)));
    });
  });
  group('MarginAttribute', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      const margin = MarginAttribute(top: 10, bottom: 5, left: 3, right: 7);
      expect(margin.top, 10);
      expect(margin.bottom, 5);
      expect(margin.left, 3);
      expect(margin.right, 7);
    });

    test('constructs correctly with no properties', () {
      const margin = MarginAttribute();
      expect(margin.top, null);
      expect(margin.bottom, null);
      expect(margin.left, null);
      expect(margin.right, null);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      const margin1 = MarginAttribute(top: 10, bottom: 5);
      const margin2 = MarginAttribute(left: 3, right: 7);

      final merged = margin1.merge(margin2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.left, 3);
      expect(merged.right, 7);
    });

    test('merge returns itself if other is null', () {
      const margin = MarginAttribute(top: 10, bottom: 5);
      final merged = margin.merge(null);

      expect(merged, equals(margin));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsets', () {
      const margin = MarginAttribute(top: 10, bottom: 5, left: 3, right: 7);

      final resolvedValue = margin.resolve(EmptyMixData);

      expect(resolvedValue,
          equals(const EdgeInsets.only(top: 10, bottom: 5, left: 3, right: 7)));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      const margin1 = MarginAttribute(top: 10, bottom: 5);
      const margin2 = MarginAttribute(top: 10, bottom: 5);

      expect(margin1, equals(margin2));
    });

    test('equality fails when properties are different', () {
      const margin1 = MarginAttribute(top: 10, bottom: 5);
      const margin2 = MarginAttribute(top: 5, bottom: 10);

      expect(margin1, isNot(equals(margin2)));
    });
  });

  group('MarginDirectionalAttribute', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      const margin =
          MarginDirectionalAttribute(top: 10, bottom: 5, start: 3, end: 7);
      expect(margin.top, 10);
      expect(margin.bottom, 5);
      expect(margin.start, 3);
      expect(margin.end, 7);
    });

    test('constructs correctly with no properties', () {
      const margin = MarginDirectionalAttribute();
      expect(margin.top, null);
      expect(margin.bottom, null);
      expect(margin.start, null);
      expect(margin.end, null);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      const margin1 = MarginDirectionalAttribute(top: 10, bottom: 5);
      const margin2 = MarginDirectionalAttribute(start: 3, end: 7);

      final merged = margin1.merge(margin2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.start, 3);
      expect(merged.end, 7);
    });

    test('merge returns itself if other is null', () {
      const margin = MarginDirectionalAttribute(top: 10, bottom: 5);
      final merged = margin.merge(null);

      expect(merged, equals(margin));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsetsDirectional', () {
      const margin =
          MarginDirectionalAttribute(top: 10, bottom: 5, start: 3, end: 7);

      final resolvedValue = margin.resolve(EmptyMixData);

      expect(
          resolvedValue,
          equals(const EdgeInsetsDirectional.only(
              top: 10, bottom: 5, start: 3, end: 7)));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      const margin1 = MarginDirectionalAttribute(top: 10, bottom: 5);
      const margin2 = MarginDirectionalAttribute(top: 10, bottom: 5);

      expect(margin1, equals(margin2));
    });

    test('equality fails when properties are different', () {
      const margin1 = MarginDirectionalAttribute(top: 10, bottom: 5);
      const margin2 = MarginDirectionalAttribute(top: 5, bottom: 10);

      expect(margin1, isNot(equals(margin2)));
    });
  });
}
