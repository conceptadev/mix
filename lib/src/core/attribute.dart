import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';

@immutable
abstract class Attribute with Comparable {
  const Attribute();
}

abstract class StyleAttribute extends Attribute {
  const StyleAttribute();

  // Type used for combining attributes
  Type get type;
}

abstract class Dto<T> with Comparable, Mergeable<Dto>, Resolver<T> {
  const Dto();
}

mixin Resolver<Value> {
  Value resolve(MixData mix);
}

// TODO: Mergeable to do Attribute only
mixin Mergeable<T> {
  T merge(covariant T? other);
}

// TODO: Should all ResolvableAttribute be the Style Attribute high level?
abstract class ResolvableAttribute<Self, Value> extends StyleAttribute
    with Resolver<Value>, Mergeable<Self> {
  const ResolvableAttribute();

  T? get<T extends StyleAttribute>(MixData mix, T? attribute) {
    // If the attribute is not mergeable, it means it is a scalar attribute
    // If its not null just return it as its priority
    if (attribute != null && attribute is! Mergeable) return attribute;

    final mixAttributes = mix.whereType<T>();

    // If its empty just return attribute
    if (mixAttributes.isEmpty) return attribute;

    // If its not mergeable return itself which has priority or the last of mix attributes
    if (attribute is! Mergeable) return attribute ?? mixAttributes.last;

    final mergeableList = [attribute, ...mixAttributes] as List<Mergeable>;

    //  If its mergeable
    return mergeableList.reduce((value, element) => value.merge(element)) as T?;
  }

  @override
  Self merge(covariant Self? other);

  @override
  Type get type => Self;
}

mixin SingleChildRenderAttributeMixin<W extends RenderObjectWidget>
    on StyleAttribute {
  W build(MixData mix, Widget child);
}

mixin MultiChildRenderAttributeMixin<W extends MultiChildRenderObjectWidget>
    on StyleAttribute {
  W render(MixData mix, List<Widget> children);
}

@immutable
abstract class Mixture<T extends Mixture<T>> extends ThemeExtension<T>
    with Comparable, Mergeable<T> {
  const Mixture();

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

  P lerpSnap<P>(P from, P to, double t) {
    return t < 0.5 ? from : to;
  }
}
