import "package:flutter/material.dart";

import "internal/mix_widget_state_builder.dart";

enum MixWidgetState {
  hovered,
  focused,
  pressed,
  dragged,
  selected,
  disabled,
  longPressed;

  static const of = MixWidgetStateModel.of;
  static const hasStateOf = MixWidgetStateModel.hasStateOf;
}

class MixWidgetStateController extends ChangeNotifier {
  @visibleForTesting
  Set<MixWidgetState> value = {};

  bool get disabled => value.contains(MixWidgetState.disabled);
  bool get hovered => value.contains(MixWidgetState.hovered);
  bool get focused => value.contains(MixWidgetState.focused);
  bool get pressed => value.contains(MixWidgetState.pressed);
  bool get dragged => value.contains(MixWidgetState.dragged);
  bool get selected => value.contains(MixWidgetState.selected);
  bool get longPressed => value.contains(MixWidgetState.longPressed);

  set disabled(bool value) => update(MixWidgetState.disabled, value);
  set hovered(bool value) => update(MixWidgetState.hovered, value);
  set focused(bool value) => update(MixWidgetState.focused, value);
  set pressed(bool value) => update(MixWidgetState.pressed, value);
  set dragged(bool value) => update(MixWidgetState.dragged, value);
  set selected(bool value) => update(MixWidgetState.selected, value);

  set longPressed(bool value) => update(MixWidgetState.longPressed, value);

  // ignore: prefer-named-boolean-parameters
  void update(MixWidgetState key, bool add) {
    final valueHasChanged = add ? value.add(key) : value.remove(key);

    if (valueHasChanged) {
      notifyListeners();
    }
  }

  void batch(List<(MixWidgetState, bool)> updates) {
    var valueHasChanged = false;
    for (final update in updates) {
      final key = update.$1;
      final add = update.$2;
      if (add) {
        valueHasChanged |= value.add(key);
      } else {
        valueHasChanged |= value.remove(key);
      }
    }

    if (valueHasChanged) {
      notifyListeners();
    }
  }

  bool has(MixWidgetState key) => value.contains(key);
}
