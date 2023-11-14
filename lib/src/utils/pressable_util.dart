import 'package:flutter/material.dart';

import '../helpers/extensions/string_ext.dart';
import '../variants/context_variant.dart';
import '../widgets/pressable/pressable.notifier.dart';
import '../widgets/pressable/pressable_state.dart';
import 'context_variant_util/on_helper_util.dart';

final onPress = _onState(PressableState.pressed);
final onLongPress = _onState(PressableState.longPressed);
final onHover = _onState(PressableState.hover);
final onDisabled = _onState(PressableState.disabled);

final onEnabled = onNot(onDisabled);

final onFocus = ContextVariant(
  'on-focus',
  when: (BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.focus == true;
  },
);

ContextVariant _onState(PressableState state) {
  return ContextVariant(
    'on-${state.name.paramCase}',
    when: (BuildContext context) {
      final pressable = PressableNotifier.of(context);

      return pressable?.state == state;
    },
  );
}
