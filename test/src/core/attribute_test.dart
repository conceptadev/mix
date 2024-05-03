import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('SpecAttribute Tests', () {
    test('SpecAttribute type should return correct type', () {
      const attribute = _MockSpecAttribute();
      expect(attribute.type, _MockSpecAttribute);
    });

    test('SpecAttribute merge should correctly merge with another attribute',
        () {
      const attribute1 = _MockSpecAttribute(value: 10);
      const attribute2 = _MockSpecAttribute(value: 20);
      final merged = attribute1.merge(attribute2);

      expect(merged.value, 20);
    });
  });

  group('StyleAttributeBuilder Tests', () {
    test('StyleAttributeBuilder type should include key when provided', () {
      final builder = _MockStyleAttributeBuilder((param) => Style(),
          key: const Key('testKey'));
      expect(builder.type, '_MockStyleAttributeBuilder[<\'testKey\'>]');
    });

    test('StyleAttributeBuilder type should return default when key is null',
        () {
      final builder = _MockStyleAttributeBuilder((param) => Style());
      expect(builder.type, '_MockStyleAttributeBuilder');
    });

    test('StyleAttributeBuilder builder should build correct attribute', () {
      final builder = _MockStyleAttributeBuilder((param) => Style());
      final attribute = builder.builder(MockBuildContext());

      expect(attribute, isA<NestedStyleAttribute>());
    });
  });

  group('ContectVariantEventBuilder Tests', () {
    test('ContectVariantEventBuilder props should include key and variant', () {
      const variant = MockContextVariantCondition(true);
      final builder = ContectVariantEventBuilder((bool condition) => Style(),
          variant: variant, key: const Key('testKey'));

      expect(builder.props, containsAll([const Key('testKey'), variant]));
    });

    test(
        'ContectVariantEventBuilder builder should build correct attribute based on context',
        () {
      const variant = MockContextVariantCondition(true);
      final builder = ContectVariantEventBuilder((bool condition) => Style(),
          variant: variant, key: const Key('testKey'));
      final attribute = builder.builder(MockBuildContext());

      expect(attribute, isA<NestedStyleAttribute>());
    });
  });
}

class _MockSpecAttribute extends SpecAttribute<_MockSpecAttribute, int> {
  final int value;

  const _MockSpecAttribute({this.value = 0});

  @override
  int resolve(MixData mix) {
    return value;
  }

  @override
  get props => [];

  @override
  _MockSpecAttribute merge(_MockSpecAttribute? other) {
    return _MockSpecAttribute(value: other?.value ?? value);
  }
}

class _MockStyleAttributeBuilder extends ContextVariantBuilder<int> {
  const _MockStyleAttributeBuilder(Style Function(int param) fn, {Key? key})
      : super(fn, key: key);

  @override
  Attribute? builder(BuildContext context) {
    return NestedStyleAttribute(fn(0));
  }

  @override
  get props => [];
}

class MockContextVariantCondition extends ContextVariant {
  final bool result;

  const MockContextVariantCondition(this.result);

  @override
  bool build(BuildContext context) {
    return result;
  }
}
