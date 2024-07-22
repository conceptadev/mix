// MouseRegionBuilder
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PointerPositionStateWidget extends StatefulWidget {
  const PointerPositionStateWidget({
    super.key,
    required this.child,
    this.onEnter,
    this.onExit,
    this.onHover,
  });

  final Widget child;
  final void Function(PointerEnterEvent event)? onEnter;
  final void Function(PointerExitEvent event)? onExit;
  final void Function(PointerHoverEvent event)? onHover;

  @override
  State createState() => _PointerPositionStateWidgetState();
}

class _PointerPositionStateWidgetState
    extends State<PointerPositionStateWidget> {
  late final _MouseRegionMixStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _MouseRegionMixStateController();
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check if we need MouseRegion

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      onHover: _onHover,
      cursor: MouseCursor.defer,
      child: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return PointerPositionProvider(
            pointerPosition: _controller.pointerPosition,
            child: widget.child,
          );
        },
      ),
    );
  }
}

class _MouseRegionMixStateController extends ChangeNotifier {
  PointerPosition? _pointerPosition;

  PointerPosition? get pointerPosition => _pointerPosition;

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

class PointerPositionProvider extends InheritedWidget {
  const PointerPositionProvider({
    super.key,
    required super.child,
    required this.pointerPosition,
  });

  static PointerPositionProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  final PointerPosition? pointerPosition;

  @override
  bool updateShouldNotify(PointerPositionProvider oldWidget) {
    return pointerPosition != oldWidget.pointerPosition;
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
