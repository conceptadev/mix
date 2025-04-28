import 'package:flutter/material.dart';

class NakedPortal extends StatefulWidget {
  final OverlayPortalController controller;
  final WidgetBuilder overlayChildBuilder;
  final Widget? child;
  final AlignmentPair alignment;
  final List<AlignmentPair> fallbackAlignments;

  const NakedPortal({
    super.key,
    required this.controller,
    required this.overlayChildBuilder,
    this.child,
    this.alignment = const AlignmentPair(
      target: Alignment.topCenter,
      follower: Alignment.bottomCenter,
    ),
    this.fallbackAlignments = const [],
  });

  @override
  State<NakedPortal> createState() => _NakedPortalState();
}

class _NakedPortalState extends State<NakedPortal> {
  Widget _overlayBuilder(BuildContext context) {
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
        delegate: _NakedPositionDelegate(
          target: target,
          targetSize: box.size,
          alignment: widget.alignment,
          fallbackAlignments: widget.fallbackAlignments,
        ),
        child: widget.overlayChildBuilder(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: widget.controller,
      overlayChildBuilder: _overlayBuilder,
      child: widget.child,
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

class _NakedPositionDelegate extends SingleChildLayoutDelegate {
  /// Creates a delegate for computing the layout of a tooltip.
  _NakedPositionDelegate({
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
  bool shouldRelayout(_NakedPositionDelegate oldDelegate) {
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
