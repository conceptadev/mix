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
        return MixWidgetStateModel.controller(
          controller: controller,
          child: Builder(builder: builder),
        );
      },
    );
  }
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

  MixWidgetStateModel.controller({
    super.key,
    required super.child,
    required MixWidgetStateController controller,
  })  : disabled = controller.disabled,
        hovered = controller.hovered,
        focused = controller.focused,
        pressed = controller.pressed,
        dragged = controller.dragged,
        selected = controller.selected,
        error = controller.error;

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
