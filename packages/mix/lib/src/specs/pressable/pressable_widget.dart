import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../core/internal/mix_interaction_detector.dart';
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
    _controller = widget.controller ?? WidgetStatesController(initialStates);
  }

  void _onTap() {
    if (!widget.enabled || widget.onPress == null) return;

    widget.onPress!();
    if (widget.enableFeedback) Feedback.forTap(context);
  }

  void _onLongPress() {
    if (!widget.enabled || widget.onLongPress == null) return;

    widget.onLongPress!();
    if (widget.enableFeedback) Feedback.forLongPress(context);
  }

  void _onFocusChange(bool hasFocus) {
    if (!hasFocus) _cancelHeldActivation();
    _controller.focused = hasFocus;
    widget.onFocusChange?.call(hasFocus);
  }

  /// Keys Flutter maps to [ActivateIntent] in `WidgetsApp.defaultShortcuts`.
  ///
  /// Pressable models activation itself instead of binding [ActivateIntent],
  /// so it has to cover the same key set or those keys would activate nothing.
  bool _isActivationKey(LogicalKeyboardKey key) {
    return key == .space ||
        key == .enter ||
        key == .numpadEnter ||
        key == .select ||
        key == .gameButtonA;
  }

  /// Releases a held keyboard activation.
  ///
  /// Guarded so keyboard bookkeeping never clears a pointer-owned press, which
  /// [MixInteractionDetector] owns.
  void _cancelHeldActivation() {
    if (_heldActivationKey == null) return;

    _heldActivationKey = null;
    _controller.pressed = false;
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

    // [FocusNode.hasFocus] is also true while a descendant holds primary focus,
    // so only the focused Pressable itself may claim activation keys. Claiming
    // them any wider would swallow Space and Enter before a nested text field
    // (or app shortcuts) ever sees them.
    if (!node.hasPrimaryFocus || !widget.enabled || widget.onPress == null) {
      _cancelHeldActivation();

      return .ignored;
    }

    // A focused Pressable owns activation keys while it can activate, so a
    // second activation key pressed during a hold is absorbed rather than
    // starting a competing activation.
    if (event is KeyDownEvent) {
      if (_heldActivationKey == null) {
        _heldActivationKey = event.logicalKey;
        _controller.pressed = true;
      }

      return .handled;
    }

    // Repeats and key ups only concern the key currently being held.
    if (event.logicalKey != _heldActivationKey) {
      return .ignored;
    }

    if (event is KeyUpEvent) {
      _cancelHeldActivation();
      _onTap();
    }

    return .handled;
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
      final ownedOldController = _ownsController;
      // Release the held key on the outgoing controller before its states are
      // copied, so a keyboard press never survives the swap.
      _cancelHeldActivation();
      _initController(
        widget.controller == null ? {...oldController.value} : null,
      );
      if (ownedOldController) oldController.dispose();
    }

    if (!widget.enabled || widget.onPress == null) {
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
    Widget focusable = Focus(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onFocusChange: _onFocusChange,
      onKeyEvent: _onKeyEvent,
      canRequestFocus: widget.canRequestFocus && widget.enabled,
      child: MixInteractionDetector(
        controller: _controller,
        enabled: widget.enabled,
        child: widget.child,
      ),
    );

    final actions = widget.actions;
    if (actions != null) {
      focusable = Actions(actions: actions, child: focusable);
    }

    Widget current = GestureDetector(
      onTap: widget.enabled && widget.onPress != null ? _onTap : null,
      onLongPress: widget.enabled && widget.onLongPress != null
          ? _onLongPress
          : null,
      behavior: widget.hitTestBehavior,
      excludeFromSemantics: true,
      child: MouseRegion(cursor: mouseCursor, child: focusable),
    );

    if (!widget.excludeFromSemantics) {
      // Only claim an enabled/disabled state for something that can be
      // disabled: a role, or an activation callback. A bare `none` wrapper is
      // not a control, so it should not be announced as one.
      final hasEnabledState =
          widget.semanticsRole != .none ||
          widget.onPress != null ||
          widget.onLongPress != null;

      current = Semantics(
        enabled: hasEnabledState ? widget.enabled : null,
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
