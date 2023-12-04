import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/style_mix_attribute.dart';
import 'package:mix/src/factory/style_mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('StyleMixAttribute', () {
    test('should create an instance with the provided value', () {
      // Arrange
      final styleMix = StyleMix(
        const MockIntScalarAttribute(1),
        const MockIntScalarAttribute(2),
      );

      // Act
      final attribute = StyleMixAttribute(styleMix);

      // Assert
      expect(attribute, isA<StyleMixAttribute>());
      expect(attribute.value, equals(styleMix));
    });

    group('merge', () {
      test('should return the same object if other is null', () {
        // Arrange
        final styleMix = StyleMix(const MockStringScalarAttribute('test'));
        final attribute = StyleMixAttribute(styleMix);

        // Act
        final mergedAttribute = attribute.merge(null);

        // Assert
        expect(mergedAttribute, same(attribute));
      });

      test('should return a new object with merged values if other is not null',
          () {
        // Arrange
        final styleMix1 = StyleMix(
          const MockDoubleScalarAttribute(1.0),
          const MockIntScalarAttribute(2),
        );
        final styleMix2 = StyleMix(const MockDoubleScalarAttribute(2.0));

        final attribute1 = StyleMixAttribute(styleMix1);
        final attribute2 = StyleMixAttribute(styleMix2);

        // Act
        final mergedAttribute = attribute1.merge(attribute2);

        // Assert
        expect(mergedAttribute, isNot(same(attribute1)));
        expect(mergedAttribute.value, equals(styleMix1.merge(styleMix2)));
      });
    });

    test('props should return a list containing the value', () {
      // Arrange
      final styleMix = StyleMix();
      final attribute = StyleMixAttribute(styleMix);

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

      final styleMix1 = StyleMix(attr1);
      final styleMix2 = StyleMix(attr2);
      final styleMix3 = StyleMix(attr3);

      final styleAttribute1 = StyleMixAttribute(styleMix1);
      final styleAttribute2 = StyleMixAttribute(styleMix2);
      final styleAttribute3 = StyleMixAttribute(styleMix3);

      // Act
      // Simulate the nested merge as it would occur during construction or setup.
      // This assumes StyleMix.merge() not only merges attributes but also merges other StyleMixes.
      final mergedAttribute1 = styleAttribute1.merge(styleAttribute2);
      final mergedAttribute2 = mergedAttribute1.merge(styleAttribute3);

      final finalStyleMix = mergedAttribute1.merge(mergedAttribute2).value;

      expect(finalStyleMix.values, containsAll([attr1, attr2, attr3]));

      // Does not contain any attributes of type StyleMixAttribute
      expect(finalStyleMix.values.whereType<StyleMixAttribute>(), isEmpty);
    });

    test('should handle nested StyleMixAttributes properly', () {
      const attr1 = MockIntScalarAttribute(3);
      const attr2 = MockDoubleScalarAttribute(1);
      const attr3 = MockBooleanScalarAttribute(false);

      final style = StyleMix(attr1, attr2, attr3);

      final styleMix = StyleMix(StyleMixAttribute(style));

      final level1Attribute = StyleMixAttribute(styleMix);

      final level2Attribute = StyleMixAttribute(StyleMix(level1Attribute));

      final level3Attribute = StyleMixAttribute(StyleMix(level2Attribute));

      expect(level1Attribute.value.values, containsAll([attr1, attr2, attr3]));
      expect(level2Attribute.value.values, containsAll([attr1, attr2, attr3]));
      expect(level3Attribute.value.values, containsAll([attr1, attr2, attr3]));

      expect(
        level1Attribute.value.values.whereType<StyleMixAttribute>(),
        isEmpty,
      );

      expect(
        level2Attribute.value.values.whereType<StyleMixAttribute>(),
        isEmpty,
      );
      expect(
        level3Attribute.value.values.whereType<StyleMixAttribute>(),
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
