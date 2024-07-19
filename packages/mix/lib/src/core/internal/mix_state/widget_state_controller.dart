import "package:flutter/material.dart";

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

class MixWidgetStateModel extends InheritedModel<MixWidgetState> {
  final bool disabled;
  final bool hovered;
  final bool focused;
  final bool pressed;
  final bool dragged;
  final bool selected;
  final bool longPressed;

  const MixWidgetStateModel({
    super.key,
    required this.disabled,
    required this.hovered,
    required this.focused,
    required this.pressed,
    required this.dragged,
    required this.selected,
    required this.longPressed,
    required super.child,
  });

  static MixWidgetStateModel? of(
    BuildContext context, [
    MixWidgetState? state,
  ]) {
    return InheritedModel.inheritFrom<MixWidgetStateModel>(
      context,
      aspect: state,
    );
  }

  static bool hasStateOf(BuildContext context, MixWidgetState state) {
    final model = of(context, state);
    if (model == null) {
      return false;
    }
    return switch (state) {
      MixWidgetState.disabled => model.disabled,
      MixWidgetState.hovered => model.hovered,
      MixWidgetState.focused => model.focused,
      MixWidgetState.pressed => model.pressed,
      MixWidgetState.dragged => model.dragged,
      MixWidgetState.selected => model.selected,
      MixWidgetState.longPressed => model.longPressed,
    };
  }

  @override
  bool updateShouldNotify(MixWidgetStateModel oldWidget) {
    return oldWidget.disabled != disabled ||
        oldWidget.hovered != hovered ||
        oldWidget.focused != focused ||
        oldWidget.pressed != pressed ||
        oldWidget.dragged != dragged ||
        oldWidget.selected != selected ||
        oldWidget.longPressed != longPressed;
  }

  @override
  bool updateShouldNotifyDependent(
    MixWidgetStateModel oldWidget,
    Set<MixWidgetState> dependencies,
  ) {
    return oldWidget.disabled != disabled &&
            dependencies.contains(MixWidgetState.disabled) ||
        oldWidget.hovered != hovered &&
            dependencies.contains(MixWidgetState.hovered) ||
        oldWidget.focused != focused &&
            dependencies.contains(MixWidgetState.focused) ||
        oldWidget.pressed != pressed &&
            dependencies.contains(MixWidgetState.pressed) ||
        oldWidget.dragged != dragged &&
            dependencies.contains(MixWidgetState.dragged) ||
        oldWidget.selected != selected &&
            dependencies.contains(MixWidgetState.selected) ||
        oldWidget.longPressed != longPressed &&
            dependencies.contains(MixWidgetState.longPressed);
  }
}

class MixWidgetStateBuilder extends StatefulWidget {
  const MixWidgetStateBuilder({
    super.key,
    required this.controller,
    required this.builder,
  });

  final MixWidgetStateController controller;

  final Widget Function(BuildContext context) builder;

  @override
  State createState() => _MixWidgetStateBuilder();
}

class _MixWidgetStateBuilder extends State<MixWidgetStateBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          return MixWidgetStateModel(
            disabled: widget.controller.disabled,
            hovered: widget.controller.hovered,
            focused: widget.controller.focused,
            pressed: widget.controller.pressed,
            dragged: widget.controller.dragged,
            selected: widget.controller.selected,
            longPressed: widget.controller.longPressed,
            child: Builder(builder: widget.builder),
          );
        });
  }
}
