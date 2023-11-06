import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignmentGeometryAttribute extensions:', () {
    test('"alignment" takes in x and y and returns AlignmentGeometryAttribute',
        () {
      var result = alignment(0, 1);

      expect(result, isA<AlignmentGeometryAttribute>());
      expect(result.x, 0);
      expect(result.y, 1);
    });

    test(
        'predefined functions return correct AlignmentGeometryAttribute objects',
        () {
      expect(alignmentTopLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopRight(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterRight(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomRight(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopStart(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterStart(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomStart(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomEnd(), isA<AlignmentGeometryAttribute>());
    });

    test(
        'predefined directional functions consider text direction and return correct AlignmentGeometryAttribute objects',
        () {
      expect(alignmentTopStart().isDirectional, isTrue);
      expect(alignmentTopEnd().isDirectional, isTrue);
      expect(alignmentCenterStart().isDirectional, isTrue);
      expect(alignmentCenterEnd().isDirectional, isTrue);
      expect(alignmentBottomStart().isDirectional, isTrue);
      expect(alignmentBottomEnd().isDirectional, isTrue);
    });

    test('predefined functions resolved values match expected Alignment', () {
      AlignmentGeometry resolvedValue;

      resolvedValue = alignmentTopLeft().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.topLeft);

      resolvedValue = alignmentTopCenter().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.topCenter);

      resolvedValue = alignmentTopRight().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.topRight);

      resolvedValue = alignmentCenterLeft().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.centerLeft);

      resolvedValue = alignmentCenter().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.center);

      resolvedValue = alignmentCenterRight().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.centerRight);

      resolvedValue = alignmentBottomLeft().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.bottomLeft);

      resolvedValue = alignmentBottomCenter().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.bottomCenter);

      resolvedValue = alignmentBottomRight().resolve(EmptyMixData);
      expect(resolvedValue, Alignment.bottomRight);
    });

    test(
        'predefined directional functions resolved values match expected AlignmentDirectional',
        () {
      AlignmentGeometry resolvedValue;

      resolvedValue = alignmentTopStart().resolve(EmptyMixData);
      expect(resolvedValue, AlignmentDirectional.topStart);

      resolvedValue = alignmentTopEnd().resolve(EmptyMixData);
      expect(resolvedValue, AlignmentDirectional.topEnd);

      resolvedValue = alignmentCenterStart().resolve(EmptyMixData);
      expect(resolvedValue, AlignmentDirectional.centerStart);

      resolvedValue = alignmentCenterEnd().resolve(EmptyMixData);
      expect(resolvedValue, AlignmentDirectional.centerEnd);

      resolvedValue = alignmentBottomStart().resolve(EmptyMixData);
      expect(resolvedValue, AlignmentDirectional.bottomStart);

      resolvedValue = alignmentBottomEnd().resolve(EmptyMixData);
      expect(resolvedValue, AlignmentDirectional.bottomEnd);
    });
  });
}
