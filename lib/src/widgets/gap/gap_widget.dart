import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'gap_rendering.dart';

// Attribution:
// This code is adapted from the 'gap:2.0.1' package available at: https://pub.dev/packages/gap
// All credit goes to the package author, @letsar (https://github.com/letsar), for developing this fantastic package.
// In order to reduce the number of dependencies, this code was directly incorporated into our project instead of importing the entire package.

/// A widget that takes a fixed amount of space in the direction of its parent.
///
/// It only works in the following cases:
/// - It is a descendant of a [Row], [Column], or [Flex],
/// and the path from the [Gap] widget to its enclosing [Row], [Column], or
/// [Flex] must contain only [StatelessWidget]s or [StatefulWidget]s (not other
/// kinds of widgets, like [RenderObjectWidget]s).
/// - It is a descendant of a [Scrollable].
///
/// See also:
///
///  * [MaxGap], a gap that can take, at most, the amount of space specified.
///  * [SliverGap], the sliver version of this widget.
class Gap extends StatelessWidget {
  /// Creates a widget that takes a fixed [mainAxisExtent] of space in the
  /// direction of its parent.
  ///
  /// The [mainAxisExtent] must not be null and must be positive.
  /// The [crossAxisExtent] must be either null or positive.
  const Gap(
    this.mainAxisExtent, {
    Key? key,
    this.crossAxisExtent,
    this.color,
  })  : assert(mainAxisExtent >= 0 && mainAxisExtent < double.infinity),
        assert(crossAxisExtent == null || crossAxisExtent >= 0),
        super(key: key);

  /// Creates a widget that takes a fixed [mainAxisExtent] of space in the
  /// direction of its parent and expands in the cross axis direction.
  ///
  /// The [mainAxisExtent] must not be null and must be positive.
  const Gap.expand(
    double mainAxisExtent, {
    Key? key,
    Color? color,
  }) : this(
          mainAxisExtent,
          key: key,
          crossAxisExtent: double.infinity,
          color: color,
        );

  /// The amount of space this widget takes in the direction of its parent.
  ///
  /// For example:
  /// - If the parent is a [Column] this is the height of this widget.
  /// - If the parent is a [Row] this is the width of this widget.
  ///
  /// Must not be null and must be positive.
  final double mainAxisExtent;

  /// The amount of space this widget takes in the opposite direction of the
  /// parent.
  ///
  /// For example:
  /// - If the parent is a [Column] this is the width of this widget.
  /// - If the parent is a [Row] this is the height of this widget.
  ///
  /// Must be positive or null. If it's null (the default) the cross axis extent
  /// will be the same as the constraints of the parent in the opposite
  /// direction.
  final double? crossAxisExtent;

  /// The color used to fill the gap.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scrollableState = Scrollable.maybeOf(context);
    final AxisDirection? axisDirection = scrollableState?.axisDirection;
    final Axis? fallbackDirection =
        axisDirection == null ? null : axisDirectionToAxis(axisDirection);

    return _RawGap(
      mainAxisExtent,
      crossAxisExtent: crossAxisExtent,
      color: color,
      fallbackDirection: fallbackDirection,
    );
  }
}

/// A widget that takes, at most, an amount of space in a [Row], [Column],
/// or [Flex] widget.
///
/// A [MaxGap] widget must be a descendant of a [Row], [Column], or [Flex],
/// and the path from the [MaxGap] widget to its enclosing [Row], [Column], or
/// [Flex] must contain only [StatelessWidget]s or [StatefulWidget]s (not other
/// kinds of widgets, like [RenderObjectWidget]s).
///
/// See also:
///
///  * [Gap], the unflexible version of this widget.
class MaxGap extends StatelessWidget {
  /// Creates a widget that takes, at most, the specified [mainAxisExtent] of
  /// space in a [Row], [Column], or [Flex] widget.
  ///
  /// The [mainAxisExtent] must not be null and must be positive.
  /// The [crossAxisExtent] must be either null or positive.
  const MaxGap(
    this.mainAxisExtent, {
    Key? key,
    this.crossAxisExtent,
    this.color,
  }) : super(key: key);

  /// Creates a widget that takes, at most, the specified [mainAxisExtent] of
  /// space in a [Row], [Column], or [Flex] widget and expands in the cross axis
  /// direction.
  ///
  /// The [mainAxisExtent] must not be null and must be positive.
  /// The [crossAxisExtent] must be either null or positive.
  const MaxGap.expand(
    double mainAxisExtent, {
    Key? key,
    Color? color,
  }) : this(
          mainAxisExtent,
          key: key,
          crossAxisExtent: double.infinity,
          color: color,
        );

  /// The amount of space this widget takes in the direction of the parent.
  ///
  /// If the parent is a [Column] this is the height of this widget.
  /// If the parent is a [Row] this is the width of this widget.
  ///
  /// Must not be null and must be positive.
  final double mainAxisExtent;

  /// The amount of space this widget takes in the opposite direction of the
  /// parent.
  ///
  /// If the parent is a [Column] this is the width of this widget.
  /// If the parent is a [Row] this is the height of this widget.
  ///
  /// Must be positive or null. If it's null (the default) the cross axis extent
  /// will be the same as the constraints of the parent in the opposite
  /// direction.
  final double? crossAxisExtent;

  /// The color used to fill the gap.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: _RawGap(
        mainAxisExtent,
        crossAxisExtent: crossAxisExtent,
        color: color,
      ),
    );
  }
}

class _RawGap extends LeafRenderObjectWidget {
  const _RawGap(
    this.mainAxisExtent, {
    Key? key,
    this.crossAxisExtent,
    this.color,
    this.fallbackDirection,
  })  : assert(mainAxisExtent >= 0 && mainAxisExtent < double.infinity),
        assert(crossAxisExtent == null || crossAxisExtent >= 0),
        super(key: key);

  final double mainAxisExtent;

  final double? crossAxisExtent;

  final Color? color;

  final Axis? fallbackDirection;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderGap(
      mainAxisExtent: mainAxisExtent,
      crossAxisExtent: crossAxisExtent ?? 0,
      color: color,
      fallbackDirection: fallbackDirection,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject
      ..mainAxisExtent = mainAxisExtent
      ..crossAxisExtent = crossAxisExtent ?? 0
      ..color = color
      ..fallbackDirection = fallbackDirection;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', mainAxisExtent));
    properties.add(DoubleProperty(
      'crossAxisExtent',
      crossAxisExtent,
      defaultValue: 0,
    ));
    properties.add(ColorProperty('color', color));
    properties.add(EnumProperty<Axis>('fallbackDirection', fallbackDirection));
  }
}
