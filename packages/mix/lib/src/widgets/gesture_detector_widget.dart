import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import '../core/widget_state/internal/gesture_mix_state.dart';
import '../core/widget_state/internal/interactive_mix_state.dart';
import '../core/widget_state/internal/mix_widget_state_builder.dart';
import '../core/widget_state/internal/mouse_region_mix_state.dart';
import '../core/widget_state/widget_state_controller.dart';
import '../internal/constants.dart';

class MixGestureDetector extends StatefulWidget {
  const MixGestureDetector({
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
    this.controller,
    this.actions,
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

  /// Called when a pointer that will trigger a tap has stopped contacting the screen.
  final GestureTapUpCallback? onTapUp;

  /// Called when the pointer that previously triggered [onTapDown] will not end up causing a tap.
  final GestureTapCancelCallback? onTapCancel;

  /// Called when a long press gesture has been recognized.
  final GestureLongPressStartCallback? onLongPressStart;

  /// Called when a long press gesture that had been recognized is ended.
  final GestureLongPressEndCallback? onLongPressEnd;

  /// Called when a long press gesture that had been recognized is canceled.
  final GestureLongPressCancelCallback? onLongPressCancel;

  /// Called when a pointer has contacted the screen and might begin to move.
  final GestureDragDownCallback? onPanDown;

  /// Called when a pointer that is in contact with the screen and moving has moved again.
  final GestureDragUpdateCallback? onPanUpdate;

  /// Called when a pointer that was previously in contact with the screen and moving is no longer in contact with the screen.
  final GestureDragEndCallback? onPanEnd;

  /// Called when the pointer that previously triggered [onPanDown] did not complete.
  final GestureDragCancelCallback? onPanCancel;

  /// Called when a pointer has contacted the screen and has begun to move.
  final GestureDragStartCallback? onPanStart;

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

  final MixWidgetStateController? controller;

  /// The duration to wait after the press is released before the state of pressed is removed
  final Duration unpressDelay;

  @override
  State createState() => MixGestureDetectorState();
}

@visibleForTesting
class MixGestureDetectorState extends State<MixGestureDetector> {
  late final MixWidgetStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? MixWidgetStateController();
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
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

  /// Binds the [ActivateIntent] from the Flutter SDK to the onPressed callback by default.
  /// This enables SPACE and ENTER key activation on most platforms.
  /// Additional actions can be provided externally to extend functionality.
  Map<Type, Action<Intent>> get actions {
    return {
      ActivateIntent:
          CallbackAction<Intent>(onInvoke: (_) => widget.onPress?.call()),
      ...?widget.actions,
    };
  }

  @override
  Widget build(BuildContext context) {
    Widget current = GestureMixStateWidget(
      enableFeedback: widget.enableFeedback,
      controller: _controller,
      onTap: widget.enabled ? widget.onPress : null,
      onLongPress: widget.enabled ? widget.onLongPress : null,
      onTapUp: widget.enabled ? widget.onTapUp : null,
      onTapCancel: widget.enabled ? widget.onTapCancel : null,
      onLongPressStart: widget.enabled ? widget.onLongPressStart : null,
      onLongPressEnd: widget.enabled ? widget.onLongPressEnd : null,
      onLongPressCancel: widget.enabled ? widget.onLongPressCancel : null,
      onPanDown: widget.enabled ? widget.onPanDown : null,
      onPanUpdate: widget.enabled ? widget.onPanUpdate : null,
      onPanEnd: widget.enabled ? widget.onPanEnd : null,
      onPanCancel: widget.enabled ? widget.onPanCancel : null,
      onPanStart: widget.enabled ? widget.onPanStart : null,
      excludeFromSemantics: widget.excludeFromSemantics,
      hitTestBehavior: widget.hitTestBehavior,
      unpressDelay: widget.unpressDelay,
      child: InteractiveMixStateWidget(
        enabled: widget.enabled,
        onFocusChange: widget.onFocusChange,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onKey: widget.onKey,
        onKeyEvent: widget.onKeyEvent,
        canRequestFocus: widget.canRequestFocus,
        mouseCursor: mouseCursor,
        controller: _controller,
        actions: actions,
        child: MouseRegionMixStateWidget(
          child: MixWidgetStateBuilder(
            controller: _controller,
            builder: (_) => widget.child,
          ),
        ),
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
