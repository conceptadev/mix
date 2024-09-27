import 'dart:async';

import 'package:flutter/material.dart';

import '../widget_state_controller.dart';

class GestureMixStateWidget extends StatefulWidget {
  const GestureMixStateWidget({
    super.key,
    required this.child,
    this.enableFeedback = false,
    this.controller,
    this.onTap,
    this.onLongPress,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onLongPressCancel,
    this.onPanDown,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onPanStart,
    this.excludeFromSemantics = false,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onTertiaryTapCancel,
    required this.unpressDelay,
  });

  /// The child widget.
  final Widget child;

  /// The controller for the widget state.
  final MixWidgetStateController? controller;

  /// Whether to provide feedback for gestures.
  final bool enableFeedback;

  /// The callback that is called when the user stops touching the screen after a tap gesture.
  final GestureTapUpCallback? onTapUp;

  /// The callback that is called when the user cancels a tap gesture.
  final GestureTapCancelCallback? onTapCancel;

  /// The callback that is called when the user starts a long press gesture.
  final GestureLongPressStartCallback? onLongPressStart;

  /// The callback that is called when the user ends a long press gesture.
  final GestureLongPressEndCallback? onLongPressEnd;

  /// The callback that is called when the user cancels a long press gesture.
  final GestureLongPressCallback? onLongPressCancel;

  /// The callback that is called when the user starts a pan gesture.
  final GestureDragDownCallback? onPanDown;

  /// The callback that is called when the user moves their finger during a pan gesture.
  final GestureDragUpdateCallback? onPanUpdate;

  final GestureDragCancelCallback? onPanCancel;

  final GestureDragStartCallback? onPanStart;

  /// The callback that is called when the user ends a pan gesture.
  final GestureDragEndCallback? onPanEnd;

  /// The callback that is called when the widget is pressed.
  final VoidCallback? onTap;

  /// The callback that is called when the widget is long-pressed.
  final VoidCallback? onLongPress;

  /// Whether to exclude the widget from semantics.
  final bool excludeFromSemantics;

  /// How to behave during hit testing.
  final HitTestBehavior hitTestBehavior;

  /// The duration to wait after the press is released before updating the press state.
  final Duration unpressDelay;

  /// The callback that is called when the user starts a double tap gesture.
  final GestureTapDownCallback? onDoubleTapDown;

  /// The callback that is called when the user cancels a double tap gesture.
  final GestureTapCancelCallback? onDoubleTapCancel;

  /// The callback that is called when the user starts a scale gesture.
  final GestureScaleStartCallback? onScaleStart;

  /// The callback that is called when the user updates a scale gesture.
  final GestureScaleUpdateCallback? onScaleUpdate;

  /// The callback that is called when the user ends a scale gesture.
  final GestureScaleEndCallback? onScaleEnd;

  /// The callback that is called when the user starts a force press gesture.
  final GestureForcePressStartCallback? onForcePressStart;

  /// The callback that is called when the force press gesture reaches its peak force.
  final GestureForcePressPeakCallback? onForcePressPeak;

  /// The callback that is called when the force press gesture is updated.
  final GestureForcePressUpdateCallback? onForcePressUpdate;

  /// The callback that is called when the force press gesture ends.
  final GestureForcePressEndCallback? onForcePressEnd;

  /// The callback that is called when the user performs a secondary tap gesture.
  final GestureTapCallback? onSecondaryTap;

  /// The callback that is called when the user starts a secondary tap gesture.
  final GestureTapDownCallback? onSecondaryTapDown;

  /// The callback that is called when the user ends a secondary tap gesture.
  final GestureTapUpCallback? onSecondaryTapUp;

  /// The callback that is called when the user cancels a secondary tap gesture.
  final GestureTapCancelCallback? onSecondaryTapCancel;

  /// The callback that is called when the user starts a tertiary tap gesture.
  final GestureTapDownCallback? onTertiaryTapDown;

  /// The callback that is called when the user ends a tertiary tap gesture.
  final GestureTapUpCallback? onTertiaryTapUp;

  /// The callback that is called when the user cancels a tertiary tap gesture.
  final GestureTapCancelCallback? onTertiaryTapCancel;

  @override
  State createState() => _GestureMixStateWidgetState();
}

