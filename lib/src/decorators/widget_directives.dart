// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';
import '../helpers/lerp_helpers.dart';

class AspectRatioDirective extends WidgetDecorator<AspectRatioDirective> {
  final double aspectRatio;
  const AspectRatioDirective(this.aspectRatio, {super.key});

  @override
  AspectRatioDirective lerp(AspectRatioDirective? other, double t) {
    return AspectRatioDirective(
      lerpDouble(aspectRatio, other?.aspectRatio, t) ?? aspectRatio,
    );
  }

  @override
  get props => [aspectRatio];

  @override
  Widget build(child, mix) =>
      AspectRatio(key: key, aspectRatio: aspectRatio, child: child);
}

class VisibilityDirective extends WidgetDecorator<VisibilityDirective> {
  final bool visible;
  const VisibilityDirective(this.visible, {super.key});

  @override
  VisibilityDirective lerp(VisibilityDirective? other, double t) {
    return VisibilityDirective(other?.visible ?? visible);
  }

  @override
  get props => [visible];

  @override
  Widget build(child, mix) =>
      Visibility(key: key, visible: visible, child: child);
}

class FlexibleDirective extends WidgetDecorator<FlexibleDirective>
    with Mergeable<FlexibleDirective> {
  final int? flex;
  final FlexFit? fit;
  const FlexibleDirective({this.flex, this.fit, super.key});

  @override
  FlexibleDirective lerp(FlexibleDirective? other, double t) {
    return FlexibleDirective(
      flex: lerpInt(flex, other?.flex, t),
      fit: lerpSnap(fit, other?.fit, t),
    );
  }

  @override
  FlexibleDirective merge(FlexibleDirective? other) {
    return FlexibleDirective(
      flex: other?.flex ?? flex,
      fit: other?.fit ?? fit,
    );
  }

  @override
  get props => [flex, fit];

  @override
  Widget build(child, mix) {
    return Flexible(
      key: key,
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

class OpacityDirective extends WidgetDecorator<OpacityDirective> {
  /// The [opacity] argument must not be null and must be between 0.0 and 1.0 (inclusive).
  final double opacity;
  const OpacityDirective(this.opacity, {super.key});

  @override
  OpacityDirective lerp(OpacityDirective? other, double t) {
    return OpacityDirective(
      lerpDouble(opacity, other?.opacity, t) ?? opacity,
    );
  }

  @override
  get props => [opacity];

  @override
  Widget build(child, mix) => Opacity(key: key, opacity: opacity, child: child);
}

class RotateDirective extends WidgetDecorator<RotateDirective> {
  final int quarterTurns;
  const RotateDirective(this.quarterTurns, {super.key});

  @override
  RotateDirective lerp(RotateDirective? other, double t) {
    return RotateDirective(lerpInt(quarterTurns, other?.quarterTurns, t));
  }

  @override
  get props => [quarterTurns];

  @override
  Widget build(child, mix) =>
      RotatedBox(key: key, quarterTurns: quarterTurns, child: child);
}

class ScaleDirective extends WidgetDecorator<ScaleDirective> {
  final double scale;
  const ScaleDirective(this.scale, {super.key});

  @override
  ScaleDirective lerp(ScaleDirective? other, double t) {
    return ScaleDirective(lerpDouble(scale, other?.scale, t) ?? scale);
  }

  @override
  get props => [scale];

  @override
  Widget build(child, mix) =>
      Transform.scale(key: key, scale: scale, child: child);
}

enum ClipType { path, oval, rect, rRect, triangle }

class ClipDirective<T> extends WidgetDecorator<ClipDirective>
    with Mergeable<ClipDirective> {
  final ClipType clipType;
  final Clip? clipBehavior;
  final CustomClipper<T>? clipper;
  //  Used only for ClipRRect
  final BorderRadiusGeometry? borderRadius;
  const ClipDirective({
    required this.clipType,
    this.clipBehavior,
    this.clipper,
    this.borderRadius,
    super.key,
  });

  @override
  ClipDirective lerp(ClipDirective? other, double t) {
    if (other == null) return this;
    if (clipType != other.clipType) return other;

    return ClipDirective(
      clipType: clipType,
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      clipper: lerpSnap(clipper, other.clipper, t),
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t),
    );
  }

  @override
  ClipDirective merge(ClipDirective? other) {
    if (other == null) return this;
    if (clipType != other.clipType) return other;

    return ClipDirective(
      clipType: clipType,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      clipper: other.clipper ?? clipper,
      borderRadius: other.borderRadius ?? borderRadius,
    );
  }

  @override
  get props => [clipType, clipBehavior, clipper, borderRadius];

  @override
  Widget build(Widget child, MixData mix) {
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
    extends MixUtility<T, ClipDirective> {
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
      ClipDirective(
        clipType: clipType,
        clipBehavior: clipBehavior,
        clipper: clipper,
        borderRadius: borderRadius,
        key: key,
      ),
    );
  }
}

class ClipDirectiveUtility<T extends StyleAttribute>
    extends MixUtility<T, ClipDirective> {
  const ClipDirectiveUtility(super.builder);

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
