import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InteractiveWidget extends _InteractableWidgetBuilder {
  const InteractiveWidget({
    super.key,
    required super.child,
    super.enabled,
    Function(bool focus)? super.onFocusChange,
    super.autofocus,
    super.focusNode,
    super.onKey,
    super.onKeyEvent,
    super.canRequestFocus,
    super.mouseCursor,
    super.shortcuts,
    super.actions,
    super.onEnter,
    super.onExit,
    super.onHover,
    super.onShowFocusHighlight,
    super.onShowHoverHighlight,
  });

  @override
  State createState() => _InteractiveStateBuilder();
}

class _InteractiveStateBuilder
    extends _InteractiveStateBuilderState<InteractiveWidget> {}

abstract class _InteractableWidgetBuilder extends StatefulWidget {
  const _InteractableWidgetBuilder({
    super.key,
    required this.child,
    this.enabled = true,
    this.onFocusChange,
    this.autofocus = false,
    this.focusNode,
    this.onKey,
    this.onShowFocusHighlight,
    this.onShowHoverHighlight,
    this.onKeyEvent,
    this.canRequestFocus = true,
    this.mouseCursor = MouseCursor.defer,
    this.shortcuts,
    this.actions,
    this.onEnter,
    this.onExit,
    this.onHover,
  });

  final bool enabled;
  final MouseCursor mouseCursor;

  final bool canRequestFocus;

  final Widget child;
  final Function(bool focus)? onShowFocusHighlight;
  final Function(bool hover)? onShowHoverHighlight;

  final ValueChanged<bool>? onFocusChange;

  final Map<ShortcutActivator, Intent>? shortcuts;

  final bool autofocus;

  final FocusNode? focusNode;

  final FocusOnKeyEventCallback? onKey;

  final FocusOnKeyEventCallback? onKeyEvent;

  final Map<Type, Action<Intent>>? actions;

  final void Function(PointerEnterEvent event)? onEnter;
  final void Function(PointerExitEvent event)? onExit;
  final void Function(PointerHoverEvent event)? onHover;
}

