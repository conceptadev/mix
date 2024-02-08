import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomFocusableActionDetector extends StatefulWidget {
  /// Create a const [CustomFocusableActionDetector].
  const CustomFocusableActionDetector({
    super.key,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
    this.shortcuts,
    this.actions,
    this.onShowFocusHighlight,
    this.onShowHoverHighlight,
    this.onFocusChange,
    this.mouseCursor = MouseCursor.defer,
    this.includeFocusSemantics = true,
    this.onMouseEnter,
    this.onMouseExit,
    this.onMouseHover,
    required this.child,
  });

  /// Is this widget enabled or not.
  ///
  /// If disabled, will not send any notifications needed to update highlight or
  /// focus state, and will not define or respond to any actions or shortcuts.
  ///
  /// When disabled, adds [Focus] to the widget tree, but sets
  /// [Focus.canRequestFocus] to false.
  final bool enabled;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.descendantsAreFocusable}
  final bool descendantsAreFocusable;

  /// {@macro flutter.widgets.Focus.descendantsAreTraversable}
  final bool descendantsAreTraversable;

  /// {@macro flutter.widgets.actions.actions}
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.widgets.shortcuts.shortcuts}
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// A function that will be called when the focus highlight should be shown or
  /// hidden.
  ///
  /// This method is not triggered at the unmount of the widget.
  final ValueChanged<bool>? onShowFocusHighlight;

  /// A function that will be called when the hover highlight should be shown or hidden.
  ///
  /// This method is not triggered at the unmount of the widget.
  final ValueChanged<bool>? onShowHoverHighlight;

  /// A function that will be called when the focus changes.
  ///
  /// Called with true if the [focusNode] has primary focus.
  final ValueChanged<bool>? onFocusChange;

  /// A function that will be called when the mouse enters
  ///
  /// Called with the [PointerEnterEvent] when the mouse enters the widget.
  final void Function(PointerExitEvent event)? onMouseExit;

  /// A function that will be called when the mouse exits
  ///
  /// Called with the [PointerExitEvent] when the mouse exits the widget.
  final void Function(PointerEnterEvent event)? onMouseEnter;

  /// A function that will be called when the pointer hovers over the widget.
  ///
  /// Called with the [PointerHoverEvent] when the pointer hovers over the widget.
  final void Function(PointerHoverEvent event)? onMouseHover;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// The [mouseCursor] defaults to [MouseCursor.defer], deferring the choice of
  /// cursor to the next region behind it in hit-test order.
  final MouseCursor mouseCursor;

  /// Whether to include semantics from [Focus].
  ///
  /// Defaults to true.
  final bool includeFocusSemantics;

  /// The child widget for this [CustomFocusableActionDetector] widget.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  @override
  State<CustomFocusableActionDetector> createState() =>
      _CustomFocusableActionDetectorState();
}

