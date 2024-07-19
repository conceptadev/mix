// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// import 'widget_state_controller.dart';

// class PointerListenerBuilder extends StatefulWidget {
//   const PointerListenerBuilder({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   @override
//   State createState() => _PointerListenerBuilderState();
// }

// class _PointerListenerBuilderState extends State<PointerListenerBuilder> {
//   late final _PointerListenerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = _PointerListenerController();
//   }

//   void _handlePointerEvent(PointerEvent event) {
//     if (event is PointerHoverEvent) {
//       final size = context.size;
//       if (size != null) {
//         _controller.updateCursorPosition(event.localPosition, size);
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Listener(
//       onPointerHover: _handlePointerEvent,
//       child: MixStateBuilder(
//         controller: _controller,
//         builder: (_) => widget.child,
//       ),
//     );
//   }
// }

// enum PointerListenerEvent {
//   hover,
//   exit,
//   enter,
// }

// class PointerListenerController extends MixStateController {
//   final _onPointerHoverEvent = ValueNotifier<PointerHoverEvent?>(null);
//   final _onPointerExitEvent = ValueNotifier<PointerExitEvent?>(null);
//   final _onPointerEnterEvent = ValueNotifier<PointerEnterEvent?>(null);

//   void onPointerEvent(PointerEvent event) {
//     if (event is PointerHoverEvent) {
//       _onPointerHoverEvent.value = event;
//     } else if (event is PointerExitEvent) {
//       _onPointerExitEvent.value = event;
//     } else if (event is PointerEnterEvent) {
//       _onPointerEnterEvent.value = event;
//     }
//   }

//   @override
//   void dispose() {
//     _onPointerHoverEvent.dispose();
//     _onPointerExitEvent.dispose();
//     _onPointerEnterEvent.dispose();
//     super.dispose();
//   }
// }

// class PointerPosition {
//   final Alignment position;
//   final Offset offset;
//   const PointerPosition({required this.position, required this.offset});

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is PointerPosition &&
//         other.position == position &&
//         other.offset == offset;
//   }

//   @override
//   int get hashCode => position.hashCode ^ offset.hashCode;
// }
