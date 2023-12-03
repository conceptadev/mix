import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/constraints/constraints_dto.dart';

import '../../../helpers/attribute_generator.dart';
import '../../../helpers/testing_utils.dart';

void main() {
  group('BoxConstraintsAttribute', () {
    final constraints = RandomGenerator.boxConstraints();
    final boxConstraintsDto = BoxConstraintsDto.from(constraints);
    test('constructor should set the value correctly', () {
      final attribute = BoxConstraintsAttribute(boxConstraintsDto);

      expect(attribute.value, isA<BoxConstraintsDto>());
      expect(attribute.value, equals(boxConstraintsDto));
    });

    test('merge should return the same attribute if other is null', () {
      final attribute = BoxConstraintsAttribute(boxConstraintsDto);
      final mergedAttribute = attribute.merge(null);

      expect(mergedAttribute, equals(attribute));
    });

    test('merge should return the same attribute if value types are different',
        () {
      const constraints1 = BoxConstraintsDto(minWidth: 50, minHeight: 100);
      const constraints2 = BoxConstraintsDto(minWidth: 100, minHeight: 200);
      const attribute1 = BoxConstraintsAttribute(constraints1);
      const attribute2 = BoxConstraintsAttribute(constraints2);
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute, equals(attribute2));
    });

    test('merge should return a new attribute with merged value', () {
      final constraints1 =
          BoxConstraintsDto.from(RandomGenerator.boxConstraints());
      final constraints2 =
          BoxConstraintsDto.from(RandomGenerator.boxConstraints());

      final attribute1 = BoxConstraintsAttribute(constraints1);
      final attribute2 = BoxConstraintsAttribute(constraints2);
      final mergedAttribute = attribute1.merge(attribute2);

      expect(mergedAttribute.value, equals(constraints1.merge(constraints2)));
    });

    test('resolve should return the constraints value', () {
      const constraints = BoxConstraintsDto(
          minWidth: 50, minHeight: 100, maxWidth: 100, maxHeight: 200);
      const attribute = BoxConstraintsAttribute(constraints);

      final resolvedConstraints = attribute.resolve(EmptyMixData);

      expect(resolvedConstraints.minWidth, 50);
      expect(resolvedConstraints.minHeight, 100);
      expect(resolvedConstraints.maxWidth, 100);
      expect(resolvedConstraints.maxHeight, 200);
    });

    testWidgets('build', (widgetTester) async {
      const constraints = BoxConstraintsDto(minWidth: 50, minHeight: 100);
      const attribute = BoxConstraintsAttribute(constraints);
      final widget = attribute.build(EmptyMixData, Container());

      await widgetTester.pumpMaterialApp(widget);

      final finder = find.byWidget(widget);

      final constrainedBox = widgetTester.widget<ConstrainedBox>(finder);

      final boxConstraints = constrainedBox.constraints;

      expect(boxConstraints, isA<BoxConstraints>());
      expect(boxConstraints.minWidth, 50);
      expect(boxConstraints.minHeight, 100);
    });
  });
}
