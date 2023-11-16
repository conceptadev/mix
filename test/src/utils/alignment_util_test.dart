import 'package:flutter/src/painting/alignment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('AlignmentGeometryAttribute utilities:', () {
    test('"alignment" takes in x and y and returns AlignmentAttribute', () {
      var result = alignment(const Alignment(0, 1));

      expect(result, isA<AlignmentGeometryAttribute>());
      expect(result, isA<AlignmentAttribute>());
      expect((result as AlignmentAttribute).x, 0);
      expect((result).y, 1);
    });

    test(
        "alignmentDirectional takes in start and y and returns AlignmentDirectionalAttribute",
        () {
      var result = alignment(const AlignmentDirectional(0, 1));

      expect(result, isA<AlignmentGeometryAttribute>());
      expect(result, isA<AlignmentDirectionalAttribute>());
      expect((result as AlignmentDirectionalAttribute).start, 0);
      expect((result).y, 1);
    });

    test(
        'predefined functions return correct AlignmentAttribute and resolves correctly',
        () {
      //  alignmentTopLeft
      expect(alignment.topLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignment.topLeft(), isA<AlignmentAttribute>());
      expect(alignment.topLeft().resolve(EmptyMixData), Alignment.topLeft);

      //  alignmentTopCenter
      expect(alignment.topCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignment.topCenter(), isA<AlignmentAttribute>());
      expect(alignment.topCenter().resolve(EmptyMixData), Alignment.topCenter);

      //  alignmentTopRight
      expect(alignment.topRight(), isA<AlignmentGeometryAttribute>());
      expect(alignment.topRight(), isA<AlignmentAttribute>());
      expect(alignment.topRight().resolve(EmptyMixData), Alignment.topRight);

      //  alignmentCenterLeft
      expect(alignment.centerLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignment.centerLeft(), isA<AlignmentAttribute>());
      expect(
          alignment.centerLeft().resolve(EmptyMixData), Alignment.centerLeft);

      //  alignmentCenter
      expect(alignment.center(), isA<AlignmentGeometryAttribute>());
      expect(alignment.center(), isA<AlignmentAttribute>());
      expect(alignment.center().resolve(EmptyMixData), Alignment.center);

      //  alignmentCenterRight
      expect(alignment.centerRight(), isA<AlignmentGeometryAttribute>());
      expect(alignment.centerRight(), isA<AlignmentAttribute>());
      expect(
          alignment.centerRight().resolve(EmptyMixData), Alignment.centerRight);

      //  alignmentBottomLeft
      expect(alignment.bottomLeft(), isA<AlignmentGeometryAttribute>());
      expect(alignment.bottomLeft(), isA<AlignmentAttribute>());
      expect(
          alignment.bottomLeft().resolve(EmptyMixData), Alignment.bottomLeft);

      //  alignmentBottomCenter
      expect(alignment.bottomCenter(), isA<AlignmentGeometryAttribute>());
      expect(alignment.bottomCenter(), isA<AlignmentAttribute>());
      expect(alignment.bottomCenter().resolve(EmptyMixData),
          Alignment.bottomCenter);

      //  alignmentBottomRight
      expect(alignment.bottomRight(), isA<AlignmentGeometryAttribute>());
      expect(alignment.bottomRight(), isA<AlignmentAttribute>());
      expect(
          alignment.bottomRight().resolve(EmptyMixData), Alignment.bottomRight);
    });
    test(
        'predefined functions return correct AlignmentDirectionalAttribute and resolves correctly',
        () {
      // alignmentTopStart
      expect(alignment.topStart(), isA<AlignmentGeometryAttribute>());
      expect(alignment.topStart(), isA<AlignmentDirectionalAttribute>());
      expect(alignment.topStart().resolve(EmptyMixData),
          AlignmentDirectional.topStart);

      // alignmentTopEnd
      expect(alignment.topEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignment.topEnd(), isA<AlignmentDirectionalAttribute>());
      expect(alignment.topEnd().resolve(EmptyMixData),
          AlignmentDirectional.topEnd);

      // alignmentCenterStart
      expect(alignment.centerStart(), isA<AlignmentGeometryAttribute>());
      expect(alignment.centerStart(), isA<AlignmentDirectionalAttribute>());
      expect(alignment.centerStart().resolve(EmptyMixData),
          AlignmentDirectional.centerStart);

      // alignmentCenterEnd
      expect(alignment.centerEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignment.centerEnd(), isA<AlignmentDirectionalAttribute>());
      expect(alignment.centerEnd().resolve(EmptyMixData),
          AlignmentDirectional.centerEnd);

      // alignmentBottomStart
      expect(alignment.bottomStart(), isA<AlignmentGeometryAttribute>());
      expect(alignment.bottomStart(), isA<AlignmentDirectionalAttribute>());
      expect(alignment.bottomStart().resolve(EmptyMixData),
          AlignmentDirectional.bottomStart);

      // alignmentBottomEnd
      expect(alignment.bottomEnd(), isA<AlignmentGeometryAttribute>());
      expect(alignment.bottomEnd(), isA<AlignmentDirectionalAttribute>());
      expect(alignment.bottomEnd().resolve(EmptyMixData),
          AlignmentDirectional.bottomEnd);
    });
  });
}
