import 'package:flutter/material.dart';

import '../core/factory/style_mix.dart';
import '../core/internal/widget_state/gesturable_builder.dart';
import '../core/internal/widget_state/interactive_widget.dart';
import '../internal/constants.dart';
import '../specs/specs.dart';

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

class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.child,
    this.enabled = true,
    this.enableFeedback = false,
    this.onPress,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.onLongPress,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
    this.onKey,
    this.canRequestFocus = true,
    this.excludeFromSemantics = false,
    this.semanticButtonLabel,
    this.onKeyEvent,
    this.unpressDelay = kDefaultAnimationDuration,
    this.actions,
  });

  final Widget child;

  final bool enabled;

  final MouseCursor? mouseCursor;

  final String? semanticButtonLabel;

  final bool excludeFromSemantics;

  final bool canRequestFocus;

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
  final FocusOnKeyEventCallback? onKey;

  /// {@macro flutter.widgets.Focus.onKeyEvent}
  final FocusOnKeyEventCallback? onKeyEvent;

  /// {@macro flutter.widgets.GestureDetector.hitTestBehavior}
  final HitTestBehavior hitTestBehavior;

  /// Actions to be bound to the widget
  final Map<Type, Action<Intent>>? actions;

  /// The duration to wait after the press is released before the state of pressed is removed
  final Duration unpressDelay;

  @override
  // ignore: library_private_types_in_public_api
  _PressableState createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool get _hasOnPress => widget.onPress != null;

  MouseCursor get _mouseCursor {
    if (widget.mouseCursor != null) {
      return widget.mouseCursor!;
    }

    if (!widget.enabled) {
      return SystemMouseCursors.forbidden;
    }

    return _hasOnPress ? SystemMouseCursors.click : MouseCursor.defer;
  }

  /// Binds the [ActivateIntent] from the Flutter SDK to the onPressed callback by default.
  /// This enables SPACE and ENTER key activation on most platforms.
  /// Additional actions can be provided externally to extend functionality.
  Map<Type, Action<Intent>> get _actions {
    return {
      if (widget.onPress != null) ...{
        ActivateIntent:
            CallbackAction<Intent>(onInvoke: (_) => _handlePressed()),
      },
      ...(widget.actions ?? {}),
    };
  }

  void _handlePressed() {
    if (widget.enabled) {
      widget.onPress?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget current = GesturableWidget(
      enableFeedback: widget.enableFeedback,
      onTap: widget.enabled ? _handlePressed : null,
      onLongPress: widget.onLongPress,
      excludeFromSemantics: widget.excludeFromSemantics,
      hitTestBehavior: widget.hitTestBehavior,
      unpressDelay: widget.unpressDelay,
      child: InteractiveWidget(
        enabled: widget.enabled,
        onFocusChange: widget.onFocusChange,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onKey: widget.onKey,
        onKeyEvent: widget.onKeyEvent,
        canRequestFocus: widget.canRequestFocus,
        mouseCursor: _mouseCursor,
        actions: _actions,
        child: widget.child,
      ),
    );

    if (!widget.excludeFromSemantics) {
      current = Semantics(
        button: true,
        label: widget.semanticButtonLabel,
        onTap: widget.onPress,
        child: current,
      );
    }

    return current;
  }
}
