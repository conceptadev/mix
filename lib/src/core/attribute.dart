import 'package:flutter/material.dart';

import '../factory/exports.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';

abstract class Attribute with Comparable, Mergeable {
  const Attribute();
}

abstract class Dto<R> with Comparable, Mergeable, Resolvable<R> {
  const Dto();
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

abstract class ScalarVisualAttribute<T extends ScalarVisualAttribute<T, R>, R>
    extends VisualAttribute<R> {
  final R value;

  const ScalarVisualAttribute(this.value);

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

abstract class DtoAttribute<
    Attr extends DtoAttribute<Attr, Value, ResolvedValue>,
    Value extends Dto<ResolvedValue>,
    ResolvedValue> extends VisualAttribute<ResolvedValue> {
  final Value value;

  const DtoAttribute(this.value);

  // Factory for merge methods
  Attr create(Value value);

  @override
  ResolvedValue resolve(MixData mix) {
    return value.resolve(mix);
  }

  @override
  Attr merge(Attr? other) {
    if (other == null) return create(value);

    return create(value.merge(other.value));
  }

  @override
  get props => [value];
}

abstract class VisualAttribute<T> extends Attribute with Resolvable<T> {
  const VisualAttribute();

  K? resolveAttribute<K, R extends VisualAttribute<K>>(
    covariant R? resolvable,
    MixData mix,
  ) {
    R? selectedAttribute = resolvable;

    selectedAttribute ??= mix.attributeOfType<R>();

    return selectedAttribute?.resolve(mix);
  }
}

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
