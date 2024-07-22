// MouseRegionBuilder
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListenerMixStateWidget extends StatefulWidget {
  const ListenerMixStateWidget({
    super.key,
    required this.child,
    this.onHover,
  });

  final Widget child;

  final void Function(PointerHoverEvent event)? onHover;

  @override
  State createState() => _ListenerMixStateWidgetState();
}

class _ListenerMixStateWidgetState extends State<ListenerMixStateWidget> {
  late final _ListenerMixStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _ListenerMixStateController();
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check if we need MouseRegion

    return Listener(
      onPointerHover: _onHover,
      child: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return ListerMixStateProvider(
            pointerPosition: _controller.pointerPosition,
            child: widget.child,
          );
        },
      ),
    );
  }
}

class _ListenerMixStateController extends ChangeNotifier {
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

class ListerMixStateProvider extends InheritedWidget {
  const ListerMixStateProvider({
    super.key,
    required super.child,
    required this.pointerPosition,
  });

  static ListerMixStateProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  final PointerPosition? pointerPosition;

  @override
  bool updateShouldNotify(ListerMixStateProvider oldWidget) {
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
