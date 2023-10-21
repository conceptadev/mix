import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('BorderRadiusGeometryAttribute', () {
    test('from factory returns BorderRadiusAttribute for BorderRadius', () {
      const borderRadius = BorderRadius.all(Radius.circular(10.0));
      final result = BorderRadiusGeometryAttribute.from(borderRadius);

      expect(result, isA<BorderRadiusAttribute>());
      expect((result as BorderRadiusAttribute).topLeft!.y, 10.0);
      expect((result).topRight!.y, 10.0);
      expect((result).bottomLeft!.y, 10.0);
      expect((result).bottomRight!.y, 10.0);
    });

    test(
        'from factory returns BorderRadiusDirectionalAttribute for BorderRadiusDirectional',
        () {
      const borderRadius = BorderRadiusDirectional.all(Radius.circular(10.0));
      final result = BorderRadiusGeometryAttribute.from(borderRadius);

      expect(result, isA<BorderRadiusDirectionalAttribute>());
      expect((result as BorderRadiusDirectionalAttribute).topStart!.y, 10.0);
      expect((result).topEnd!.y, 10.0);
      expect((result).bottomStart!.y, 10.0);
      expect((result).bottomEnd!.y, 10.0);
    });
  });

  group('BorderRadiusAttribute', () {
    test('merge returns merged object correctly', () {
      final attr1 = BorderRadiusAttribute.circular(10.0);
      const attr2 =
          BorderRadiusAttribute.only(topLeft: RadiusDto.elliptical(20, 20));

      final merged = attr1.merge(attr2);

      expect(merged.topLeft!.x, 20.0);
      expect(merged.topLeft!.y, 20.0);
      expect(merged.topRight!.x, 10.0);
      expect(merged.topRight!.y, 10.0);
      expect(merged.bottomLeft!.x, 10.0);
      expect(merged.bottomLeft!.y, 10.0);
      expect(merged.bottomRight!.x, 10.0);
      expect(merged.bottomRight!.y, 10.0);
    });

    test('resolve returns correct BorderRadius', () {
      final attr = BorderRadiusAttribute.circular(10.0);
      final borderRadius = attr.resolve(EmptyMixData);

      expect(borderRadius.topLeft, const Radius.circular(10.0));
      expect(borderRadius.topRight, const Radius.circular(10.0));
      expect(borderRadius.bottomLeft, const Radius.circular(10.0));
      expect(borderRadius.bottomRight, const Radius.circular(10.0));
    });

    test('Equality holds when all attributes are the same', () {
      final attr1 = BorderRadiusAttribute.circular(10.0);
      final attr2 = BorderRadiusAttribute.circular(10.0);

      expect(attr1, attr2);
    });

    test('Equality fails when attributes are different', () {
      final attr1 = BorderRadiusAttribute.circular(10.0);
      const attr2 =
          BorderRadiusAttribute.only(topLeft: RadiusDto.elliptical(10, 30));

      expect(attr1, isNot(attr2));
    });
  });

  group('BorderRadiusDirectionalAttribute', () {
    test('merge returns merged object correctly', () {
      final attr1 = BorderRadiusDirectionalAttribute.circular(10.0);
      const attr2 = BorderRadiusDirectionalAttribute.only(
          topStart: RadiusDto.elliptical(20, 20));

      final merged = attr1.merge(attr2);

      expect(merged.topStart!.x, 20.0);
      expect(merged.topStart!.y, 20.0);
      expect(merged.topEnd!.x, 10.0);
      expect(merged.topEnd!.y, 10.0);
      expect(merged.bottomStart!.x, 10.0);
      expect(merged.bottomStart!.y, 10.0);
      expect(merged.bottomEnd!.x, 10.0);
      expect(merged.bottomEnd!.y, 10.0);
    });

    test('resolve returns correct BorderRadiusDirectional', () {
      final attr = BorderRadiusDirectionalAttribute.circular(10.0);
      final borderRadius = attr.resolve(EmptyMixData);

      expect(borderRadius.topStart, const Radius.circular(10.0));
      expect(borderRadius.topEnd, const Radius.circular(10.0));
      expect(borderRadius.bottomStart, const Radius.circular(10.0));
      expect(borderRadius.bottomEnd, const Radius.circular(10.0));
    });

    test('Equality holds when all attributes are the same', () {
      final attr1 = BorderRadiusDirectionalAttribute.circular(10.0);
      final attr2 = BorderRadiusDirectionalAttribute.circular(10.0);

      expect(attr1, attr2);
    });

    test('Equality fails when attributes are different', () {
      final attr1 = BorderRadiusDirectionalAttribute.circular(10.0);
      const attr2 = BorderRadiusDirectionalAttribute.only(
          topStart: RadiusDto.elliptical(10, 30));

      expect(attr1, isNot(attr2));
    });
  });
}
