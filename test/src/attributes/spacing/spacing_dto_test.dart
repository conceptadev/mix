import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/attributes/spacing/spacing_dto.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('SpacingDto', () {
    test('resolves to EdgeInsets.only with correct values', () {
      const spacingDto = SpacingDto.only(
        top: 10,
        bottom: 20,
        left: 30,
        right: 40,
      );

      expect(
        spacingDto.resolve(EmptyMixData),
        const EdgeInsets.only(
          left: 30,
          top: 10,
          right: 40,
          bottom: 20,
        ),
      );
    });

    test('merges correctly with another SpacingDto', () {
      const spacingDto1 = SpacingDto.only(
        top: 10,
        bottom: 20,
        left: 30,
        right: 40,
      );
      const spacingDto2 = SpacingDto.only(
        top: 5,
        bottom: 15,
        left: 25,
        right: 35,
      );
      final mergedSpacingDto = spacingDto1.merge(spacingDto2);
      expect(
        mergedSpacingDto,
        const SpacingDto.only(
          top: 5,
          bottom: 15,
          left: 25,
          right: 35,
        ),
      );
    });
  });
}
