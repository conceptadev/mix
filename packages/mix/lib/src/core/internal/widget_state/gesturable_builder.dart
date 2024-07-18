import 'dart:async';

import 'package:flutter/material.dart';

class GesturableWidget extends GesturableWidgetBuilder {
  const GesturableWidget({
    super.key,
    required super.child,
    super.enableFeedback = false,
    super.enabled = true,
    super.onTap,
    super.onLongPress,
    super.onTapUp,
    super.onTapCancel,
    super.onLongPressStart,
    super.onLongPressEnd,
    super.onLongPressCancel,
    super.onPanDown,
    super.onPanUpdate,
    super.onPanEnd,
    super.excludeFromSemantics = false,
    super.hitTestBehavior = HitTestBehavior.opaque,
    required super.unpressDelay,
  });

  @override
  State createState() => _GesturableState();
}

class _GesturableState extends GesturableWidgetStateBuilder<GesturableWidget> {}

abstract class GesturableWidgetBuilder extends StatefulWidget {
  const GesturableWidgetBuilder({
    super.key,
    required this.enabled,
    required this.child,
    this.enableFeedback = false,
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
    this.excludeFromSemantics = false,
    this.hitTestBehavior = HitTestBehavior.opaque,
    required this.unpressDelay,
  });

  final bool enabled;

  /// The child widget.

  final Widget child;

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
}

abstract class GesturableWidgetStateBuilder<T extends GesturableWidgetBuilder>
    extends State<T> {
  late final _GesturableDataController _controller;
  int _pressCount = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = _GesturableDataController();
    _controller.enabled = widget.enabled;
  }

  void _handlePanUpdate(DragUpdateDetails event) {
    widget.onPanUpdate?.call(event);
  }

  void _handlePanDown(DragDownDetails details) {
    widget.onPanDown?.call(details);
  }

  void _handlePanEnd(DragEndDetails details) {
    _updatePress(true);
    widget.onPanEnd?.call(details);
  }

  void _updatePress(bool isPressed) {
    if (isPressed == _controller.pressed) return;

    _controller.pressed = isPressed;

    if (isPressed) {
      _pressCount++;
      final initialPressCount = _pressCount;
      _unpressAfterDelay(initialPressCount);
    }
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

  void _unpressAfterDelay(int initialPressCount) {
    void unpressCallback() {
      if (_controller.pressed && _pressCount == initialPressCount) {
        _controller.pressed = false;
      }
    }

    _timer?.cancel();
    _timer = null;

    final delay = widget.unpressDelay;

    if (delay != Duration.zero) {
      _timer = Timer(delay, unpressCallback);
    } else {
      unpressCallback();
    }
  }

  void _onTap() {
    _updatePress(true);
    widget.onTap?.call();
    if (widget.enableFeedback) Feedback.forTap(context);
  }

  void _onLongPress() {
    widget.onLongPress?.call();
    if (widget.enableFeedback) Feedback.forLongPress(context);
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      _controller.enabled = widget.enabled;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _onTapUp,
      onTap: _onTap,
      onTapCancel: _onTapCancel,
      onLongPressCancel: _onLongPressCancel,
      onLongPress: _onLongPress,
      onLongPressStart: _onLongPressStart,
      onLongPressEnd: _onLongPressEnd,
      onPanDown: _handlePanDown,
      onPanUpdate: _handlePanUpdate,
      onPanEnd: _handlePanEnd,
      behavior: widget.hitTestBehavior,
      excludeFromSemantics: widget.excludeFromSemantics,
      child: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return GesturableState(
            longPressed: _controller.longPressed,
            pressed: _controller.pressed,
            child: widget.child,
          );
        },
      ),
    );
  }
}

class _GesturableDataController extends ChangeNotifier {
  bool _enabled = false;
  bool _pressed = false;
  bool _longPressed = false;

  bool get enabled => _enabled;
  bool get disabled => !_enabled;
  bool get pressed => enabled && _pressed;
  bool get longPressed => enabled && _longPressed;

  set enabled(bool value) {
    if (_enabled == value) return;

    _enabled = value;
    notifyListeners();
  }

  set pressed(bool value) {
    if (_pressed == value) return;

    _pressed = value;
    notifyListeners();
  }

  set longPressed(bool value) {
    if (_longPressed == value) return;
    _longPressed = value;
    notifyListeners();
  }
}

enum GestureStateAspect {
  pressed,
  longPressed,
}

class GesturableState extends InheritedModel<GestureStateAspect> {
  const GesturableState({
    super.key,
    required super.child,
    required this.longPressed,
    required this.pressed,
  });

  static GesturableState of(
    BuildContext context, [
    GestureStateAspect? aspect,
  ]) {
    final GesturableState? result = maybeOf(context, aspect);
    assert(result != null, 'Unable to find an instance of GesturableState...');

    return result!;
  }

  static GesturableState? maybeOf(
    BuildContext context, [
    GestureStateAspect? aspect,
  ]) {
    return InheritedModel.inheritFrom<GesturableState>(
      context,
      aspect: aspect,
    );
  }

  static bool pressedOf(BuildContext context) {
    return of(context, GestureStateAspect.pressed).pressed;
  }

  static bool longPressedOf(BuildContext context) {
    return of(context, GestureStateAspect.longPressed).longPressed;
  }

  final bool pressed;
  final bool longPressed;
  @override
  bool updateShouldNotify(GesturableState oldWidget) {
    return oldWidget.pressed != pressed || oldWidget.longPressed != longPressed;
  }

  @override
  bool updateShouldNotifyDependent(
    GesturableState oldWidget,
    Set<GestureStateAspect> dependencies,
  ) {
    return dependencies.contains(GestureStateAspect.pressed) &&
            oldWidget.pressed != pressed ||
        dependencies.contains(GestureStateAspect.longPressed) &&
            oldWidget.longPressed != longPressed;
  }
}
