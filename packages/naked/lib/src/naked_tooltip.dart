import 'package:flutter/material.dart';

/// A fully customizable tooltip with no default styling.
///
/// NakedTooltip provides core tooltip behavior and accessibility
/// without imposing any visual styling, giving consumers complete design freedom.
///
/// This component handles showing and hiding tooltips, positioning the tooltip
/// relative to the target widget, and automatically dismissing the tooltip
/// after a specified duration.
///
/// Example:
/// ```dart
// class MyTooltip extends StatefulWidget {
//   @override
//   _MyTooltipState createState() => _MyTooltipState();
// }

// class _MyTooltipState extends State<MyTooltip>
//     with SingleTickerProviderStateMixin {
//   late final _controller = OverlayPortalController();
//   late final animationController = AnimationController(
//     duration: const Duration(milliseconds: 2000),
//     vsync: this,
//   );
//   late final CurvedAnimation _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animation = CurvedAnimation(
//       parent: animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NakedTooltip(
//       fallbackAlignments: [
//         AlignmentPair(
//           target: Alignment.topCenter,
//           follower: Alignment.bottomCenter,
//           offset: const Offset(0, -8),
//         ),
//       ],
//       targetAnchor: Alignment.bottomCenter,
//       followerAnchor: Alignment.topCenter,
//       offset: const Offset(0, 8),
//       tooltipWidgetBuilder:
//           (context) => FadeTransition(
//             opacity: _animation,
//             child: Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.grey[800],
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Text(
//                 'This is a tooltip',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//       controller: _controller,
//       child: MouseRegion(
//         onEnter: (_) {
//           _controller.show();
//           animationController.forward();
//         },
//         onExit: (_) {
//           animationController.reverse().then((_) {
//             _controller.hide();
//           });
//         },
//         child: Container(
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: const Color(0xFF2196F3),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Text('Hover me', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//     );
//   }
// }
/// ```

class NakedTooltip extends StatefulWidget {
  /// The widget that triggers the tooltip.
  final Widget child;

  /// The widget to display in the tooltip.
  final WidgetBuilder tooltipWidgetBuilder;

  /// Whether the tooltip is currently visible.
  final OverlayPortalController controller;

  /// The anchor point on the tooltip that should be aligned with the target.
  final Alignment followerAnchor;

  /// The anchor point on the target that the tooltip should be aligned to.
  final Alignment targetAnchor;

  /// The offset of the tooltip from the target widget.
  final Offset offset;

  /// Optional semantic label for accessibility.
  final String? semanticLabel;

  /// The fallback alignments for the tooltip.
  final List<AlignmentPair> fallbackAlignments;

  /// Creates a naked tooltip.
  ///
  /// The [child] and [tooltipWidget] parameters are required.
  const NakedTooltip({
    super.key,
    required this.child,
    required this.tooltipWidgetBuilder,
    required this.controller,
    this.followerAnchor = Alignment.bottomCenter,
    this.targetAnchor = Alignment.topCenter,
    this.offset = const Offset(0, -8),
    this.semanticLabel,
    this.fallbackAlignments = const [],
  });

  @override
  State<NakedTooltip> createState() => _NakedTooltipState();
}

class _NakedTooltipState extends State<NakedTooltip>
    with SingleTickerProviderStateMixin {
  Widget _overlayTooltipBuilder(BuildContext context) {
    final OverlayState overlayState = Overlay.of(
      context,
      debugRequiredFor: widget,
    );
    final RenderBox box = this.context.findRenderObject()! as RenderBox;
    final Offset target = box.localToGlobal(
      box.size.topLeft(Offset.zero),
      ancestor: overlayState.context.findRenderObject(),
    );

    return Positioned.fill(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      child: CustomSingleChildLayout(
        delegate: _TooltipPositionDelegate(
          target: target,
          targetSize: box.size,
          alignment: AlignmentPair(
            target: widget.targetAnchor,
            follower: widget.followerAnchor,
            offset: widget.offset,
          ),
          fallbackAlignments: widget.fallbackAlignments,
        ),
        child: widget.tooltipWidgetBuilder(context),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller.isShowing) {
      widget.controller.hide();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: OverlayPortal(
        overlayChildBuilder: _overlayTooltipBuilder,
        controller: widget.controller,
        child: widget.child,
      ),
    );
  }
}

class AlignmentPair {
  final Alignment target;
  final Alignment follower;
  final Offset offset;

  const AlignmentPair({
    required this.target,
    required this.follower,
    this.offset = Offset.zero,
  });
}

class _TooltipPositionDelegate extends SingleChildLayoutDelegate {
  /// Creates a delegate for computing the layout of a tooltip.
  _TooltipPositionDelegate({
    required this.target,
    required this.targetSize,
    required this.alignment,
    required this.fallbackAlignments,
  });

  /// The offset of the target the tooltip is positioned near in the global
  /// coordinate system.
  final Offset target;

  /// The amount of vertical distance between the target and the displayed
  /// tooltip.
  final Size targetSize;

  final AlignmentPair alignment;

  final List<AlignmentPair> fallbackAlignments;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return _calculateOverlayPosition(
      screenSize: size,
      targetSize: targetSize,
      targetPosition: target,
      overlaySize: childSize,
      alignment: alignment,
      fallbackAlignments: fallbackAlignments,
    );
  }

  @override
  bool shouldRelayout(_TooltipPositionDelegate oldDelegate) {
    return target != oldDelegate.target || targetSize != oldDelegate.targetSize;
  }
}

Offset _calculateOverlayPosition({
  required Size screenSize,
  required Size targetSize,
  required Offset targetPosition,
  required Size overlaySize,
  required AlignmentPair alignment,
  List<AlignmentPair> fallbackAlignments = const [],
}) {
  final allAlignments = [alignment, ...fallbackAlignments];

  for (final pair in allAlignments) {
    final candidate = _calculateAlignedOffset(
      targetTopLeft: targetPosition,
      targetSize: targetSize,
      overlaySize: overlaySize,
      alignment: pair,
    );

    if (_isOverlayFullyVisible(candidate, overlaySize, screenSize)) {
      return candidate;
    }
  }

  // Return first attempt even if it overflows
  return _calculateAlignedOffset(
    targetTopLeft: targetPosition,
    targetSize: targetSize,
    overlaySize: overlaySize,
    alignment: alignment,
  );
}

Offset _calculateAlignedOffset({
  required Offset targetTopLeft,
  required Size targetSize,
  required Size overlaySize,
  required AlignmentPair alignment,
}) {
  final targetAnchorOffset = alignment.target.alongSize(targetSize);
  final followerAnchorOffset = alignment.follower.alongSize(overlaySize);

  return targetTopLeft +
      targetAnchorOffset -
      followerAnchorOffset +
      alignment.offset;
}

bool _isOverlayFullyVisible(
  Offset overlayTopLeft,
  Size overlaySize,
  Size screenSize,
) {
  return overlayTopLeft.dx >= 0 &&
      overlayTopLeft.dy >= 0 &&
      overlayTopLeft.dx + overlaySize.width <= screenSize.width &&
      overlayTopLeft.dy + overlaySize.height <= screenSize.height;
}
