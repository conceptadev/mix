import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
/// class MyTooltip extends StatefulWidget {
///   @override
///   _MyTooltipState createState() => _MyTooltipState();
/// }
///
/// class _MyTooltipState extends State<MyTooltip> {
///   bool _isVisible = false;
///
///   @override
///   Widget build(BuildContext context) {
///     return NakedTooltip(
///       tooltipWidget: Container(
///         padding: EdgeInsets.all(8),
///         decoration: BoxDecoration(
///           color: Colors.grey[800],
///           borderRadius: BorderRadius.circular(4),
///         ),
///         child: Text('This is a tooltip', style: TextStyle(color: Colors.white)),
///       ),
///       visible: _isVisible,
///       showDuration: const Duration(seconds: 2),
///       child: MouseRegion(
///         onEnter: (_) => setState(() => _isVisible = true),
///         onExit: (_) => setState(() => _isVisible = false),
///         child: Container(
///           padding: EdgeInsets.all(8),
///           decoration: BoxDecoration(
///             color: const Color(0xFF2196F3),
///             borderRadius: BorderRadius.circular(4),
///           ),
///           child: Text('Hover me', style: TextStyle(color: Colors.white)),
///         ),
///       ),
///     );
///   }
/// }
/// ```
class NakedTooltip extends StatefulWidget {
  /// The widget that triggers the tooltip.
  final Widget child;

  /// The widget to display in the tooltip.
  final Widget tooltipWidget;

  /// Whether the tooltip is currently visible.
  final bool visible;

  /// The anchor point on the tooltip that should be aligned with the target.
  final Alignment followerAnchor;

  /// The anchor point on the target that the tooltip should be aligned to.
  final Alignment targetAnchor;

  /// The offset of the tooltip from the target widget.
  final Offset offset;

  /// Optional semantic label for accessibility.
  final String? semanticLabel;

  /// The transition builder for the tooltip.
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  /// The animation style for the tooltip.
  ///
  /// Controls how the tooltip animates in and out.
  final AnimationStyle? animationStyle;

  /// Creates a naked tooltip.
  ///
  /// The [child] and [tooltipWidget] parameters are required.
  const 
  NakedTooltip({
    super.key,
    required this.child,
    required this.tooltipWidget,
    required this.visible,
    this.followerAnchor = Alignment.bottomCenter,
    this.targetAnchor = Alignment.topCenter,
    this.offset = const Offset(0, -8),
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.animationStyle,
    this.semanticLabel,
  });

  @override
  State<NakedTooltip> createState() => _NakedTooltipState();
}

class _NakedTooltipState extends State<NakedTooltip>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();

  static const _duration = Duration(milliseconds: 200);
  static const _curve = Curves.easeInOut;

  bool _tooltipShouldBeVisible = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    if (widget.visible) {
      _overlayController.show();
      _updateTooltipVisibility(true);
    }
  }

  @override
  void dispose() {
    if (_overlayController.isShowing) {
      _overlayController.hide();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(NakedTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _timer?.cancel();
      if (widget.visible) {
        _overlayController.show();

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _updateTooltipVisibility(true);
        });
      } else {
        _timer = Timer(widget.animationStyle?.duration ?? _duration, () {
          _overlayController.hide();
        });
        _updateTooltipVisibility(false);
      }
    });
  }

  void _updateTooltipVisibility(bool visible) {
    setState(() {
      _tooltipShouldBeVisible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: _overlayTooltipBuilder,
          child: widget.child,
        ),
      ),
    );
  }

  Widget _overlayTooltipBuilder(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: widget.animationStyle?.duration ?? _duration,
          reverseDuration: widget.animationStyle?.reverseDuration ?? _duration,
          switchInCurve: widget.animationStyle?.curve ?? _curve,
          switchOutCurve: widget.animationStyle?.reverseCurve ?? _curve,
          transitionBuilder: widget.transitionBuilder,
          child: _tooltipShouldBeVisible
              ? Semantics(
                  container: true,
                  child: KeyedSubtree(
                    key: const ValueKey(true),
                    child: CompositedTransformFollower(
                      targetAnchor: widget.targetAnchor,
                      followerAnchor: widget.followerAnchor,
                      offset: widget.offset,
                      link: _layerLink,
                      child: widget.tooltipWidget,
                    ),
                  ),
                )
              : const KeyedSubtree(
                  key: ValueKey(false),
                  child: SizedBox.shrink(),
                ),
        ),
      ],
    );
  }
}
