import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignmentGeometryAttribute utilities:', () {
    test('"alignment" takes in x and y and returns AlignmentAttribute', () {
      var result = alignment(0, 1);

      expect(result, isA<AlignmentGeometryAttribute>());
      expect(result, isA<AlignmentAttribute>());
      expect(result.x, 0);
      expect(result.y, 1);
    });

    test(
        "alignmentDirectional takes in start and y and returns AlignmentDirectionalAttribute",
        () {
      var result = alignmentDirectional(0, 1);

      expect(result, isA<AlignmentGeometryAttribute>());
      expect(result, isA<AlignmentDirectionalAttribute>());
      expect(result.start, 0);
      expect(result.y, 1);
    });

    test(
        'predefined functions return correct AlignmentAttribute and resolves correctly',
        () {
      //  alignmentTopLeft
      expect(alignmentTopLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopLeft(), isA<AlignmentAttribute>());
      expect(alignmentTopLeft().resolve(EmptyMixData), Alignment.topLeft);

      //  alignmentTopCenter
      expect(alignmentTopCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopCenter(), isA<AlignmentAttribute>());
      expect(alignmentTopCenter().resolve(EmptyMixData), Alignment.topCenter);

      //  alignmentTopRight
      expect(alignmentTopRight(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopRight(), isA<AlignmentAttribute>());
      expect(alignmentTopRight().resolve(EmptyMixData), Alignment.topRight);

      //  alignmentCenterLeft
      expect(alignmentCenterLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterLeft(), isA<AlignmentAttribute>());
      expect(alignmentCenterLeft().resolve(EmptyMixData), Alignment.centerLeft);

      //  alignmentCenter
      expect(alignmentCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenter(), isA<AlignmentAttribute>());
      expect(alignmentCenter().resolve(EmptyMixData), Alignment.center);

      //  alignmentCenterRight
      expect(alignmentCenterRight(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterRight(), isA<AlignmentAttribute>());
      expect(
          alignmentCenterRight().resolve(EmptyMixData), Alignment.centerRight);

      //  alignmentBottomLeft
      expect(alignmentBottomLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomLeft(), isA<AlignmentAttribute>());
      expect(alignmentBottomLeft().resolve(EmptyMixData), Alignment.bottomLeft);

      //  alignmentBottomCenter
      expect(alignmentBottomCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomCenter(), isA<AlignmentAttribute>());
      expect(alignmentBottomCenter().resolve(EmptyMixData),
          Alignment.bottomCenter);

      //  alignmentBottomRight
      expect(alignmentBottomRight(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomRight(), isA<AlignmentAttribute>());
      expect(
          alignmentBottomRight().resolve(EmptyMixData), Alignment.bottomRight);
    });
    test(
        'predefined functions return correct AlignmentDirectionalAttribute and resolves correctly',
        () {
      // alignmentTopStart
      expect(alignmentTopStart(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopStart(), isA<AlignmentDirectionalAttribute>());
      expect(alignmentTopStart().resolve(EmptyMixData),
          AlignmentDirectional.topStart);

      // alignmentTopEnd
      expect(alignmentTopEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignmentTopEnd(), isA<AlignmentDirectionalAttribute>());
      expect(
          alignmentTopEnd().resolve(EmptyMixData), AlignmentDirectional.topEnd);

      // alignmentCenterStart
      expect(alignmentCenterStart(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterStart(), isA<AlignmentDirectionalAttribute>());
      expect(alignmentCenterStart().resolve(EmptyMixData),
          AlignmentDirectional.centerStart);

      // alignmentCenterEnd
      expect(alignmentCenterEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignmentCenterEnd(), isA<AlignmentDirectionalAttribute>());
      expect(alignmentCenterEnd().resolve(EmptyMixData),
          AlignmentDirectional.centerEnd);

      // alignmentBottomStart
      expect(alignmentBottomStart(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomStart(), isA<AlignmentDirectionalAttribute>());
      expect(alignmentBottomStart().resolve(EmptyMixData),
          AlignmentDirectional.bottomStart);

      // alignmentBottomEnd
      expect(alignmentBottomEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignmentBottomEnd(), isA<AlignmentDirectionalAttribute>());
      expect(alignmentBottomEnd().resolve(EmptyMixData),
          AlignmentDirectional.bottomEnd);
    });
  });
}
