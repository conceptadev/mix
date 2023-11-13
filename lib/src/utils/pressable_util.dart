import 'package:flutter/material.dart';

import '../helpers/extensions/string_ext.dart';
import '../variants/context_variant.dart';
import '../widgets/pressable/pressable.notifier.dart';
import '../widgets/pressable/pressable_state.dart';
import 'context_variant_util.dart';

final onPress = _pressableVariant(PressableState.pressed);
final onLongPress = _pressableVariant(PressableState.longPressed);
final onHover = _pressableVariant(PressableState.hover);
final onDisabled = _pressableVariant(PressableState.disabled);

final onEnabled = onNot(onDisabled);

final onFocus = ContextVariant(
  'on-focus',
  when: (BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.focus == true;
  },
);

ContextVariant _pressableVariant(PressableState state) {
  return ContextVariant(
    'on-${state.name.paramCase}',
    when: (BuildContext context) {
      final pressable = PressableNotifier.of(context);

      return pressable?.state == state;
    },
  );
}
