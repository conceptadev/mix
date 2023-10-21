import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('CurveAttribute', () {
    test('resolve returns correct Curve', () {
      const attr = TestableCurveAttribute(Curves.ease);
      final curve = attr.resolve(EmptyMixData);

      expect(curve, Curves.ease);
    });

    test('Equality holds when Curve is the same', () {
      const attr1 = TestableCurveAttribute(Curves.ease);
      const attr2 = TestableCurveAttribute(Curves.ease);

      expect(attr1, attr2);
    });

    test('Equality fails when Curve is different', () {
      const attr1 = TestableCurveAttribute(Curves.ease);
      const attr2 = TestableCurveAttribute(Curves.bounceIn);

      expect(attr1, isNot(attr2));
    });

    test('merge returns correct merged object', () {
      const attr1 = TestableCurveAttribute(Curves.ease);
      const attr2 = TestableCurveAttribute(Curves.bounceIn);

      final merged = attr1.merge(attr2);

      expect(merged.curve, Curves.bounceIn); // should take from attr2
    });
  });
}

class TestableCurveAttribute extends CurveAttribute {
  const TestableCurveAttribute(Curve curve) : super(curve);

  @override
  TestableCurveAttribute merge(covariant CurveAttribute? other) {
    return TestableCurveAttribute(other?.curve ?? curve);
  }
}
