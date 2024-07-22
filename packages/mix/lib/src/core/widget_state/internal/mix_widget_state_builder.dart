import "package:flutter/material.dart";

import "../widget_state_controller.dart";

class MixWidgetStateBuilder extends StatelessWidget {
  const MixWidgetStateBuilder({
    super.key,
    required this.controller,
    required this.builder,
  });

  final MixWidgetStateController controller;

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return MixWidgetStateModel(
          disabled: controller.disabled,
          hovered: controller.hovered,
          focused: controller.focused,
          pressed: controller.pressed,
          dragged: controller.dragged,
          selected: controller.selected,
          longPressed: controller.longPressed,
          child: Builder(builder: builder),
        );
      },
    );
  }
}

class MixWidgetStateModel extends InheritedModel<MixWidgetState> {
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

  final bool disabled;
  final bool hovered;
  final bool focused;
  final bool pressed;
  final bool dragged;
  final bool selected;
  final bool longPressed;

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
