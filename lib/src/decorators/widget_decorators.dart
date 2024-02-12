// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class IntrinsicHeightDecorator
    extends WidgetDecorator<IntrinsicHeightDecorator> {
  const IntrinsicHeightDecorator({super.key});

  @override
  IntrinsicHeightDecorator lerp(IntrinsicWidthDecorator other, double t) {
    return this;
  }

  @override
  get props => [];

  @override
  Widget build(MixData mix, Widget child) =>
      IntrinsicHeight(key: key, child: child);
}

class IntrinsicWidthDecorator extends WidgetDecorator<IntrinsicWidthDecorator> {
  const IntrinsicWidthDecorator({super.key});

  @override
  IntrinsicWidthDecorator lerp(IntrinsicWidthDecorator other, double t) {
    return this;
  }

  @override
  get props => [];

  @override
  Widget build(MixData mix, Widget child) =>
      IntrinsicWidth(key: key, child: child);
}

/// A decorator that wraps a widget with the [AspectRatio] widget.
///
/// The [AspectRatio] widget sizes its child to match a given aspect ratio.
class AspectRatioDecorator extends WidgetDecorator<AspectRatioDecorator> {
  /// The aspect ratio to use when sizing the child.
  ///
  /// For example, a 16:9 aspect ratio would have a value of 16.0 / 9.0.
  final double aspectRatio;
  const AspectRatioDecorator(this.aspectRatio, {super.key});

  @override
  AspectRatioDecorator lerp(AspectRatioDecorator? other, double t) {
    return AspectRatioDecorator(
      lerpDouble(aspectRatio, other?.aspectRatio, t) ?? aspectRatio,
    );
  }

  @override
  get props => [aspectRatio];

  @override
  Widget build(MixData mix, Widget child) =>
      AspectRatio(key: key, aspectRatio: aspectRatio, child: child);
}

/// A decorator that wraps a widget with the [Visibility] widget.
///
/// The [Visibility] widget can be used to show or hide a widget in the UI.
class VisibilityDecorator extends WidgetDecorator<VisibilityDecorator> {
  /// Whether the child is visible or not.
  final bool visible;
  const VisibilityDecorator(this.visible, {super.key});

  @override
  VisibilityDecorator lerp(VisibilityDecorator? other, double t) {
    return VisibilityDecorator(lerpSnap(visible, other?.visible, t) ?? visible);
  }

  @override
  get props => [visible];

  @override
  Widget build(MixData mix, Widget child) =>
      Visibility(key: key, visible: visible, child: child);
}

