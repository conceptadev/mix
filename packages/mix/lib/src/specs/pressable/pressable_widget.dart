import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import '../../core/internal/mix_interaction_detector.dart';
import '../../core/providers/focus_highlight_mode_provider.dart';
import '../../core/providers/widget_state_provider.dart';
import '../box/box_spec.dart';
import '../box/box_widget.dart';

/// The accessibility role exposed by a [Pressable].
enum PressableSemanticsRole { button, link, none }

/// Combines [Box] styling with gesture handling.
///
/// Provides press, long press, and focus interactions.
class PressableBox extends StatelessWidget {
  const PressableBox({
    super.key,
    this.style,
    this.onLongPress,
    this.focusNode,
    required this.child,
    this.autofocus = false,
    this.enableFeedback = false,
    this.onFocusChange,
    this.onPress,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.excludeFromSemantics = false,
    this.semanticsLabel,
    this.semanticsRole = PressableSemanticsRole.button,
    this.onKeyEvent,
    this.controller,
    this.actions,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.enabled = true,
  });

  /// Enables audible/haptic feedback for gestures.
  final bool enableFeedback;

  /// Called when the box is pressed.
  final VoidCallback? onPress;

  /// Called when the box is long-pressed.
  final VoidCallback? onLongPress;

  final BoxStyler? style;
  final Widget child;
  final bool enabled;
  final FocusNode? focusNode;
  final bool autofocus;
  final ValueChanged<bool>? onFocusChange;

  final MouseCursor? mouseCursor;
  final bool canRequestFocus;
  final bool excludeFromSemantics;
  final String? semanticsLabel;
  final PressableSemanticsRole semanticsRole;
  final FocusOnKeyEventCallback? onKeyEvent;
  final WidgetStatesController? controller;
  final Map<Type, Action<Intent>>? actions;

  final HitTestBehavior hitTestBehavior;

  @override
  Widget build(BuildContext context) {
    final style = this.style;

    return Pressable(
      enabled: enabled,
      enableFeedback: enableFeedback,
      onPress: onPress,
      hitTestBehavior: hitTestBehavior,
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      focusNode: focusNode,
      mouseCursor: mouseCursor,
      canRequestFocus: canRequestFocus,
      excludeFromSemantics: excludeFromSemantics,
      semanticsLabel: semanticsLabel,
      semanticsRole: semanticsRole,
      onKeyEvent: onKeyEvent,
      controller: controller,
      actions: actions,
      child: style == null
          ? Box(child: child)
          : Box(style: style, child: child),
    );
  }
}

/// Base widget for handling press gestures and states.
///
/// Manages press, hover, and focus states with configurable behavior.
class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    this.enabled = true,
    this.enableFeedback = false,
    this.onPress,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.onLongPress,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.excludeFromSemantics = false,
    this.semanticsLabel,
    this.semanticsRole = PressableSemanticsRole.button,
    this.onKeyEvent,
    this.controller,
    this.actions,
    required this.child,
  });

  final Widget child;

  final bool enabled;

  final MouseCursor? mouseCursor;

  final String? semanticsLabel;

  final PressableSemanticsRole semanticsRole;

  final bool excludeFromSemantics;

  final bool canRequestFocus;

  /// Enables audible/haptic feedback for gestures.
  final bool enableFeedback;

  /// Called when the box is pressed.
  final VoidCallback? onPress;

  /// Called when the box is long-pressed.
  final VoidCallback? onLongPress;

  /// Called when focus state changes.
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.onKeyEvent}
  final FocusOnKeyEventCallback? onKeyEvent;

  /// {@macro flutter.widgets.GestureDetector.hitTestBehavior}
  final HitTestBehavior hitTestBehavior;

  /// Custom actions bound to the widget.
  final Map<Type, Action<Intent>>? actions;

  final WidgetStatesController? controller;

  @override
  State createState() => PressableWidgetState();
}

@visibleForTesting
class PressableWidgetState extends State<Pressable> {
  late WidgetStatesController _controller;
  late bool _ownsController;
  LogicalKeyboardKey? _heldActivationKey;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController([Set<WidgetState>? initialStates]) {
    _ownsController = widget.controller == null;
    _controller =
        widget.controller ?? WidgetStatesController(initialStates ?? {});
  }

