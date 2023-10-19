import 'package:flutter/foundation.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin/compare_mixin.dart';
import 'attribute.dart';
import 'helpers/list.attribute.dart';

abstract class StyleAttribute<T> extends Attribute with Resolvable<T> {
  const StyleAttribute({super.key});

  K? resolveAttribute<K, R extends StyleAttribute<K>>(
    covariant R? resolvable,
    MixData mix,
  ) {
    R? selectedAttribute = resolvable;

    selectedAttribute ??= mix.attributeOf<R>();

    return selectedAttribute?.resolve(mix);
  }

  @override
  M mergeProp<M extends Mergeable>(M? currentValue, M? newValue) {
    return currentValue?.merge(newValue) ?? newValue;
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

abstract class SpecAttribute<T extends Spec> extends StyleAttribute<T> {
  const SpecAttribute({super.key});

  @override
  T resolve(MixData mix);
}

abstract class Spec with Comparable {
  const Spec();
}

extension ListResolvableAttributeExt<T> on List<StyleAttribute<T>> {
  List<T> resolveAll(MixData mix) {
    return map((e) => e.resolve(mix)).toList();
  }

  // .list, gets a List of T and turns into a ListAttribute<ResolvableAttribute<T>>
  ListAtttribute<StyleAttribute<T>> get list =>
      ListAtttribute<StyleAttribute<T>>(this);
}
