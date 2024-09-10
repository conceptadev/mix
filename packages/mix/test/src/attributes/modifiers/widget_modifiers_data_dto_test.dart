import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/modifiers/internal/cleaner_modifier.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('WidgetModifiersDataDto', () {
    test('merge combines two WidgetModifiersDataDto instances correctly', () {
      final dto1 = WidgetModifiersDataDto([
        TransformModifierSpecAttribute(transform: Matrix4.identity()),
      ]);
      const dto2 = WidgetModifiersDataDto([
        OpacityModifierSpecAttribute(opacity: 0.5),
      ]);

      final merged = dto1.merge(dto2);

      expect(merged.value.length, 2);
      expect(
        merged.value[0].resolve(EmptyMixData),
        TransformModifierSpec(transform: Matrix4.identity()),
      );
      expect(
        merged.value[1].resolve(EmptyMixData),
        const OpacityModifierSpec(0.5),
      );
    });

    test('merge with cleaner removes previous modifiers ', () {
      final dto1 = WidgetModifiersDataDto([
        TransformModifierSpecAttribute(transform: Matrix4.identity()),
      ]);

      final cleaner = WidgetModifiersDataDto([
        CleanerModifierSpecAttribute(),
      ]);

      const dto2 = WidgetModifiersDataDto([
        OpacityModifierSpecAttribute(opacity: 0.5),
      ]);

      final merged = dto1.merge(cleaner).merge(dto2);

      expect(merged.value.length, 2);

      expect(
        merged.value[0].resolve(EmptyMixData),
        const CleanerModifierSpec(),
      );
      expect(
        merged.value[1].resolve(EmptyMixData),
        const OpacityModifierSpec(0.5),
      );
    });

    test('merge returns the same instance when other is null', () {
      final dto = WidgetModifiersDataDto([
        TransformModifierSpecAttribute(transform: Matrix4.identity()),
      ]);

      final merged = dto.merge(null);

      expect(identical(merged, dto), true);
    });

    test('resolve creates WidgetModifiersData with resolved modifiers', () {
      final dto = WidgetModifiersDataDto([
        TransformModifierSpecAttribute(transform: Matrix4.identity()),
        const OpacityModifierSpecAttribute(opacity: 0.5),
      ]);

      final resolved = dto.resolve(EmptyMixData);

      expect(resolved.value.length, 2);
      expect(
        resolved.value[0],
        TransformModifierSpec(transform: Matrix4.identity()),
      );
      expect(
        resolved.value[1],
        const OpacityModifierSpec(0.5),
      );
    });

    test('defaultValue returns empty WidgetModifiersData', () {
      const dto = WidgetModifiersDataDto([]);

      expect(dto.defaultValue.value, isEmpty);
    });

    test('props returns list containing value', () {
      final List<WidgetModifierSpecAttribute> modifiers = [
        TransformModifierSpecAttribute(transform: Matrix4.identity()),
        const OpacityModifierSpecAttribute(opacity: 0.5),
      ];
      final dto = WidgetModifiersDataDto(modifiers);

      expect(dto.props, [modifiers]);
    });
  });
}
