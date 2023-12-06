import 'package:flutter/material.dart';

import '../../factory/style_mix.dart';
import '../../recipes/container/container_widget.dart';
import 'gesture_state.notifier.dart';

class GestureBox extends StatelessWidget {
  const GestureBox({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.unpressDelay = const Duration(milliseconds: 250),
    this.onFocusChange,
    this.behavior,
    required this.child,
    this.style,
  });

  final StyleMix? style;
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Duration unpressDelay;
  final Function(bool focus)? onFocusChange;

  final HitTestBehavior? behavior;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      behavior: behavior,
      focusNode: focusNode,
      autofocus: autofocus,
      onFocusChange: onFocusChange,
      onLongPress: onLongPress,
      unpressDelay: unpressDelay,
      onPressed: onPressed,
      child: Box(style: style, child: child),
    );
  }
}

class Pressable extends StatefulWidget {
  const Pressable({
    this.behavior,
    this.focusNode,
    this.autofocus = false,
    required this.child,
    this.onFocusChange,
    this.onLongPress,
    this.unpressDelay = const Duration(milliseconds: 100),
    this.onPressed,
    this.disabled = false,
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool disabled;
  final Duration unpressDelay;
  final Function(bool focus)? onFocusChange;

  final HitTestBehavior? behavior;

  @override
  PressableWidgetState createState() => PressableWidgetState();
}

class PressableWidgetState extends State<Pressable> {
  late FocusNode _node;
  bool _isInternalNode = false;
  bool _hover = false;
  bool _focus = false;
  bool _pressed = false;
  bool _longpressed = false;

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? _createFocusNode();
    _isInternalNode = widget.focusNode == null;
  }

  FocusNode _createFocusNode() {
    return FocusNode(debugLabel: '${widget.runtimeType}');
  }

  GestureState get _currentGesture {
    // Long pressed has priority over pressed
    // Due to delay of removing the _press state
    if (_longpressed) return GestureState.longPressed;

    if (_pressed) return GestureState.pressed;

    return GestureState.none;
  }

  @override
  void didUpdateWidget(Pressable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      if (_isInternalNode) _node.dispose();

      _node = widget.focusNode ?? _createFocusNode();
      _isInternalNode = widget.focusNode == null;
    }
  }

  @override
  void dispose() {
    if (_isInternalNode) _node.dispose();

    super.dispose();
  }

  void handleUnpress() {
    void unpress() {
      if (!_pressed) return;
      updateState(() => _pressed = false);
    }

    Future.delayed(widget.unpressDelay, unpress);
  }

  updateState(void Function() fn) {
    if (!mounted) return;
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final currentGesture = _currentGesture;
    final currentStatus =
        widget.disabled ? GestureStatus.disabled : GestureStatus.enabled;

    final onEnabled = currentStatus == GestureStatus.enabled;

    return MergeSemantics(
      child: Semantics(
        enabled: onEnabled,
        button: true,
        focusable: onEnabled && _node.canRequestFocus,
        focused: _node.hasFocus,
        child: GestureDetector(
          onTapDown: (_) => updateState(() => _pressed = true),
          onTapUp: (_) => handleUnpress(),
          onTap: widget.onPressed,
          onTapCancel: () => handleUnpress(),
          onLongPressCancel: () => updateState(() => _longpressed = false),
          onLongPress: widget.onLongPress,
          onLongPressStart: (_) => updateState(() => _longpressed = true),
          onLongPressEnd: (_) => updateState(() => _longpressed = false),
          behavior: widget.behavior,
          child: FocusableActionDetector(
            enabled: onEnabled,
            focusNode: _node,
            autofocus: widget.autofocus,
            onShowFocusHighlight: (v) => updateState(() => _focus = v),
            onShowHoverHighlight: (v) => updateState(() => _hover = v),
            onFocusChange: widget.onFocusChange,
            child: GestureStateNotifier(
              data: GestureData(
                focus: _focus,
                status: currentStatus,
                state: currentGesture,
                hover: _hover,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
