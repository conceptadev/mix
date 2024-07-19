import 'package:flutter/material.dart';

import 'widget_state_controller.dart';

class InteractiveMixStateWidget extends StatefulWidget {
  const InteractiveMixStateWidget({
    super.key,
    required this.child,
    this.disabled = false,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.onKey,
    this.onShowFocusHighlight,
    this.onShowHoverHighlight,
    this.onKeyEvent,
    this.canRequestFocus = true,
    this.mouseCursor = MouseCursor.defer,
    this.shortcuts,
    this.actions,
  });

  final bool disabled;
  final MouseCursor mouseCursor;

  final bool canRequestFocus;

  final Widget child;
  final Function(bool focus)? onShowFocusHighlight;
  final Function(bool hover)? onShowHoverHighlight;

  final ValueChanged<bool>? onFocusChange;

  final Map<ShortcutActivator, Intent>? shortcuts;

  final bool autofocus;

  final FocusNode? focusNode;

  final FocusOnKeyEventCallback? onKey;

  final FocusOnKeyEventCallback? onKeyEvent;

  final Map<Type, Action<Intent>>? actions;

  @override
  State createState() => _InteractiveStateBuilderState();
}

class _InteractiveStateBuilderState extends State<InteractiveMixStateWidget> {
  late final InteractiveMixStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = InteractiveMixStateController();

    _controller.update(InteractiveMixState.disabled, widget.disabled);
  }

  void _onShowFocusHighlight(bool hasFocus) {
    _controller.update(InteractiveMixState.focused, hasFocus);
    widget.onShowFocusHighlight?.call(hasFocus);
  }

  void _onShowHoverHighlight(bool isHovered) {
    _controller.update(InteractiveMixState.hovered, isHovered);
    widget.onShowHoverHighlight?.call(isHovered);
  }

  @override
  void didUpdateWidget(InteractiveMixStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.disabled != oldWidget.disabled) {
      _controller.update(InteractiveMixState.disabled, widget.disabled);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      enabled: widget.disabled,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      onShowFocusHighlight: _onShowFocusHighlight,
      onShowHoverHighlight: _onShowHoverHighlight,
      onFocusChange: widget.onFocusChange,
      mouseCursor: widget.mouseCursor,
      child: MixStateBuilder(
        controller: _controller,
        builder: (_) => widget.child,
      ),
    );
  }
}

enum InteractiveMixState {
  focused,
  disabled,
  hovered;

  static const of = MixStateController.ofType<InteractiveMixStateController>;

  static const maybeOf =
      MixStateController.maybeOfType<InteractiveMixStateController>;
}

class InteractiveMixStateController
    extends MixStateEnumController<InteractiveMixState> {
  bool get enabled => !disabled;
  bool get disabled => has(InteractiveMixState.disabled);
  bool get focused => has(InteractiveMixState.focused);
  bool get hovered => has(InteractiveMixState.hovered);

  set disabled(bool value) => update(InteractiveMixState.disabled, !value);
  set focused(bool value) => update(InteractiveMixState.focused, value);
  set hovered(bool value) => update(InteractiveMixState.hovered, value);
}
