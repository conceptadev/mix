import 'package:flutter/foundation.dart';

import '../factory/mix_provider_data.dart';
import 'animation/animation.attribute.dart';
import 'attribute.dart';
import 'helpers/list.attribute.dart';
import 'visible/visible.attribute.dart';

abstract class ResolvableAttribute<T> extends Attribute with Resolvable<T> {
  const ResolvableAttribute({super.key});

  K? resolveAttribute<K, R extends ResolvableAttribute<K>>(
    covariant R? resolvable,
    MixData mix,
  ) {
    R? selectedAttribute = resolvable;

    selectedAttribute ??= mix.get<R>();

    return selectedAttribute?.resolve(mix);
  }

  T call(MixData mix) => resolve(mix);

  @override
  M mergeAttribute<M extends Mergeable>(M? currentValue, M? newValue) {
    return currentValue?.merge(newValue) ?? newValue;
  }
}

typedef ValueModifier<T> = T Function(T value);

abstract class ModifiableAttribute<T> extends ResolvableAttribute<T> {
  @protected
  final T value;
  @protected
  final ValueModifier<T>? modifier;

  const ModifiableAttribute(this.value, {super.key, this.modifier});

  @protected
  T modify(T valueToModify) => modifier?.call(valueToModify) ?? valueToModify;
}

abstract class WidgetAttributes<T extends WidgetAttributesResolved>
    extends ResolvableAttribute<T> {
  final AnimationAttribute? animation;
  final VisibleAttribute? visible;
  const WidgetAttributes({super.key, this.visible, this.animation});

  @override
  T resolve(MixData mix);
}

abstract class WidgetAttributesResolved extends Dto {
  final AnimationAttributeResolved? animation;
  final bool visible;
  const WidgetAttributesResolved({
    required this.animation,
    required this.visible,
  });
}

abstract class ResolvableDto<T> extends Dto with Mergeable, Resolvable<T> {
  const ResolvableDto();
}

extension ListResolvableAttributeExt<T> on List<ResolvableAttribute<T>> {
  List<T> resolveAll(MixData mix) {
    return map((e) => e.resolve(mix)).toList();
  }

  // .list, gets a List of T and turns into a ListAttribute<ResolvableAttribute<T>>
  ListAtttribute<ResolvableAttribute<T>> get list =>
      ListAtttribute<ResolvableAttribute<T>>(this);
}
