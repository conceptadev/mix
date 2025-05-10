import "package:flutter/material.dart";

import "../widget_state_controller.dart";

class MixWidgetStateBuilder extends StatelessWidget {
  const MixWidgetStateBuilder({
    super.key,
    required this.controller,
    required this.builder,
  });

  final WidgetStatesController controller;

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
          error: controller.error,
          child: Builder(builder: builder),
        );
      },
    );
  }
}
