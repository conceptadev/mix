// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../helpers/lerp_helpers.dart';

class AspectRatioDecorator extends BoxWidgetDecorator<AspectRatioDecorator> {
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
  Widget build(mix, child) =>
      AspectRatio(key: key, aspectRatio: aspectRatio, child: child);
}

class VisibilityDecorator extends BoxWidgetDecorator<VisibilityDecorator> {
  final bool visible;
  const VisibilityDecorator(this.visible, {super.key});

  @override
  VisibilityDecorator lerp(VisibilityDecorator? other, double t) {
    return VisibilityDecorator(lerpSnap(visible, other?.visible, t) ?? visible);
  }

  @override
  get props => [visible];

  @override
  Widget build(mix, child) =>
      Visibility(key: key, visible: visible, child: child);
}

class FlexibleDecorator extends FlexWidgetDecorator<FlexibleDecorator>
    with Mergeable<FlexibleDecorator> {
  final int? flex;
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
  Widget build(mix, Widget child) {
    return Flexible(
      key: key,
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

class OpacityDecorator extends BoxWidgetDecorator<OpacityDecorator> {
  /// The [opacity] argument must not be null and must be between 0.0 and 1.0 (inclusive).
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
  Widget build(mix, child) => Opacity(key: key, opacity: opacity, child: child);
}

class RotateDecorator extends BoxWidgetDecorator<RotateDecorator> {
  final int quarterTurns;
  const RotateDecorator(this.quarterTurns, {super.key});

  @override
  RotateDecorator lerp(RotateDecorator? other, double t) {
    return RotateDecorator(lerpInt(quarterTurns, other?.quarterTurns, t));
  }

  @override
  get props => [quarterTurns];

  @override
  Widget build(mix, child) =>
      RotatedBox(key: key, quarterTurns: quarterTurns, child: child);
}

class ScaleDecorator extends BoxWidgetDecorator<ScaleDecorator> {
  final double scale;
  const ScaleDecorator(this.scale, {super.key});

  @override
  ScaleDecorator lerp(ScaleDecorator? other, double t) {
    return ScaleDecorator(lerpDouble(scale, other?.scale, t) ?? scale);
  }

  @override
  get props => [scale];

  @override
  Widget build(mix, child) =>
      Transform.scale(key: key, scale: scale, child: child);
}

enum ClipType { path, oval, rect, rRect, triangle }

class ClipDecorator<T> extends BoxWidgetDecorator<ClipDecorator>
    with Mergeable<ClipDecorator> {
  final ClipType clipType;
  final Clip? clipBehavior;
  final CustomClipper<T>? clipper;
  //  Used only for ClipRRect
  final BorderRadiusGeometry? borderRadius;
  const ClipDecorator({
    required this.clipType,
    this.clipBehavior,
    this.clipper,
    this.borderRadius,
    super.key,
  });

  @override
  ClipDecorator lerp(ClipDecorator? other, double t) {
    if (other == null) return this;
    if (clipType != other.clipType) return other;

    return ClipDecorator(
      clipType: lerpSnap(clipType, other.clipType, t),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      clipper: lerpSnap(clipper, other.clipper, t),
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t),
    );
  }

  @override
  ClipDecorator merge(ClipDecorator? other) {
    if (other == null) return this;
    if (clipType != other.clipType) return other;

    return ClipDecorator(
      clipType: clipType,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      clipper: other.clipper ?? clipper,
      borderRadius: other.borderRadius ?? borderRadius,
    );
  }

  @override
  get props => [clipType, clipBehavior, clipper, borderRadius];

  @override
  Widget build(mix, child) {
    switch (clipType) {
      case ClipType.path:
        return ClipPath(
          key: key,
          clipper: clipper as CustomClipper<Path>?,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          child: child,
        );

      case ClipType.oval:
        return ClipOval(
          key: key,
          clipper: clipper as CustomClipper<Rect>?,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          child: child,
        );

      case ClipType.rect:
        return ClipRect(
          key: key,
          clipper: clipper as CustomClipper<Rect>?,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          child: child,
        );

      case ClipType.rRect:
        return ClipRRect(
          key: key,
          borderRadius: borderRadius ?? BorderRadius.zero,
          clipper: clipper as CustomClipper<RRect>?,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          child: child,
        );

      case ClipType.triangle:
        return ClipPath(
          key: key,
          clipper: const TriangleClipper(),
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          child: child,
        );

      default:
        return child; // Fallback in case of an undefined clip type
    }
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

class ClipTypeUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipDecorator> {
  final ClipType clipType;

  const ClipTypeUtility(this.clipType, super.builder);

  T call({
    Clip? clipBehavior,
    CustomClipper<T>? clipper,
    // Used only for ClipRRect
    BorderRadiusGeometry? borderRadius,
    Key? key,
  }) {
    //  Border radius can only be used for ClipType.rRect
    assert(
      clipType != ClipType.rRect || borderRadius != null,
      'Border radius can only be used for ClipType.rRect',
    );

    return builder(
      ClipDecorator(
        clipType: clipType,
        clipBehavior: clipBehavior,
        clipper: clipper,
        borderRadius: borderRadius,
        key: key,
      ),
    );
  }
}

class ClipDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipDecorator> {
  const ClipDecoratorUtility(super.builder);

  ClipTypeUtility<T> get path {
    return ClipTypeUtility(ClipType.path, builder);
  }

  ClipTypeUtility<T> get oval {
    return ClipTypeUtility(ClipType.oval, builder);
  }

  ClipTypeUtility<T> get rect {
    return ClipTypeUtility(ClipType.rect, builder);
  }

  ClipTypeUtility<T> get rrect {
    return ClipTypeUtility(ClipType.rRect, builder);
  }

  ClipTypeUtility<T> get triangle {
    return ClipTypeUtility(ClipType.triangle, builder);
  }
}
