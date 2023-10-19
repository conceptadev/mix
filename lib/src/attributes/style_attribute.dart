import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin/compare_mixin.dart';
import 'attribute.dart';
import 'helpers/list.attribute.dart';

abstract class StyleAttribute<T> extends Attribute with Resolvable<T> {
  const StyleAttribute();

  K? resolveAttribute<K, R extends StyleAttribute<K>>(
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

  @override
  M mergeProp<M extends Mergeable>(M? current, M? other) {
    return current?.merge(other) ?? other;
  }
}

typedef ValueModifier<T> = T Function(T value);

abstract class ModifiableDto<T> extends Dto<T> {
  @protected
  final T value;
  @protected
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

  P? snap<P>(P? from, P? to, double t) {
    return t < 0.5 ? from : to;
  }
}

extension ListResolvableAttributeExt<T> on List<StyleAttribute<T>> {
  List<T> resolveAll(MixData mix) {
    return map((e) => e.resolve(mix)).toList();
  }

  // .list, gets a List of T and turns into a ListAttribute<ResolvableAttribute<T>>
  ListAtttribute<StyleAttribute<T>> get list =>
      ListAtttribute<StyleAttribute<T>>(this);
}
