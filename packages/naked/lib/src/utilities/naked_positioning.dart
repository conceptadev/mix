import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Defines a position for anchoring an element to a target.
///
/// The [targetAnchor] defines the point on the target that
/// the [childAnchor] of the positioned element should align with.
class AnchorPosition {
  /// Creates an anchor position.
  const AnchorPosition({
    required this.targetAnchor,
    required this.childAnchor,
  });

  /// The anchor point on the target element.
  final Alignment targetAnchor;

  /// The anchor point on the child element.
  final Alignment childAnchor;

  /// Places the child above the target, centered horizontally.
  static const AnchorPosition topCenter = AnchorPosition(
    targetAnchor: Alignment.topCenter,
    childAnchor: Alignment.bottomCenter,
  );

  /// Places the child below the target, centered horizontally.
  static const AnchorPosition bottomCenter = AnchorPosition(
    targetAnchor: Alignment.bottomCenter,
    childAnchor: Alignment.topCenter,
  );

  /// Places the child to the left of the target, centered vertically.
  static const AnchorPosition leftCenter = AnchorPosition(
    targetAnchor: Alignment.centerLeft,
    childAnchor: Alignment.centerRight,
  );

  /// Places the child to the right of the target, centered vertically.
  static const AnchorPosition rightCenter = AnchorPosition(
    targetAnchor: Alignment.centerRight,
    childAnchor: Alignment.centerLeft,
  );

  /// Places the child at the top-left corner of the target.
  static const AnchorPosition topLeft = AnchorPosition(
    targetAnchor: Alignment.topLeft,
    childAnchor: Alignment.bottomLeft,
  );

  /// Places the child at the top-right corner of the target.
  static const AnchorPosition topRight = AnchorPosition(
    targetAnchor: Alignment.topRight,
    childAnchor: Alignment.bottomRight,
  );

  /// Places the child at the bottom-left corner of the target.
  static const AnchorPosition bottomLeft = AnchorPosition(
    targetAnchor: Alignment.bottomLeft,
    childAnchor: Alignment.topLeft,
  );

  /// Places the child at the bottom-right corner of the target.
  static const AnchorPosition bottomRight = AnchorPosition(
    targetAnchor: Alignment.bottomRight,
    childAnchor: Alignment.topRight,
  );
}

/// A widget that positions its child relative to a target element.
///
/// [NakedPositioning] automatically calculates the optimal position for its child
/// based on the target's position, preferred positions, and available screen space.
/// It handles viewport overflow by trying different positioning strategies in order
/// of preference until finding one that fits well within the screen bounds.
///
/// This widget is particularly useful for creating floating UI elements like dropdowns,
/// tooltips, popovers, and context menus that need to be positioned relative to
/// triggering elements while ensuring they remain fully visible within the viewport.
///
/// The positioning algorithm:
/// 1. Measures the child's size
/// 2. Tries each preferred position in order
/// 3. Evaluates how well each position fits within the viewport
/// 4. Uses the best-fitting position (or falls back to the first preferred position)
///
/// Example:
/// ```dart
/// NakedPositioning(
///   target: targetRect,
///   preferredPositions: [
///     AnchorPosition.bottomCenter,
///     AnchorPosition.topCenter,
///   ],
///   offset: const Offset(0, 8),
///   child: Container(
///     padding: EdgeInsets.all(16),
///     child: Text('Positioned Content'),
///   ),
/// )
/// ```
class NakedPositioning extends StatefulWidget {
  /// Creates a widget that positions its child relative to a target element.
  ///
  /// The [child] and [target] parameters are required.
  const NakedPositioning({
    super.key,
    required this.child,
    required this.target,
    this.preferredPositions = const [
      AnchorPosition.bottomCenter,
      AnchorPosition.topCenter,
      AnchorPosition.rightCenter,
      AnchorPosition.leftCenter,
    ],
    this.offset = Offset.zero,
    this.constraints,
    this.dynamicSizing = false,
    this.onPositionChanged,
    this.maintainTargetInSafeArea = true,
  });

  /// The widget to position relative to the target.
  ///
  /// This is the content that will be positioned according to the specified
  /// anchor positions and constraints.
  final Widget child;

