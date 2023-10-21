import 'dart:math';

import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';

abstract class StyleAttribute<T> extends Attribute with Resolvable<T> {
  const StyleAttribute();

  K? resolveAttr<K, R extends StyleAttribute<K>>(
    covariant R? resolvable,
    MixData mix,
  ) {
    R? selectedAttribute = resolvable;

    selectedAttribute ??= mix.attributeOf<R>();

    return selectedAttribute?.resolve(mix);
  }

  K? resolveDto<K, R extends Dto<K>>(covariant R? resolvable, MixData mix) {
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
  @visibleForTesting
  final T value;
  @visibleForTesting
  final ValueModifier<T>? modifier;

  const ModifiableDto(this.value, {this.modifier});

  @protected
  T modify(T valueToModify) => modifier?.call(valueToModify) ?? valueToModify;
}

abstract class SpecAttribute<T extends Spec<T>> extends StyleAttribute<T> {
  const SpecAttribute();
}

abstract class Spec<T extends ThemeExtension<T>> extends ThemeExtension<T>
    with Comparable {
  const Spec();

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
