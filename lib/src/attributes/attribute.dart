import 'dart:math';

import 'package:flutter/material.dart';

import '../core/equality/compare_mixin.dart';
import '../factory/mix_provider_data.dart';

@immutable
abstract class Attribute with Comparable {
  const Attribute();
}

abstract class StyleAttribute extends Attribute {
  const StyleAttribute();
}

abstract class Dto<Self extends Dto<Self>> with Comparable, Mergeable<Self> {
  const Dto();
}

abstract class MergeableStyleAttribute extends StyleAttribute
    with Mergeable<MergeableStyleAttribute> {
  const MergeableStyleAttribute();
}

mixin Resolver<Value> {
  Value resolve(MixData mix);
}

// TODO: Mergeable to do Attribute only
mixin Mergeable<T> {
  T merge(covariant T? other);
}

extension MergeableListExt<T extends Mergeable> on List<T> {
  List<T> merge(List<T>? other) {
    if (other == null) return this;

    if (isEmpty) return other;

    final listLength = length;
    final otherLength = other.length;
    final maxLength = max(listLength, otherLength);

    return List<T>.generate(maxLength, (int index) {
      if (index < listLength && index < otherLength) {
        final currentValue = this[index];
        final otherValue = other[index];

        return currentValue.merge(otherValue);
      } else if (index < listLength) {
        return this[index];
      }

      return other[index];
    });
  }
}

// TODO: Rename ValueAttribute
@immutable
abstract class ScalarAttribute<Self extends ScalarAttribute<Self, Value>, Value>
    extends StyleAttribute with Mergeable<Self> {
  final Value value;

  const ScalarAttribute(this.value);

  Self Function(Value) get create;

  @override
  Self merge(covariant Self? other) {
    if (other == null) return create(value);

    return value is Mergeable
        ? create((value as Mergeable).merge(other.value))
        : create(other.value);
  }

  @override
  get props => [value];
}

@immutable
abstract class ResolvableAttribute<
    Self extends ResolvableAttribute<Self, Data, Value>,
    Data extends Resolver<Value>,
    Value> extends ScalarAttribute<Self, Data> with Resolver<Value> {
  const ResolvableAttribute(super.value);

  @override
  Value resolve(MixData mix) => value.resolve(mix);

  @override
  Self Function(Data) get create;
}

@immutable
abstract class RecipeAttribute<Value extends MixRecipe<Value>>
    extends StyleAttribute with Resolver<Value> {
  const RecipeAttribute();
}

@immutable
abstract class MixRecipe<T extends MixRecipe<T>> extends ThemeExtension<T>
    with Comparable {
  const MixRecipe();

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
