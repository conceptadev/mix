import 'package:flutter/material.dart';

import '../../helpers/string_ext.dart';
import '../../variants/variant.dart';
import 'gesture_state.notifier.dart';

final onPress = _onState(GestureState.pressed);
final onLongPress = _onState(GestureState.longPressed);
// final onHover = _onState(GestureState.hover);
final onDisabled = _onStatus(GestureStatus.disabled);
final onEnabled = _onStatus(GestureStatus.enabled);

final onFocus = ContextVariant(
  'on-focus',
  (context) => GestureStateNotifier.of(context)?.focus == true,
);

final onHover = ContextVariant(
  'on-hover',
  (context) => GestureStateNotifier.of(context)?.hover == true,
);

@immutable
class GestureVariant extends ContextVariant {
  const GestureVariant(super.name, super.when);
}

GestureVariant _onState(GestureState state) {
  return GestureVariant(
    'on-${state.name.paramCase}',
    (context) => GestureStateNotifier.of(context)?.state == state,
  );
}

GestureVariant _onStatus(GestureStatus status) {
  return GestureVariant(
    'on-${status.name.paramCase}',
    (context) => GestureStateNotifier.of(context)?.status == status,
  );
}