/// A decorator that wraps a widget with the [Flexible] widget.
///
/// The [Flexible] widget is used to create a flexible space in a [Row], [Column], or [Flex] widget.
class FlexibleDecorator extends WidgetDecorator<FlexibleDecorator>
    with Mergeable<FlexibleDecorator> {
  /// The flex factor to use for this widget.
  final int? flex;

  /// How the child is inscribed into the available space.
  final FlexFit? fit;
  const FlexibleDecorator({this.flex, this.fit, super.key});

  @override
  FlexibleDecorator lerp(FlexibleDecorator? other, double t) {
    return FlexibleDecorator(
      flex: lerpInt(flex, other?.flex, t),
      fit: lerpSnap(fit, other?.fit, t),
    );
  }

  @override
  FlexibleDecorator merge(FlexibleDecorator? other) {
    return FlexibleDecorator(
      flex: other?.flex ?? flex,
      fit: other?.fit ?? fit,
    );
  }

  @override
  get props => [flex, fit];

  @override
  Widget build(MixData mix, Widget child) {
    return Flexible(
      key: key,
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with the [Opacity] widget.
///
/// The [Opacity] widget is used to make a widget partially transparent.
class OpacityDecorator extends WidgetDecorator<OpacityDecorator> {
  /// The [opacity] argument must not be null and
  /// must be between 0.0 and 1.0 (inclusive).
  final double opacity;
  const OpacityDecorator(this.opacity, {super.key});

  @override
  OpacityDecorator lerp(OpacityDecorator? other, double t) {
    return OpacityDecorator(
      lerpDouble(opacity, other?.opacity, t) ?? opacity,
    );
  }

  @override
  get props => [opacity];

  @override
  Widget build(MixData mix, Widget child) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'The opacity must be between 0.0 and 1.0 (inclusive).',
    );

    return Opacity(key: key, opacity: opacity, child: child);
  }
}

/// A decorator that wraps a widget with the [RotatedBox] widget.
///
/// The [RotatedBox] widget is used to rotate a widget by a given number of quarter turns.
class RotateDecorator extends WidgetDecorator<RotateDecorator> {
  /// The number of clockwise quarter turns the child should be rotated.
  final int quarterTurns;
  const RotateDecorator(this.quarterTurns, {super.key});

  @override
  RotateDecorator lerp(RotateDecorator? other, double t) {
    return RotateDecorator(lerpInt(quarterTurns, other?.quarterTurns, t));
  }

  @override
  get props => [quarterTurns];

  @override
  Widget build(MixData mix, Widget child) {
    return RotatedBox(key: key, quarterTurns: quarterTurns, child: child);
  }
}

/// A decorator that wraps a widget with the [Transform] widget.
///
/// The [Transform] widget is used to apply a transformation to a widget.
class TransformDecorator extends WidgetDecorator<TransformDecorator> {
  /// The transformation matrix to apply to the child.
  final Matrix4 transform;
  const TransformDecorator(this.transform, {super.key});

  @override
  TransformDecorator lerp(TransformDecorator? other, double t) {
    return TransformDecorator(
      Matrix4Tween(begin: transform, end: other?.transform).lerp(t),
    );
  }

  @override
  get props => [transform];

  @override
  Widget build(MixData mix, Widget child) {
    return Transform(key: key, transform: transform, child: child);
  }
}

/// A decorator that wraps a widget with the [Transform.scale] widget.
///
/// The [Transform.scale] widget is used to scale a widget.
class ScaleDecorator extends WidgetDecorator<ScaleDecorator> {
  final double scale;
  const ScaleDecorator(this.scale, {super.key});

  @override
  ScaleDecorator lerp(ScaleDecorator? other, double t) {
    return ScaleDecorator(lerpDouble(scale, other?.scale, t) ?? scale);
  }

  @override
  get props => [scale];

  @override
  Widget build(MixData mix, Widget child) {
    return Transform.scale(key: key, scale: scale, child: child);
  }
}

// /// A decorator that wraps a widget with a [DecoratedBox] widget.
// ///
// /// The [DecoratedBox] widget is used to apply a decoration to a widget.
// class DecorationDecorator extends WidgetDecorator<DecorationDecorator>
//     with Mergeable<DecorationDecorator> {
//   final DecorationDto decoration;
//   const DecorationDecorator(this.decoration, {super.key});

//   @override
//   DecorationDecorator lerp(DecorationDecorator? other, double t) {
//     return DecorationDecorator(lerpSnap(decoration, other?.decoration, t));
//   }

//   @override
//   get props => [decoration];

//   @override
//   Widget build(MixData mix, Widget child) {
//     return DecoratedBox(
//       key: key,
//       decoration: decoration.resolve(mix),
//       child: child,
//     );
//   }
// }

/// A decorator that wraps a widget with a [FractionallySizedBoxDecorator] widget.
///
/// The [FractionallySizedBox] widget is used to size a widget to a fraction of the total available space.
class FractionallySizedBoxDecorator
    extends WidgetDecorator<FractionallySizedBoxDecorator> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;
  const FractionallySizedBoxDecorator({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
    super.key,
  });

  @override
  FractionallySizedBoxDecorator lerp(
    FractionallySizedBoxDecorator? other,
    double t,
  ) {
    return FractionallySizedBoxDecorator(
      widthFactor:
          lerpDouble(widthFactor, other?.widthFactor, t) ?? widthFactor,
      heightFactor:
          lerpDouble(heightFactor, other?.heightFactor, t) ?? heightFactor,
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
    );
  }

  @override
  get props => [widthFactor, heightFactor, alignment];

  @override
  Widget build(MixData mix, Widget child) {
    return FractionallySizedBox(
      key: key,
      alignment: alignment ?? Alignment.center,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [SizedBox] widget.
///
/// The [SizedBox] widget is used to give a widget a fixed size.
class SizedBoxDecorator extends WidgetDecorator<SizedBoxDecorator> {
  final double? width;
  final double? height;
  const SizedBoxDecorator({this.width, this.height, super.key});

  @override
  SizedBoxDecorator lerp(SizedBoxDecorator? other, double t) {
    return SizedBoxDecorator(
      width: lerpDouble(width, other?.width, t),
      height: lerpDouble(height, other?.height, t),
    );
  }

  @override
  get props => [width, height];

  @override
  Widget build(MixData mix, Widget child) {
    return SizedBox(key: key, width: width, height: height, child: child);
  }
}

/// A decorator that wraps a widget with a [Align] widget.
///
/// The [Align] widget is used to align a widget within its parent.
class AlignDecorator extends WidgetDecorator<AlignDecorator> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignDecorator({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
    super.key,
  });

  @override
  AlignDecorator lerp(AlignDecorator? other, double t) {
    return AlignDecorator(
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
      widthFactor: lerpDouble(widthFactor, other?.widthFactor, t),
      heightFactor: lerpDouble(heightFactor, other?.heightFactor, t),
    );
  }

  @override
  get props => [alignment, widthFactor, heightFactor];

  @override
  Widget build(MixData mix, Widget child) {
    return Align(
      key: key,
      alignment: alignment ?? Alignment.center,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

/// An abstract class to create different clip decorators.
///
/// The [ClipDecorator] class is used to create different clip decorators.
abstract class ClipDecorator<Self extends ClipDecorator<Self, T>, T>
    extends WidgetDecorator<Self> with Mergeable<Self> {
  final Clip? clipBehavior;
  final CustomClipper<T>? clipper;
  const ClipDecorator({this.clipBehavior, this.clipper, super.key});
}

/// A decorator that wraps a widget with a [ClipOval] widget.
///
/// The [ClipOval] widget is used to clip a widget to an oval shape.
class ClipOvalDecorator extends ClipDecorator<ClipOvalDecorator, Rect> {
  const ClipOvalDecorator({super.clipBehavior, super.clipper, super.key});

  @override
  ClipOvalDecorator lerp(ClipOvalDecorator? other, double t) {
    return ClipOvalDecorator(
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
    );
  }

  @override
  ClipOvalDecorator merge(ClipOvalDecorator? other) {
    return ClipOvalDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      clipper: other?.clipper ?? clipper,
      key: other?.key ?? key,
    );
  }

  @override
  get props => [clipBehavior, clipper];

  @override
  Widget build(MixData mix, Widget child) {
    return ClipOval(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [ClipRect] widget.
///
/// The [ClipRect] widget is used to clip a widget to a rectangle.
class ClipRectDecorator extends ClipDecorator<ClipRectDecorator, Rect> {
  const ClipRectDecorator({super.clipBehavior, super.clipper, super.key});

  @override
  ClipRectDecorator lerp(ClipRectDecorator? other, double t) {
    return ClipRectDecorator(
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
    );
  }

  @override
  ClipRectDecorator merge(ClipRectDecorator? other) {
    return ClipRectDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      clipper: other?.clipper ?? clipper,
      key: other?.key ?? key,
    );
  }

  @override
  get props => [clipBehavior, clipper];

  @override
  Widget build(MixData mix, Widget child) {
    return ClipRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [ClipRRect] widget.
///
/// The [ClipRRect] widget is used to clip a widget to a rounded rectangle.
class ClipRRectDecorator extends ClipDecorator<ClipRRectDecorator, RRect> {
  final BorderRadiusGeometry? borderRadius;

  const ClipRRectDecorator({
    this.borderRadius,
    super.clipBehavior,
    super.clipper,
    super.key,
  });

  @override
  ClipRRectDecorator merge(ClipRRectDecorator? other) {
    return ClipRRectDecorator(
      borderRadius: other?.borderRadius ?? borderRadius,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      clipper: other?.clipper ?? clipper,
      key: other?.key ?? key,
    );
  }

  @override
  ClipRRectDecorator lerp(ClipRRectDecorator? other, double t) {
    return ClipRRectDecorator(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other?.borderRadius, t),
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
    );
  }

  @override
  get props => [borderRadius, clipBehavior, clipper];

  @override
  Widget build(MixData mix, Widget child) {
    return ClipRRect(
      key: key,
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a [ClipPath] widget.
///
/// The [ClipPath] widget is used to clip a widget using a custom clipper.
class ClipPathDecorator extends ClipDecorator<ClipPathDecorator, Path> {
  const ClipPathDecorator({super.clipBehavior, super.clipper, super.key});

  @override
  ClipPathDecorator lerp(ClipPathDecorator? other, double t) {
    return ClipPathDecorator(
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
    );
  }

  @override
  ClipPathDecorator merge(ClipPathDecorator? other) {
    return ClipPathDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      clipper: other?.clipper ?? clipper,
      key: other?.key ?? key,
    );
  }

  @override
  get props => [clipBehavior, clipper];

  @override
  Widget build(MixData mix, Widget child) {
    return ClipPath(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A decorator that wraps a widget with a custom [ClipPath] widget with a [TriangleClipper].
///
/// The [TriangleClipper] is used to clip a widget to a triangle shape.
class ClipTriangleDecorator extends ClipDecorator<ClipTriangleDecorator, Path> {
  const ClipTriangleDecorator({super.clipBehavior, super.key});

  @override
  ClipTriangleDecorator lerp(ClipTriangleDecorator? other, double t) {
    return ClipTriangleDecorator(
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
    );
  }

  @override
  ClipTriangleDecorator merge(ClipTriangleDecorator? other) {
    return ClipTriangleDecorator(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
      key: other?.key ?? key,
    );
  }

  @override
  get props => [clipBehavior];

  @override
  Widget build(MixData mix, Widget child) {
    return ClipPath(
      key: key,
      clipper: const TriangleClipper(),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  const TriangleClipper();
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
