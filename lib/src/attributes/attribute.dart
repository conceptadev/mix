import 'package:flutter/material.dart';

import '../core/equality/compare_mixin.dart';
import '../factory/mix_provider_data.dart';

@immutable
abstract class Attribute with Comparable, Mergeable<Attribute> {
  const Attribute();
}

abstract class StyleAttribute extends Attribute {
  const StyleAttribute();
}

abstract class Dto<Value> with Comparable, Mergeable<Dto>, Resolver<Value> {
  const Dto();
}

abstract class ValueAttribute<Value> extends StyleAttribute {
  const ValueAttribute();
}

mixin Resolver<Value> {
  Value resolve(MixData mix);
}

// TODO: Mergeable to do Attribute only
mixin Mergeable<T> {
  T merge(covariant T? other);
}

@immutable
abstract class ScalarAttribute<Value> extends ValueAttribute<Value> {
  final Value value;
  const ScalarAttribute(this.value);

  @override
  get props => [value];
}

abstract class ResolvableAttribute<ResolvableValue extends Resolver<Value>,
    Value> extends ValueAttribute<Value> with Resolver<Value> {
  final ResolvableValue value;
  const ResolvableAttribute(this.value);

  @override
  Value resolve(MixData mix) => value.resolve(mix);

  @override
  get props => [value];
}

@immutable
abstract class StyleRecipe<T extends StyleRecipe<T>> extends ThemeExtension<T>
    with Comparable {
  const StyleRecipe();

  Duration lerpDuration(Duration a, Duration b, double t) {
    int lerpTicks = ((1 - t) * a.inMilliseconds + t * b.inMilliseconds).round();

    return Duration(milliseconds: lerpTicks);
  }

  int lerpInt(int a, int b, double t) {
    return ((1 - t) * a + t * b).round();
  }

  N? genericNumLerp<N extends num>(N? a, N? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return (a * (1 - t) + b * t) as N;
  }

  P snap<P>(P from, P to, double t) {
    return t < 0.5 ? from : to;
  }
}
