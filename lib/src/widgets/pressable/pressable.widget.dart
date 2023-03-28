import 'package:flutter/material.dart';

import 'pressable.notifier.dart';
import 'pressable_state.dart';

class Pressable extends StatefulWidget {
  const Pressable({
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.onFocusChange,
    this.behavior,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Function(bool)? onFocusChange;

  final HitTestBehavior? behavior;

  @override
  // ignore: library_private_types_in_public_api
  _PressableState createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  late FocusNode node;

  @override
  void initState() {
    super.initState();
    node = widget.focusNode ?? _createFocusNode();
  }

  @override
  void didUpdateWidget(Pressable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      node = widget.focusNode ?? node;
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) node.dispose();
    super.dispose();
  }

  FocusNode _createFocusNode() {
    return FocusNode(debugLabel: '${widget.runtimeType}');
  }

  bool _hover = false;
  bool _focus = false;
  bool _pressed = false;
  bool _longpressed = false;

  bool get _onEnabled => widget.onPressed != null || widget.onLongPress != null;

  PressableState get state {
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
        button: true,
        enabled: _onEnabled,
        focusable: _onEnabled && node.canRequestFocus,
        focused: node.hasFocus,
        child: GestureDetector(
          behavior: widget.behavior,
          onTap: () {
            widget.onPressed?.call();
          },
          onTapDown: (_) {
            updateState(() => _pressed = true);
          },
          onTapUp: (_) {
            handleUnpress();
          },
          onTapCancel: () {
            handleUnpress();
          },
          onLongPress: widget.onLongPress,
          onLongPressStart: (_) {
            updateState(() => _longpressed = true);
          },
          onLongPressEnd: (_) {
            updateState(() => _longpressed = false);
          },
          onLongPressCancel: () {
            updateState(() => _longpressed = false);
          },
          child: FocusableActionDetector(
            focusNode: node,
            autofocus: widget.autofocus,
            enabled: _onEnabled,
            onFocusChange: widget.onFocusChange,
            onShowFocusHighlight: (v) {
              updateState(() => _focus = v);
            },
            onShowHoverHighlight: (v) {
              updateState(() => _hover = v);
            },
            child: PressableNotifier(
              state: state,
              focus: _focus,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
