import 'package:flutter/foundation.dart';

import '../factory/mix_provider_data.dart';
import 'animation/animation.attribute.dart';
import 'attribute.dart';
import 'helpers/list.attribute.dart';
import 'visible/visible.attribute.dart';

abstract class StyleAttribute<T> extends Attribute with Resolvable<T> {
  const StyleAttribute({super.key});

  K? resolveAttribute<K, R extends StyleAttribute<K>>(
    covariant R? resolvable,
    MixData mix,
  ) {
    R? selectedAttribute = resolvable;

    selectedAttribute ??= mix.get<R>();

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

abstract class WidgetAttributes<T extends WidgetAttributesResolved>
    extends StyleAttribute<T> {
  final AnimationAttribute? animation;
  final VisibleAttribute? visible;
  const WidgetAttributes({super.key, this.visible, this.animation});

  @override
  T resolve(MixData mix);
}

abstract class WidgetAttributesResolved extends DataClass {
  final AnimationAttributeResolved? animation;
  final bool visible;
  const WidgetAttributesResolved({
    required this.animation,
    required this.visible,
  });
}

extension ListResolvableAttributeExt<T> on List<StyleAttribute<T>> {
  List<T> resolveAll(MixData mix) {
    return map((e) => e.resolve(mix)).toList();
  }

  // .list, gets a List of T and turns into a ListAttribute<ResolvableAttribute<T>>
  ListAtttribute<StyleAttribute<T>> get list =>
      ListAtttribute<StyleAttribute<T>>(this);
}
