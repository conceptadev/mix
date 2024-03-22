import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../factory/style_mix.dart';
import '../../specs/container/box_widget.dart';
import '../../utils/custom_focusable_action_detector.dart';
import 'pressable_data.notifier.dart';

class PressableBox extends StatelessWidget {
  const PressableBox({
    super.key,
    this.style,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.enableFeedback = false,
    this.unpressDelay = const Duration(milliseconds: 150),
    this.onFocusChange,
    @Deprecated('Use onTap instead') VoidCallback? onPressed,
    VoidCallback? onPress,
    @Deprecated('Use hitTestBehavior instead') HitTestBehavior? behavior,
    this.hitTestBehavior,
    @Deprecated('Use AnimatedStyle instead')
    this.animationDuration = const Duration(milliseconds: 125),
    @Deprecated('Use AnimatedStyle instead')
    this.animationCurve = Curves.linear,
    this.disabled = false,
    required this.child,
  }) : onPress = onPress ?? onPressed;

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
  final bool disabled;
  final FocusNode? focusNode;
  final bool autofocus;
  final Duration unpressDelay;
  final Function(bool focus)? onFocusChange;
  final Duration animationDuration;
  final Curve animationCurve;

  final HitTestBehavior? hitTestBehavior;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      disabled: disabled,
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
    super.disabled,
    super.enableFeedback,
    @Deprecated('Use onTap instead') VoidCallback? onPressed,
    VoidCallback? onPress,
    @Deprecated('Use hitTestBehavior instead') HitTestBehavior? behavior,
    HitTestBehavior? hitTestBehavior,
    super.onLongPress,
    super.onFocusChange,
    super.autofocus,
    super.focusNode,
    super.onKey,
    super.onKeyEvent,
    super.unpressDelay,
  }) : super(
          onPress: onPress ?? onPressed,
          hitTestBehavior:
              hitTestBehavior ?? behavior ?? HitTestBehavior.opaque,
        );

  @override
  PressableWidgetState createState() => PressableWidgetState();
}

class PressableWidgetState extends _PressableBuilderWidgetState<Pressable> {}

abstract class _PressableBuilderWidget extends StatefulWidget {
  const _PressableBuilderWidget({
    super.key,
    required this.child,
    this.disabled = false,
    this.enableFeedback = false,
    this.onPress,
    this.onLongPress,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.onKey,
    this.onKeyEvent,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.unpressDelay,
  });

  final Widget child;

  final bool disabled;

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
  final Duration? unpressDelay;
}

abstract class _PressableBuilderWidgetState<T extends _PressableBuilderWidget>
    extends State<T> {
  bool _isHovered = false;
  bool _isFocused = false;
  bool _isPressed = false;
  bool _isLongPressed = false;

  PointerPosition? _pointerPosition = const PointerPosition(
    alignment: Alignment.center,
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
            alignment: cursorAlignment,
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

    if (delay != null && delay != Duration.zero) {
      await Future.delayed(delay);
    }

    if (_isPressed && _pressCount == initialPressCount) {
      updateState(() => _isPressed = false);
    }
  }

  bool get isEnabled {
    return !widget.disabled &&
        (widget.onPress != null || widget.onLongPress != null);
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
    return PressableState(
      enabled: isEnabled,
      hovered: _isHovered,
      focused: _isFocused,
      pressed: _isPressed,
      longPressed: _isLongPressed,
      pointerPosition: _pointerPosition,
      child: Builder(
        builder: (context) {
          final focusableDetector = CustomFocusableActionDetector(
            enabled: isEnabled,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            onShowFocusHighlight: _handleFocusUpdate,
            onShowHoverHighlight: _handleHoverUpdate,
            onFocusChange: widget.onFocusChange,
            onMouseEnter: _handleOnMouseEnter,
            onMouseExit: _handleOnMouseExit,
            onMouseHover: _handleMouseHover,
            child: widget.child,
          );

          return GestureDetector(
            onTapUp: isEnabled ? (_) => _handlePressUpdate(false) : null,
            onTap: isEnabled ? handleOnPress : null,
            onTapCancel: isEnabled ? () => _handlePressUpdate(false) : null,
            onLongPressCancel:
                isEnabled ? () => handleLongPressUpdate(false) : null,
            onLongPress: isEnabled ? handleOnLongPress : null,
            onLongPressStart:
                isEnabled ? (_) => handleLongPressUpdate(true) : null,
            onLongPressEnd:
                isEnabled ? (_) => handleLongPressUpdate(false) : null,
            onPanDown: isEnabled ? _handlePanDown : null,
            onPanUpdate: isEnabled ? _handlePanUpdate : null,
            onPanEnd: isEnabled ? _handlePanUp : null,
            behavior: widget.hitTestBehavior,
            child: focusableDetector,
          );
        },
      ),
    );
  }
}
