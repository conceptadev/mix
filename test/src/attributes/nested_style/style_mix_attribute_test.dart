import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/nested_style/nested_style_attribute.dart';
import 'package:mix/src/factory/style_mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('NestedStyleAttribute', () {
    test('should create an instance with the provided value', () {
      // Arrange
      final styleMix = Style(
        const MockIntScalarAttribute(1),
        const MockIntScalarAttribute(2),
      );

      // Act
      final attribute = NestedStyleAttribute(styleMix);

      // Assert
      expect(attribute, isA<NestedStyleAttribute>());
      expect(attribute.value, equals(styleMix));
    });

    group('merge', () {
      test('should return the same object if other is null', () {
        // Arrange
        final styleMix = Style(const MockStringScalarAttribute('test'));
        final attribute = NestedStyleAttribute(styleMix);

        // Act
        final mergedAttribute = attribute.merge(null);

        // Assert
        expect(mergedAttribute, same(attribute));
      });

      test('should return a new object with merged values if other is not null',
          () {
        // Arrange
        final styleMix1 = Style(
          const MockDoubleScalarAttribute(1.0),
          const MockIntScalarAttribute(2),
        );
        final styleMix2 = Style(const MockDoubleScalarAttribute(2.0));

        final attribute1 = NestedStyleAttribute(styleMix1);
        final attribute2 = NestedStyleAttribute(styleMix2);

        // Act
        final mergedAttribute = attribute1.merge(attribute2);

        // Assert
        expect(mergedAttribute, isNot(same(attribute1)));
        expect(mergedAttribute.value, equals(styleMix1.merge(styleMix2)));
      });
    });

    test('props should return a list containing the value', () {
      // Arrange
      final styleMix = Style();
      final attribute = NestedStyleAttribute(styleMix);

      // Act
      final props = attribute.props;

      // Assert
      expect(props, isList);
      expect(props, contains(styleMix));
    });

    test('should contain all attributes after multiple merges', () {
      const attr1 = MockIntScalarAttribute(3);
      const attr2 = MockDoubleScalarAttribute(1);
      const attr3 = MockBooleanScalarAttribute(false);

      final styleMix1 = Style(attr1);
      final styleMix2 = Style(attr2);
      final styleMix3 = Style(attr3);

      final styleAttribute1 = NestedStyleAttribute(styleMix1);
      final styleAttribute2 = NestedStyleAttribute(styleMix2);
      final styleAttribute3 = NestedStyleAttribute(styleMix3);

      // Act
      // Simulate the nested merge as it would occur during construction or setup.
      // This assumes StyleMix.merge() not only merges attributes but also merges other StyleMixes.
      final mergedAttribute1 = styleAttribute1.merge(styleAttribute2);
      final mergedAttribute2 = mergedAttribute1.merge(styleAttribute3);

      final finalStyleMix = mergedAttribute1.merge(mergedAttribute2).value;

      expect(finalStyleMix.values, containsAll([attr1, attr2, attr3]));

      // Does not contain any attributes of type NestedStyleAttribute
      expect(finalStyleMix.values.whereType<NestedStyleAttribute>(), isEmpty);
    });

    test('should handle nested NestedStyleAttributes properly', () {
      const attr1 = MockIntScalarAttribute(3);
      const attr2 = MockDoubleScalarAttribute(1);
      const attr3 = MockBooleanScalarAttribute(false);

      final style = Style(attr1, attr2, attr3);

      final styleMix = Style(NestedStyleAttribute(style));

      final level1Attribute = NestedStyleAttribute(styleMix);

      final level2Attribute = NestedStyleAttribute(Style(level1Attribute));

      final level3Attribute = NestedStyleAttribute(Style(level2Attribute));

      expect(level1Attribute.value.values, containsAll([attr1, attr2, attr3]));
      expect(level2Attribute.value.values, containsAll([attr1, attr2, attr3]));
      expect(level3Attribute.value.values, containsAll([attr1, attr2, attr3]));

      expect(
        level1Attribute.value.values.whereType<NestedStyleAttribute>(),
        isEmpty,
      );

      expect(
        level2Attribute.value.values.whereType<NestedStyleAttribute>(),
        isEmpty,
      );
      expect(
        level3Attribute.value.values.whereType<NestedStyleAttribute>(),
        isEmpty,
      );

      expect(level1Attribute.value.values.length, 3);
      expect(level2Attribute.value.values.length, 3);
      expect(level3Attribute.value.values.length, 3);

      expect(styleMix, level1Attribute.value);
      expect(styleMix, level2Attribute.value);
      expect(styleMix, level3Attribute.value);
    });
  });
}
