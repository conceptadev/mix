import "package:flutter/material.dart";

import "internal/mix_widget_state_builder.dart";

extension MixWidgetState on WidgetState {
  static const of = MixWidgetStateModel.of;
  static const hasStateOf = MixWidgetStateModel.hasStateOf;
}

/// A controller that manages the state of a widget.
///
/// [MixWidgetStateController] tracks various states of a widget, such as
/// [disabled], [hovered], [focused], [pressed], [dragged], [selected], and
/// [longPressed]. These states are stored in a [Set] called [value].
///
/// The controller extends [ChangeNotifier], allowing listeners to be notified
/// when the state of the widget changes.
class MixWidgetStateController extends ChangeNotifier {
  /// The current set of states for the widget.
  ///
  /// This is annotated with `@visibleForTesting` to indicate that it is
  /// accessible for testing purposes.
  @visibleForTesting
  Set<WidgetState> value = {};

  /// Whether the widget is currently in the disabled state.
  bool get disabled => value.contains(WidgetState.disabled);

  /// Whether the widget is currently being hovered over.
  bool get hovered => value.contains(WidgetState.hovered);

  /// Whether the widget currently has focus.
  bool get focused => value.contains(WidgetState.focused);

  /// Whether the widget is currently being pressed.
  bool get pressed => value.contains(WidgetState.pressed);

  /// Whether the widget is currently being dragged.
  bool get dragged => value.contains(WidgetState.dragged);

  /// Whether the widget is currently in the selected state.
  bool get selected => value.contains(WidgetState.selected);

  /// Whether the widget is currently in the error state.
  bool get error => value.contains(WidgetState.error);

  /// Sets whether the widget is in the disabled state.
  set disabled(bool value) => update(WidgetState.disabled, value);

  /// Sets whether the widget is being hovered over.
  set hovered(bool value) => update(WidgetState.hovered, value);

  /// Sets whether the widget has focus.
  set focused(bool value) => update(WidgetState.focused, value);

  /// Sets whether the widget is being pressed.
  set pressed(bool value) => update(WidgetState.pressed, value);

  /// Sets whether the widget is being dragged.
  set dragged(bool value) => update(WidgetState.dragged, value);

  /// Sets whether the widget is in the selected state.
  set selected(bool value) => update(WidgetState.selected, value);

  /// Sets whether the widget is in the selected state.
  set error(bool value) => update(WidgetState.error, value);

  /// Updates the state of the widget for a given [key].
  ///
  /// If [add] is true, the [key] state is added to [value]. If false, it is
  /// removed. Listeners are notified if the state has changed.
  // ignore: prefer-named-boolean-parameters
  void update(WidgetState key, bool add) {
    final valueHasChanged = add ? value.add(key) : value.remove(key);

    if (valueHasChanged) {
      notifyListeners();
    }
  }

  /// Batch updates the state of the widget with multiple state changes.
  ///
  /// [updates] is a list of tuples, where each tuple contains a state [key]
  /// and a boolean [add] indicating whether to add or remove the state.
  /// Listeners are notified if any state has changed.
  void batch(List<(WidgetState, bool)> updates) {
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

  /// Checks if the widget is currently in the given state [key].
  bool has(WidgetState key) => value.contains(key);
}