  /// The target rectangle to position relative to.
  ///
  /// This defines the reference area that the child will be positioned in relation to.
  /// Typically, this is the bounding box of a trigger element like a button.
  final Rect target;

  /// Ordered list of preferred positions to try.
  ///
  /// The positions are tried in order until one fits well within the screen bounds.
  /// If none fit optimally, the position with the least overflow is used.
  /// Default positions try below, above, right, then left of the target.
  final List<AnchorPosition> preferredPositions;

  /// Additional offset to apply to the positioned element.
  ///
  /// This offset is applied after positioning according to the anchor positions.
  /// Useful for adding spacing between the target and child.
  final Offset offset;

  /// Optional size constraints for the positioned element.
  ///
  /// If provided, these constraints will be applied to the child widget.
  /// Useful for limiting the size of dynamic content.
  final BoxConstraints? constraints;

  /// Whether to track size changes for dynamic content.
  ///
  /// Set to true if the child's size may change after initial measurement.
  /// This causes the positioning to be recalculated when the child changes.
  final bool dynamicSizing;

  /// Callback when position changes.
  ///
  /// Called with the calculated position rectangle whenever the position is updated.
  /// Useful for animations or for coordinating with other UI elements.
  final ValueChanged<Rect>? onPositionChanged;

  /// Whether to ensure the target stays within safe area.
  ///
  /// When true, the positioning logic will account for device safe areas
  /// (notches, status bars, etc.) to ensure the content remains accessible.
  final bool maintainTargetInSafeArea;

  @override
  State<NakedPositioning> createState() => _NakedPositioningState();
}

class _NakedPositioningState extends State<NakedPositioning> {
  Size? _childSize;
  Rect? _calculatedPosition;
  MediaQueryData? _mediaQuery;
  bool _measuringComplete = false;

  @override
  void initState() {
    super.initState();
    // Initial position will be calculated after measurement
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Capture media query for screen size and safe area
    final newMediaQuery = MediaQuery.of(context);
    if (_mediaQuery != newMediaQuery) {
      _mediaQuery = newMediaQuery;
      if (_childSize != null) {
        _calculatePosition();
      }
    }
  }

  @override
  void didUpdateWidget(NakedPositioning oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if we need to recalculate position
    final needsRecalculation = oldWidget.target != widget.target ||
        oldWidget.preferredPositions != widget.preferredPositions ||
        oldWidget.offset != widget.offset ||
        oldWidget.constraints != widget.constraints ||
        oldWidget.maintainTargetInSafeArea != widget.maintainTargetInSafeArea;

    // Check if we need to remeasure
    final needsRemeasurement =
        widget.dynamicSizing && oldWidget.child != widget.child;

    if (needsRemeasurement) {
      _measuringComplete = false;
    } else if (needsRecalculation && _childSize != null) {
      _calculatePosition();
    }
  }

  void _calculatePosition() {
    if (_childSize == null || _mediaQuery == null) return;

    // Get screen size accounting for safe area if needed
    final screenSize = _mediaQuery!.size;
    final safeArea = widget.maintainTargetInSafeArea
        ? _mediaQuery!.padding
        : EdgeInsets.zero;

    // Track best position so far
    Rect? bestPosition;
    double bestScore = double.negativeInfinity;

    // Try each preferred position in order
    for (final position in widget.preferredPositions) {
      final targetPoint =
          _getAnchorPointOnTarget(widget.target, position.targetAnchor);
      final childPoint =
          _getAnchorPointOnChild(_childSize!, position.childAnchor);

      // Calculate position for this anchor combination
      final candidatePosition = Rect.fromLTWH(
        targetPoint.dx - childPoint.dx + widget.offset.dx,
        targetPoint.dy - childPoint.dy + widget.offset.dy,
        _childSize!.width,
        _childSize!.height,
      );

      // Score this position based on how well it fits on screen
      final score = _scorePosition(candidatePosition, screenSize, safeArea);

      if (score > bestScore) {
        bestScore = score;
        bestPosition = candidatePosition;

        // If position is fully on screen, we can stop searching
        if (score >= 1.0) break;
      }
    }

    // Apply constraints to best position found
    final constrainedPosition = bestPosition != null
        ? _applyConstraints(bestPosition)
        : Rect.fromLTWH(0, 0, _childSize!.width, _childSize!.height);

    // Update state
    setState(() {
      _calculatedPosition = constrainedPosition;
      widget.onPositionChanged?.call(constrainedPosition);
    });
  }

