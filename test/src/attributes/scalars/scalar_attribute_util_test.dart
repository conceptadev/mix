import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/scalars/scalar_attribute_util.dart';

void main() {
  group('AlignmentGeometryAttributeUtility Tests', () {
    const utility = AlignmentGeometryAttributeUtility();
    test('initializes correctly', () {
      expect(utility.center(), isA<AlignmentGeometryAttribute>());
      expect(utility.topLeft(), isA<AlignmentGeometryAttribute>());
      expect(utility.topRight(), isA<AlignmentGeometryAttribute>());
      expect(utility.bottomLeft(), isA<AlignmentGeometryAttribute>());
      expect(utility.bottomRight(), isA<AlignmentGeometryAttribute>());

      expect(utility.center().value, isA<Alignment>());
      expect(utility.topLeft().value, isA<Alignment>());
      expect(utility.topRight().value, isA<Alignment>());
      expect(utility.bottomLeft().value, isA<Alignment>());
      expect(utility.bottomRight().value, isA<Alignment>());
    });

    test('callable method returns an AlignmentGeometryAttribute', () {
      final attribute = utility(Alignment.topCenter);

      expect(attribute, isA<AlignmentGeometryAttribute>());
      expect(attribute.value, Alignment.topCenter);
    });

    //  has as method
    test('hasAs returns true if value is the same', () {
      final attribute = utility.as(Alignment.topCenter);
      final otherAttribute = utility(Alignment.topCenter);

      expect(attribute.as(otherAttribute), isTrue);
    });
  });

  group('ClipBehaviorAttributeUtility Tests', () {
    const utility = ClipBehaviorAttributeUtility();
    test('initializes correctly', () {
      expect(utility.none().value, isA<Clip>());
      expect(utility.hardEdge().value, isA<Clip>());
      expect(utility.antiAlias().value, isA<Clip>());
      expect(utility.antiAliasWithSaveLayer().value, isA<Clip>());
    });
  });

  group('TransformAttributeUtility Tests', () {
    const utility = TransformAttributeUtility();
    test('initializes correctly', () {
      expect(utility.identity().value, isA<Matrix4>());
    });
  });

  group('AxisAttributeUtility Tests', () {
    const utility = AxisAttributeUtility();
    test('initializes correctly', () {
      expect(utility.horizontal().value, isA<Axis>());
      expect(utility.vertical().value, isA<Axis>());
    });
  });

  group('BackgroundColorAttributeUtility Tests', () {
    const utility = BackgroundColorAttributeUtility();
    test('initializes correctly', () {
      expect(utility.black().value, isA<Color>());
      expect(utility.white().value, isA<Color>());
    });
  });
}