class _GestureMixStateWidgetState extends State<GestureMixStateWidget> {
  int _pressCount = 0;
  Timer? _timer;
  late final MixWidgetStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? MixWidgetStateController();
  }

  void _onPanUpdate(DragUpdateDetails event) {
    widget.onPanUpdate?.call(event);
  }

  void _onPanDown(DragDownDetails details) {
    widget.onPanDown?.call(details);
  }

  _handlePress(bool value) {
    _controller.pressed = value;
    if (value) {
      _pressCount++;
      final initialPressCount = _pressCount;
      _unpressAfterDelay(initialPressCount);
    }
  }

  void _onPanEnd(DragEndDetails details) {
    _handlePress(true);
    widget.onPanEnd?.call(details);
  }

  void _onTapUp(TapUpDetails details) {
    _controller.longPressed = false;
    widget.onTapUp?.call(details);
  }

  void _onTapCancel() {
    _controller.longPressed = false;
    widget.onTapCancel?.call();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _controller.longPressed = true;
    widget.onLongPressStart?.call(details);
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    _controller.longPressed = false;
    widget.onLongPressEnd?.call(details);
  }

  void _onLongPressCancel() {
    _controller.longPressed = false;
    widget.onLongPressCancel?.call();
  }

  void _onPanCancel() {
    widget.onPanCancel?.call();
  }

  void _onPanStart(DragStartDetails details) {
    widget.onPanStart?.call(details);
  }

  void _unpressAfterDelay(int initialPressCount) {
    void unpressCallback() {
      if (_controller.pressed && _pressCount == initialPressCount) {
        _controller.pressed = false;
      }
    }

    _timer?.cancel();

    final delay = widget.unpressDelay;

    if (delay != Duration.zero) {
      _timer = Timer(delay, unpressCallback);
    } else {
      unpressCallback();
    }
  }

  void _onTap() {
    _handlePress(true);
    widget.onTap?.call();
    if (widget.enableFeedback) Feedback.forTap(context);
  }

  void _onLongPress() {
    widget.onLongPress?.call();
    if (widget.enableFeedback) Feedback.forLongPress(context);
  }

  void _onDoubleTapDown(TapDownDetails details) {
    widget.onDoubleTapDown?.call(details);
  }

  void _onDoubleTapCancel() {
    widget.onDoubleTapCancel?.call();
  }

  void _onScaleStart(ScaleStartDetails details) {
    widget.onScaleStart?.call(details);
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    widget.onScaleUpdate?.call(details);
  }

  void _onScaleEnd(ScaleEndDetails details) {
    widget.onScaleEnd?.call(details);
  }

  void _onForcePressStart(ForcePressDetails details) {
    widget.onForcePressStart?.call(details);
  }

  void _onForcePressPeak(ForcePressDetails details) {
    widget.onForcePressPeak?.call(details);
  }

  void _onForcePressUpdate(ForcePressDetails details) {
    widget.onForcePressUpdate?.call(details);
  }

  void _onForcePressEnd(ForcePressDetails details) {
    widget.onForcePressEnd?.call(details);
  }

  void _onSecondaryTap() {
    widget.onSecondaryTap?.call();
  }

  void _onSecondaryTapDown(TapDownDetails details) {
    widget.onSecondaryTapDown?.call(details);
  }

  void _onSecondaryTapUp(TapUpDetails details) {
    widget.onSecondaryTapUp?.call(details);
  }

  void _onSecondaryTapCancel() {
    widget.onSecondaryTapCancel?.call();
  }

  void _onTertiaryTapDown(TapDownDetails details) {
    widget.onTertiaryTapDown?.call(details);
  }

  void _onTertiaryTapUp(TapUpDetails details) {
    widget.onTertiaryTapUp?.call(details);
  }

  void _onTertiaryTapCancel() {
    widget.onTertiaryTapCancel?.call();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // Dispose if being managed internally
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: widget.onTap != null ? _onTapUp : null,
      onTap: widget.onTap != null ? _onTap : null,
      onTapCancel: widget.onTap != null ? _onTapCancel : null,
      onLongPressCancel: widget.onLongPress != null ? _onLongPressCancel : null,
      onLongPress: widget.onLongPress != null ? _onLongPress : null,
      onLongPressStart: widget.onLongPress != null ? _onLongPressStart : null,
      onLongPressEnd: widget.onLongPress != null ? _onLongPressEnd : null,
      onPanDown: widget.onPanDown != null ? _onPanDown : null,
      onPanStart: widget.onPanStart != null ? _onPanStart : null,
      onPanUpdate: widget.onPanUpdate != null ? _onPanUpdate : null,
      onPanEnd: widget.onPanEnd != null ? _onPanEnd : null,
      onPanCancel: widget.onPanCancel != null ? _onPanCancel : null,
      onDoubleTapDown: widget.onDoubleTapDown != null ? _onDoubleTapDown : null,
      onDoubleTapCancel:
          widget.onDoubleTapCancel != null ? _onDoubleTapCancel : null,
      onScaleStart: widget.onScaleStart != null ? _onScaleStart : null,
      onScaleUpdate: widget.onScaleUpdate != null ? _onScaleUpdate : null,
      onScaleEnd: widget.onScaleEnd != null ? _onScaleEnd : null,
      onForcePressStart:
          widget.onForcePressStart != null ? _onForcePressStart : null,
      onForcePressPeak:
          widget.onForcePressPeak != null ? _onForcePressPeak : null,
      onForcePressUpdate:
          widget.onForcePressUpdate != null ? _onForcePressUpdate : null,
      onForcePressEnd: widget.onForcePressEnd != null ? _onForcePressEnd : null,
      onSecondaryTap: widget.onSecondaryTap != null ? _onSecondaryTap : null,
      onSecondaryTapDown:
          widget.onSecondaryTapDown != null ? _onSecondaryTapDown : null,
      onSecondaryTapUp:
          widget.onSecondaryTapUp != null ? _onSecondaryTapUp : null,
      onSecondaryTapCancel:
          widget.onSecondaryTapCancel != null ? _onSecondaryTapCancel : null,
      onTertiaryTapDown:
          widget.onTertiaryTapDown != null ? _onTertiaryTapDown : null,
      onTertiaryTapUp: widget.onTertiaryTapUp != null ? _onTertiaryTapUp : null,
      onTertiaryTapCancel:
          widget.onTertiaryTapCancel != null ? _onTertiaryTapCancel : null,
      behavior: widget.hitTestBehavior,
      excludeFromSemantics: widget.excludeFromSemantics,
      child: widget.child,
    );
  }
}
