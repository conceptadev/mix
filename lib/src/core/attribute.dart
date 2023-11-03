import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';

@immutable
abstract class Attribute with Comparable, Mergeable {
  const Attribute();
}

mixin Resolvable<T> {
  T resolve(MixData mix);
}

mixin Mergeable<T> {
  T merge(covariant T? other);

  M mergeAttr<M extends Mergeable>(M? current, M? other) {
    return current?.merge(other) ?? other;
  }
}

@immutable
abstract class ScalarAttribute<T extends ScalarAttribute<T, R>, R>
    extends VisualAttribute<R> {
  final R value;

  const ScalarAttribute(this.value);

  // Factory for merge methods
  // ignore: avoid-shadowing
  T create(R value);

  @override
  R resolve(MixData mix) {
    return value is Resolvable ? (value as Resolvable).resolve(mix) : value;
  }

  @override
  T merge(T? other) {
    if (other == null) return create(value);

    return value is Mergeable
        ? create((value as Mergeable).merge(other.value))
        : create(other.value);
  }

  @override
  get props => [value];
}

@immutable
abstract class VisualAttribute<T> extends Attribute with Resolvable<T> {
  const VisualAttribute();
}

@immutable
abstract class MixExtension<T extends MixExtension<T>> extends ThemeExtension<T>
    with Comparable {
  const MixExtension();

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
