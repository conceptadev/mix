import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('PaddingAttribute', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      const edgeInsets = EdgeInsetsDto(top: 10, bottom: 5, left: 3, right: 7);
      const padding = PaddingAttribute(edgeInsets);
      expect(padding.value.top, 10);
      expect(padding.value.bottom, 5);
      expect(padding.value.left, 3);
      expect(padding.value.right, 7);
    });

    test('constructs correctly with no properties', () {
      const padding = PaddingAttribute(EdgeInsetsDto());
      expect(padding.value.top, null);
      expect(padding.value.bottom, null);
      expect(padding.value.left, null);
      expect(padding.value.right, null);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      const padding1 = PaddingAttribute(EdgeInsetsDto(top: 10, bottom: 5));

      const padding2 = PaddingAttribute(EdgeInsetsDto(left: 3, right: 7));

      final merged = padding1.merge(padding2);

      expect(merged.value.top, 10);
      expect(merged.value.bottom, 5);
      expect(merged.value.left, 3);
      expect(merged.value.right, 7);
    });

    test('merge returns itself if other is null', () {
      const padding = PaddingAttribute(EdgeInsetsDto(top: 10, bottom: 5));
      final merged = padding.merge(null);

      expect(merged, equals(padding));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsets', () {
      const padding = PaddingAttribute(
          EdgeInsetsDto(top: 10, bottom: 5, left: 3, right: 7));

      final resolvedValue = padding.resolve(EmptyMixData);

      expect(resolvedValue,
          equals(const EdgeInsets.only(top: 10, bottom: 5, left: 3, right: 7)));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      const padding1 = PaddingAttribute(EdgeInsetsDto(top: 10, bottom: 5));

      const padding2 = PaddingAttribute(EdgeInsetsDto(top: 10, bottom: 5));

      expect(padding1, equals(padding2));
    });

    test('equality fails when properties are different', () {
      const padding1 = PaddingAttribute(EdgeInsetsDto(top: 10, bottom: 5));
      const padding2 = PaddingAttribute(EdgeInsetsDto(top: 5, bottom: 10));

      expect(padding1, isNot(equals(padding2)));
    });
  });

  group('PaddingAttribute Directional', () {
    // Constructor Tests
    test('constructs correctly with all properties', () {
      const padding = PaddingAttribute(
          EdgeInsetsDirectionalDto(top: 10, bottom: 5, start: 3, end: 7));

      expect(padding.value.top, 10);
      expect(padding.value.bottom, 5);
      expect(padding.value.start, 3);
      expect(padding.value.end, 7);
    });
    test('constructs correctly with no properties', () {
      const padding = PaddingAttribute(EdgeInsetsDirectionalDto());
      expect(padding.value.top, isNull);
      expect(padding.value.bottom, isNull);
      expect(padding.value.start, isNull);
      expect(padding.value.end, isNull);
    });

    // Merge Function Tests
    test('merge function merges correctly', () {
      const padding1 =
          PaddingAttribute(EdgeInsetsDirectionalDto(top: 10, bottom: 5));

      const padding2 =
          PaddingAttribute(EdgeInsetsDirectionalDto(start: 3, end: 7));

      final merged = padding1.merge(padding2);

      expect(merged.value.top, 10);
      expect(merged.value.bottom, 5);
      expect(merged.value.start, 3);
      expect(merged.value.end, 7);
    });

    test('merge returns itself if other is null', () {
      const padding =
          PaddingAttribute(EdgeInsetsDirectionalDto(top: 10, bottom: 5));
      final merged = padding.merge(null);

      expect(merged, equals(padding));
    });

    // Resolve Function Tests
    // Assuming a mock for MixData and its resolver
    test('resolve function returns correct EdgeInsetsDirectional', () {
      const padding = PaddingAttribute(
          EdgeInsetsDirectionalDto(top: 10, bottom: 5, start: 3, end: 7));

      final resolvedValue = padding.resolve(EmptyMixData);

      expect(
          resolvedValue,
          equals(const EdgeInsetsDirectional.only(
              top: 10, bottom: 5, start: 3, end: 7)));
    });

    // Equality Tests
    test('equality holds when properties are the same', () {
      const padding1 =
          PaddingAttribute(EdgeInsetsDirectionalDto(top: 10, bottom: 5));
      const padding2 =
          PaddingAttribute(EdgeInsetsDirectionalDto(top: 10, bottom: 5));

      expect(padding1, equals(padding2));
    });

    test('equality fails when properties are different', () {
      const padding1 =
          PaddingAttribute(EdgeInsetsDirectionalDto(top: 10, bottom: 5));

      const padding2 =
          PaddingAttribute(EdgeInsetsDirectionalDto(top: 5, bottom: 10));

      expect(padding1, isNot(equals(padding2)));
    });
  });
}
