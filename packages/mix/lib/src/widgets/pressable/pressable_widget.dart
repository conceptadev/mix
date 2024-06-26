import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/factory/style_mix.dart';
import '../../internal/constants.dart';
import '../../internal/custom_focusable_action_detector.dart';
import '../../specs/box/box_widget.dart';
import 'pressable_state.dart';

class PressableBox extends StatelessWidget {
  const PressableBox({
    super.key,
    this.style,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.enableFeedback = false,
    this.unpressDelay = kDefaultAnimationDuration,
    this.onFocusChange,
    this.onPress,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.enabled = true,
    required this.child,
  });

  /// Should gestures provide audible and/or haptic feedback
  ///
  /// On platforms like Android, enabling feedback will result in audible and tactile
  /// responses to certain actions. For example, a tap may produce a clicking sound,
  /// while a long-press may trigger a short vibration.
  final bool enableFeedback;

  /// The callback that is called when the box is tapped or otherwise activated.
  ///
  /// If this callback and [onLongPress] are null, then it will be disabled automatically.
  final VoidCallback? onPress;

  /// The callback that is called when long-pressed.
  ///
  /// If this callback and [onPress] are null, then `PressableBox` will be disabled automatically.
  final VoidCallback? onLongPress;

  final Style? style;
  final Widget child;
  final bool enabled;
  final FocusNode? focusNode;
  final bool autofocus;
  final Duration unpressDelay;
  final Function(bool focus)? onFocusChange;

  final HitTestBehavior hitTestBehavior;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      enabled: enabled,
      onPress: onPress,
      hitTestBehavior: hitTestBehavior,
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      focusNode: focusNode,
      unpressDelay: unpressDelay,
      child: Box(style: style, child: child),
    );
  }
}

class Pressable extends _PressableBuilderWidget {
  const Pressable({
    super.key,
    required super.child,
    super.enabled,
    super.enableFeedback,
    super.onPress,
    super.hitTestBehavior,
    super.onLongPress,
    super.onFocusChange,
    super.autofocus,
    super.focusNode,
    super.onKey,
    super.onKeyEvent,
    super.unpressDelay = kDefaultAnimationDuration,
  });

  @override
  PressableWidgetState createState() => PressableWidgetState();
}

class PressableWidgetState extends _PressableBuilderWidgetState<Pressable> {}

abstract class _PressableBuilderWidget extends StatefulWidget {
  const _PressableBuilderWidget({
    super.key,
    required this.child,
    this.enabled = true,
    this.enableFeedback = false,
    this.onPress,
    this.onLongPress,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.onKey,
    this.onKeyEvent,
    this.hitTestBehavior = HitTestBehavior.opaque,
    required this.unpressDelay,
  });

  final Widget child;

  final bool enabled;

  /// Should gestures provide audible and/or haptic feedback
  ///
  /// On platforms like Android, enabling feedback will result in audible and tactile
  /// responses to certain actions. For example, a tap may produce a clicking sound,
  /// while a long-press may trigger a short vibration.
  final bool enableFeedback;

  /// The callback that is called when the box is tapped or otherwise activated.
  ///
  /// If this callback and [onLongPress] are null, then it will be disabled automatically.
  final VoidCallback? onPress;

  /// The callback that is called when long-pressed.
  ///
  /// If this callback and [onPress] are null, then `PressableBox` will be disabled automatically.
  final VoidCallback? onLongPress;

  /// Called when the focus state of the [Focus] changes.
  ///
  /// Called with true when the [Focus] node gains focus
  /// and false when the [Focus] node loses focus.
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.onKey}
  final FocusOnKeyCallback? onKey;

  /// {@macro flutter.widgets.Focus.onKeyEvent}
  final FocusOnKeyEventCallback? onKeyEvent;

  /// {@macro flutter.widgets.GestureDetector.hitTestBehavior}
  final HitTestBehavior hitTestBehavior;

  /// The duration to wait after the press is released before the state of pressed is removed
  final Duration unpressDelay;
}

