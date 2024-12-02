import 'dart:async';

import 'package:flutter/material.dart';

import '../on_tap_event_inherited.dart';
import '../widget_state_controller.dart';

abstract interface class WidgetStateHandler {
  @visibleForTesting
  // ignore: avoid-unassigned-late-fields
  late final MixWidgetStateController controller;
}

mixin HandlePress on WidgetStateHandler {
  int _pressCount = 0;
  Timer? _timer;

  void returnToStartState();

  void handlePress({required bool value, required Duration delay}) {
    controller.pressed = value;
    if (value) {
      _pressCount++;
      final initialPressCount = _pressCount;
      _unpressAfterDelay(initialPressCount, delay: delay);
    }
  }

  void _unpressAfterDelay(int initialPressCount, {required Duration delay}) {
    void unpressCallback() {
      if (controller.pressed && _pressCount == initialPressCount) {
        controller.pressed = false;
        returnToStartState();
      }
    }

    _timer?.cancel();

    if (delay != Duration.zero) {
      _timer = Timer(delay, unpressCallback);
    } else {
      unpressCallback();
    }
  }
}

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

  @override
  State createState() => _GestureMixStateWidgetState();
}

abstract class _GestureMixStateWidgetStateWithController
    extends State<GestureMixStateWidget> implements WidgetStateHandler {}

class _GestureMixStateWidgetState
    extends _GestureMixStateWidgetStateWithController with HandlePress {
  OnTapEvent? _event;

  @override
  @protected
  late final MixWidgetStateController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? MixWidgetStateController();
  }

  void _onPanUpdate(DragUpdateDetails event) {
    widget.onPanUpdate?.call(event);
  }

  void _onPanDown(DragDownDetails details) {
    widget.onPanDown?.call(details);
  }

  void _onPanEnd(DragEndDetails details) {
    handlePress(value: true, delay: widget.unpressDelay);
    widget.onPanEnd?.call(details);
  }

  void _onLongPressStart(LongPressStartDetails details) {
    controller.longPressed = true;
    _event = OnTapEvent.down;
    controller.pressed = _event == OnTapEvent.down;
    widget.onLongPressStart?.call(details);
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    controller.longPressed = false;
    controller.pressed = false;
    setState(() {
      _event = null;
    });
    widget.onLongPressEnd?.call(details);
  }

  void _onLongPressCancel() {
    controller.longPressed = false;
    controller.pressed = false;
    widget.onLongPressCancel?.call();
  }

  void _onPanCancel() {
    widget.onPanCancel?.call();
  }

  void _onPanStart(DragStartDetails details) {
    widget.onPanStart?.call(details);
  }

  void _onTap() {
    handlePress(value: true, delay: widget.unpressDelay);

    widget.onTap?.call();
    if (widget.enableFeedback) Feedback.forTap(context);
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _event = OnTapEvent.down;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _event = OnTapEvent.up;
    });
    controller.longPressed = false;
    widget.onTapUp?.call(details);
  }

  void _onTapCancel() {
    controller.longPressed = false;
    controller.pressed = false;
    returnToStartState();
    widget.onTapCancel?.call();
  }

  void _onLongPress() {
    widget.onLongPress?.call();
    if (widget.enableFeedback) Feedback.forLongPress(context);
  }

  @override
  void dispose() {
    _timer?.cancel();
    // Dispose if  being managed internally
    if (widget.controller == null) controller.dispose();
    super.dispose();
  }

  @override
  void returnToStartState() {
    setState(() {
      _event = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OnTapEventInherited(
      _event,
      child: GestureDetector(
        onTapDown: widget.onTap != null ? _onTapDown : null,
        onTapUp: widget.onTap != null ? _onTapUp : null,
        onTap: widget.onTap != null ? _onTap : null,
        onTapCancel: widget.onTap != null ? _onTapCancel : null,
        onLongPressCancel:
            widget.onLongPress != null ? _onLongPressCancel : null,
        onLongPress: widget.onLongPress != null ? _onLongPress : null,
        onLongPressStart: widget.onLongPress != null ? _onLongPressStart : null,
        onLongPressEnd: widget.onLongPress != null ? _onLongPressEnd : null,
        onPanDown: widget.onPanDown != null ? _onPanDown : null,
        onPanStart: widget.onPanStart != null ? _onPanStart : null,
        onPanUpdate: widget.onPanUpdate != null ? _onPanUpdate : null,
        onPanEnd: widget.onPanEnd != null ? _onPanEnd : null,
        onPanCancel: widget.onPanCancel != null ? _onPanCancel : null,
        behavior: widget.hitTestBehavior,
        excludeFromSemantics: widget.excludeFromSemantics,
        child: widget.child,
      ),
    );
  }
}
