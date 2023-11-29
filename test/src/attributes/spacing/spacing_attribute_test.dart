import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('PaddingAttribute', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      final padding =
          PaddingAttribute.only(top: 10, bottom: 5, left: 3, right: 7);

      expect(padding.top, 10);
      expect(padding.bottom, 5);
      expect(padding.left, 3);
      expect(padding.right, 7);
      expect(padding.start, null);
      expect(padding.end, null);
    });

    test('constructs correctly with no properties', () {
      final padding = PaddingAttribute.only();
      expect(padding.top, null);
      expect(padding.bottom, null);
      expect(padding.left, null);
      expect(padding.right, null);
      expect(padding.start, null);
      expect(padding.end, null);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      final padding1 = PaddingAttribute.only(top: 10, bottom: 5);

      final padding2 = PaddingAttribute.only(left: 3, right: 7);

      final merged = padding1.merge(padding2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.left, 3);
      expect(merged.right, 7);
    });

    test('merge returns itself if other is null', () {
      final padding = PaddingAttribute.only(top: 10, bottom: 5);
      final merged = padding.merge(null);

      expect(merged, equals(padding));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      final padding1 = PaddingAttribute.only(top: 10, bottom: 5);

      final padding2 = PaddingAttribute.only(top: 10, bottom: 5);

      expect(padding1, equals(padding2));
    });

    test('equality fails when properties are different', () {
      final padding1 = PaddingAttribute.only(top: 10, bottom: 5);
      final padding2 = PaddingAttribute.only(top: 5, bottom: 10);

      expect(padding1, isNot(equals(padding2)));
    });
  });

  group('PaddingAttribute Directional', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      final padding =
          PaddingAttribute.only(top: 10, bottom: 5, start: 3, end: 7);

      expect(padding.top, 10);
      expect(padding.bottom, 5);
      expect(padding.start, 3);
      expect(padding.end, 7);
    });
    test('constructs correctly with no properties', () {
      final padding = PaddingAttribute.only();
      expect(padding.top, isNull);
      expect(padding.bottom, isNull);
      expect(padding.start, isNull);
      expect(padding.end, isNull);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      final padding1 = PaddingAttribute.only(top: 10, bottom: 5);

      final padding2 = PaddingAttribute.only(start: 3, end: 7);

      final merged = padding1.merge(padding2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.end, 7);
      expect(merged.start, 3);
    });

    test('merge returns itself if other is null', () {
      final padding = PaddingAttribute.only(top: 10, bottom: 5);
      final merged = padding.merge(null);

      expect(merged, equals(padding));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsetsDirectional', () {
      final padding =
          PaddingAttribute.only(top: 10, bottom: 5, start: 3, end: 7);

      final resolvedValue = padding.resolve(EmptyMixData);

      expect(
        resolvedValue,
        equals(
          const EdgeInsetsDirectional.only(
              top: 10, bottom: 5, start: 3, end: 7),
        ),
      );
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      final padding1 = PaddingAttribute.only(top: 10, bottom: 5);
      final padding2 = PaddingAttribute.only(top: 10, bottom: 5);

      expect(padding1, equals(padding2));
    });

    test('equality fails when properties are different', () {
      final padding1 = PaddingAttribute.only(top: 10, bottom: 5);

      final padding2 = PaddingAttribute.only(top: 5, bottom: 10);

      expect(padding1, isNot(equals(padding2)));
    });
  });

  // MarginAttribute
  group('MarginAttribute', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      final margin =
          MarginAttribute.only(top: 10, bottom: 5, left: 3, right: 7);

      expect(margin.top, 10);
      expect(margin.bottom, 5);
      expect(margin.left, 3);
      expect(margin.right, 7);
      expect(margin.start, null);
      expect(margin.end, null);
    });

    test('constructs correctly with no properties', () {
      final margin = MarginAttribute.only();
      expect(margin.top, null);
      expect(margin.bottom, null);
      expect(margin.left, null);
      expect(margin.right, null);
      expect(margin.start, null);
      expect(margin.end, null);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      final margin1 = MarginAttribute.only(top: 10, bottom: 5);

      final margin2 = MarginAttribute.only(left: 3, right: 7);

      final merged = margin1.merge(margin2);

      expect(merged.top, 10);
      expect(merged.bottom, 5);
      expect(merged.left, 3);
      expect(merged.right, 7);
    });

    test('merge returns itself if other is null', () {
      final margin = MarginAttribute.only(top: 10, bottom: 5);
      final merged = margin.merge(null);

      expect(merged, equals(margin));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsets', () {
      final margin =
          MarginAttribute.only(top: 10, bottom: 5, left: 3, right: 7);

      final resolvedValue = margin.resolve(EmptyMixData);

      expect(
        resolvedValue,
        equals(
          const EdgeInsets.only(top: 10, bottom: 5, left: 3, right: 7),
        ),
      );
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      final margin1 = MarginAttribute.only(top: 10, bottom: 5);

      final margin2 = MarginAttribute.only(top: 10, bottom: 5);

      expect(margin1, equals(margin2));
    });

    test(' equality fails when properties are different', () {
      final margin1 = MarginAttribute.only(top: 10, bottom: 5);

      final margin2 = MarginAttribute.only(top: 5, bottom: 10);

      expect(margin1, isNot(equals(margin2)));
    });

    // Directional MarginAttribute
    test('constructs correctly with all properties', () {
      final margin = MarginAttribute.only(top: 10, bottom: 5, start: 3, end: 7);

      expect(margin.top, 10);
      expect(margin.bottom, 5);
      expect(margin.start, 3);
      expect(margin.end, 7);
    });
  });
}
