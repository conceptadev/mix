import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group(
    'IconMixAttribute',
    () {
      test(
        'of should return an instance of IconMixAttribute',
        () {
          final attribute = IconMixAttribute.of(EmptyMixData);
          expect(attribute, isA<IconMixAttribute>());
        },
      );

      test(
        'resolve should return an instance of IconSpec',
        () {
          const attribute = IconMixAttribute();
          final resolvedSpec = attribute.resolve(EmptyMixData);
          expect(resolvedSpec, isA<IconSpec>());
        },
      );

      test(
        'merge should return a new instance of IconMixAttribute',
        () {
          const attribute1 =
              IconMixAttribute(size: 24, color: ColorDto(Colors.red));
          const attribute2 =
              IconMixAttribute(size: 32, color: ColorDto(Colors.green));
          final mergedAttribute = attribute1.merge(attribute2);
          expect(mergedAttribute, isA<IconMixAttribute>());
          expect(mergedAttribute.size, equals(24));
          expect(mergedAttribute.color, equals(const ColorDto(Colors.red)));
        },
      );

      test(
        'props should return a list of size and color',
        () {
          const attribute =
              IconMixAttribute(size: 24, color: ColorDto(Colors.red));
          final props = attribute.props;
          expect(props, contains(24));
          expect(props, contains(const ColorDto(Colors.red)));
        },
      );
    },
  );
}