  Offset _getAnchorPointOnTarget(Rect target, Alignment alignment) {
    return Offset(
      target.left + target.width * ((alignment.x + 1) / 2),
      target.top + target.height * ((alignment.y + 1) / 2),
    );
  }

  Offset _getAnchorPointOnChild(Size size, Alignment alignment) {
    return Offset(
      size.width * ((alignment.x + 1) / 2),
      size.height * ((alignment.y + 1) / 2),
    );
  }

  double _scorePosition(Rect position, Size screenSize, EdgeInsets safeArea) {
    // Calculate how much of the position is visible on screen
    final visibleLeft = math.max(position.left, safeArea.left);
    final visibleTop = math.max(position.top, safeArea.top);
    final visibleRight =
        math.min(position.right, screenSize.width - safeArea.right);
    final visibleBottom =
        math.min(position.bottom, screenSize.height - safeArea.bottom);

    // If completely off screen in any dimension, return negative score
    if (visibleRight <= visibleLeft || visibleBottom <= visibleTop) {
      return -1.0;
    }

    // Calculate visible area ratio (1.0 means fully visible)
    final visibleWidth = visibleRight - visibleLeft;
    final visibleHeight = visibleBottom - visibleTop;
    final visibleArea = visibleWidth * visibleHeight;
    final totalArea = position.width * position.height;

    return visibleArea / totalArea;
  }

  Rect _applyConstraints(Rect position) {
    if (widget.constraints == null) return position;

    // Apply min/max width constraints
    double width = position.width;
    if (widget.constraints!.minWidth.isFinite &&
        width < widget.constraints!.minWidth) {
      width = widget.constraints!.minWidth;
    }
    if (widget.constraints!.maxWidth.isFinite &&
        width > widget.constraints!.maxWidth) {
      width = widget.constraints!.maxWidth;
    }

    // Apply min/max height constraints
    double height = position.height;
    if (widget.constraints!.minHeight.isFinite &&
        height < widget.constraints!.minHeight) {
      height = widget.constraints!.minHeight;
    }
    if (widget.constraints!.maxHeight.isFinite &&
        height > widget.constraints!.maxHeight) {
      height = widget.constraints!.maxHeight;
    }

    return Rect.fromLTWH(position.left, position.top, width, height);
  }

  @override
  Widget build(BuildContext context) {
    if (!_measuringComplete) {
      return _AdaptiveSizeMeasure(
        onChange: (size) {
          _childSize = size;
          _measuringComplete = true;
          _calculatePosition();
        },
        dynamicSizing: widget.dynamicSizing,
        child: widget.child,
      );
    }

    return Positioned(
      left: _calculatedPosition!.left,
      top: _calculatedPosition!.top,
      width: _calculatedPosition!.width,
      height: _calculatedPosition!.height,
      child: widget.child,
    );
  }
}

class _AdaptiveSizeMeasure extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onChange;
  final bool dynamicSizing;

  const _AdaptiveSizeMeasure({
    required this.child,
    required this.onChange,
    this.dynamicSizing = false,
  });

  @override
  _AdaptiveSizeMeasureState createState() => _AdaptiveSizeMeasureState();
}

class _AdaptiveSizeMeasureState extends State<_AdaptiveSizeMeasure> {
  Size? _lastReportedSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureSize());
  }

  @override
  void didUpdateWidget(_AdaptiveSizeMeasure oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dynamicSizing && oldWidget.child != widget.child) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureSize());
    }
  }

  void _measureSize() {
    if (!mounted) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final newSize = renderBox.size;

      // Only report if size changed or first measurement
      if (_lastReportedSize == null || _lastReportedSize != newSize) {
        _lastReportedSize = newSize;
        widget.onChange(newSize);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // For dynamic sizing, use a layout observer
    if (widget.dynamicSizing) {
      return LayoutBuilder(
        builder: (context, constraints) {
          // Schedule a post-frame callback to measure after this frame
          WidgetsBinding.instance.addPostFrameCallback((_) => _measureSize());
          return widget.child;
        },
      );
    }

    // For static sizing, just render the child
    return widget.child;
  }
}
