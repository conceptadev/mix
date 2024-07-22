// MouseRegionBuilder
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PointerListenerMixStateWidget extends StatefulWidget {
  const PointerListenerMixStateWidget({super.key, required this.child});

  final Widget child;

  @override
  State createState() => _PointerListenerMixStateWidgetState();
}

class _PointerListenerMixStateWidgetState
    extends State<PointerListenerMixStateWidget> {
  late final PointerListenerMixStateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PointerListenerMixStateController();
  }

  void _onHover(PointerHoverEvent event) {
    final size = context.size;
    if (size != null) {
      _controller.updateCursorPosition(event.localPosition, size);
    }
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
          return PointerListenerMixWidgetState(
            notifier: _controller,
            child: widget.child,
          );
        },
      ),
    );
  }
}

class PointerListenerMixStateController extends ChangeNotifier {
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

class PointerListenerMixWidgetState
    extends InheritedNotifier<PointerListenerMixStateController> {
  const PointerListenerMixWidgetState({
    super.key,
    required super.notifier,
    required super.child,
  });

  static PointerListenerMixStateController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PointerListenerMixWidgetState>()
        ?.notifier;
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