abstract class _InteractiveStateBuilderState<
    T extends _InteractableWidgetBuilder> extends State<T> {
  late final _InteractiveStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _InteractiveStateController();
    _controller.enabled = widget.enabled;
  }

  void _onShowFocusHighlight(bool hasFocus) {
    _controller.focused = hasFocus;
    widget.onShowFocusHighlight?.call(hasFocus);
  }

  void _onShowHoverHighlight(bool isHovered) {
    _controller.hovered = isHovered;
    widget.onShowHoverHighlight?.call(isHovered);
  }

  void _updateCursorPosition(Offset cursorOffset) {
    final size = context.size;
    if (size != null) {
      _controller.updateCursorPosition(cursorOffset, size);
    }
  }

  void _onHover(PointerHoverEvent event) {
    _updateCursorPosition(event.localPosition);
    widget.onHover?.call(event);
  }

  void _onEnter(PointerEnterEvent event) {
    _updateCursorPosition(event.localPosition);
    widget.onEnter?.call(event);
  }

  void _onExit(PointerExitEvent event) {
    _updateCursorPosition(event.localPosition);
    widget.onExit?.call(event);
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      onHover: _onHover,
      cursor: MouseCursor.defer,
      child: FocusableActionDetector(
        enabled: widget.enabled,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        mouseCursor: widget.mouseCursor,
        shortcuts: widget.shortcuts,
        actions: widget.actions,
        onShowFocusHighlight: _onShowFocusHighlight,
        onShowHoverHighlight: _onShowHoverHighlight,
        onFocusChange: widget.onFocusChange,
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) {
            return InteractiveState(
              enabled: _controller.enabled,
              focused: _controller.focused,
              hovered: _controller.hovered,
              pointerPosition: _controller.pointerPosition,
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}

class _InteractiveStateController extends ChangeNotifier {
  bool _enabled = false;
  bool _focused = false;
  bool _hovered = false;
  PointerPosition? _pointerPosition;

  bool get focused => _enabled && _focused;
  bool get hovered => _enabled && _hovered;
  bool get enabled => _enabled;
  bool get disabled => !_enabled;
  PointerPosition? get pointerPosition => _enabled ? _pointerPosition : null;

  set enabled(bool value) {
    if (_enabled == value) return;

    _enabled = value;
    notifyListeners();
  }

  set focused(bool value) {
    if (_focused == value) return;

    _focused = value;
    notifyListeners();
  }

  set hovered(bool value) {
    if (_hovered == value) return;
    _hovered = value;
    notifyListeners();
  }

  void updateCursorPosition(Offset cursorOffset, Size size) {
    final ax = cursorOffset.dx / size.width;
    final ay = cursorOffset.dy / size.height;
    final cursorAlignment = Alignment(
      ((ax - 0.5) * 2).clamp(-1.0, 1.0),
      ((ay - 0.5) * 2).clamp(-1.0, 1.0),
    );

    _pointerPosition = PointerPosition(
      position: cursorAlignment,
      offset: cursorOffset,
    );

    notifyListeners();
  }
}

class PointerPosition {
  final Alignment position;
  final Offset offset;
  const PointerPosition({required this.position, required this.offset});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PointerPosition &&
        other.position == position &&
        other.offset == offset;
  }

  @override
  int get hashCode => position.hashCode ^ offset.hashCode;
}

enum InteractiveAspect {
  enabled,
  focused,
  hovered,
  pointerPosition,
}

class InteractiveState extends InheritedModel<InteractiveAspect> {
  const InteractiveState({
    super.key,
    required super.child,
    required this.enabled,
    required this.focused,
    required this.hovered,
    required this.pointerPosition,
  });

  static InteractiveState of(
    BuildContext context, [
    InteractiveAspect? aspect,
  ]) {
    final InteractiveState? result = maybeOf(context, aspect);
    assert(result != null, 'Unable to find an instance of PressableState...');

    return result!;
  }

  static InteractiveState? maybeOf(
    BuildContext context, [
    InteractiveAspect? aspect,
  ]) {
    return InheritedModel.inheritFrom<InteractiveState>(
      context,
      aspect: aspect,
    );
  }

  static bool enabledOf(BuildContext context) {
    return of(context, InteractiveAspect.enabled).enabled;
  }

  static bool disabledOf(BuildContext context) {
    return !enabledOf(context);
  }

  static bool focusedOf(BuildContext context) {
    return of(context, InteractiveAspect.focused).focused;
  }

  static bool hoveredOf(BuildContext context) {
    return of(context, InteractiveAspect.hovered).hovered;
  }

  static PointerPosition? pointerPositionOf(BuildContext context) {
    return of(context, InteractiveAspect.pointerPosition).pointerPosition;
  }

  final bool enabled;
  final bool focused;
  final bool hovered;
  final PointerPosition? pointerPosition;

  bool get disabled => !enabled;

  @override
  bool updateShouldNotify(InteractiveState oldWidget) {
    return enabled != oldWidget.enabled ||
        focused != oldWidget.focused ||
        hovered != oldWidget.hovered ||
        pointerPosition != oldWidget.pointerPosition;
  }

  @override
  bool updateShouldNotifyDependent(
    InteractiveState oldWidget,
    Set<InteractiveAspect> dependencies,
  ) {
    return dependencies.contains(InteractiveAspect.enabled) &&
            enabled != oldWidget.enabled ||
        dependencies.contains(InteractiveAspect.focused) &&
            focused != oldWidget.focused ||
        dependencies.contains(InteractiveAspect.hovered) &&
            hovered != oldWidget.hovered ||
        dependencies.contains(InteractiveAspect.pointerPosition) &&
            pointerPosition != oldWidget.pointerPosition;
  }
}
