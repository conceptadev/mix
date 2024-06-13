// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/mix_data.dart';
import '../core/modifier.dart';
import '../internal/lerp_helpers.dart';

final class ClipOvalModifierSpec
    extends WidgetModifierSpec<ClipOvalModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalModifierSpec({this.clipper, this.clipBehavior});

  @override
  ClipOvalModifierSpec lerp(ClipOvalModifierSpec? other, double t) {
    return ClipOvalModifierSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior: lerpSnap(clipBehavior, other?.clipBehavior, t),
    );
  }

  @override
  ClipOvalModifierSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipOvalModifierSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipOval(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

final class ClipOvalModifierAttribute extends WidgetModifierAttribute<
    ClipOvalModifierAttribute, ClipOvalModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipOvalModifierAttribute({this.clipper, this.clipBehavior});

  @override
  ClipOvalModifierAttribute merge(ClipOvalModifierAttribute? other) {
    return ClipOvalModifierAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipOvalModifierSpec resolve(MixData mix) {
    return ClipOvalModifierSpec(clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

final class ClipRectModifierSpec
    extends WidgetModifierSpec<ClipRectModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectModifierSpec({this.clipper, this.clipBehavior});

  @override
  ClipRectModifierSpec lerp(ClipRectModifierSpec? other, double t) {
    return ClipRectModifierSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRectModifierSpec copyWith({
    CustomClipper<Rect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRectModifierSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipRect(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      child: child,
    );
  }
}

/// A modifier that wraps a widget with a [ClipRect] widget.
///
/// The [ClipRect] widget is used to clip a widget to a rectangle.
final class ClipRectModifierAttribute extends WidgetModifierAttribute<
    ClipRectModifierAttribute, ClipRectModifierSpec> {
  final CustomClipper<Rect>? clipper;
  final Clip? clipBehavior;

  const ClipRectModifierAttribute({this.clipper, this.clipBehavior});

  @override
  ClipRectModifierAttribute merge(ClipRectModifierAttribute? other) {
    return ClipRectModifierAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRectModifierSpec resolve(MixData mix) {
    return ClipRectModifierSpec(clipper: clipper, clipBehavior: clipBehavior);
  }

  @override
  get props => [clipper, clipBehavior];
}

final class ClipRRectModifierSpec
    extends WidgetModifierSpec<ClipRRectModifierSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectModifierSpec({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectModifierSpec lerp(ClipRRectModifierSpec? other, double t) {
    return ClipRRectModifierSpec(
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other?.borderRadius, t),
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipRRectModifierSpec copyWith({
    BorderRadiusGeometry? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipRRectModifierSpec(
      borderRadius: borderRadius ?? this.borderRadius,
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

final class ClipRRectModifierAttribute extends WidgetModifierAttribute<
    ClipRRectModifierAttribute, ClipRRectModifierSpec> {
  final BorderRadiusGeometry? borderRadius;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  const ClipRRectModifierAttribute({
    this.borderRadius,
    this.clipper,
    this.clipBehavior,
  });

  @override
  ClipRRectModifierAttribute merge(ClipRRectModifierAttribute? other) {
    return ClipRRectModifierAttribute(
      borderRadius: other?.borderRadius ?? borderRadius,
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipRRectModifierSpec resolve(MixData mix) {
    return ClipRRectModifierSpec(
      borderRadius: borderRadius,
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [borderRadius, clipper, clipBehavior];
}

@immutable
final class ClipPathModifierSpec
    extends WidgetModifierSpec<ClipPathModifierSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathModifierSpec({this.clipper, this.clipBehavior});

  @override
  ClipPathModifierSpec lerp(ClipPathModifierSpec? other, double t) {
    return ClipPathModifierSpec(
      clipper: lerpSnap(clipper, other?.clipper, t),
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipPathModifierSpec copyWith({
    CustomClipper<Path>? clipper,
    Clip? clipBehavior,
  }) {
    return ClipPathModifierSpec(
      clipper: clipper ?? this.clipper,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipper, clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A modifier that wraps a widget with a [ClipPath] widget.
///
/// The [ClipPath] widget is used to clip a widget using a custom clipper.
final class ClipPathModifierAttribute extends WidgetModifierAttribute<
    ClipPathModifierAttribute, ClipPathModifierSpec> {
  final CustomClipper<Path>? clipper;
  final Clip? clipBehavior;

  const ClipPathModifierAttribute({this.clipper, this.clipBehavior});

  @override
  ClipPathModifierAttribute merge(ClipPathModifierAttribute? other) {
    return ClipPathModifierAttribute(
      clipper: other?.clipper ?? clipper,
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipPathModifierSpec resolve(MixData mix) {
    return ClipPathModifierSpec(
      clipper: clipper,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
    );
  }

  @override
  get props => [clipper, clipBehavior];
}

@immutable
final class ClipTriangleModifierSpec
    extends WidgetModifierSpec<ClipTriangleModifierSpec> {
  final Clip? clipBehavior;

  const ClipTriangleModifierSpec({this.clipBehavior});

  @override
  ClipTriangleModifierSpec lerp(ClipTriangleModifierSpec? other, double t) {
    return ClipTriangleModifierSpec(
      clipBehavior:
          lerpSnap(clipBehavior, other?.clipBehavior, t) ?? clipBehavior,
    );
  }

  @override
  ClipTriangleModifierSpec copyWith({Clip? clipBehavior}) {
    return ClipTriangleModifierSpec(
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  get props => [clipBehavior];

  @override
  Widget build(Widget child) {
    return ClipPath(
      clipper: const TriangleClipper(),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      child: child,
    );
  }
}

/// A modifier that wraps a widget with a custom [ClipPath] widget with a [TriangleClipper].
///
/// The [TriangleClipper] is used to clip a widget to a triangle shape.
final class ClipTriangleModifierAttribute extends WidgetModifierAttribute<
    ClipTriangleModifierAttribute, ClipTriangleModifierSpec> {
  final Clip? clipBehavior;

  const ClipTriangleModifierAttribute({this.clipBehavior});

  @override
  ClipTriangleModifierAttribute merge(ClipTriangleModifierAttribute? other) {
    return ClipTriangleModifierAttribute(
      clipBehavior: other?.clipBehavior ?? clipBehavior,
    );
  }

  @override
  ClipTriangleModifierSpec resolve(MixData mix) {
    return ClipTriangleModifierSpec(clipBehavior: clipBehavior);
  }

  @override
  get props => [clipBehavior];
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

final class ClipPathUtility<T extends Attribute>
    extends MixUtility<T, ClipPathModifierAttribute> {
  const ClipPathUtility(super.builder);

  T call({CustomClipper<Path>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipPathModifierAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

final class ClipRRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRRectModifierAttribute> {
  const ClipRRectUtility(super.builder);
  T call({
    BorderRadius? borderRadius,
    CustomClipper<RRect>? clipper,
    Clip? clipBehavior,
  }) {
    return builder(
      ClipRRectModifierAttribute(
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
      ),
    );
  }
}

final class ClipOvalUtility<T extends Attribute>
    extends MixUtility<T, ClipOvalModifierAttribute> {
  const ClipOvalUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipOvalModifierAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

final class ClipRectUtility<T extends Attribute>
    extends MixUtility<T, ClipRectModifierAttribute> {
  const ClipRectUtility(super.builder);
  T call({CustomClipper<Rect>? clipper, Clip? clipBehavior}) {
    return builder(
      ClipRectModifierAttribute(clipper: clipper, clipBehavior: clipBehavior),
    );
  }
}

final class ClipTriangleUtility<T extends Attribute>
    extends MixUtility<T, ClipTriangleModifierAttribute> {
  const ClipTriangleUtility(super.builder);
  T call({Clip? clipBehavior}) {
    return builder(ClipTriangleModifierAttribute(clipBehavior: clipBehavior));
  }
}