abstract class _PressableBuilderWidgetState<T extends _PressableBuilderWidget>
    extends State<T> {
  bool _isHovered = false;
  bool _isFocused = false;
  bool _isPressed = false;
  bool _isLongPressed = false;

  PointerPosition? _pointerPosition = const PointerPosition(
    position: Alignment.center,
    offset: Offset.zero,
  );
  int _pressCount = 0;

  void _handleFocusUpdate(bool hasFocus) {
    updateState(() {
      _isFocused = hasFocus;
    });
  }

  void _handleHoverUpdate(bool isHovered) {
    updateState(() {
      _isHovered = isHovered;
    });
  }

  void _updateCursorPosition(Offset cursorOffset) {
    setState(() {
      final size = context.size;
      if (size != null) {
        final ax = cursorOffset.dx / size.width;
        final ay = cursorOffset.dy / size.height;
        final cursorAlignment = Alignment(
          ((ax - 0.5) * 2).clamp(-1.0, 1.0),
          ((ay - 0.5) * 2).clamp(-1.0, 1.0),
        );

        setState(() {
          _pointerPosition = PointerPosition(
            position: cursorAlignment,
            offset: cursorOffset,
          );
        });
      }
    });
  }

  void _handlePanUpdate(DragUpdateDetails event) {
    _updateCursorPosition(event.localPosition);
  }

  void _handlePanDown(DragDownDetails details) {
    _updateCursorPosition(details.localPosition);
  }

  void _handlePanUp(DragEndDetails details) {
    _handlePressUpdate(true);
  }

  void _handleMouseHover(PointerHoverEvent event) {
    _updateCursorPosition(event.localPosition);
  }

  void _handleOnMouseEnter(PointerEnterEvent event) {
    _updateCursorPosition(event.localPosition);
  }

  void _handleOnMouseExit(PointerExitEvent event) {
    _updateCursorPosition(event.localPosition);
  }

  void _handlePressUpdate(bool isPressed) {
    if (isPressed == _isPressed) return;

    updateState(() {
      _isPressed = isPressed;
    });

    if (isPressed) {
      _pressCount++;
      final initialPressCount = _pressCount;
      unpressAfterDelay(initialPressCount);
    }
  }

  void handleLongPressUpdate(bool isLongPressed) {
    if (isLongPressed == _isLongPressed) return;

    updateState(() {
      _isLongPressed = isLongPressed;
    });
  }

  void updateState(void Function() fn) {
    if (!mounted) return;
    setState(fn);
  }

  Future<void> unpressAfterDelay(int initialPressCount) async {
    final delay = widget.unpressDelay;

    if (delay != Duration.zero) {
      await Future.delayed(delay);
    }

    if (_isPressed && _pressCount == initialPressCount) {
      updateState(() => _isPressed = false);
    }
  }

  void handleOnPress() {
    if (!mounted) return;
    _handlePressUpdate(true);
    widget.onPress?.call();
    if (widget.enableFeedback) Feedback.forTap(context);
  }

  void handleOnLongPress() {
    if (!mounted) return;

    widget.onLongPress?.call();
    if (widget.enableFeedback) Feedback.forLongPress(context);
  }

  @override
  Widget build(BuildContext context) {
    final focusableDetector = CustomFocusableActionDetector(
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onShowFocusHighlight: _handleFocusUpdate,
      onShowHoverHighlight: _handleHoverUpdate,
      onFocusChange: widget.onFocusChange,
      onMouseEnter: _handleOnMouseEnter,
      onMouseExit: _handleOnMouseExit,
      onMouseHover: _handleMouseHover,
      child: PressableState(
        enabled: widget.enabled,
        hovered: _isHovered,
        focused: _isFocused,
        pressed: _isPressed,
        longPressed: _isLongPressed,
        pointerPosition: _pointerPosition,
        child: widget.child,
      ),
    );

    return GestureDetector(
      onTapUp: widget.enabled ? (_) => _handlePressUpdate(false) : null,
      onTap: widget.enabled ? handleOnPress : null,
      onTapCancel: widget.enabled ? () => _handlePressUpdate(false) : null,
      onLongPressCancel:
          widget.enabled ? () => handleLongPressUpdate(false) : null,
      onLongPress: widget.enabled ? handleOnLongPress : null,
      onLongPressStart:
          widget.enabled ? (_) => handleLongPressUpdate(true) : null,
      onLongPressEnd:
          widget.enabled ? (_) => handleLongPressUpdate(false) : null,
      onPanDown: widget.enabled ? _handlePanDown : null,
      onPanUpdate: widget.enabled ? _handlePanUpdate : null,
      onPanEnd: widget.enabled ? _handlePanUp : null,
      behavior: widget.hitTestBehavior,
      child: focusableDetector,
    );
  }
}
