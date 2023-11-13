import 'package:flutter/material.dart';

import 'pressable.notifier.dart';
import 'pressable_state.dart';

class Pressable extends StatefulWidget {
  const Pressable({
    this.autofocus = false,
    this.behavior,
    required this.child,
    this.focusNode,
    super.key,
    this.onFocusChange,
    this.onLongPress,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Function(bool focus)? onFocusChange;

  final HitTestBehavior? behavior;

  @override
  // Ignore no need to make this api public.
  // ignore: library_private_types_in_public_api
  _PressableWidgetState createState() => _PressableWidgetState();
}

class _PressableWidgetState extends State<Pressable> {
  late FocusNode _node;

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? _createFocusNode();
  }

  FocusNode _createFocusNode() {
    return FocusNode(debugLabel: '${widget.runtimeType}');
  }

  @override
  void didUpdateWidget(Pressable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      _node = widget.focusNode ?? _node;
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _node.dispose();
    super.dispose();
  }

  bool _hover = false;
  bool _focus = false;
  bool _pressed = false;
  bool _longpressed = false;

  bool get _onEnabled => widget.onPressed != null || widget.onLongPress != null;

  PressableState get _state {
    if (widget.onPressed == null && widget.onLongPress == null) {
      return PressableState.disabled;
    }
    // Long pressed has priority over pressed
    // Due to delay of removing the _press state
    if (_longpressed) {
      return PressableState.longPressed;
    }

    if (_pressed) {
      return PressableState.pressed;
    }

    if (_hover) {
      return PressableState.hover;
    }

    // ignore: prefer-returning-conditional-expressions
    return PressableState.inactive;
  }

  void handleUnpress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_pressed) {
        updateState(() => _pressed = false);
      }
    });
  }

  updateState(void Function() fn) {
    if (mounted) setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        enabled: _onEnabled,
        button: true,
        focusable: _onEnabled && _node.canRequestFocus,
        focused: _node.hasFocus,
        child: GestureDetector(
          onTapDown: (_) => updateState(() => _pressed = true),
          onTapUp: (_) => handleUnpress(),
          onTap: () => widget.onPressed?.call(),
          onTapCancel: () => handleUnpress(),
          onLongPressCancel: () => updateState(() => _longpressed = false),
          onLongPress: widget.onLongPress,
          onLongPressStart: (_) => updateState(() => _longpressed = true),
          onLongPressEnd: (_) => updateState(() => _longpressed = false),
          behavior: widget.behavior,
          child: FocusableActionDetector(
            enabled: _onEnabled,
            focusNode: _node,
            autofocus: widget.autofocus,
            onShowFocusHighlight: (v) => updateState(() => _focus = v),
            onShowHoverHighlight: (v) => updateState(() => _hover = v),
            onFocusChange: widget.onFocusChange,
            child: PressableNotifier(
              state: _state,
              focus: _focus,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
