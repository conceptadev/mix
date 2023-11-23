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

@immutable
abstract class ScalarAttribute<Value> extends StyleAttribute {
  final Value value;
  const ScalarAttribute(this.value);

  @override
  ScalarAttribute<Value> merge(covariant ScalarAttribute<Value>? other);

  @override
  get props => [value];
}

// TODO: Should all ResolvableAttribute be the Style Attribute high level?
abstract class ResolvableAttribute<Value> extends StyleAttribute
    with Resolver<Value> {
  const ResolvableAttribute();

  V? getValue<T extends ScalarAttribute<V>, V>(MixData mix, T? attr) {
    if (attr != null) return attr.value;

    return mix.attributeOfType<T>()?.value;
  }

  V? getResolved<T extends ResolvableAttribute<V>, V>(MixData mix, T? attr) {
    if (attr != null) return attr.resolve(mix);

    return mix.attributeOfType<T>()?.resolve(mix);
  }

  @override
  ResolvableAttribute<Value> merge(covariant ResolvableAttribute<Value>? other);
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
abstract class RecipeMix<T extends RecipeMix<T>> extends ThemeExtension<T>
    with Comparable {
  const RecipeMix();

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
