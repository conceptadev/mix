import 'dart:math';

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';
import 'attribute.dart';

abstract class ValueAttribute<T extends ValueAttribute<T, R>, R>
    extends StyleAttribute<R> {
  final R value;

  const ValueAttribute(this.value);

// Factory for merge methods
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

abstract class ModifiableDtoAttribute<D extends ModifiableDto<R>, R>
    extends DtoAttribute<ModifiableDtoAttribute<D, R>, D, R> {
  const ModifiableDtoAttribute(super.value);
}

abstract class DtoAttribute<
    Attr extends DtoAttribute<Attr, Value, ResolvedValue>,
    Value extends ModifiableDto<ResolvedValue>,
    ResolvedValue> extends StyleAttribute<ResolvedValue> {
  final Value value;

  const DtoAttribute(this.value);

// Factory for merge methods
  // ignore: avoid-shadowing
  Attr create(Value value);

  @override
  ResolvedValue resolve(MixData mix) {
    return value.resolve(mix);
  }

  @override
  Attr merge(Attr? other) {
    if (other == null) return create(value);

    return create((value).merge(other.value));
  }

  @override
  get props => [value];
}

abstract class StyleAttribute<T> extends Attribute with Resolvable<T> {
  const StyleAttribute();

  K? resolveAttr<K, R extends StyleAttribute<K>>(
    covariant R? resolvable,
    MixData mix,
  ) {
    R? selectedAttribute = resolvable;

    selectedAttribute ??= mix.attributeOfType<R>();

    return selectedAttribute?.resolve(mix);
  }

  K? resolveDto<K, R extends StyleAttribute<K>>(
    covariant R? resolvable,
    MixData mix,
  ) {
    return resolvable?.resolve(mix);
  }

  List<M> combinedAttrList<M extends Mergeable>(
    List<M>? current,
    List<M>? other,
  ) {
    return [...current ?? [], ...other ?? []];
  }

  List<M> mergeAttrList<M extends Mergeable>(
    List<M>? current,
    List<M>? other,
  ) {
    if (current == null && other == null) return [];
    if (current == null) return other ?? [];
    if (other == null) return current;

    if (current.isEmpty) return other;

    final listLength = current.length;
    final otherLength = other.length;
    final maxLength = max(listLength, otherLength);

    return List<M>.generate(maxLength, (int index) {
      if (index < listLength && index < otherLength) {
        return mergeAttr(current[index], other[index]);
      } else if (index < listLength) {
        return current[index];
      }

      return other[index];
    });
  }

  @override
  M mergeAttr<M extends Mergeable>(M? current, M? other) {
    return current?.merge(other) ?? other;
  }
}

typedef ValueModifier<T> = T Function(T value);

abstract class ModifiableDto<T> extends Dto<T> {
  final T value;
  @visibleForTesting
  final ValueModifier<T>? modifier;

  const ModifiableDto(this.value, {this.modifier});

  @protected
  T modify(T valueToModify) => modifier?.call(valueToModify) ?? valueToModify;
}

abstract class SpecAttribute<T extends MixExtension<T>>
    extends StyleAttribute<T> {
  const SpecAttribute();
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

extension ListResolvableAttributeExt<T> on List<StyleAttribute<T>> {
  List<T> resolveAll(MixData mix) {
    return map((e) => e.resolve(mix)).toList();
  }
}