class _CustomFocusableActionDetectorState
    extends State<CustomFocusableActionDetector> {
  // This global key is needed to keep only the necessary widgets in the tree
  // while maintaining the subtree's state.
  //
  // See https://github.com/flutter/flutter/issues/64058 for an explanation of
  // why using a global key over keeping the shape of the tree.
  final GlobalKey _mouseRegionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      _updateHighlightMode(FocusManager.instance.highlightMode);
    });
    FocusManager.instance
        .addHighlightModeListener(_handleFocusHighlightModeChange);
  }

  void _updateHighlightMode(FocusHighlightMode mode) {
    _mayTriggerCallback(task: () {
      switch (mode) {
        case FocusHighlightMode.touch:
          _canShowHighlight = false;
          break;
        case FocusHighlightMode.traditional:
          _canShowHighlight = true;
          break;
      }
    });
  }

  // Have to have this separate from the _updateHighlightMode because it gets
  // called in initState, where things aren't mounted yet.
  // Since this method is a highlight mode listener, it is only called
  // immediately following pointer events.
  void _handleFocusHighlightModeChange(FocusHighlightMode mode) {
    if (!mounted) {
      return;
    }
    _updateHighlightMode(mode);
  }

  void _handleMouseEnter(PointerEnterEvent event) {
    if (!_hovering) {
      _mayTriggerCallback(task: () {
        _hovering = true;
      });
      widget.onMouseEnter?.call(event);
    }
  }

  void _handleMouseExit(PointerExitEvent event) {
    if (_hovering) {
      _mayTriggerCallback(task: () {
        _hovering = false;
      });
      widget.onMouseExit?.call(event);
    }
  }

  void _handleFocusChange(bool focused) {
    if (_focused != focused) {
      _mayTriggerCallback(task: () {
        _focused = focused;
      });
      widget.onFocusChange?.call(_focused);
    }
  }

  // Record old states, do `task` if not null, then compare old states with the
  // new states, and trigger callbacks if necessary.
  //
  // The old states are collected from `oldWidget` if it is provided, or the
  // current widget (before doing `task`) otherwise. The new states are always
  // collected from the current widget.
  void _mayTriggerCallback({
    VoidCallback? task,
    CustomFocusableActionDetector? oldWidget,
  }) {
    bool shouldShowHoverHighlight(CustomFocusableActionDetector target) {
      return _hovering && target.enabled && _canShowHighlight;
    }

    bool canRequestFocus(CustomFocusableActionDetector target) {
      final NavigationMode mode = MediaQuery.maybeNavigationModeOf(context) ??
          NavigationMode.traditional;
      switch (mode) {
        case NavigationMode.traditional:
          return target.enabled;
        case NavigationMode.directional:
          return true;
      }
    }

    bool shouldShowFocusHighlight(CustomFocusableActionDetector target) {
      return _focused && _canShowHighlight && canRequestFocus(target);
    }

    assert(SchedulerBinding.instance.schedulerPhase !=
        SchedulerPhase.persistentCallbacks);
    final CustomFocusableActionDetector oldTarget = oldWidget ?? widget;
    final bool didShowHoverHighlight = shouldShowHoverHighlight(oldTarget);
    final bool didShowFocusHighlight = shouldShowFocusHighlight(oldTarget);
    if (task != null) {
      task();
    }
    final bool doShowHoverHighlight = shouldShowHoverHighlight(widget);
    final bool doShowFocusHighlight = shouldShowFocusHighlight(widget);
    if (didShowFocusHighlight != doShowFocusHighlight) {
      widget.onShowFocusHighlight?.call(doShowFocusHighlight);
    }
    if (didShowHoverHighlight != doShowHoverHighlight) {
      widget.onShowHoverHighlight?.call(doShowHoverHighlight);
    }
  }

  @override
  void dispose() {
    FocusManager.instance
        .removeHighlightModeListener(_handleFocusHighlightModeChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomFocusableActionDetector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
        _mayTriggerCallback(oldWidget: oldWidget);
      });
    }
  }

  bool _canShowHighlight = false;
  bool _hovering = false;
  bool _focused = false;
  bool get _canRequestFocus {
    final NavigationMode mode =
        MediaQuery.maybeNavigationModeOf(context) ?? NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return widget.enabled;
      case NavigationMode.directional:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = MouseRegion(
      key: _mouseRegionKey,
      onEnter: _handleMouseEnter,
      onExit: _handleMouseExit,
      cursor: widget.mouseCursor,
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onFocusChange: _handleFocusChange,
        canRequestFocus: _canRequestFocus,
        descendantsAreFocusable: widget.descendantsAreFocusable,
        descendantsAreTraversable: widget.descendantsAreTraversable,
        includeSemantics: widget.includeFocusSemantics,
        child: widget.child,
      ),
    );
    if (widget.enabled &&
        widget.actions != null &&
        widget.actions!.isNotEmpty) {
      child = Actions(actions: widget.actions!, child: child);
    }
    if (widget.enabled &&
        widget.shortcuts != null &&
        widget.shortcuts!.isNotEmpty) {
      child = Shortcuts(shortcuts: widget.shortcuts!, child: child);
    }

    return child;
  }
}
