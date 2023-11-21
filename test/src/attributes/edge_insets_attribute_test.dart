import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/edge_insets_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('EdgeInsetsAttribute', () {
    test('resolves to EdgeInsets.only with correct values', () {
      const attribute = EdgeInsetsDto(
        top: 10,
        bottom: 20,
        left: 30,
        right: 40,
      );

      expect(
          attribute.resolve(EmptyMixData),
          const EdgeInsets.only(
            left: 30,
            top: 10,
            right: 40,
            bottom: 20,
          ));
    });

    test('merges correctly with another EdgeInsetsAttribute', () {
      const attribute1 = EdgeInsetsDto(
        top: 10,
        bottom: 20,
        left: 30,
        right: 40,
      );
      const attribute2 = EdgeInsetsDto(
        top: 5,
        bottom: 15,
        left: 25,
        right: 35,
      );
      final mergedAttribute = attribute1.merge(attribute2);
      expect(
          mergedAttribute,
          const EdgeInsetsDto(
            top: 5,
            bottom: 15,
            left: 25,
            right: 35,
          ));
    });
  });

  group('EdgeInsetsDirectionalAttribute', () {
    test('resolves to EdgeInsetsDirectional.only with correct values', () {
      const attribute = EdgeInsetsDirectionalDto(
        top: 10,
        bottom: 20,
        start: 30,
        end: 40,
      );

      expect(
          attribute.resolve(EmptyMixData),
          const EdgeInsetsDirectional.only(
            start: 30,
            top: 10,
            end: 40,
            bottom: 20,
          ));
    });

    test('merges correctly with another EdgeInsetsDirectionalAttribute', () {
      const attribute1 = EdgeInsetsDirectionalDto(
        top: 10,
        bottom: 20,
        start: 30,
        end: 40,
      );
      const attribute2 = EdgeInsetsDirectionalDto(
        top: 5,
        bottom: 15,
        start: 25,
        end: 35,
      );
      final mergedAttribute = attribute1.merge(attribute2);
      expect(
          mergedAttribute,
          const EdgeInsetsDirectionalDto(
            top: 5,
            bottom: 15,
            start: 25,
            end: 35,
          ));
    });
  });
}
