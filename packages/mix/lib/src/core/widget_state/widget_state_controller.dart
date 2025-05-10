import "package:flutter/material.dart";

extension MixWidgetState on WidgetState {
  static const of = MixWidgetStateModel.of;
  static const hasStateOf = MixWidgetStateModel.hasStateOf;
}

/// A controller that manages the state of a widget.
///
/// [MixWidgetStateController] tracks various states of a widget, such as
/// [disabled], [hovered], [focused], [pressed], [dragged], [selected].
/// These states are stored in a [Set] called [value].
///
/// The controller extends [ChangeNotifier], allowing listeners to be notified
/// when the state of the widget changes.
@Deprecated('Use WidgetStatesController instead')
typedef MixWidgetStateController = WidgetStatesController;

extension WidgetStatesExt on WidgetStatesController {
  /// The current set of states for the widget.
  ///
  /// This is annotated with `@visibleForTesting` to indicate that it is
  /// accessible for testing purposes.

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

  /// Checks if the widget is currently in the given state [key].
  bool has(WidgetState key) => value.contains(key);
}

class MixWidgetStateModel extends InheritedModel<WidgetState> {
  const MixWidgetStateModel({
    super.key,
    required this.disabled,
    required this.hovered,
    required this.focused,
    required this.pressed,
    required this.dragged,
    required this.selected,
    required this.error,
    required super.child,
  });

  static MixWidgetStateModel? of(BuildContext context, [WidgetState? state]) {
    return InheritedModel.inheritFrom<MixWidgetStateModel>(
      context,
      aspect: state,
    );
  }

  static bool hasStateOf(BuildContext context, WidgetState state) {
    final model = of(context, state);
    if (model == null) {
      return false;
    }

    return switch (state) {
      WidgetState.disabled => model.disabled,
      WidgetState.hovered => model.hovered,
      WidgetState.focused => model.focused,
      WidgetState.pressed => model.pressed,
      WidgetState.dragged => model.dragged,
      WidgetState.selected => model.selected,
      WidgetState.error => model.error,
      WidgetState.scrolledUnder => false,
    };
  }

  final bool disabled;
  final bool hovered;
  final bool focused;
  final bool pressed;
  final bool dragged;
  final bool selected;
  final bool error;

  @override
  bool updateShouldNotify(MixWidgetStateModel oldWidget) {
    return oldWidget.disabled != disabled ||
        oldWidget.hovered != hovered ||
        oldWidget.focused != focused ||
        oldWidget.pressed != pressed ||
        oldWidget.dragged != dragged ||
        oldWidget.selected != selected ||
        oldWidget.error != error;
  }

  @override
  bool updateShouldNotifyDependent(
    MixWidgetStateModel oldWidget,
    Set<WidgetState> dependencies,
  ) {
    return oldWidget.disabled != disabled &&
            dependencies.contains(WidgetState.disabled) ||
        oldWidget.hovered != hovered &&
            dependencies.contains(WidgetState.hovered) ||
        oldWidget.focused != focused &&
            dependencies.contains(WidgetState.focused) ||
        oldWidget.pressed != pressed &&
            dependencies.contains(WidgetState.pressed) ||
        oldWidget.dragged != dragged &&
            dependencies.contains(WidgetState.dragged) ||
        oldWidget.selected != selected &&
            dependencies.contains(WidgetState.selected) ||
        oldWidget.error != error && dependencies.contains(WidgetState.error);
  }
}