  void _onTap() {
    if (!widget.enabled || widget.onPress == null) return;

    widget.onPress?.call();
    if (widget.enableFeedback) Feedback.forTap(context);
  }

  void _onLongPress() {
    if (!widget.enabled || widget.onLongPress == null) return;

    widget.onLongPress?.call();
    if (widget.enableFeedback) Feedback.forLongPress(context);
  }

  void _onFocusChange(bool hasFocus) {
    if (!hasFocus && _heldActivationKey != null) _cancelHeldActivation();
    _controller.focused = hasFocus;
    widget.onFocusChange?.call(hasFocus);
  }

  bool _isActivationKey(LogicalKeyboardKey key) {
    return key == .space || key == .enter || key == .numpadEnter;
  }

  void _cancelHeldActivation([WidgetStatesController? controller]) {
    _heldActivationKey = null;
    (controller ?? _controller).pressed = false;
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    final customResult = widget.onKeyEvent?.call(node, event) ?? .ignored;

    if (customResult != .ignored) {
      if (event is KeyUpEvent && event.logicalKey == _heldActivationKey) {
        _cancelHeldActivation();
      }

      return customResult;
    }

    if (!_isActivationKey(event.logicalKey)) {
      return .ignored;
    }

    if (!widget.enabled || widget.onPress == null || !node.hasFocus) {
      if (event.logicalKey == _heldActivationKey) {
        _cancelHeldActivation();
      }

      return .handled;
    }

    if (event is KeyDownEvent) {
      if (_heldActivationKey == null) {
        _heldActivationKey = event.logicalKey;
        _controller.pressed = true;
      }

      return .handled;
    }

    if (event is KeyRepeatEvent) {
      return .handled;
    }

    if (event is KeyUpEvent) {
      final shouldActivate = event.logicalKey == _heldActivationKey;
      if (shouldActivate) {
        _cancelHeldActivation();
        _onTap();
      }

      return .handled;
    }

    return .ignored;
  }

  bool get hasOnPress => widget.onPress != null;

  MouseCursor get mouseCursor {
    if (widget.mouseCursor != null) {
      return widget.mouseCursor!;
    }

    if (!widget.enabled) {
      return SystemMouseCursors.forbidden;
    }

    return hasOnPress ? SystemMouseCursors.click : MouseCursor.defer;
  }

  @override
  void didUpdateWidget(Pressable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      final oldController = _controller;
      final oldStates = oldController.value;
      final ownedOldController = _ownsController;
      _cancelHeldActivation(oldController);
      _initController(widget.controller == null ? oldStates : null);
      if (ownedOldController) oldController.dispose();
    }

    if ((oldWidget.enabled && !widget.enabled) ||
        (oldWidget.onPress != null && widget.onPress == null)) {
      _cancelHeldActivation();
    }
  }

  @override
  void dispose() {
    _cancelHeldActivation();
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget current = GestureDetector(
      onTap: widget.enabled && widget.onPress != null ? _onTap : null,
      onLongPress: widget.enabled && widget.onLongPress != null
          ? _onLongPress
          : null,
      behavior: widget.hitTestBehavior,
      excludeFromSemantics: true,
      child: MouseRegion(
        cursor: mouseCursor,
        child: Actions(
          actions: widget.actions ?? const {},
          child: Focus(
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            onFocusChange: _onFocusChange,
            onKeyEvent: _onKeyEvent,
            canRequestFocus: widget.canRequestFocus && widget.enabled,
            child: MixInteractionDetector(
              controller: _controller,
              enabled: widget.enabled,
              child: FocusHighlightModeProvider(child: widget.child),
            ),
          ),
        ),
      ),
    );

    if (!widget.excludeFromSemantics) {
      current = Semantics(
        enabled: widget.enabled,
        button: widget.semanticsRole == .button ? true : null,
        link: widget.semanticsRole == .link ? true : null,
        label: widget.semanticsLabel,
        onTap: widget.enabled && widget.onPress != null ? _onTap : null,
        onLongPress: widget.enabled && widget.onLongPress != null
            ? _onLongPress
            : null,
        child: current,
      );
    }

    return current;
  }
}
