import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/decorator.dart';
import 'package:mix/src/factory/mix_provider_data.dart';

import '../../helpers/testing_utils.dart';

void main() {
  group('DecoratorSpec', () {
    test('lerpValue should return null when both begin and end are null', () {
      expect(DecoratorSpec.lerpValue(null, null, 0.5), isNull);
    });

    test(
        'lerpValue should return the result of lerp when begin and end are not null',
        () {
      const begin = _TestDecoratorSpec(1);
      const end = _TestDecoratorSpec(2);
      expect(
        DecoratorSpec.lerpValue(begin, end, 0.5),
        isA<_TestDecoratorSpec>(),
      );
      expect(
        (DecoratorSpec.lerpValue(begin, end, 0.5) as _TestDecoratorSpec?)
            ?.value,
        1.5,
      );
    });
  });

  group('DecoratorAttribute', () {
    test('resolve should return a DecoratorSpec', () {
      const attribute = _TestDecoratorAttribute(2);

      expect(attribute.resolve(EmptyMixData), isA<_TestDecoratorSpec>());
      expect(attribute.resolve(EmptyMixData).value, 2);
    });
  });
}

class _TestDecorator
    extends DecoratorAttribute<_TestDecorator, _TestDecoratorSpec> {
  final double value;
  const _TestDecorator(this.value);

  @override
  _TestDecoratorSpec resolve(MixData mix) {
    return const _TestDecoratorSpec(0);
  }

  @override
  get props => [];

  @override
  _TestDecorator merge(_TestDecorator? other) {
    return _TestDecorator(other?.value ?? value);
  }
}

class _TestDecoratorSpec extends DecoratorSpec<_TestDecoratorSpec> {
  final double value;
  const _TestDecoratorSpec(this.value);

  @override
  Widget build(Widget child) {
    return Container();
  }

  @override
  _TestDecoratorSpec copyWith({double? value}) {
    return _TestDecoratorSpec(value ?? this.value);
  }

  @override
  get props => [];

  @override
  _TestDecoratorSpec lerp(_TestDecoratorSpec? other, double t) {
    if (other == null) return this;

    return _TestDecoratorSpec(lerpDouble(value, other.value, t)!);
  }
}

class _TestDecoratorAttribute
    extends DecoratorAttribute<_TestDecoratorAttribute, _TestDecoratorSpec> {
  final double value;
  const _TestDecoratorAttribute(this.value);

  @override
  _TestDecoratorSpec resolve(MixData mix) {
    return _TestDecoratorSpec(value);
  }

  @override
  get props => [];

  @override
  _TestDecoratorAttribute merge(_TestDecoratorAttribute? other) {
    return _TestDecoratorAttribute(other?.value ?? value);
  }
}
